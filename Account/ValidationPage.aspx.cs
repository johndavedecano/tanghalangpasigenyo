using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;

public partial class ValidationPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DateTime now = DateTime.Now;
        TimeZoneInfo timezone = TimeZoneInfo.FindSystemTimeZoneById("Singapore Standard Time");
        TextBox1.Text = TimeZoneInfo.ConvertTime(now,timezone).ToString();

        MembershipUser ma = Membership.GetUser();
        TextBox2.Text = ma.ProviderUserKey.ToString();
        if(User.IsInRole("client"))
        {
            DataView dv2 = (DataView)ClientIdSelect.Select(DataSourceSelectArguments.Empty);
            TextBox3.Text = Convert.ToString((int)dv2.Table.Rows[0][0]);
            Session["ClientID"] = Convert.ToString((int)dv2.Table.Rows[0][0]);
            Session["ClientName"] = (string)dv2.Table.Rows[0][1];
            Client.Insert();
            Response.Redirect("~/Client/ClientAccount.aspx");
        }
        else if (User.IsInRole("admin"))
        {
            DataView dv2 = (DataView)EmpIdSelect.Select(DataSourceSelectArguments.Empty);
            TextBox3.Text = Convert.ToString((int)dv2.Table.Rows[0][0]);
            Session["EmployeeID"] = Convert.ToString((int)dv2.Table.Rows[0][0]);
            Session["EmployeeName"] = (string)dv2.Table.Rows[0][2];
            Emp.Insert();
            Response.Redirect("~/Admin/Admin.aspx");
        }
        else if (User.IsInRole("ysa"))
        {
            Response.Redirect("");
        }
        else if (User.IsInRole("yc"))
        {
            Response.Redirect("");
        }
        else
        {
            Response.Redirect("default.aspx");
        }
    }
}