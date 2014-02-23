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
            DataView dv = (DataView)VidSelect.Select(DataSourceSelectArguments.Empty);
            Session["vvid"] = (int)dv.Table.Rows[0][0];

            DataView dvx = (DataView)sumamnty.Select(DataSourceSelectArguments.Empty);
            Double tl = (Double)dvx.Table.Rows[0][0];

            DataView dvy = (DataView)sumfac.Select(DataSourceSelectArguments.Empty);
            Double tl1 = (Double)dvy.Table.Rows[0][0];

            DataView dvz = (DataView)summisc.Select(DataSourceSelectArguments.Empty);
            Double tl2 = (Double)dvz.Table.Rows[0][0];

            DataView acum = (DataView)Accum.Select(DataSourceSelectArguments.Empty);
            Double w = (Double)acum.Table.Rows[0][0];

            DataView dmg = (DataView)dmgSum.Select(DataSourceSelectArguments.Empty);
            Double dgs = (Double)dmg.Table.Rows[0][0];
            Label1.Text = dgs.ToString("n2");
            w = tl + tl1 + tl2 + w + dgs;
            Label12.Text = w.ToString("n2");
            Session["accum"] = w;
            accumUpdate.Update();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int x = 0;
        Double y = 0;
        DataView dv = (DataView)dmgFeeSelect.Select(DataSourceSelectArguments.Empty);
        x = Convert.ToInt32(TextBox1.Text);
        y = (Double)dv.Table.Rows[0][0];
        y = y * x;
        TextBox2.Text = y.ToString();
        dmgAmntyInsert.Insert();
        Response.Redirect(Request.RawUrl);

    }
    protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        Response.Redirect(Request.RawUrl);
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        int x, y, z,w;
        Double a, b, c;
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        foreach (DataRow dr in dv.Table.Rows)
        {
            x = (int)dv.Table.Rows[0][3];
            y = (int)dv.Table.Rows[0][1];
            TextBox5.Text = y.ToString();
            DataView dv2 = (DataView)amSelect.Select(DataSourceSelectArguments.Empty);
            w = (int)dv2.Table.Rows[0][1];
            w = w - x;
            TextBox4.Text = w.ToString();
            amSelect.Update();
        }
        TagUpdate.Update();
        DataView dv3 = (DataView)PerformanceBondSelect.Select(DataSourceSelectArguments.Empty);
        a = (Double)dv3.Table.Rows[0][0];
        DataView dv4 = (DataView)TotalAccum.Select(DataSourceSelectArguments.Empty);
        b = (Double)dv4.Table.Rows[0][0];
        a = a - b;
        if (a > 0)
        {
            amnt.Text = a.ToString();
            Refunded.Insert();
        }
        else if (a < 0)
        {
            a = Math.Abs(a);
            amnt.Text = a.ToString();
            BalanceAgain.Update();
            TagUpdate0.Update();
        }
        else
        {
            TagUpdate1.Update();
        }
        Response.Redirect("~/admin/EOS0.aspx?rr=1");
    }
}