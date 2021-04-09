using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class retrun_p1 : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
    SqlCommand cmd;
    Class1 cls = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] == null && Session["type"] == null)
        {
            Response.Redirect("~/login.aspx");
        }
        if (!IsPostBack)
        {
            bind();
        }
    }
    public void bind()
    {
        SqlDataAdapter adap = new SqlDataAdapter("select * from tbl_challan_details_master where challan_no='" + Request.QueryString["id"].ToString() + "' and created_by='" + Request.QueryString["val"].ToString() + "'", con);
        DataSet ds = new DataSet();
        adap.Fill(ds);
        {
            DataRow dr = ds.Tables[0].Rows[0];
            Literal2.Text = dr["challan_no"].ToString();
            Literal1.Text = Convert.ToDateTime(dr["date"]).ToString("dd-MMM-yyyy");
            Literal3.Text = dr["dealer_name"].ToString();
            Literal4.Text = dr["dealer_area"].ToString();
            // Literal5.Text = Convert.ToDouble(dr["totlamount"]).ToString("n2");
            Literal6.Text = Convert.ToDouble(dr["fraight"]).ToString("n2");
            //   Literal7.Text = Convert.ToDouble(dr["netamount"]).ToString("n2");
            //   Literal8.Text = dr["inwords"].ToString();
            Literal9.Text = dr["created_by"].ToString();

            cls.gridbind(GridView1, "Select * from tbl_challan_details_master where challan_no='" + Request.QueryString["id"].ToString() + "' and created_by='" + Request.QueryString["val"].ToString() + "' ");
        }
    }
}