using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data;

public partial class events : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        DataView dv1 = (DataView)SqlDataSource2.Select(DataSourceSelectArguments.Empty);
        TextBox2.Text = dv1.Table.Rows[0][0].ToString() + " days";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlDataSource3.Insert();
    }
}