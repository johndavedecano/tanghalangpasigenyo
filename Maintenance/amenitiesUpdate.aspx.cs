using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;

public partial class amenities : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        MembershipUser ma = Membership.GetUser();
        TextBox2.Text = ma.ProviderUserKey.ToString();
        DataView dv2 = (DataView)NameSelect.Select(DataSourceSelectArguments.Empty);
        UpdatedBy.Text = (string)dv2.Table.Rows[0][0];

    }
    protected void DetailView_ItemUpdate(object sender, DetailsViewUpdatedEventArgs e)
    {
        if (e.AffectedRows == 1)
        {

            DisplayValues(e);
            Response.Redirect("~/Maintenance/amenities.aspx");
        }
    }

    protected void DetailView_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Cancel")
        {
            Response.Redirect("~/Maintenance/amenities.aspx");
        }
    }
    void DisplayValues(DetailsViewUpdatedEventArgs e)
    {
        string[] fields = new string[] { "VenueName", "AmenityName", "Description", "Quantity", "Price" };
        for (int i = 0; i < e.OldValues.Count; i++)
        {
            if (e.OldValues[i].ToString() != e.NewValues[i].ToString())
            {
                string oldv=e.OldValues[i].ToString(), newv=e.NewValues[i].ToString();
                if (i == 0)
                {
                    if (oldv == "1")
                        oldv = "Ynares Sports Arena";
                    else if (oldv == "2")
                        oldv = "Ynares Center";
                    if (newv == "1")
                        newv = "Ynares Sports Arena";
                    else if (newv == "2")
                        newv = "Ynares Center";
                }
                Table.Text = "Amenity";
                Column.Text = fields[i];
                OldValue.Text = oldv;
                NewValue.Text = newv;
                DateRecorded.Text = DateTime.Today.ToShortDateString();
                UpdateTrail.Insert();
            }
        }
    }

}