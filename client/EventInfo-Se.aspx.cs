using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;

public partial class client_EventInfo : System.Web.UI.Page
{
    string uid = "";
    int tagg = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request.QueryString["ReservationId"] == null)
            Response.Redirect("~/UnableAccess.aspx");
        string key;
        DataView dvb = (DataView)UserIdSelect.Select(DataSourceSelectArguments.Empty);
        try
        {
            uid = (string)dvb.Table.Rows[0][0];
        }
        catch (Exception)
        {
            Response.Redirect("~/UnableAccess.aspx");
        }
        MembershipUser ma = Membership.GetUser();
        key = ma.ProviderUserKey.ToString();
        if (uid == key)
        {
        }
        else Response.Redirect("~/UnableAccess.aspx");

        DataView dv = (DataView)ClientIdSelect.Select(DataSourceSelectArguments.Empty);
        int cid = (int)dv.Table.Rows[0][0];
        ClientID.Text = cid.ToString();
        tagg = (int)dv.Table.Rows[0][1];
        if (tagg == 1)
        {
            Button1.Visible = false;
            rc1.Visible = false;
        }
        else if (tagg == 2)
        {
            rc2.Visible = false;;
        }
        else if (tagg == 3)
        {
            Button1.Text = "View Billing Statement";
            Button5.Visible = false;
            rc2.Visible = false;
        }
        else if (tagg == 4)
        {
            Button1.Text = "View Billing Statement";
            Button5.Visible = false;
            rc2.Visible = false;
            rc1.Visible = false;
            balanceHide.Visible = true;
        }
        else if (tagg == 5)
        {
            tag5Hide.Visible = false;
        }
        else if (tagg == 6)
        {
            balanceHide.Visible = true;
            tag5Hide.Visible = false;
        }
        

    }
    protected string FormatUrl(int categoryID)
    {
        return "~/Client/Check.aspx?ReservationId=" + categoryID;
    }
    protected void Button5_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Client/Additionals.aspx?newId=" + Request.QueryString["ReservationId"]);
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Client/rfc.aspx?ReservationId=" + Request.QueryString["ReservationId"]);
    }
    protected void rc2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Client/rfc.aspx?ReservationId=" + Request.QueryString["ReservationId"] + "&tag=" +tagg);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Client/Billing.aspx?ReservationId=" + Request.QueryString["ReservationId"]);
    }
}