using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Security;
using System.IO;

public partial class client_Default : System.Web.UI.Page
{
    int newid = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        ValidateSessions();
        DataView dv = (DataView)VenueName.Select(DataSourceSelectArguments.Empty);
        DataView dv7 = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        Label1.Text = (string)dv.Table.Rows[0][0];
        Label12.Text = (string)dv7.Table.Rows[0][0];
        Label3.Text = Session["EventName"].ToString();
        Label4.Text = ConvertMode(Session["StartTime"].ToString());
        Label5.Text = Session["NoofHours"].ToString() + "hrs";
        Label6.Text = ConvertMode(Session["EndTime"].ToString());
        compute();
        MembershipUser ma = Membership.GetUser();
        Session["uid"] = ma.ProviderUserKey.ToString();
        DataView dv2 = (DataView)ClientId.Select(DataSourceSelectArguments.Empty);
        cid.Text = Convert.ToString((int)dv2.Table.Rows[0][0]);
    }
    protected void ValidateSessions()
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
        if (Session["StartTime"] == null)
        {
            Response.Redirect("~/place/Step1.aspx");
        }
        if (Session["NoofHours"] == null)
        {
            Response.Redirect("~/place/Step1.aspx");
        }
        if (Session["EndTime"] == null)
        {
            Response.Redirect("~/place/Step1.aspx");
        }
    }
    protected void compute()
    {
        DataView dv3 = (DataView)EventSelect.Select(DataSourceSelectArguments.Empty);
        string evnttype = (string)dv3.Table.Rows[0][1];
        Label2.Text = (string)dv3.Table.Rows[0][0];
        if (dv3.Table.Rows[0][3] is DBNull)
        {
            evnttype = "Small Event";
        }
        else
        {
            evnttype = "Big Event";
        }

        Double crph = (Double)dv3.Table.Rows[0][2];

        Double amount = 0, oe = 0, pb = 0;
        int hours = Convert.ToInt32(Session["NoofHours"].ToString());
        if (evnttype == "Big Event")
        {
            Double cffhr = (Double)dv3.Table.Rows[0][3];
            if (hours <= 3)
            {
                amount = cffhr;
            }
            else
            {
                hours = hours - 3;
                amount = cffhr + (hours * crph);
            }
        }
        else if (evnttype == "Small Event")
        {
            amount = crph * hours;
        }

        Label7.Text = amount.ToString("N2");

        oe = (Double)dv3.Table.Rows[0][5];

        Label8.Text = oe.ToString("n2");

        if (dv3.Table.Rows[0][6] is DBNull)
        {
            Label9.Text = "0";
            pb = 0;
        }
        else
        {
            pb = (Double)dv3.Table.Rows[0][6];
            Label9.Text = pb.ToString("n2");
        }

        Double total = amount + oe + pb;
        era.Text = amount.ToString();
        gt.Text = total.ToString();
        Label10.Text = "<strong>" + total.ToString("n2") + "</strong>";

        if (dv3.Table.Rows[0][4] is DBNull)
        {
            Label11.Text = "0";
        }
        else
        {
            Double rf = (Double)dv3.Table.Rows[0][4];
            Label11.Text = rf.ToString("n2");
        }


    }
    public string ConvertMode(string testing)
    {
        string s = "", post = "";
        if (testing.Length == 4)
        {
            testing = "0" + testing;
        }
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
    protected void fileups()
    {
        string letterfolder = "letter";
        string savepath;
        string savefile;

        if (FileUpload1.HasFile)
        {
            savepath = Path.Combine(Request.PhysicalApplicationPath, letterfolder);
            savefile = Path.Combine(savepath, FileUpload1.FileName);
            FileUpload1.SaveAs(savefile);
            ReservationInsert.Insert();
            Response.Redirect("~/place/Step6.aspx?newId=" + newid.ToString());
        }
    }
    protected void ReservationInsert_Inserted(object sender, SqlDataSourceStatusEventArgs e)
    {
        newid = Convert.ToInt32(e.Command.Parameters["@NewId"].Value);
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        fileups();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/client/ClientAccount.aspx");
    }
}