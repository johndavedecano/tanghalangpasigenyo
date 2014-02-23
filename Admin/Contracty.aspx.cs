using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_RFC : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        buttonhide.Visible = false;
        prntHide.Visible = false;
        if (Request.QueryString["rrId"] != null)
        {
            buttonhide.Visible = true;
        }
        LinkButton1.Attributes.Add("onclick", "window.open('../Admin/Contract.aspx?rrId=" + Request.QueryString["rrId"] + "', 'newwindow','menubar=1,resizable=1,width=700,height=900');return false;");

    }


    protected void Button1_Click(object sender, EventArgs e)
    {
        prntHide.Visible = true;
        buttonhide.Visible = false;
        TagUpdate.Update();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/Admin.aspx");
    }
}