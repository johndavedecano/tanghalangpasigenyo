using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_RFC : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["rr"] == null)
        {
            Label1.Text = "";
        }
        else if (Request.QueryString["rr"] == "0")
        {
            Label1.Text = "Request Approved";
        }
        else if (Request.QueryString["rr"] == "1")
        {
            Label1.Text = "Request Rejected";
        }
        if (Request.QueryString["ReservationId"] != null)
        {
            DataView dv = (DataView)Approved.Select(DataSourceSelectArguments.Empty);
            DateTime ddate = (DateTime)dv.Table.Rows[0][0];
            TextBox1.Text = ddate.ToShortDateString();
            DataView dv2 = (DataView)Cancel0.Select(DataSourceSelectArguments.Empty);
            int x = (int)dv2.Table.Rows[0][0];
            TextBox2.Text = x.ToString();
        }

    }   
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        UpdateDate.Update();
        Approved.Update();
        ResUpdate.Update();
        TagUpdate.Update();
        DataView dv = (DataView)AfftectedSelect.Select(DataSourceSelectArguments.Empty);
        int x = 0;
        foreach (DataRow dr in dv.Table.Rows)
        {
            Session["rr"] = (int)dv.Table.Rows[x][0];
            Session["gg"] = "Event Date Already Reserved";
            ccancel.Insert();
        }
        Response.Redirect("~/admin/RFR.aspx?rr=0");
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        Rejected.Update();
        Response.Redirect("~/admin/RFR.aspx?rr=1");
    }
}