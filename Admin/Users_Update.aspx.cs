using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Web.Configuration;
using System.Data.SqlClient;

public partial class Admin_Users_Update : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string id = Request["EmpId"];
            UserForm.Visible = true;
            UserNotFound.Visible = false;
            this.FindEmployee(id);
            this.Load_Roles();
        }
    }
    public void Load_Roles()
    {
        RolesDropdown.DataSource = Roles.GetAllRoles();
        RolesDropdown.DataBind();
    }
    private void FindEmployee(String id)
    {
        // Find Member BY ID
        string cmd_string = "SELECT EmployeeTBL.EmpId As EmpId,EmployeeTBL.EmpFName,EmployeeTBL.EmpLName,EmployeeTBL.Position,aspnet_Users.UserName FROM EmployeeTBL LEFT JOIN aspnet_Users ON (EmployeeTBL.UserId = aspnet_Users.UserId) WHERE EmployeeTBL.EmpId='" + id + "'";
        string s = WebConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        SqlDataReader m;
        SqlConnection con = new SqlConnection(s);
        con.Open();

        SqlCommand cmd = new SqlCommand(cmd_string, con);
        m = cmd.ExecuteReader();
        if (m.Read())
        {
            FirstName.Text = m[1].ToString();
            LastName.Text = m[2].ToString();
            MembershipUser u = Membership.GetUser(m[4].ToString());
            UserName.Text = u.UserName;
            Email.Text = u.Email;
            // GET CURRENT USER ROLE
            string[] userRoles = Roles.GetRolesForUser(u.UserName);
            CurrentRole.Text = userRoles[0].ToString();
        }
        else {
            UserForm.Visible = false;
            UserNotFound.Visible = true;
        }

        
    }

    public void UpdateUser_OnClick(object sender, EventArgs args)
    { 
        
    }
}