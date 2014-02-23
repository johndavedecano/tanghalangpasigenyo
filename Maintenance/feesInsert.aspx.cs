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
        TextBox4.Text = DropDownList1.SelectedItem.Text;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        TextBox1.Text = HeadLoginName.Page.User.Identity.Name;
        TextBox5.Text = DateTime.Today.ToShortDateString();
        string dd;
        int dd1 = 0; ;
        
        dd = DropDownList1.SelectedIndex.ToString();
        dd1 = Convert.ToInt32(dd) + 1;
        TextBox4.Text = dd1.ToString();
        SqlDataSource1.Insert();
        Response.Redirect("~/Fees.aspx");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Fees.aspx");
    }
}