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
            Notifications.Visible = false;
            UserName.Enabled = false;
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
            if (userRoles != null) {
                CurrentRole.Text = userRoles[0].ToString();
                RolesDropdown.SelectedValue = userRoles[0].ToString();
            }
            if (u.IsApproved == true)
            {
                UserStatus.SelectedValue = "yes";
            }
            else
            {
                UserStatus.SelectedValue = "no";
            }
        }
        else {
            UserForm.Visible = false;
            UserNotFound.Visible = true;
        }
    }

    public void UpdateUser_OnClick(object sender, EventArgs args)
    {
        try
        {
            MembershipUser u = Membership.GetUser(UserName.Text);
            u.Email = Email.Text;
            if (PasswordTextbox.Text != "" && PasswordConfirmTextbox.Text != "")
            {
                u.ChangePassword(u.ResetPassword(), PasswordTextbox.Text);
            }
            if (UserStatus.Text == "yes")
            {
                u.IsApproved = true;
            }
            else {
                u.IsApproved = false;
            }
            Membership.UpdateUser(u);
            string id = Request["EmpId"];
            string cmd_string = "UPDATE EmployeeTBL SET EmpFName = '"+FirstName.Text+"', EmpLName = '"+LastName.Text+"', Position = '"+RolesDropdown.Text+"' WHERE EmpId = '"+id+"'";
            string s = WebConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
            SqlConnection con = new SqlConnection(s);
            SqlCommand cmd = new SqlCommand(cmd_string, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            Notifications.Visible = true;
            NotificationsMessage.Text = "<div class='alert alert-success'>Account has been successfully updated.</div>";

        }
        catch (System.Configuration.Provider.ProviderException e)
        {
            Notifications.Visible = true;
            NotificationsMessage.Text = "<div class='alert alert-danger'>"+e.Message.ToString()+"</div>";
        }
    }
}