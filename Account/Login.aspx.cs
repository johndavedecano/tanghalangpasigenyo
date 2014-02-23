using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string strRedirect;
        strRedirect = Request["ReturnUrl"];
        if (strRedirect != null)
            Response.Redirect("~/Account/Login.aspx",true);
        
    }

}