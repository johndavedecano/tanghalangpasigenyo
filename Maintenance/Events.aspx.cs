using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;

public partial class events : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        MembershipUser ma = Membership.GetUser();
        TextBox2.Text = ma.ProviderUserKey.ToString();
        DataView dv2 = (DataView)NameSelect.Select(DataSourceSelectArguments.Empty);
        DeletedBy.Text = (string)dv2.Table.Rows[0][0];
        DateRecorded.Text = DateTime.Now.ToString();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        TableCell cell = GridView1.Rows[e.RowIndex].Cells[0];
        iid.Text = cell.Text;
        DeleteTrail.Insert();
    }
}