using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class client_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["VenueId"] == null)
        {
            Response.Redirect("~/place/Step1.aspx");
        }
        Session["EventId"] = null;
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        System.Threading.Thread.Sleep(1000);
        
        UpdatePanel1.Update();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Session["EventName"] = TextBox1.Text;
        Session["EventId"] = DropDownList1.SelectedValue;
        Response.Redirect("~/place/step3.aspx");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/place/step1.aspx");
    }
}