using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Data;

public partial class client_ClientAccount : System.Web.UI.Page
{
    string key;
    protected void Page_Load(object sender, EventArgs e)
    {
        MembershipUser ma = Membership.GetUser();
        key = ma.ProviderUserKey.ToString();
        TextBox1.Text = key;
        CheckSource();
        if (TextBox2.Text == "0")
        {
            Response.Redirect("~/Client/ClientInfo.aspx?UserId=" + key);
        }
        else {
            DataView dv = (DataView)SqlDataSource3.Select(DataSourceSelectArguments.Empty);
            int clientid= (int)dv.Table.Rows[0][0];
            TextBox3.Text = clientid.ToString();

        }
        if (Request.QueryString["rfc"] != null)
        {
            if (Request.QueryString["rfc"].ToString() == "1")
            {
                UpdateLabel.Text = "Your Request had been Updated";
            }
            else if (Request.QueryString["rfc"].ToString() == "3")
            {
                UpdateLabel.Text = "Your Tentative Reservation had been Cancelled";
            }
            else
            {
                UpdateLabel.Text = "Your Request had been Submitted";
            }
        }
        else { }
        if (Request.QueryString["rfr"] != null)
        {
            if (Request.QueryString["rfr"].ToString() == "1")
            {
                UpdateLabel.Text = "Your Request had been Updated";
            }
            else if (Request.QueryString["rfr"].ToString() == "3")
            {
                UpdateLabel.Text = "Your Tentative Reservation (Date) had been Updated";
            }
            else
            {
                UpdateLabel.Text = "Your Request had been Submitted";
            }
        }
        else { }
        if (Request.QueryString["bbb"] != null)
        {
            if (Request.QueryString["bbb"].ToString() == "1")
            {
                UpdateLabel.Text = "You had beed confirmed your billing statement it is subjected for Contract";
            }
        }
        else { }

    }
    protected string FormatUrl(int categoryID)
    {
        return "~/Client/Check.aspx?ReservationId=" + categoryID;
    }
    protected void CheckSource()
    {
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        int status = (int)dv.Table.Rows[0][0];
        TextBox2.Text = status.ToString();

    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/place/Step1.aspx");
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/client/ClientInfoE.aspx?ClientId=" + TextBox3.Text);
    }
}