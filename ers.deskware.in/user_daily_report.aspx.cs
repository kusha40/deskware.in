using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_daily_report : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ConnectionString);
    SqlCommand cmd;
    Class1 cls = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] == null && Session["type"] == null)
        {
            Response.Redirect("~/login.aspx");
        }
        if (Request.QueryString["id"] == null)
        {
            Response.Redirect("~/login.aspx");
        }
        else
        {

            h4.InnerHtml = "Daily Reporting :  " + Request.QueryString["id"].ToString() + "";
            cls.gridbind(GridView1, "select max(created_by)as created_by,max(date)as date from tbl_daily_reporting  where created_by='" + Request.QueryString["id"].ToString() + "' group by date order by date desc");
        }

    }
}