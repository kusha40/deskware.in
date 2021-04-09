using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class view_stock_challan : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
    SqlCommand cmd;
    Class1 cls = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] == null)
        {
            Response.Redirect("stock_entry_without_purchase.aspx");
        }
        if (!IsPostBack)
        {
            cls.gridbind(GridView1, "select max(date)as date, max(size)as size,max(c_name)as c_name,max(p_type)as p_type,sum(qty)as qty,max(unit)as unit,max(stock_id)as stock_id from tbl_stock_master where stock_id='"+Request.QueryString["id"].ToString()+"' group by c_name ");

            int i; double totl = 0;
            for (i = 0; i < GridView1.Rows.Count; i++)
            {
                Label debit = GridView1.Rows[i].FindControl("Label201") as Label;
                totl += double.Parse(debit.Text);
            }
            Label4.Text = totl.ToString("n2");
        }
    }
}