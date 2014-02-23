using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class client_rfc : System.Web.UI.Page
{
    Double oe = 0, pb = 0, vr = 0, amntyex = 0, facex = 0, miscex = 0, total=0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["ReservationId"] == null)
        {
            Response.Redirect("~/UnableAccess.aspx");
        }
        DataView dvxxx = (DataView)Validates.Select(DataSourceSelectArguments.Empty);
        if ((int)dvxxx.Table.Rows[0][0] != 1)
        {
            Response.Redirect("~/UnableAccess.aspx");
        }
        DataView dv = (DataView)ClientIdSelect.Select(DataSourceSelectArguments.Empty);
        int cid = (int)dv.Table.Rows[0][0];
        ClientID.Text = cid.ToString();
        int tagg = (int)dv.Table.Rows[0][1];
        Label8.Text = "Note: Once you Confirm your Bill it is subjected to create a Contract. You are not allowed to change your amenities and facilities reservation.";
        if (tagg >= 3)
        {
            Button1.Visible = false;
            Button2.Visible = false;
            Label8.Visible = false;
        }
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

        Label1.Text = vr.ToString("n2");
        Label5.Text = oe.ToString("n2");
        Label6.Text = pb.ToString("n2");

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
        Label2.Text = amntyex.ToString("n2");
        Label3.Text = facex.ToString("n2");
        Label4.Text = miscex.ToString("n2");

        total = oe + pb + vr + amntyex + facex + miscex;
        Label7.Text = total.ToString("n2");

        LinkButton1.Attributes.Add("onclick", "window.open('../bill.aspx?ReservationId=" + Request.QueryString["ReservationId"] + "', 'newwindow','menubar=1,resizable=1,width=700,height=900');return false;");
    }
    protected string FormatUrl(int categoryID)
    {
        return "~/Client/Check.aspx?ReservationId=" + categoryID;
    }


    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Client/Additionals.aspx?newId=" + Request.QueryString["ReservationId"]);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DataView dv = (DataView)TypeSelect.Select(DataSourceSelectArguments.Empty);
        if ((string)dv.Table.Rows[0][1] == "Small Event")
        {
            TagUpdate0.Update();
        }
        else
        {
            TagUpdate.Update();
        }
        BalanceInsert.Insert();
        Response.Redirect("~/client/ClientAccount.aspx?bbb=" + 1);
    }
}