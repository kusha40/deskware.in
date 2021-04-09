using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_sale_report_weekly : System.Web.UI.Page
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
            h1.InnerHtml = "Month:"+System.DateTime.Now.ToString("MMMM")+"";
            cls.gridbind(GridView1, "Declare @DatePeriod datetime Set @DatePeriod = '"+System.DateTime.Now.ToString("yyyy-MM-dd")+"' Select  dealer_name as DealerName,        IsNull([1],0) as 'Week 1',        IsNull([2],0) as 'Week 2',        IsNull([3],0) as 'Week 3',        IsNull([4],0) as 'Week 4',        IsNull([5], 0) as 'Week 5' From ( Select  dealer_name,        DATEDIFF(week, DATEADD(MONTH, DATEDIFF(MONTH, 0, date), 0), date) +1 as [Weeks],         debit as 'debit'  From dbo.tbl_dealer_ledger_master Where DatePart(Month, date)= DatePart(Month, @DatePeriod))p Pivot (Sum(debit) for Weeks in ([1],[2],[3],[4],[5])) as pv");
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
        string from_date = DateTime.ParseExact(txtfdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("yyyy-MM-dd", CultureInfo.InvariantCulture);
        h1.InnerHtml = "Month:" + DateTime.ParseExact(txtfdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MMMM", CultureInfo.InvariantCulture) + "";
        cls.gridbind(GridView1, "Declare @DatePeriod datetime Set @DatePeriod = '" + from_date + "' Select  dealer_name as DealerName,        IsNull([1],0) as 'Week 1',        IsNull([2],0) as 'Week 2',        IsNull([3],0) as 'Week 3',        IsNull([4],0) as 'Week 4',        IsNull([5], 0) as 'Week 5' From ( Select  dealer_name,        DATEDIFF(week, DATEADD(MONTH, DATEDIFF(MONTH, 0, date), 0), date) +1 as [Weeks],         debit as 'debit'  From dbo.tbl_dealer_ledger_master Where DatePart(Month, date)= DatePart(Month, @DatePeriod))p Pivot (Sum(debit) for Weeks in ([1],[2],[3],[4],[5])) as pv");
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        cls.gridbind(GridView1, "Declare @DatePeriod datetime Set @DatePeriod = '" + System.DateTime.Now.ToString("yyyy-MM-dd") + "' Select  dealer_name as DealerName,        IsNull([1],0) as 'Week 1',        IsNull([2],0) as 'Week 2',        IsNull([3],0) as 'Week 3',        IsNull([4],0) as 'Week 4',        IsNull([5], 0) as 'Week 5' From ( Select  dealer_name,        DATEDIFF(week, DATEADD(MONTH, DATEDIFF(MONTH, 0, date), 0), date) +1 as [Weeks],         debit as 'debit'  From dbo.tbl_dealer_ledger_master Where DatePart(Month, date)= DatePart(Month, @DatePeriod))p Pivot (Sum(debit) for Weeks in ([1],[2],[3],[4],[5])) as pv");
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


            double a = double.Parse(w1.Text) + double.Parse(w2.Text) + double.Parse(w3.Text) + double.Parse(w4.Text) + double.Parse(w5.Text);

            total.Text = a.ToString("n2");
        }
    }
}