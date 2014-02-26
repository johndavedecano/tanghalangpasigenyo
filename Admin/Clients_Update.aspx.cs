using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Text.RegularExpressions;

public partial class Admin_Clients_Update : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack) {
            
            string id = Request["ClientId"];
            ClientForm.Visible = true;
            UserNotFound.Visible = false;
            Notifications.Visible = false;

            try
            {
                // SETUP CONNECTION
                string cmd_string = "SELECT ClientTBL.ClientId,ClientTBL.ClientFName,ClientTBL.ClientMName,ClientTBL.ClientLName,aspnet_Membership.Email,aspnet_Users.UserName,ClientTBL.ClientContactNo,ClientTBL.ClientAddress,ClientTBL.ClientCompany,aspnet_Membership.IsApproved,aspnet_Users.UserId,ClientTBL.UserId ";
                cmd_string += "FROM ClientTBL ";
                cmd_string += "LEFT JOIN aspnet_Users ON (ClientTBL.UserId = aspnet_Users.UserId) ";
                cmd_string += "LEFT JOIN aspnet_Membership ON (aspnet_Users.UserId = aspnet_Membership.UserId) ";
                cmd_string += "WHERE ClientTBL.ClientId='" + id + "'";
                string s = WebConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
                SqlDataReader m;
                SqlConnection con = new SqlConnection(s);
                con.Open();
                SqlCommand cmd = new SqlCommand(cmd_string, con);
                m = cmd.ExecuteReader();
                int count = m.FieldCount;
                if (m.Read())
                {
                    // LETS CLOSE THE DATABASE CONNECTION FROM HERE BITCH!!!!

                    CreateAccountResults.Text = "";
                    FirstName.Text = m[1].ToString();
                    MiddleName.Text = m[2].ToString();
                    LastName.Text = m[3].ToString();

                    // GENERATE WILDCARD STRINGS
                    string client_strng = m[1].ToString() + m[2].ToString() + m[3].ToString();
                    client_strng = Regex.Replace(client_strng, "[^a-zA-Z0-9]+", String.Empty).ToLower();
                    string client_email = client_strng + "@dummyuser.com";
                    Guid userid = new Guid("{" + m[11].ToString() + "}");

                    // GENERATE DUMMY EMAIL IF DBNULL
                    if (m[4].GetType() == typeof(DBNull) || m[4].ToString() == "")
                    {
                        // TRY TO UPDATE USERNAME
                        SqlConnection con_3 = new SqlConnection(s);
                        string update_username = "UPDATE aspnet_Membership SET Email='" + client_email + "' WHERE UserId='" + userid + "'";
                        SqlCommand update_cmd = new SqlCommand(update_username, con_3);
                        con_3.Open();
                        update_cmd.ExecuteNonQuery();
                        con_3.Close();
                        // FILL WITH THE NEW EMAIL
                        Email.Text = client_email;
                    }
                    else
                    {
                        Email.Text = m[4].ToString();
                    }

                    // GENERATE DUMMY USERNAME IF DBNULL
                    if (m[5].GetType() == typeof(DBNull))
                    {
                        SqlConnection con_2 = new SqlConnection(s);
                        string update_username = "UPDATE aspnet_Users SET UserName='" + client_strng + "', LoweredUserName='" + client_strng + "' WHERE UserId='" + userid + "'";
                        SqlCommand update_cmdx = new SqlCommand(update_username, con_2);
                        con_2.Open();
                        update_cmdx.ExecuteNonQuery();
                        con_2.Close();
                        // FILL WITH THE NEW USERNAME
                        UserName.Text = client_strng;
                    }
                    else
                    {
                        UserName.Text = m[5].ToString();
                    }

                    ClientContactNo.Text = m[6].ToString();
                    ClientAddress.Text = m[7].ToString();
                    ClientCompany.Text = m[8].ToString();

                    if (m[9].GetType() == typeof(bool))
                    {
                        bool status = Convert.ToBoolean(m[9]);
                        if (status == true)
                        {
                            UserStatus.SelectedValue = "1";
                        }
                        else
                        {
                            UserStatus.SelectedValue = "0";
                        }
                    }
                    else
                    {
                        UserStatus.SelectedValue = "0";
                    }
                }
                else
                {
                    UserNotFound.Visible = true;
                    ClientForm.Visible = false;
                }
                con.Close();
            }
            catch (System.Configuration.Provider.ProviderException x)
            {
                Notifications.Visible = true;
                NotificationsMessage.Text = "<div class='alert alert-danger'>" + x.Message.ToString() + "</div>";
            }
        }
    }

    public void UpdateClient_OnClick(object sender, EventArgs args)
    {
        try
        {
            /////////////////////////////////////////////////////////////////////////////////////////////////////
            MembershipUser u = Membership.GetUser(UserName.Text);
            if (u == null)
            {

                string new_username = FirstName.Text + MiddleName.Text + LastName.Text;
                new_username = Regex.Replace(new_username, "[^a-zA-Z0-9]+", String.Empty).ToLower();
                Guid userid = new Guid("{" + Request["UserId"].ToString() + "}");

                string dave = WebConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
                SqlConnection con_dave = new SqlConnection(dave);

                string update_username = "UPDATE aspnet_Users SET UserName='" + new_username + "', LoweredUserName='" + new_username + "' WHERE UserId='" + userid + "'";
                SqlCommand update_cmdx = new SqlCommand(update_username, con_dave);

                con_dave.Open();
                update_cmdx.ExecuteNonQuery();
                con_dave.Close();
            }
            u.Email = Email.Text;
            u.IsApproved = (UserStatus.Text == "1") ? true : false;
            if (PasswordTextbox.Text != "" && PasswordConfirmTextbox.Text != "")
            {
                u.ChangePassword(u.ResetPassword(), PasswordTextbox.Text);
            }
            Membership.UpdateUser(u);
            //////////////////////////////////////////////////////////////////////////////////////////////////////
            
            // UPDATE CLIENT PROFILE/////////////////////////////////////////////////////////////////////////////
            int status = (UserStatus.Text == "1") ? 1 : 0;
            string s2 = WebConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
            SqlConnection con2 = new SqlConnection(s2);
            string update = "";
            update += "UPDATE ClientTBL ";
            update += "SET ClientFname = '"+FirstName.Text+"',";
            update += "ClientLname = '" + LastName.Text + "',";
            update += "ClientMname='" + MiddleName.Text + "',";
            update += "ClientContactNo='" + ClientContactNo.Text + "',";
            update += "ClientAddress='" + ClientAddress.Text + "',";
            update += "ClientCompany='" + ClientCompany.Text + "',";
            update += "Status=" + status.ToString();
            update += " WHERE ClientId=" + Request["ClientId"].ToString();
            con2.Open();
            SqlCommand update_cmd = new SqlCommand(update, con2);
            update_cmd.ExecuteNonQuery();
            con2.Close();
            Notifications.Visible = true;
            NotificationsMessage.Text = "<div class='alert alert-success'>Account has been successfully updated.</div>";
            //NotificationsMessage.Text = "<div class='alert alert-success'>"+update+"</div>";
        }
        catch (System.Configuration.Provider.ProviderException e)
        {
            Notifications.Visible = true;
            NotificationsMessage.Text = "<div class='alert alert-danger'>" + e.Message.ToString() + "</div>";
        }
    }
}