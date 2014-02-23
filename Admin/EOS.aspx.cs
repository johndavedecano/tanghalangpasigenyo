using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_EOS : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ReservationId"] != null)
        {

        }
        TextBox1.ReadOnly = true;
        RequiredFieldValidator7.Enabled = false;
    }
    protected void CheckBox1_CheckedChanged(object sender, EventArgs e)
    {
        if (CheckBox1.Checked == true)
        {
            TextBox1.ReadOnly = false;
            RequiredFieldValidator7.Enabled = true;
        }
        else
        {
            TextBox1.ReadOnly = true;
            TextBox1.Text = "";
            RequiredFieldValidator7.Enabled = false;
        }
        UpdatePanel1.Update();
    }
   
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (CheckBox1.Checked == false)
        {
            TextBox1.Text = "0";
        }
        DataView dv = (DataView)rphSelect.Select(DataSourceSelectArguments.Empty);
        Double x = (Double)dv.Table.Rows[0][0];
        Double y = Convert.ToDouble(TextBox1.Text);
        x = x * y;
        TextBox13.Text = x.ToString();
        eosInsert.Insert();
        Response.Redirect("~/Admin/EOS2.aspx?ReservationId=" + Request.QueryString["ReservationId"]);

    }
}