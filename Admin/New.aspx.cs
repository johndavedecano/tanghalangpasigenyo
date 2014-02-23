using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       // Label1.Text = "<div class='month m-8'>";
       // Label2.Text = "<div class='day d-21'>";
       // Label3.Text = "<div class='year y-2012'>";
    }
    protected void UpdateTimer_Tick(object sender, EventArgs e)
    {
        DateStampLabel.Text = DateTime.Now.ToShortTimeString();
    }
}