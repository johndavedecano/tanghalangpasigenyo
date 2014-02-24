using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;
using System.Web.Configuration;
using System.Data.SqlClient;

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
        if (Session["ReservationDate"] == null)
        {
            Response.Redirect("~/place/Step1.aspx");
        }
            Session["StartTime"] = null;
            Session["EndTime"] = null;
            Session["NoofHours"] = null;

            DataView dv2 = (DataView)EventType.Select(DataSourceSelectArguments.Empty);

            et = (string)dv2.Table.Rows[0][0];

            if (et == "Small Event")
            {
                Label3.Text = "<strong>The Venue is not available</strong>";
            }
            else
            {
                Label3.Text = "";
            }
            DataView dv3 = (DataView)AffectedCount.Select(DataSourceSelectArguments.Empty);
            int count = (int)dv3.Table.Rows[0][0];
            if (count == 0)
                Label3.Text = "";
            TimeSlotValid.Visible = false;
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
    private bool ValidateDate(TimeSpan startime,TimeSpan endtime,DateTime ReservationDate)
    {
        string cmd_string = "SELECT COUNT(*) FROM ReservationTBL WHERE ReservationDate = '" + ReservationDate.ToString() + "' AND (ReservationStartTime BETWEEN '" + startime.ToString() + "' AND '" + endtime.ToString() + "') OR (ReservationStartTime BETWEEN '" + startime.ToString() + "' AND '" + endtime.ToString() + "')";
        string s = WebConfigurationManager.ConnectionStrings["ApplicationServices"].ConnectionString;
        SqlConnection con = new SqlConnection(s);
        SqlDataReader m;
        con.Open();
        SqlCommand cmd = new SqlCommand(cmd_string,con);
        m = cmd.ExecuteReader();
        if (m.Read()){
            con.Close();
            return false;
        }else{
            con.Close();
            return true;
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        contime();
        etime();
        Session["StartTime"] = starttime.Text;
        Session["EndTime"] = endtime.Text;
        Session["NoofHours"] = DropDownList1.SelectedValue.ToString();
        DateTime ReservationD = Convert.ToDateTime(Session["ReservationDate"]);
        int x = 0;
        TimeSpan startT = TimeSpan.Parse(starttime.Text);
        TimeSpan endT = TimeSpan.Parse(endtime.Text);

        if (this.ValidateDate(startT, endT, ReservationD) == false)
        {
            DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
            foreach (DataRow dr in dv.Table.Rows)
            {

                if (ReservationD.Date == (DateTime)dv.Table.Rows[x][2])
                {
                    if (((((TimeSpan)dv.Table.Rows[x][3]) <= startT) && (((TimeSpan)dv.Table.Rows[x][4]) >= startT)) || ((((TimeSpan)dv.Table.Rows[x][3]) <= endT) && (((TimeSpan)dv.Table.Rows[x][4]) >= endT)))
                    {
                        Label3.Text = "<strong>The Venue is not available</strong>";
                    }

                    else
                    {
                        Label3.Text = "";
                        Response.Redirect("~/place/step5.aspx");

                    } x++;
                }
            }
            if (dv.Count == 0) { Label3.Text = ""; Response.Redirect("~/place/step5.aspx");}
        }
        else {
            TimeSlotValid.Visible = true;
        }
    }
    protected void contime()
    {
        string myla = "", ms = "";
        myla = TextBox3.Text;
        int x = 0;
        x = myla.Length;

        if (x == 7)
        {
            ms = myla.Substring(5, 2);
            x = Convert.ToInt32(myla.Substring(0, 2));
            if (myla.Substring(0, 2) != "12")
            {
                if (ms == "pm")
                {

                    x = x + 12;
                    starttime.Text = x.ToString() + myla.Substring(2, 3);

                }
                else
                    starttime.Text = myla.Substring(0, 5);
            }
            else
            {
                if (ms == "am")
                {
                    x = x - 12;
                    starttime.Text = x.ToString() + myla.Substring(2, 3);
                }
                else
                    starttime.Text = myla.Substring(0, 5);
            }
        }
        else if (x == 6)
        {
            ms = myla.Substring(4, 2);
            if (ms == "pm")
            {
                x = Convert.ToInt32(myla.Substring(0, 1));
                x = x + 12;
                starttime.Text = x.ToString() + myla.Substring(1, 3);
            }
            else
                starttime.Text = myla.Substring(0, 4);
        }
    }
    protected void etime()
    {
        string start = starttime.Text;
        string startleft, startright;
        if (start.Length == 4)
        {
            startleft = start.Substring(0, 1);
            startright = start.Substring(1, 3);
        }
        else
        {
            startleft = start.Substring(0, 2);
            startright = start.Substring(2, 3);
        }



        int startTime = Convert.ToInt32(startleft);
        int NoHrs = Convert.ToInt32(DropDownList1.SelectedValue.ToString());

        int endTime = startTime + NoHrs;

        endTime %= 24;


        endtime.Text = endTime + startright;

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/place/step3.aspx");
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
//        if (Session["ReservationDate"] == null)
//        {
//            Response.Redirect("~/place/Step1.aspx");
//        }
//        Session["StartTime"] = null;
//        Session["EndTime"] = null;
//        Session["NoofHours"] = null;
//        DataView dv2 = (DataView)EventType.Select(DataSourceSelectArguments.Empty);
//        et = (string)dv2.Table.Rows[0][0];
//        if (et == "Small Event")
//        {
//            Label3.Text = "<strong>The Venue is not available</strong>";
//        }
//        else
//        {
//            Label3.Text = "";
//        }
//        DataView dv3 = (DataView)AffectedCount.Select(DataSourceSelectArguments.Empty);
//        int count = (int)dv3.Table.Rows[0][0];
//        if (count == 0)
//            Label3.Text = "";
//    }
//    protected string ConvertTime(TimeSpan d)
//    {
//        string s = "", post = "";
//        string testing = d.ToString();
//        string ss = testing.Substring(0, 2);
//        int x = Convert.ToInt32(ss);
//        if (x > 12)
//        {
//            x = x - 12;
//            post = "pm";
//        }
//        else if (x < 12)
//        {
//            post = "am";
//        }
//        else if (x == 12)
//        {
//            post = "pm";
//        }
//        s = x.ToString() + ":" + testing.Substring(3, 2) + post;
//        return s;
//    }
//    protected void Button2_Click(object sender, EventArgs e)
//    {
//        contime();
//        etime();
//        Session["StartTime"] = starttime.Text;
//        Session["EndTime"] = endtime.Text;
//        Session["NoofHours"] = DropDownList1.SelectedValue.ToString();
//        Response.Redirect("~/place/step5.aspx");
//    }
//    protected void contime()
//    {
//        string myla = "", ms = "";
//        myla = TextBox3.Text;
//        int x = 0;
//        x = myla.Length;

//        if (x == 7)
//        {
//            ms = myla.Substring(5, 2);
//            x = Convert.ToInt32(myla.Substring(0, 2));
//            if (myla.Substring(0, 2) != "12")
//            {
//                if (ms == "pm")
//                {

//                    x = x + 12;
//                    starttime.Text = x.ToString() + myla.Substring(2, 3);

//                }
//                else
//                    starttime.Text = myla.Substring(0, 5);
//            }
//            else
//            {
//                if (ms == "am")
//                {
//                    x = x - 12;
//                    starttime.Text = x.ToString() + myla.Substring(2, 3);
//                }
//                else
//                    starttime.Text = myla.Substring(0, 5);
//            }
//        }
//        else if (x == 6)
//        {
//            ms = myla.Substring(4, 2);
//            if (ms == "pm")
//            {
//                x = Convert.ToInt32(myla.Substring(0, 1));
//                x = x + 12;
//                starttime.Text = x.ToString() + myla.Substring(1, 3);
//            }
//            else
//                starttime.Text = myla.Substring(0, 4);
//        }
//    }
//    protected void etime()
//    {
//        string start = starttime.Text;
//        string startleft, startright;
//        if (start.Length == 4)
//        {
//            startleft = start.Substring(0, 1);
//            startright = start.Substring(1, 3);
//        }
//        else
//        {
//            startleft = start.Substring(0, 2);
//            startright = start.Substring(2, 3);
//        }



//        int startTime = Convert.ToInt32(startleft);
//        int NoHrs = Convert.ToInt32(DropDownList1.SelectedValue.ToString());

//        int endTime = startTime + NoHrs;

//        endTime %= 24;


//        endtime.Text = endTime + startright;

//    }
//    protected void Button1_Click(object sender, EventArgs e)
//    {
//        Response.Redirect("~/place/step3.aspx");
//    }
//}