using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Additionals : System.Web.UI.Page
{
    Double rph = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["newId"] == null)
        {
            Response.Redirect("~/UnableAccess.aspx");
        }
        DataView dvxxx = (DataView)Validates.Select(DataSourceSelectArguments.Empty);
        if ((int)dvxxx.Table.Rows[0][0] != 1)
        {
            Response.Redirect("~/UnableAccess.aspx");
        }
        Double oa = 0;
        Double pb = 0;
        DataView dv1 = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        Label1.Text = (string)dv1.Table.Rows[0][1];
        Label2.Text = (string)dv1.Table.Rows[0][2];
        DateTime rdate = (DateTime)dv1.Table.Rows[0][6];
        Label3.Text = rdate.ToString("MM/dd/yyyy");

        Double era = (Double)dv1.Table.Rows[0][4];
        if (dv1.Table.Rows[0][5] is DBNull) { Label6.Text = ""; Label7.Text = ""; }
        else
        {
            pb = (Double)dv1.Table.Rows[0][5];
            Label6.Text = "Performance Bond";
            Label7.Text = pb.ToString("n2");
        }

        if (dv1.Table.Rows[0][3] is DBNull) { }
        else
        {
            oa = (Double)dv1.Table.Rows[0][3];
            Label5.Text = oa.ToString("n2");
        }

        Label4.Text = era.ToString("n2");

        era = oa + era + pb;
        Label8.Text = era.ToString("n2");

        if (dv1.Table.Rows[0][7] is DBNull)
        { Label9.Text = "No Reservation Fee."; }
        else
        {
            Double rf = (Double)dv1.Table.Rows[0][7];
            Label9.Text = rf.ToString("n2");
        }
        int vid = (int)dv1.Table.Rows[0][8];
        TextBox4.Text = vid.ToString();
        TextBox8.Text = Request.QueryString["newId"];
        DataView dvy = (DataView)SqlDataSource8.Select(DataSourceSelectArguments.Empty);
        if ((int)dvy.Table.Rows[0][0] >= 1)
        {
            DataView dvx = (DataView)SqlDataSource6.Select(DataSourceSelectArguments.Empty);
            Double tl = (Double)dvx.Table.Rows[0][0];
            Label10.Text = tl.ToString("n2");
        }
        else
            Label10.Text = "0";

        DataView dva = (DataView)rsvamntyCount.Select(DataSourceSelectArguments.Empty);
        if ((int)dva.Table.Rows[0][0] >= 1)
        {
            DataView dvb = (DataView)rsvamntySum.Select(DataSourceSelectArguments.Empty);
            Double tl2 = (Double)dvb.Table.Rows[0][0];
            Label12.Text = tl2.ToString("n2");
        }
        else
            Label12.Text = "0";
        DataView dvz = (DataView)rsvmiscCount.Select(DataSourceSelectArguments.Empty);
        if ((int)dvz.Table.Rows[0][0] >= 1)
        {
            DataView dvw = (DataView)rsvmiscSum.Select(DataSourceSelectArguments.Empty);
            Double tl3 = (Double)dvw.Table.Rows[0][0];
            Label13.Text = tl3.ToString("n2");
        }
        else
            Label13.Text = "0";

        Label11.Text = "";
        TextBox3.ReadOnly = true;

        Double gtotal = Convert.ToDouble(Label8.Text) + Convert.ToDouble(Label10.Text) + Convert.ToDouble(Label12.Text) + Convert.ToDouble(Label13.Text);
        Label14.Text = gtotal.ToString("n2");
        rsvupdatetotal.Update();
        Button1.Enabled = false;
        Button2.Enabled = false;
        btn1.Enabled = false;
        btn2.Enabled = false;
    }



    protected void ListView1_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (String.Equals(e.CommandName, "AddToList"))
        {
            ListViewDataItem dataItem = (ListViewDataItem)e.Item;
            TextBox5.Text = ListView1.DataKeys[dataItem.DisplayIndex].Value.ToString();
            DataView dv = (DataView)SqlDataSource3.Select(DataSourceSelectArguments.Empty);
            TextBox1.Text = (string)dv.Table.Rows[0][1];
            rph = (Double)dv.Table.Rows[0][2];
            TextBox2.Text = rph.ToString("n2");
            int gid = (int)dv.Table.Rows[0][3];
            TextBox6.Text = gid.ToString();
            Label11.Text = "";
            TextBox3.ReadOnly = false;
            TextBox3.Focus();
            Button1.Enabled = true;
            Button2.Enabled = true;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Double amount = Convert.ToDouble(TextBox2.Text) * Convert.ToInt32(TextBox3.Text);
        TextBox7.Text = amount.ToString("n2");
        DataView dvgroup = (DataView)SqlDataSource9.Select(DataSourceSelectArguments.Empty);
        int returncount = (int)dvgroup.Table.Rows[0][0];
        if (returncount >= 1)
        {
            Label11.Text = "Unable to Insert same Facility";
        }
        else
        {
            Label11.Text = "";
            SqlDataSource4.Insert();
            DataView dvx = (DataView)SqlDataSource6.Select(DataSourceSelectArguments.Empty);
            Double tl = (Double)dvx.Table.Rows[0][0];
            Label10.Text = tl.ToString("n2");
            Response.Redirect(Request.RawUrl);

        }
    }

    protected void GridView1_RowCommand1(object sender, GridViewCommandEventArgs e)
    {
        if (String.Equals(e.CommandName, "Modify"))
        {

        }
    }
    protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        Response.Redirect(Request.RawUrl);

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox1.Text = "";
        TextBox2.Text = "";
        TextBox3.Text = "";
        TextBox3.ReadOnly = true;
    }
    protected void ListView2_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (String.Equals(e.CommandName, "AddToList"))
        {
            ListViewDataItem dataItem = (ListViewDataItem)e.Item;
            amntyid.Text = ListView2.DataKeys[dataItem.DisplayIndex].Value.ToString();
            DataView dv = (DataView)AmenitySelect.Select(DataSourceSelectArguments.Empty);
            a1.Text = (string)dv.Table.Rows[0][1];
            a2.Text = (string)dv.Table.Rows[0][2];
            Double prc = (Double)dv.Table.Rows[0][3];
            a3.Text = prc.ToString("n2");
            a4.Focus();
            int x = (int)dv.Table.Rows[0][4];
            RangeValidator2.MaximumValue = x.ToString(); ;
            btn1.Enabled = true;
            btn2.Enabled = true;
        }
    }
    protected void btn1_Click(object sender, EventArgs e)
    {
        amntyamount.Text = (Convert.ToDouble(a3.Text) * Convert.ToInt32(a4.Text)).ToString();
        try { rsvamntyTBL.Insert(); }
        catch (Exception g) { }

        DataView dvx = (DataView)rsvamntySum.Select(DataSourceSelectArguments.Empty);
        Double tl2 = (Double)dvx.Table.Rows[0][0];
        Label12.Text = tl2.ToString("n2");
        Response.Redirect(Request.RawUrl);
    }
    protected void GridView2_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }
    protected void ListView3_ItemCommand(object sender, ListViewCommandEventArgs e)
    {
        if (String.Equals(e.CommandName, "AddToList"))
        {
            ListViewDataItem dataItem = (ListViewDataItem)e.Item;
            miscid.Text = ListView3.DataKeys[dataItem.DisplayIndex].Value.ToString();
            DataView dv = (DataView)miscselect.Select(DataSourceSelectArguments.Empty);
            Double amt = (Double)dv.Table.Rows[0][1];
            miscamount.Text = amt.ToString("n2");
            try { miscInsert.Insert(); }
            catch (Exception g) { }
            Response.Redirect(Request.RawUrl);
        }
    }

    protected void GridView3_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("~/client/ClientAccount.aspx");
    }

}