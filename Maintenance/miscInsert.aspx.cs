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

        TextBox4.Text = DropDownList1.SelectedValue.ToString();
        miscInsert.Insert();
        Response.Redirect("~/Maintenance/misc.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Maintenance/misc.aspx");
    }

}