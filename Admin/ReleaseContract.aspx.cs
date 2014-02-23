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
        if (Request.QueryString["ReservationId"] != null)
        { EOS.Visible = true; }
        else { EOS.Visible = false; }
        LinkButton1.Attributes.Add("onclick", "window.open('../Admin/Contract.aspx?rrId=" + Request.QueryString["ReservationId"] + "', 'newwindow','menubar=1,resizable=1,width=700,height=900');return false;");


    }



    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/Admin.aspx");
    }
}