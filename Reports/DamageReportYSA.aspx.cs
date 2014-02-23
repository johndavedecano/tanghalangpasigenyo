using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Reports_AmenitiesReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void BackAdminBtn_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/Admin/Admin.aspx");
    }
    protected void YCYSABtn_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("DamageReport.aspx");
    }
    protected void YCBtn_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("DamageReportYC.aspx");
    }

}