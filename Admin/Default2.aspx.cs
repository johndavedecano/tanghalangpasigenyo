using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        TextBox1.Text = DateTime.Now.ToLongTimeString();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int x = 0;
        string sttt = "";
        sttt = TextBox3.Text;
        if (sttt.Length == 10)
        {
            sttt = "0" + sttt;
        }
        string post = sttt.Substring(9, 2);
        if (post == "PM")
        {
            x = Convert.ToInt32(sttt.Substring(0, 2)) + 12;
            if (x == 24)
            {
                x = x - 12;
            }
            TextBox2.Text = x.ToString() + sttt.Substring(2, 6);
        }
        else
        {
            x = Convert.ToInt32(sttt.Substring(0, 2));
            if (x == 12)
            {
                x = x - 12;
                TextBox2.Text = x.ToString() + sttt.Substring(2, 6);
            }
            else
            TextBox2.Text = sttt.Substring(0, 8);
        }
    }
}