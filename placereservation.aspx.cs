using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class placereservation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CheckReorderStatus();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        TextBox13.Text = HeadLoginName.Page.User.Identity.Name;
        SqlDataSource1.Insert();
        

    }
    protected void CheckReorderStatus()
    {
        DataView dv = (DataView)SqlDataSource3.Select(DataSourceSelectArguments.Empty);
        int reorderedProducts = (int)dv.Table.Rows[0][0] + 1;
            TextBox14.Text = reorderedProducts.ToString();
        
    }
}