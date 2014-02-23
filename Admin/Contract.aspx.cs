using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Contract : System.Web.UI.Page
{
    int x = 0, y = 0, qty= 0, z = 0;
    string Cname = "", Cadd = "", Ccomp = "", Vname = "", Vadd = "", Ename = "", Aname = "", Ades = "", Fname = "", Fdes = "", Mname = "", Mdes = "";
    double RF , Total , OE , PB , RPH ;
    TimeSpan Estime, Eetime;
    DateTime Edate, DL ;
    protected void Page_Load(object sender, EventArgs e)
    {
        Label2.Text = DateTime.Now.ToString("D");
        Label14.Text = "";
        Label16.Text = "";
        Label33.Text = "";
        Label34.Text = "";
        Label35.Text = "";
        Label36.Text = "";
        Label24.Text = "";
        Label47.Text = "";
        DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        foreach (DataRow dr in dv.Table.Rows)
        {
            Cname = (string)dv.Table.Rows[x][0];
            Cadd = (string)dv.Table.Rows[x][1];
            Ccomp = (string)dv.Table.Rows[x][2];
            Label14.Text = Label14.Text + Cname;
            Label33.Text = Label33.Text + Cadd;
            Label34.Text = Label34.Text + Ccomp;
            Label16.Text = Label16.Text + Cname;
            Label35.Text = Label35.Text + Cadd;
            Label36.Text = Label36.Text + Ccomp;
            Label24.Text = Label24.Text + Cname;
           

        }
        Venue.Text = "";
        VAdd.Text = "";
        N.Text = "";
        Label37.Text = "";
         DataView dv1 = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
         foreach (DataRow dr in dv1.Table.Rows)
         {
             Vname = (string)dv1.Table.Rows[x][0];
             Vadd = (string)dv1.Table.Rows[x][1];
             Ename = (string)dv1.Table.Rows[x][2];
             Edate = (DateTime)dv1.Table.Rows[x][3];
            
             Venue.Text = Venue.Text + Vname;
             VAdd.Text = VAdd.Text + Vadd;
             N.Text = N.Text + Ename;
             Label37.Text =  Edate.ToString("D");
             
         }
         Label40.Text = "";
         Label41.Text = "";
         Label43.Text = "";
         Label44.Text = "";
         Label42.Text = "";
         Label1.Text = "";
         DataView dv2 = (DataView)SqlDataSource3.Select(DataSourceSelectArguments.Empty);
         foreach (DataRow dr in dv2.Table.Rows)
         {
             RF = (double)dv2.Table.Rows[x][0];
             Total = (double)dv2.Table.Rows[x][4];
             OE = (double)dv2.Table.Rows[x][1];
             PB = (double)dv2.Table.Rows[x][2];
             RPH = (double)dv2.Table.Rows[x][3];
             DL = (DateTime)dv2.Table.Rows[x][5];
             Label40.Text = Label40.Text + RF.ToString("n2");
             Label41.Text = Label41.Text + Total.ToString("n2");
             Label43.Text = Label43.Text + OE.ToString("n2");
             Label44.Text = Label44.Text + PB.ToString("n2");
             Label42.Text = Label42.Text + RPH.ToString("n2");
             Label1.Text = DL.ToString("D");

         }
         Label45.Text = "";
         DataView dv3 = (DataView)SqlDataSource4.Select(DataSourceSelectArguments.Empty);
         foreach (DataRow dr in dv3.Table.Rows)
         {
           
             Edate = (DateTime)dv3.Table.Rows[x][0];
             Estime = (TimeSpan)dv3.Table.Rows[x][1];
             Eetime= (TimeSpan)dv3.Table.Rows[x][2];

             Label45.Text = Edate.ToString("D") + ' ' + ConvertMode(Estime.ToString()) + ' ' + '-' + ' ' + ConvertMode(Eetime.ToString());

         }
         Label46.Text = "";
         DataView dv4 = (DataView)SqlDataSource5.Select(DataSourceSelectArguments.Empty);
        
        foreach (DataRow dr in dv4.Table.Rows)
         {
             
            Aname = (string)dv4.Table.Rows[x][0];
            Ades = (string)dv4.Table.Rows[x][3];
             qty = (int)dv4.Table.Rows[x][1];
             Label46.Text = Label46.Text + ' ' + Ades + ' '  + qty.ToString() + ' ' + "pcs" + ", ";
             x++;
           
         }
        Label3.Text = "";
        Label4.Text = "";
        string check = Label46.Text;
        int lg = check.Length;
        if (x > 0)
        {
            Label3.Text = "<li> Amenity- ";
            check = check.Substring(0, lg - 2);
            Label46.Text = check + ";";
            Label4.Text = "</li>";
            
        }
        Label47.Text = "";
        DataView dv5 = (DataView)SqlDataSource6.Select(DataSourceSelectArguments.Empty);
        foreach (DataRow dr in dv5.Table.Rows)
        {

            Fname = (string)dv5.Table.Rows[y][0];
            Fdes = (string)dv5.Table.Rows[y][1];
            Label47.Text = Label47.Text + Fname + ' ' + Fdes + ", ";
            y++;

        }
        string check2 = Label47.Text;
        int lg2 = check2.Length;
        Label5.Text = "";
        Label6.Text = "";
        if (y > 0)
        {
            Label5.Text = "<li> Facility- ";
            check2 = check2.Substring(0, lg2 - 2);
            Label47.Text = check2 + ";";
            Label6.Text = "</li>";
        }

         Label48.Text = "";
        DataView dv6 = (DataView)SqlDataSource7.Select(DataSourceSelectArguments.Empty);
        foreach (DataRow dr in dv6.Table.Rows)
        {

            Fname = (string)dv6.Table.Rows[z][0];
            Fdes = (string)dv6.Table.Rows[z][1];
            Label48.Text = Label48.Text + Mname + ' ' + Mdes + ", ";
            z++;

        }

        string check3 = Label48.Text;
        int lg3 = check3.Length;
        if (lg3 != 0)
        {
            check3 = check3.Substring(0, lg3 - 2);
            Label48.Text = check3 + ";";
        }
    }
      

    public string ConvertMode(string testing)
    {
        string s = "", post = "";
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
  

}

