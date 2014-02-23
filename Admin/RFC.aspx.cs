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
        if (Request.QueryString["rr"] == null)
        {
            Label1.Text = "";
        }
        else if (Request.QueryString["rr"] == "0")
        {
            Label1.Text = "Request Approved";
        }
        else if (Request.QueryString["rr"] == "1")
        {
            Label1.Text = "Request Rejected";
        }

    }   
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Cancel.Update();
        Approved.Update();
        Session["gg"] = "Cancellation Request Granted.";
        ccancel.Insert();
        Response.Redirect("~/admin/RFC.aspx?rr=0");
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Reject.Update();
        Response.Redirect("~/admin/RFC.aspx?rr=1");
    }
}