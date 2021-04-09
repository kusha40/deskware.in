using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class view_report : System.Web.UI.Page
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
        if (Request.QueryString["uid"] == null)
        {
            Response.Redirect("~/login.aspx");
        }
        else
        {
            h4.InnerHtml = "Employee : " + Request.QueryString["uid"].ToString() + " || Date : " + DateTime.ParseExact(Request.QueryString["date"].ToString().Replace("-", "/"), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("dd-MMM-yyyy", CultureInfo.InvariantCulture);
            cls.gridbind(GridView1, "select  * from tbl_daily_reporting where created_by='" + Request.QueryString["uid"].ToString() + "' and CAST(date AS DATE)='" + DateTime.ParseExact(Request.QueryString["date"].ToString().Replace("-", "/"), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "' order by date asc");

        }

    }
    protected void btnsubmit2_Click(object sender, EventArgs e)
    {

        Response.Clear();
        Response.AddHeader("content-disposition", "attachment;filename=Report.xls");
        Response.Charset = "";
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = "application/vnd.xls";
        System.IO.StringWriter stringWrite = new System.IO.StringWriter();
        System.Web.UI.HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);
        GridView1.RenderControl(htmlWrite);
        Response.Write(stringWrite.ToString());
        Response.End();
    }
    public override void VerifyRenderingInServerForm(Control control)
    { }
}