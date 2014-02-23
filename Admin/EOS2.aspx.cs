using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_EOS : System.Web.UI.Page
{
    Double x, y, z;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ReservationId"] != null)
        {
            DataView dv = (DataView)VidSelect.Select(DataSourceSelectArguments.Empty);
            Session["vvid"] = (int)dv.Table.Rows[0][0];

            DataView dvx = (DataView)sumamnty.Select(DataSourceSelectArguments.Empty);
            Double tl = (Double)dvx.Table.Rows[0][0];
            amntytotal.Text = tl.ToString("n2");

            DataView dvy = (DataView)sumfac.Select(DataSourceSelectArguments.Empty);
            Double tl1 = (Double)dvy.Table.Rows[0][0];
            factotal.Text = tl1.ToString("n2");

            DataView dvz = (DataView)summisc.Select(DataSourceSelectArguments.Empty);
            Double tl2 = (Double)dvz.Table.Rows[0][0];
            misctotal.Text = tl2.ToString("n2");

            x = Convert.ToDouble(amntytotal.Text);
            y = Convert.ToDouble(factotal.Text);
            z = Convert.ToDouble(misctotal.Text);

            DataView acum = (DataView)Accum.Select(DataSourceSelectArguments.Empty);
            Double w = (Double)acum.Table.Rows[0][0];
            w = w + x + y + z;
            Label12.Text = w.ToString("n2");
            Session["accum"] = w;
            accumUpdate.Update();
        }
        Label11.Text = "";

       
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        int x = 0;
        Double y = 0;
        DataView dv = (DataView)PriceSelect.Select(DataSourceSelectArguments.Empty);
        x = Convert.ToInt32(TextBox2.Text);
        y = (Double)dv.Table.Rows[0][0];
        y = y * x;
        TextBox4.Text = y.ToString();
        try
        {
            eosamntyInsert.Insert();
        }
        catch (Exception)
        {
        }
        Response.Redirect(Request.RawUrl);
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        int x = 0, z = 0;
        Double y = 0;
        DataView dv = (DataView)PriceSelect2.Select(DataSourceSelectArguments.Empty);
        x = Convert.ToInt32(TextBox3.Text);
        y = (Double)dv.Table.Rows[0][0];
        y = y * x;
        TextBox4.Text = y.ToString();
        z = (int)dv.Table.Rows[0][1];
        TextBox5.Text = z.ToString();
        DataView dvgroup = (DataView)SqlDataSource9.Select(DataSourceSelectArguments.Empty);
        int returncount = (int)dvgroup.Table.Rows[0][0];
        if (returncount >= 1)
        {
            Label11.Text = "Already Added";
        }
        else
        {
            eosfacInsert.Insert();
            Response.Redirect(Request.RawUrl);
        }

    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        Double y = 0;
        DataView dv = (DataView)Price3Select.Select(DataSourceSelectArguments.Empty);
        y = (Double)dv.Table.Rows[0][0];
        TextBox4.Text = y.ToString();
        try
        {
            eosmiscinsert.Insert();
        }
        catch (Exception)
        {
        }
        Response.Redirect(Request.RawUrl);
    }
    protected void GridView4_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }
    protected void GridView5_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }
    protected void GridView6_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/EOS3.aspx?ReservationId=" + Request.QueryString["ReservationId"]);
    }
}