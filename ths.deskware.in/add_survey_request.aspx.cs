using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class add_survey_request : System.Web.UI.Page
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
            if (Request.QueryString["id"].ToString() == null)
            {
                Response.Redirect("~/login.aspx");
            }
            if(Request.QueryString["id"].ToString()!=null)
            {
                SqlDataAdapter adap = new SqlDataAdapter("select title,fname,lname,address from tbl_medors_lead_master where lead_id='" + Request.QueryString["id"].ToString() + "' ", con);
            DataSet ds = new DataSet();
            adap.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dr = ds.Tables[0].Rows[0];
                TextBox1.Text = dr["title"].ToString()+" "+dr["fname"].ToString()+" "+dr["lname"].ToString();
                TextBox2.Text = dr["address"].ToString();
            }
            }
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}