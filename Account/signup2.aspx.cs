using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;

public partial class signup2 : System.Web.UI.Page
{
    string key;
    String UserName1;
    protected void Page_Load(object sender, EventArgs e)
    {
        {

            TextBox2.Text = "0";
            MembershipUser ma = Membership.GetUser();
            key = ma.ProviderUserKey.ToString();
            TextBox1.Text = key;
            SqlDataSource1.Insert();
            UserName1 = HeadLoginName.Page.User.Identity.Name;
            String rolename = "client";
            Roles.AddUserToRole(UserName1, rolename);
            Response.Redirect("~/Client/ClientInfo.aspx?UserId=" + key);        
            
            
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {



        //Response.Redirect("~/ClientInfo.aspx?UserId=" + .ProviderUserKey.ToString());
    }
}