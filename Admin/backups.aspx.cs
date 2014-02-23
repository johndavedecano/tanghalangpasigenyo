using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class Admin_backups : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = "";
        

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection("Data Source=(local);Initial Catalog=ybaros_db;Integrated Security=True");
        SqlCommand cmd = new SqlCommand("backups", con);
        cmd.CommandType = CommandType.StoredProcedure;
        con.Open();
        cmd.ExecuteNonQuery();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection("Data Source=(local);Initial Catalog=ybaros_db;Integrated Security=True");
        SqlCommand cmd = new SqlCommand("Restores", con);
        cmd.CommandType = CommandType.StoredProcedure;
        con.Open();
        cmd.ExecuteNonQuery();
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        SqlConnection con = new SqlConnection("Data Source=(local);Initial Catalog=ybaros_db;Integrated Security=True");
        SqlCommand cmd = new SqlCommand("bbackup", con);
        cmd.CommandType = CommandType.StoredProcedure;
        con.Open();
        cmd.ExecuteNonQuery();
        TextBox1.Text = DateTime.Now.ToString();
        SqlDataSource1.Insert();
        Label1.Text = "Backup Successfully";

    }
}