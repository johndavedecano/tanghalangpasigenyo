using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class amenities : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void SubmitBtn_Click(object sender, EventArgs e)
    {
        EventTypeTB.Text = EventTypeDDL.Text;
        VenueIdTB.Text = VenueTypeDDL.SelectedValue.ToString();
         EventsInsert.Insert();
        Response.Redirect("~/Maintenance/Events.aspx");
    }
    protected void CancelBtn_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Maintenance/Events.aspx");
    }
}