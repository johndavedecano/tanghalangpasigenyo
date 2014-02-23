using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Fees : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        TextBox1.Text = HeadLoginName.Page.User.Identity.Name;
        TextBox2.Text = DateTime.Today.ToShortDateString();
    }
    protected void DetailView_ItemUpdate(object sender, DetailsViewUpdatedEventArgs e)
    {
        if (e.AffectedRows == 1)
        {
            Response.Redirect("~/Maintenance/Fees.aspx");
        }
    }

    protected void DetailView_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Cancel")
        {
            Response.Redirect("~/Maintenance/Fees.aspx");
        }
    }
}