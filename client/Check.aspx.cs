using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class client_Check : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataView dvb = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
        String test = (String)dvb.Table.Rows[0][1];
        if (test == "Big Event")
        {
            Response.Redirect("~/Client/EventInfo.aspx?ReservationId=" + Request.QueryString["ReservationId"].ToString());
        }
        else if (test == "Small Event")
        {
            Response.Redirect("~/Client/EventInfo-Se.aspx?ReservationId=" + Request.QueryString["ReservationId"].ToString());
        }

    }
}