using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_sale_report_monthly : System.Web.UI.Page
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
            h1.InnerHtml = "Year:" + System.DateTime.Now.ToString("yyyy") + "";
            cls.gridbind(GridView1, "SELECT    dealer_name,       IsNull([4],0) AS Apr,    IsNull([5],0) AS May,    IsNull([6],0) AS Jun,   IsNull([7],0) AS Jul,   IsNull([8],0) AS Aug,   IsNull([9],0) AS Sep,  IsNull([10],0) AS Oct,   IsNull([11],0) AS Nov,    IsNull([12],0) AS Dec,	 IsNull([1],0)AS Jan,    IsNull([2],0) AS Feb,    IsNull([3],0) AS Mar FROM (Select dealer_name,debit, MONTH(date) as TMonth  from    dbo.tbl_dealer_ledger_master where year(date)='" + System.DateTime.Now.ToString("yyyy") + "') source PIVOT(    SUM(debit)    FOR TMonth    IN ( [4], [5], [6], [7], [8], [9], [10], [11], [12],[1], [2], [3] )) AS pvtMonth");
        }

    }
    protected void Button2_Click(object sender, EventArgs e)
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
    protected void Button1_Click(object sender, EventArgs e)
    {
        string from_date = DateTime.ParseExact(txtfdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("yyyy", CultureInfo.InvariantCulture);
        h1.InnerHtml = "Year:" + DateTime.ParseExact(txtfdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("yyyy", CultureInfo.InvariantCulture) + "";
        cls.gridbind(GridView1, "SELECT    dealer_name,       IsNull([4],0) AS Apr,    IsNull([5],0) AS May,    IsNull([6],0) AS Jun,   IsNull([7],0) AS Jul,   IsNull([8],0) AS Aug,   IsNull([9],0) AS Sep,  IsNull([10],0) AS Oct,   IsNull([11],0) AS Nov,    IsNull([12],0) AS Dec,	 IsNull([1],0)AS Jan,    IsNull([2],0) AS Feb,    IsNull([3],0) AS Mar FROM (Select dealer_name,debit, MONTH(date) as TMonth  from    dbo.tbl_dealer_ledger_master where year(date)='" + from_date + "') source PIVOT(    SUM(debit)    FOR TMonth    IN ( [4], [5], [6], [7], [8], [9], [10], [11], [12],[1], [2], [3] )) AS pvtMonth");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        cls.gridbind(GridView1, "SELECT    dealer_name,       IsNull([4],0) AS Apr,    IsNull([5],0) AS May,    IsNull([6],0) AS Jun,   IsNull([7],0) AS Jul,   IsNull([8],0) AS Aug,   IsNull([9],0) AS Sep,  IsNull([10],0) AS Oct,   IsNull([11],0) AS Nov,    IsNull([12],0) AS Dec,	 IsNull([1],0)AS Jan,    IsNull([2],0) AS Feb,    IsNull([3],0) AS Mar FROM (Select dealer_name,debit, MONTH(date) as TMonth  from    dbo.tbl_dealer_ledger_master where year(date)='"+System.DateTime.Now.ToString("yyyy")+"') source PIVOT(    SUM(debit)    FOR TMonth    IN ( [4], [5], [6], [7], [8], [9], [10], [11], [12],[1], [2], [3] )) AS pvtMonth");
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label total = e.Row.FindControl("Label1") as Label;
            Label w1 = e.Row.FindControl("Label2") as Label;
            Label w2 = e.Row.FindControl("Label3") as Label;
            Label w3 = e.Row.FindControl("Label4") as Label;
            Label w4 = e.Row.FindControl("Label5") as Label;
            Label w5 = e.Row.FindControl("Label6") as Label;

            Label w6 = e.Row.FindControl("Label7") as Label;
            Label w7 = e.Row.FindControl("Label8") as Label;
            Label w8 = e.Row.FindControl("Label9") as Label;
            Label w9 = e.Row.FindControl("Label10") as Label;
            Label w10 = e.Row.FindControl("Label11") as Label;
            Label w11 = e.Row.FindControl("Label12") as Label;
            Label w12 = e.Row.FindControl("Label13") as Label;


            double a = double.Parse(w1.Text) + double.Parse(w2.Text) + double.Parse(w3.Text) + double.Parse(w4.Text) + double.Parse(w5.Text) + double.Parse(w6.Text) + double.Parse(w7.Text) + double.Parse(w8.Text) + double.Parse(w9.Text) + double.Parse(w10.Text) + double.Parse(w11.Text) + double.Parse(w12.Text);

            total.Text = a.ToString("n2");
        }
    }
}