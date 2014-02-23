using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class client_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Request.QueryString["newId"] == null)
            Response.Redirect("~/client/ClientAccount.aspx");

        Label1.Text =  Request.QueryString["newId"];
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Client/Additionals.aspx?newId=" + Label1.Text);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/client/ClientAccount.aspx");
    }
}