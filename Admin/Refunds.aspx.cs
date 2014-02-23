using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;

public partial class Admin_RFC : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        MembershipUser ma = Membership.GetUser();
        Employee.Text = ma.ProviderUserKey.ToString();
        DataView emps = (DataView)EmpIdSelect.Select(DataSourceSelectArguments.Empty);
        Employee.Text = (string)emps.Table.Rows[0][2];
        int x=0;
        if (Request.QueryString["ReservationId"] == null)
        { SHOWHIDE.Visible = false; }

        else
        {
            SHOWHIDE.Visible = true;
        }
        Label1.Text = "LandBank of the Philippines";
        Label2.Text = DateTime.Now.ToShortDateString();
        string sttt = "";
        sttt = DateTime.Now.ToLongTimeString();
        if (sttt.Length == 10)
        {
            sttt = "0" + sttt;
        }
        string post = sttt.Substring(9, 2);
        if (post == "PM")
        {
            x = Convert.ToInt32(sttt.Substring(0, 2)) + 12;
            TextBox2.Text = x.ToString() + sttt.Substring(2, 6);
        }
        else
        {
            TextBox2.Text = sttt.Substring(0, 8);
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        int x = 0;
        string sttt = "";
        sttt = DateTime.Now.ToLongTimeString();
        if (sttt.Length == 10)
        {
            sttt = "0" + sttt;
        }
        string post = sttt.Substring(9, 2);
        if (post == "PM")
        {
            x = Convert.ToInt32(sttt.Substring(0, 2)) + 12;
            if (x == 24)
            {
                x = x - 12;
            }
            TextBox2.Text = x.ToString() + sttt.Substring(2, 6);
        }
        else
        {
            x = Convert.ToInt32(sttt.Substring(0, 2));
            if (x == 12)
            {
                x = x - 12;
                TextBox2.Text = x.ToString() + sttt.Substring(2, 6);
            }
            else
                TextBox2.Text = sttt.Substring(0, 8);
        }
        SqlDataSource1.Update();
        TagUpdate0.Update();
        Response.Redirect("~/Admin/Refunds.aspx");
    }
    protected void Button2_Click1(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/Refunds.aspx");
    }
}