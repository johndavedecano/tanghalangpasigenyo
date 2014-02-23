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
    protected void Button1_Click(object sender, EventArgs e)
    {
        string dd;
        int dd1 = 0; ;

        dd = DropDownList1.SelectedIndex.ToString();
        dd1 = Convert.ToInt32(dd) + 1;
        TextBox4.Text = dd1.ToString();
        SqlDataSource1.Insert();
        Response.Redirect("~/Maintenance/amenities.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Maintenance/amenities.aspx");
    }
}