using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class client_bill : System.Web.UI.Page
{
    Double x= 0, y = 0, z = 0, amntyex = 0, facex = 0, miscex = 0, total = 0;
   
    protected void Page_Load(object sender, EventArgs e)
    {

        DataView dvx = (DataView)sumamnty.Select(DataSourceSelectArguments.Empty);
        Double tl = (Double)dvx.Table.Rows[0][0];
        Label7.Text = tl.ToString("n2");

        DataView dvy = (DataView)sumfac.Select(DataSourceSelectArguments.Empty);
        Double tl1 = (Double)dvy.Table.Rows[0][0];
        Label8.Text = tl1.ToString("n2");

        DataView dvz = (DataView)summisc.Select(DataSourceSelectArguments.Empty);
        Double tl2 = (Double)dvz.Table.Rows[0][0];
        Label9.Text = tl2.ToString("n2");

        DataView dmg = (DataView)dmgSum.Select(DataSourceSelectArguments.Empty);
        Double dgs = (Double)dmg.Table.Rows[0][0];
        Label10.Text = dgs.ToString("n2");

        DataView acum = (DataView)Accum.Select(DataSourceSelectArguments.Empty);
        Double w = (Double)acum.Table.Rows[0][0];
        Label6.Text = w.ToString("n2");

        x = Convert.ToDouble(Label7.Text);
        y = Convert.ToDouble(Label8.Text);
        z = Convert.ToDouble(Label9.Text);


        total = x + y + z + w + dgs;
        Label12.Text = total.ToString("n2");
        Label2.Text = DateTime.Now.ToLongDateString();
        DataView PBD = (DataView)PB.Select(DataSourceSelectArguments.Empty);
        Double P = (Double)PBD.Table.Rows[0][0];

        P = P - total;
        if (P >= 0)
        {
            Label14.Text = "Refundable Amount ";
            Label13.Text = P.ToString("n2");

        }
        else {
            P= Math.Abs(P);
            Label13.Text =  P.ToString("n2");
            Label14.Text = "Remaining Balance";
            
        }
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