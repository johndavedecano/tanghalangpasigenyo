using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_Default : System.Web.UI.Page
{
    int x = 0, qty;
    string anam = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        Label1.Text = "";
         DataView dv = (DataView)SqlDataSource1.Select(DataSourceSelectArguments.Empty);
         foreach (DataRow dr in dv.Table.Rows)
         {
             anam= (string)dv.Table.Rows[x][0];
             qty = (int)dv.Table.Rows[x][1];
             Label1.Text =Label1.Text + qty.ToString() + "pcs of " + anam + ", ";
             x++;
         }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
    }
}