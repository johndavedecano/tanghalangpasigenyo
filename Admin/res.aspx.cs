using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

public partial class Admin_res : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        DataView dv = (DataView)DetailsSelect.Select(DataSourceSelectArguments.Empty);

        if (dv == null){
            Response.Redirect("404.aspx");
        }else{
            int a = 0;
            string b = "", c = "", d = "", h = "";
            Double f = 0;
            DateTime g;

            a = (int)dv.Table.Rows[0][0]; //rno
            b = (string)dv.Table.Rows[0][1]; //rxno
            c = (string)dv.Table.Rows[0][2]; //payortb
            d = (string)dv.Table.Rows[0][3]; //partic
            f = (Double)dv.Table.Rows[0][4]; //amnt
            h = (string)dv.Table.Rows[0][5]; //recby
            g = (DateTime)dv.Table.Rows[0][6]; //ddate


            rno.Text = a.ToString();
            rxno.Text = b;
            payortb.Text = c;
            partic.Text = d;
            amnt.Text = f.ToString("n2");
            recby.Text = h;
            ddate.Text = g.ToLongDateString();
            total.Text = f.ToString("n2");
        }
    }
}