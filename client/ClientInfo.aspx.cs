using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class ClientInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        TextBox8.Text = "1";
        MembershipUser ma = Membership.GetUser();
        string key = ma.ProviderUserKey.ToString();
        if (Request.QueryString["UserId"] == key)
        { }
        else
            Response.Redirect("~/UnableAccess.aspx");
        
    }
    protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSource1.Update();
        Response.Redirect("~/Account/ValidationPage.aspx");
    }
}