

using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class client_Default : System.Web.UI.Page
{
    string et = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["VenueId"] == null)
        {
            Response.Redirect("~/place/Step1.aspx");
        }
        if (Session["EventId"] == null)
        {
            Response.Redirect("~/place/Step1.aspx");
        }
        if (Session["EventName"] == null)
        {
            Response.Redirect("~/place/Step1.aspx");
        }
        
 
        DataView dv2 = (DataView)EventType.Select(DataSourceSelectArguments.Empty);
        et = (string)dv2.Table.Rows[0][0];
    }
    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
    {
    //    Session["ReservationDate"] = null;
        TextBox3.Text = Calendar1.SelectedDate.ToShortDateString();
    }
    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
    {
        DateTime d = DateTime.Now;
        if (et == "Big Event")
        {
            //DataView dv = (DataView)ReservedDateSelect.Select(DataSourceSelectArguments.Empty);
            //foreach (DataRow dr in dv.Table.Rows)
            //{
            //    if (e.Day.Date == (DateTime)dv.Table.Rows[x][0])
            //    {
            //        e.Day.IsSelectable = false;
            //        e.Cell.CssClass = "testing2";
            //    }
            //    x++;
            //}
            if (e.Day.Date <= DateTime.Now)
            {
                e.Day.IsSelectable = false;
                e.Cell.Font.Strikeout = true;
                e.Cell.ForeColor = System.Drawing.Color.Black;
                e.Cell.BackColor = System.Drawing.Color.White;
            }
        }
        else if (et == "Small Event")
        {

            if (e.Day.Date < d)
            {
                e.Day.IsSelectable = false;
                e.Cell.Font.Strikeout = true;
            }
            // DataView dv3 = (DataView)PracticeDateSelect.Select(DataSourceSelectArguments.Empty);

            //foreach (DataRow dr in dv3.Table.Rows)
            //{
            //    if (e.Day.Date == (DateTime)dv3.Table.Rows[y][0])
            //    {
            //        e.Cell.CssClass = "testing";
            //        e.Day.IsSelectable = true;
            //        e.Cell.Font.Strikeout = false;
            //    }
            //    y++;
            //}
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Session["ReservationDate"] = TextBox3.Text;
        Response.Redirect("~/place/step4.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        Response.Redirect("~/place/step2.aspx");
    }
}





//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Web;
//using System.Web.UI;
//using System.Web.UI.WebControls;
//using System.Data;

//public partial class client_Default : System.Web.UI.Page
//{
//    string et = "";
//    protected void Page_Load(object sender, EventArgs e)
//    {
//        if (Session["VenueId"] == null)
//        {
//            Response.Redirect("~/place/Step1.aspx");
//        }
//        if (Session["EventId"] == null)
//        {
//            Response.Redirect("~/place/Step1.aspx");
//        }
//        if (Session["EventName"] == null)
//        {
//            Response.Redirect("~/place/Step1.aspx");
//        }
//        Session["ReservationDate"] = null;
//        DataView dv2 = (DataView)EventType.Select(DataSourceSelectArguments.Empty);
//        et = (string)dv2.Table.Rows[0][0];
//    }
//    protected void Calendar1_SelectionChanged(object sender, EventArgs e)
//    {
//        TextBox3.Text = Calendar1.SelectedDate.ToShortDateString();
//    }
//    protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
//    {
//        int x = 0, y = 0;
//        if (et == "Big Event")
//        {
//            DataView dv = (DataView)ReservedDateSelect.Select(DataSourceSelectArguments.Empty);
//            foreach (DataRow dr in dv.Table.Rows)
//            {
//                if (e.Day.Date == (DateTime)dv.Table.Rows[x][0])
//                {
//                    e.Day.IsSelectable = false;
//                    e.Cell.CssClass = "testing2";
//                }
//                x++;
//            }
//            if (e.Day.Date < DateTime.Now)
//            {
//                e.Day.IsSelectable = false;
//                e.Cell.Font.Strikeout = true;
//                e.Cell.ForeColor = System.Drawing.Color.Black;
//                e.Cell.BackColor = System.Drawing.Color.White;
//            }
//        }
//        else if (et == "Small Event")
//        {
//            e.Day.IsSelectable = false;
//            e.Cell.Font.Strikeout = true;
//            DataView dv3 = (DataView)PracticeDateSelect.Select(DataSourceSelectArguments.Empty);
//            foreach (DataRow dr in dv3.Table.Rows)
//            {
//                if (e.Day.Date == (DateTime)dv3.Table.Rows[y][0])
//                {
//                    e.Cell.CssClass = "testing";
//                    e.Day.IsSelectable = true;
//                    e.Cell.Font.Strikeout = false;
//                }
//                y++;
//            }
//        }
//    }
//    protected void Button2_Click(object sender, EventArgs e)
//    {
//        Session["ReservationDate"] = TextBox3.Text;
//        Response.Redirect("~/place/step4.aspx");
//    }
//    protected void Button1_Click(object sender, EventArgs e)
//    {
        
//        Response.Redirect("~/place/step2.aspx");
//    }
//}