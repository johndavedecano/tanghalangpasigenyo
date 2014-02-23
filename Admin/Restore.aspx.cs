using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_Restore : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        string table = (string)dv.Table.Rows[0][1];
        int id = (int)dv.Table.Rows[0][2];
        TextBox1.Text = id.ToString();
        if(table=="Amenity")
        {
            Amenity.Update();
        }
        else if(table=="Events")
        {
            Event.Update();
        }
        else if(table=="Facility")
        {
            Facility.Update();
        }
        else if(table=="Miscellaneous")
        {
            Misc.Update();
        }
        DeleteDtrail.Delete();
        Response.Redirect("~/Admin/DeleteTrail.aspx");
    }
}