using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class ConfirmEvent : System.Web.UI.Page
{
    Double era, gt;
    TimeSpan st, et;
    DateTime dt;
    protected void Page_Load(object sender, EventArgs e)
    {
        DataView dv = (DataView)DateSelect.Select(DataSourceSelectArguments.Empty);
        DateTime dd = (DateTime)dv.Table.Rows[0][0];
        TextBox1.Text = dd.ToShortDateString();
        TextBox2.Text = ((int)dv.Table.Rows[0][1]).ToString();
        era = (Double)dv.Table.Rows[0][2];
        gt = (Double)dv.Table.Rows[0][3];
        tgt.Text = gt.ToString("n2");
        tera.Text = era.ToString("n2");
        DataView dvd = (DataView)EventDetails.Select(DataSourceSelectArguments.Empty);
        dt = (DateTime)dvd.Table.Rows[0][0];
        st = (TimeSpan)dvd.Table.Rows[0][1];
        et = (TimeSpan)dvd.Table.Rows[0][2];
        rdate.Text = dt.ToShortDateString();
        stime.Text = st.ToString();
        etime.Text = et.ToString();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Tag2.Update();
        SEInsert.Insert();
        Response.Redirect("~/Admin/Admin.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["gg"] = "Cancelled by the Admin";
        ccancel.Insert();
        Tag0.Update();
        Response.Redirect("~/Admin/Admin.aspx");
    }
    protected string ConvertTime(TimeSpan d)
    {
        string s = "", post = "";
        string testing = d.ToString();
        string ss = testing.Substring(0, 2);
        int x = Convert.ToInt32(ss);
        if (x > 12)
        {
            x = x - 12;
            post = "pm";
        }
        else if (x < 12)
        {
            post = "am";
        }
        else if (x == 12)
        {
            post = "pm";
        }
        s = x.ToString() + ":" + testing.Substring(3, 2) + post;
        return s;
    }
}