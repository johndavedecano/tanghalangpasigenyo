using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_RFC : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["rr"] == "1")
        { Label3.Text = "Transaction Successful"; }
       
        else {
            Label3.Text = "";
        }
    }


}