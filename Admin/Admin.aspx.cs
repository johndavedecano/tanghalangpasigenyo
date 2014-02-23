using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       // Label1.Text = "<div class='month m-8'>";
       // Label2.Text = "<div class='day d-21'>";
       // Label3.Text = "<div class='year y-2012'>";
        DateStampLabel.Text = DateTime.Now.ToShortTimeString();
        Panel2.Visible = false;
        Panel3.Visible = false;
        Panel1.Visible = false;
    }
    protected void UpdateTimer_Tick(object sender, EventArgs e)
    {
        DateStampLabel.Text = DateTime.Now.ToShortTimeString();
    }
   /* protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {

        int x = 0; ;
        DataView dv = (DataView)ReservedDateSelect.Select(DataSourceSelectArguments.Empty);
        foreach (DataRow dr in dv.Table.Rows)
        {
            if (e.Day.Date == (DateTime)dv.Table.Rows[x][0])
            {
                e.Day.IsSelectable = true;
                e.Cell.CssClass = "testing2";
            }
            x++;
        }
        if (e.Day.Date < DateTime.Now)
        {
            e.Day.IsSelectable = false;
            e.Cell.Font.Strikeout = true;
            e.Cell.ForeColor = System.Drawing.Color.Black;
            e.Cell.BackColor = System.Drawing.Color.White;
        }
    }
    protected void Calendar2_DayRender(object sender, DayRenderEventArgs e)
    {
        int x = 0; ;
        DataView dv = (DataView)ReservedDateSelect0.Select(DataSourceSelectArguments.Empty);
        foreach (DataRow dr in dv.Table.Rows)
        {
            if (e.Day.Date == (DateTime)dv.Table.Rows[x][0])
            {
                e.Day.IsSelectable = true;
                e.Cell.CssClass = "testing2";
            }
            x++;
        }
        if (e.Day.Date < DateTime.Now)
        {
            e.Day.IsSelectable = false;
            e.Cell.Font.Strikeout = true;
            e.Cell.ForeColor = System.Drawing.Color.Black;
            e.Cell.BackColor = System.Drawing.Color.White;
        }
    }*/
    protected void Button1_Click(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(1000);
        string x = "";
        DataView dv = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
        DataView dv2 = (DataView)SqlDataSource3.Select(DataSourceSelectArguments.Empty);
        int y = (int)dv2.Table.Rows[0][0];
        if (y == 1)
        {
            x = (string)dv.Table.Rows[0][3];
        }
        
        if (x == "prac")
        {
            Panel2.Visible = false;
            Panel3.Visible = false;
            Panel1.Visible = true;
        }
        else if (x == "res")
        {
            Panel1.Visible = false;
            Panel2.Visible = true;
            Panel3.Visible = false;
            int z = (int)dv.Table.Rows[0][2];;
            TextBox6.Text = z.ToString();
        }
        else
        {
            Panel1.Visible = false;
            Panel3.Visible = false;
            Panel3.Visible = true;
        }
    }
}