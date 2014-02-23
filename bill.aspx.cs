using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class client_bill : System.Web.UI.Page
{
    Double oe = 0, pb = 0, vr = 0, amntyex = 0, facex = 0, miscex = 0, total = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        DataView dv1 = (DataView)ExpensesSelect.Select(DataSourceSelectArguments.Empty);
        if (dv1.Table.Rows[0][0] is DBNull)
        {
            oe = 0;
        }
        else
        {
            oe = (Double)dv1.Table.Rows[0][0];
        }
        if (dv1.Table.Rows[0][1] is DBNull)
        {
            pb = 0;
        }
        else
        {
            pb = (Double)dv1.Table.Rows[0][1];
        }
        vr = (Double)dv1.Table.Rows[0][2];


        DataView dv2 = (DataView)Amenity.Select(DataSourceSelectArguments.Empty);
        DataView dv3 = (DataView)Facility.Select(DataSourceSelectArguments.Empty);
        DataView dv4 = (DataView)Misc.Select(DataSourceSelectArguments.Empty);
        if (dv2.Table.Rows[0][0] is DBNull)
        {
            amntyex = 0;
        }
        else
        {
            amntyex = (Double)dv2.Table.Rows[0][0];
        }
        if (dv3.Table.Rows[0][0] is DBNull)
        {
            facex = 0;
        }
        else
        {
            facex = (Double)dv3.Table.Rows[0][0];
        }
        if (dv4.Table.Rows[0][0] is DBNull)
        {
            miscex = 0;
        }
        else
        {
            miscex = (Double)dv4.Table.Rows[0][0];
        }

        Label6.Text = vr.ToString("n2");
        Label7.Text = amntyex.ToString("n2");
        Label8.Text = facex.ToString("n2");
        Label9.Text = miscex.ToString("n2");
        Label10.Text = oe.ToString("n2");
        Label11.Text = pb.ToString("n2");


        total = oe + pb + vr + amntyex + facex + miscex;
        Label12.Text = total.ToString("n2");
        Label2.Text = DateTime.Now.ToLongDateString();
        DataView dv5 = (DataView)DetailsSelect.Select(DataSourceSelectArguments.Empty);
        string vn, en, cn, cc;
        DateTime ddate;
        TimeSpan st, et;

        vn = (string)dv5.Table.Rows[0][0];
        ddate = (DateTime)dv5.Table.Rows[0][1];
        st = (TimeSpan)dv5.Table.Rows[0][2];
        et = (TimeSpan)dv5.Table.Rows[0][3];
        en = (string)dv5.Table.Rows[0][4];
        cn = (string)dv5.Table.Rows[0][5];
        cc = (string)dv5.Table.Rows[0][6];
        Venue.Text = vn;
        EventDate.Text = ddate.ToLongDateString();


        StartTime.Text = ConvertMode(st.ToString());
        EndTime.Text = ConvertMode(et.ToString());
        EventName.Text = en;
        Label3.Text = cn;
        Label4.Text = cc;
    }
    public string ConvertMode(string testing)
    {
        string s = "", post="";
        string ss = testing.Substring(0,2);
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