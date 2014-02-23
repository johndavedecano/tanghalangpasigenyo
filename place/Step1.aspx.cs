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
        Session["VenueId"] = null;
        Session["EventId"] = null;
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Session["VenueId"] = 2;
        Response.Redirect("~/place/step2.aspx");
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Session["VenueId"] = 1;
        Response.Redirect("~/place/step2.aspx");
    }
}