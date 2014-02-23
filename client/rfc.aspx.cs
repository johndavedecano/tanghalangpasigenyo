using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class client_rfc : System.Web.UI.Page
{
    string stat = "";
    int bbb = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        DataView dv = (DataView)ClientIdSelect.Select(DataSourceSelectArguments.Empty);
        int cid = (int)dv.Table.Rows[0][0];
        ClientID.Text = cid.ToString();
    }
    protected string FormatUrl(int categoryID)
    {
        return "~/Client/EventInfo.aspx?ReservationId=" + categoryID;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        if (Request.QueryString["tag"] != null)
        {
            if (Request.QueryString["tag"].ToString() == "1")
            {
                stat = "Tentative";
                Session["gg"] = "Cancelled by the User";
                ccancel.Insert();
                TagUpdate.Update();
                bbb = 1;
            }
            else
            {
               
            }
        }
        else { stat = "Request"; }
        execute_sp();
    }
    protected void execute_sp()
    {
        SqlConnection con = new SqlConnection("workstation id=iris.arvixe.com;packet size=4096;user id=pamantasan;pwd=pamantasan2013;data source=iris.arvixe.com;persist security info=False;initial catalog=ybaros_db");
        SqlCommand cmd = new SqlCommand("samplesp", con);
        cmd.Parameters.Add("@ReservationId", SqlDbType.Int).Value = Request.QueryString["ReservationId"];
        cmd.Parameters.Add("@ReasonForCancellation",SqlDbType.VarChar).Value = TextBox1.Text;
        cmd.Parameters.Add("@DateRequested", SqlDbType.Date).Value = DateTime.Now.ToShortDateString();
        cmd.Parameters.Add("@Status", SqlDbType.VarChar).Value = stat;
        SqlParameter returnValue = new SqlParameter();
                returnValue.Direction = ParameterDirection.ReturnValue;
                cmd.Parameters.Add(returnValue);
        cmd.CommandType = CommandType.StoredProcedure;
        con.Open();
        cmd.ExecuteNonQuery();
        int x = (int)returnValue.Value;
        con.Close();
        if(bbb==0)
        Response.Redirect("~/client/ClientAccount.aspx?rfc=" + x);
        else
        Response.Redirect("~/client/ClientAccount.aspx?rfc=3");

    }
}