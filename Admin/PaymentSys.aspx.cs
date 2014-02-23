using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;

public partial class Admin_RFC : System.Web.UI.Page
{
    Double x = 0, y=0;
    int vid = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        MembershipUser ma = Membership.GetUser();
        Employee.Text = ma.ProviderUserKey.ToString();
        DataView emps = (DataView)EmpIdSelect.Select(DataSourceSelectArguments.Empty);
        Employee.Text = (string)emps.Table.Rows[0][2];


        TextBox1.Enabled = false;
        TextBox2.Enabled = false;
        TextBox3.Enabled = false;
        Button1.Enabled = false;
        Button2.Enabled = false;
        LinkButton1.Enabled = false;
        Button3.Enabled = false;
        TextBox4.ReadOnly = false;
        RangeValidator1.Visible = true;
        TextBox5.Text = DateTime.Now.ToString();
        LinkButton1.Attributes.Add("onclick", "window.open('../Admin/res.aspx?rrgh=" + TextBox4.Text + "&rqw=" + TextBox1.Text + "', 'newwindow','menubar=1,resizable=1,width=700,height=900');return false;");

    }   
    protected void Button4_Click(object sender, EventArgs e)
    {
        DataView dv1 = (DataView)Checking.Select(DataSourceSelectArguments.Empty);
        if((int)dv1.Table.Rows[0][0] == 1)
        {
                TextBox1.Enabled = true;
                TextBox2.Enabled = true;
                TextBox3.Enabled = true;
                Button1.Enabled = true;
                Button2.Enabled = true;
                TextBox4.ReadOnly = true;
                DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
                x = (Double)dv.Table.Rows[0][0];
                TextBox8.Text = x.ToString();
                RangeValidator1.MaximumValue = x.ToString();
                DataView dv3 = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
                vid = (int)dv3.Table.Rows[0][0];
                TextBox7.Text = vid.ToString();
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DataView dv3 = (DataView)SelectTag.Select(DataSourceSelectArguments.Empty);
        int taggg = (int)dv3.Table.Rows[0][0];
        x = Convert.ToDouble(TextBox8.Text);
        y = Convert.ToDouble(TextBox3.Text);
        if (taggg == 4)
        {
            if (x == y)
            {
                TagUpdate.Update();
            }
        }
        else if (taggg == 6)
        {
            if (x == y)
            {
                TagUpdate0.Update();
            }
        }
        string sttt = "";
        sttt = DateTime.Now.ToLongTimeString();
        if (sttt.Length == 10)
        {
            sttt = "0" + sttt;
        }
        string post = sttt.Substring(9, 2);
        if (post == "PM")
        {
            int h = Convert.ToInt32(sttt.Substring(0, 2)) + 12;
            TTime.Text = h.ToString() + sttt.Substring(2, 6);
        }
        else
        {
            TTime.Text = sttt.Substring(0, 8);
        }
        y = x - y;
        TextBox6.Text = y.ToString();
        PaymentInsert.Insert();
        TextBox5.Text = DateTime.Now.ToShortDateString();
        SqlDataSource1.Update();
        LinkButton1.Enabled = true;
        Button3.Enabled = true;
        RangeValidator1.Visible = false;
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }
}