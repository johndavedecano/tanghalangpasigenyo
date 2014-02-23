using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;

public partial class facilities : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        MembershipUser ma = Membership.GetUser();
        TextBox2.Text = ma.ProviderUserKey.ToString();
        DataView dv2 = (DataView)NameSelect.Select(DataSourceSelectArguments.Empty);
        DeletedBy.Text = (string)dv2.Table.Rows[0][0];
        DateRecorded.Text = DateTime.Now.ToString();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Maintenance/facilities.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int y = 0, x = 0;

        DataView dv2 = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        foreach (DataRow dr in dv2.Table.Rows)
        {
            x = (int)dv2.Table.Rows[y][0];
            iid.Text = x.ToString();
            DeleteTrail.Insert();
            y++;
        }
        SqlDataSource2.Delete();
        Response.Redirect("~/Maintenance/facilities.aspx");
    }
}