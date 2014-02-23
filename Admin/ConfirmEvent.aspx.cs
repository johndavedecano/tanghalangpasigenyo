using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;

public partial class ConfirmEvent : System.Web.UI.Page
{
    Double era, gt;
    protected void Page_Load(object sender, EventArgs e)
    {
        MembershipUser ma = Membership.GetUser();
        Employee.Text = ma.ProviderUserKey.ToString();
        DataView emps = (DataView)EmpIdSelect.Select(DataSourceSelectArguments.Empty);
        Employee.Text = (string)emps.Table.Rows[0][2];

        DataView dv = (DataView)DateSelect.Select(DataSourceSelectArguments.Empty);
        DateTime dd = (DateTime)dv.Table.Rows[0][0];
        TextBox1.Text = dd.ToShortDateString();
        TextBox2.Text = ((int)dv.Table.Rows[0][1]).ToString();
        era = (Double)dv.Table.Rows[0][2];
        gt = (Double)dv.Table.Rows[0][3];
        DataView dv2 = (DataView)ReservationFetch.Select(DataSourceSelectArguments.Empty);
        if (dv2.Table.Rows[0][0] is DBNull)
        {
            Label1.Visible = false;
            Label2.Visible = false;
            TextBox3.Visible = false;
            Button1.Visible = false;
        }
        else
        {
            Label1.Text = "Reservation Fee:  " + ((Double)dv2.Table.Rows[0][0]).ToString("n2");
            Label2.Text = "Receipt No.: ";
            era = era - (Double)dv2.Table.Rows[0][0];
            gt = gt - (Double)dv2.Table.Rows[0][0];
        }
        tgt.Text = gt.ToString("n2");
        tera.Text = era.ToString("n2");
        DT.Text = DateTime.Now.ToShortDateString();

        printhead.Visible = false;
        Double DoubeD = (Double)dv2.Table.Rows[0][0];
        AR.Text = DoubeD.ToString("n2");
        Button1.Enabled = true;
        TextBox3.ReadOnly = false;
        Button2.Enabled = true;
        LinkButton1.Attributes.Add("onclick", "window.open('../Admin/res.aspx?rrgh=" + Request.QueryString["ReservationId"] + "&rqw="+ TextBox3.Text +"', 'newwindow','menubar=1,resizable=1,width=700,height=900');return false;");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
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
        deduct.Update();
        UpdateTag.Update();
        UpdateDate.Insert();
        PaymentInsert.Insert();
        DataView dv = (DataView)AfftectedSelect.Select(DataSourceSelectArguments.Empty);
        int x=0;
        foreach (DataRow dr in dv.Table.Rows)
        {
            Session["rr"] = (int)dv.Table.Rows[x][0];
            Session["gg"] = "Event Date Already Reserved";
            ccancel.Insert();
        }
        printhead.Visible = true;
        Button1.Enabled = false;
        TextBox3.ReadOnly = true;
        Button2.Enabled = false;
    }


    protected void Button2_Click(object sender, EventArgs e)
    {

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/Admin.aspx");
    }
}