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
    string stat, et;
    int bbb = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        DataView dv = (DataView)ClientIdSelect.Select(DataSourceSelectArguments.Empty);
        int cid = (int)dv.Table.Rows[0][0];
        ClientID.Text = cid.ToString();
        DataView dv2 = (DataView)VenueIdSelect.Select(DataSourceSelectArguments.Empty);
        int vid = (int)dv2.Table.Rows[0][0];
        VenueId.Text = vid.ToString();
        DataView dv3 = (DataView)EventsSelect.Select(DataSourceSelectArguments.Empty);
        et = (string)dv3.Table.Rows[0][6];
    }
    protected string FormatUrl(int categoryID)
    {
        return "~/Client/EventInfo.aspx?ReservationId=" + categoryID;
    }
    protected void execute_sp()
    {
        SqlConnection con = new SqlConnection("workstation id=iris.arvixe.com;packet size=4096;user id=pamantasan;pwd=pamantasan2013;data source=iris.arvixe.com;persist security info=False;initial catalog=ybaros_db");
        SqlCommand cmd = new SqlCommand("ReservationSP", con);
        cmd.Parameters.Add("@ReservationId", SqlDbType.Int).Value = Request.QueryString["ReservationId"];
        cmd.Parameters.Add("@ReasonForReschedule", SqlDbType.VarChar).Value = TextBox3.Text;
        cmd.Parameters.Add("@NewDate",SqlDbType.Date).Value = TextBox1.Text;
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
        if (bbb == 0)
            Response.Redirect("~/client/ClientAccount.aspx?rfr=" + x);
        else
            Response.Redirect("~/client/ClientAccount.aspx?rfr=3");

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Request.QueryString["tag"] != null)
        {
            if (Request.QueryString["tag"].ToString() == "1")
            {
                stat = "Tentative";
                DateTimeUpdate.Update();
                bbb = 1;
            }
            else
            {

            }
        }
        else { stat = "Request"; }
        execute_sp();
    }
    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {
        int x = 0, y = 0;
        if (et == "Big Event")
        {
            DataView dv = (DataView)ReservedDateSelect.Select(DataSourceSelectArguments.Empty);
            foreach (DataRow dr in dv.Table.Rows)
            {
                if (e.Day.Date == (DateTime)dv.Table.Rows[x][0])
                {
                    e.Day.IsSelectable = false;
                    e.Cell.CssClass = "testing2";
                }
                x++;
            }
            if (e.Day.Date < DateTime.Now)
            {
                e.Day.IsSelectable = false;
                e.Cell.Font.Strikeout = true;
                e.Cell.ForeColor = System.Drawing.Color.Black;
                e.Cell.BackColor = System.Drawing.Color.White;
            }
        }
        else if (et == "Small Event")
        {
            e.Day.IsSelectable = false;
            e.Cell.Font.Strikeout = true;
            DataView dv3 = (DataView)PracticeDateSelect.Select(DataSourceSelectArguments.Empty);
            foreach (DataRow dr in dv3.Table.Rows)
            {
                if (e.Day.Date == (DateTime)dv3.Table.Rows[y][0])
                {
                    e.Cell.CssClass = "testing";
                    e.Day.IsSelectable = true;
                    e.Cell.Font.Strikeout = false;
                }
                y++;
            }
        }
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        TextBox1_PopupControlExtender.Commit(Calendar1.SelectedDate.ToShortDateString());
        
    }
}