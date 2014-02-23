using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class Admin_Users_Add : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        this.Bind_Roles();
    }

    protected void Bind_Roles()
    {
        DropDownList1.DataSource = Roles.GetAllRoles();
        DropDownList1.DataBind();
    }

    public void CreateUser_OnClick(object sender, EventArgs args)
    {
        MembershipCreateStatus createStatus;
        // Create new user.
        MembershipUser newUser = Membership.CreateUser(
            UserNameTextbox.Text,
            PasswordTextbox.Text,
            Email.Text, 
            String.Empty,
            String.Empty,
            true, 
            out createStatus
        );
        switch (createStatus)
        {
            case MembershipCreateStatus.Success:
                CreateAccountResults.Text = "<div class='alert alert-success'>The user account was successfully created!</div>";
                break;
            case MembershipCreateStatus.DuplicateUserName:
                CreateAccountResults.Text = "<div class='alert alert-danger'>There already exists a user with this username.</div>";
                break;

            case MembershipCreateStatus.DuplicateEmail:
                CreateAccountResults.Text = "<div class='alert alert-danger'>There already exists a user with this email address.</div>";
                break;
            case MembershipCreateStatus.InvalidEmail:
                CreateAccountResults.Text = "<div class='alert alert-danger'>There email address you provided in invalid.</div>";
                break;
            case MembershipCreateStatus.InvalidAnswer:
                CreateAccountResults.Text = "<div class='alert alert-danger'>There security answer was invalid.</div>";
                break;
            case MembershipCreateStatus.InvalidPassword:
                CreateAccountResults.Text = "<div class='alert alert-danger'>The password you provided is invalid. It must be seven characters long and have at least one non-alphanumeric character.</div>";
                break;
            default:
                CreateAccountResults.Text = "<div class='alert alert-danger'>There was an unknown error; the user account was NOT created.</div>";
                break;
        }

    }


}