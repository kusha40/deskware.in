using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class view_movement : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
    SqlCommand cmd;
    Class1 cls = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] == null || Request.QueryString["pid"] == null || Request.QueryString["typ"] == null)
        {
            Response.Redirect("movement_of_stock.aspx");
        }
        if (!IsPostBack)
        {
            cls.gridbind(GridView1, "select * from tbl_challan_details_master where  type='" + Request.QueryString["typ"].ToString() + "' and p_code='" + Request.QueryString["pid"].ToString() + "' order by date desc");
           // cls.gridbind(GridView1, "select * from tbl_challan_details_master where  CAST(date AS DATE)='" + Request.QueryString["id"].ToString() + "' and type='" + Request.QueryString["typ"].ToString() + "' and p_code='" + Request.QueryString["pid"].ToString() + "'");
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