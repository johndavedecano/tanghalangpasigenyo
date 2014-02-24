using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Web.Configuration;

public partial class Admin_Users_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Bind_Roles();
    }

    protected void Bind_Roles()
    {
        RolesDropdown.DataSource = Roles.GetAllRoles();
        RolesDropdown.DataBind();
    }

    public void CreateUser_OnClick(object sender, EventArgs args)
    {
        // Create new user and retrieve create status result.

        MembershipCreateStatus status;
        try
        {
            string passwordQuestion = "What is your mother's maiden name?";
            string passwordAnswer = MiddleName.Text;
 
            MembershipUser newUser = Membership.CreateUser(UserName.Text, PasswordTextbox.Text, 
                                                            Email.Text, passwordQuestion,
                                                            passwordAnswer, true, out status);
            // ADD USER ROLES
            if (!Roles.RoleExists(RolesDropdown.Text))
            {
                Roles.CreateRole(RolesDropdown.Text);
            }

            if (!Roles.IsUserInRole(UserName.Text, RolesDropdown.Text))
            {
                Roles.AddUserToRole(UserName.Text, RolesDropdown.Text);
            }

            // ADD MEMBERS PROFILE
            string cmd_string;
            string role = RolesDropdown.Text;
            string s = WebConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
            SqlConnection con = new SqlConnection(s);
            con.Open();

            MembershipUser mu = Membership.GetUser(UserName.Text);
            string userId = mu.ProviderUserKey.ToString();

            switch (role) { 
                case "client":
                    cmd_string = "INSERT INTO ClientTBL (UserId,ClientLname,ClientMname, ClientFname) VALUES ('" + userId + "','" + LastName.Text + "','" + MiddleName.Text + "','" + FirstName.Text + "')";
                break;

                default:
                    cmd_string = "INSERT INTO EmployeeTBL (UserId, EmpFName, EmpLName, Position) VALUES ('" + userId + "','" + FirstName.Text + "','" + LastName.Text + "','" + RolesDropdown.Text + "')";
                break;
            }

            SqlCommand cmd = new SqlCommand(cmd_string, con);
            cmd.ExecuteNonQuery();
            con.Close();

            if (newUser == null)
            {
                CreateAccountResults.Text = GetErrorMessage(status);
            }
            else
            {
                CreateAccountResults.Text = "<div class='alert alert-success'>Account has been successfully created.</div>";
            }
        }
        catch
        {
            CreateAccountResults.Text = "<div class='alert alert-danger'>An exception occurred creating the user.</div>";
        }
    }

    public string GetErrorMessage(MembershipCreateStatus status)
    {
        switch (status)
        {
            case MembershipCreateStatus.DuplicateUserName:
                return "<div class='alert alert-danger'>Username already exists. Please enter a different user name.</div>";
            case MembershipCreateStatus.DuplicateEmail:
                return "<div class='alert alert-danger'>A username for that e-mail address already exists. Please enter a different e-mail address.</div>";
            case MembershipCreateStatus.InvalidPassword:
                return "<div class='alert alert-danger'>The password provided is invalid. Please enter a valid password value.</div>";
            case MembershipCreateStatus.InvalidEmail:
                return "<div class='alert alert-danger'>The e-mail address provided is invalid. Please check the value and try again.</div>";
            case MembershipCreateStatus.InvalidAnswer:
                return "<div class='alert alert-danger'>The password retrieval answer provided is invalid. Please check the value and try again.</div>";
            case MembershipCreateStatus.InvalidQuestion:
                return "<div class='alert alert-danger'>The password retrieval question provided is invalid. Please check the value and try again.</div>";
            case MembershipCreateStatus.InvalidUserName:
                return "<div class='alert alert-danger'>The user name provided is invalid. Please check the value and try again.</div>";
            case MembershipCreateStatus.ProviderError:
                return "<div class='alert alert-danger'>The authentication provider returned an error. Please verify your entry and try again. If the problem persists, please contact your system administrator.</div>";
            case MembershipCreateStatus.UserRejected:
                return "<div class='alert alert-danger'>The user creation request has been canceled. Please verify your entry and try again. If the problem persists, please contact your system administrator.</div>";
            default:
                return "<div class='alert alert-danger'>An unknown error occurred. Please verify your entry and try again. If the problem persists, please contact your system administrator.</div>";
        }

    }
}