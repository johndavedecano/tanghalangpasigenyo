using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_PracticeDates : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["rrr"] == "1")
        {
            Label1.Text = "Date Successfully Added";
        }
        else
        {
            Label1.Text = "";
        
        }
        


    }
    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {
        int x = 0;
        DataView dv = (DataView)ReservedDateSelect.Select(DataSourceSelectArguments.Empty);
        foreach (DataRow dr in dv.Table.Rows)
        {
            if (e.Day.Date == (DateTime)dv.Table.Rows[x][0])
            {
                e.Day.IsSelectable = false;
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
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
        TextBox1.Text = Calendar1.SelectedDate.ToShortDateString();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        PracDateInsert.Insert();
        UpdatePanel1.Update();
        Response.Redirect("~/Admin/PracticeDates.aspx?rrr=1");

    }
}