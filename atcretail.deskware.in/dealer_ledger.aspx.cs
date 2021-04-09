using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dealer_ledger : System.Web.UI.Page
{
  SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
    SqlCommand cmd;
    Class1 cls = new Class1();

    //private static int PageSize = 10;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] == null && Session["type"] == null)
        {
            Response.Redirect("~/login.aspx");
        }
        if (!IsPostBack)
        {
            cls.bind_ddl(ddldealer, "Select distinct dealer_name,dealer_id from tbl_dealer_ledger_master order by dealer_name asc", "dealer_name", "dealer_id");
        }

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        h3.Visible = true;
       // cls.gridbind(GridView1, "select * from tbl_dealer_ledger_master where dealer_id='"+ddldealer.SelectedValue+"' order by date asc ");

        cls.gridbind(GridView1, "SELECT[A].id,[A].dealer_id,[C].name,[A].date,[A].debit,[A].credit,[A].challan_no,[A].remarks,(SELECT SUM(COALESCE(debit,0)- COALESCE(credit,0))FROM dbo.tbl_dealer_ledger_master AS [B]WHERE [B].id <= [A].id AND[B].dealer_id = [A].dealer_id) AS 'Balance' FROM dbo.tbl_dealer_ledger_master AS [A] INNER JOIN dbo.tbl_dealer_Master AS [C] ON [A].dealer_id = [C].id and dealer_id='" + ddldealer.SelectedValue + "' ORDER BY dealer_id, id;");


        getbalance();
        //int i; double totl = 0; double totl1 = 0;
        //for (i = 0; i < GridView1.Rows.Count; i++)
        //{
        //    Label debit = GridView1.Rows[i].FindControl("Label6") as Label;
        //    Label credit = GridView1.Rows[i].FindControl("Label7") as Label;
        //    totl += double.Parse(debit.Text);
        //    totl1 += double.Parse(credit.Text);
        //}
        //Label3.Text = totl.ToString("n2");
        //Label4.Text = totl1.ToString("n2");
        //Label5.Text = Convert.ToDouble( double.Parse(Label3.Text) - double.Parse(Label4.Text)).ToString("n2");      

    }
    public void getbalance()
    {
        SqlDataAdapter adap1 = new SqlDataAdapter("select sum(debit)as debit,sum(credit) as credit,(sum(debit)-sum(credit))as bal from tbl_dealer_ledger_master where dealer_id='" + ddldealer.SelectedValue + "'", con);
        DataSet ds1 = new DataSet();
        adap1.Fill(ds1);
        {
            DataRow dr1 = ds1.Tables[0].Rows[0];
            Label3.Text = double.Parse(dr1["debit"].ToString()).ToString("n2");
            Label4.Text = double.Parse(dr1["credit"].ToString()).ToString("n2");
            Label5.Text = double.Parse(dr1["bal"].ToString()).ToString("n2");
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "del")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "", "window.open('delete_ledger_entry.aspx?id=" + e.CommandArgument.ToString() + "&typ=dealer','Graph','height=724px,width=900px,scrollbars=1' );", true);
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
    protected void btnview3_Click(object sender, EventArgs e)
    {
        h3.Visible = true;
        string from_date = DateTime.ParseExact(TextBox1.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
        string to_date = DateTime.ParseExact(TextBox2.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
        cls.gridbind(GridView1, "select * from tbl_dealer_ledger_master where dealer_id='" + ddldealer.SelectedValue + "' and date between '" + from_date + "' and '" + to_date + "' order by date asc ");

        int i; double totl = 0; double totl1 = 0;
        for (i = 0; i < GridView1.Rows.Count; i++)
        {
            Label debit = GridView1.Rows[i].FindControl("Label6") as Label;
            Label credit = GridView1.Rows[i].FindControl("Label7") as Label;
            totl += double.Parse(debit.Text);
            totl1 += double.Parse(credit.Text);
        }
        Label3.Text = totl.ToString("n2");
        Label4.Text = totl1.ToString("n2");
        Label5.Text = Convert.ToDouble(double.Parse(Label3.Text) - double.Parse(Label4.Text)).ToString("n2"); 
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        //if (e.Row.RowType == DataControlRowType.DataRow)
        //{
        //    Label debit = e.Row.FindControl("Label6") as Label;
        //    Label credit = e.Row.FindControl("Label7") as Label;
        //    Label bal = e.Row.FindControl("lblbal") as Label;
        //    Int32 index = GridView1.Rows.Count - 1;
        //    if (index >= 0)
        //    {
              
        //        if (index == 0)
        //        {
        //            Label L1 = GridView1.Rows[index].FindControl("Label6") as Label;
        //            bal.Text = L1.Text;
        //            double c = double.Parse(bal.Text) + double.Parse(debit.Text) - double.Parse(credit.Text);
        //            bal.Text = c.ToString("n2");
        //        }
        //        else
        //        {
        //            Label L = GridView1.Rows[index].FindControl("lblbal") as Label;
        //            bal.Text = L.Text;
        //            double c = double.Parse(bal.Text) + double.Parse(debit.Text) - double.Parse(credit.Text);
        //            bal.Text = c.ToString("n2");
        //        }

        //    }
        //}
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
     GridView1.PageIndex = e.NewPageIndex;
       // GridView1.DataBind();
     cls.gridbind(GridView1, "SELECT[A].id,[A].dealer_id,[C].name,[A].date,[A].debit,[A].credit,[A].challan_no,[A].remarks,(SELECT SUM(COALESCE(debit,0)- COALESCE(credit,0))FROM dbo.tbl_dealer_ledger_master AS [B]WHERE [B].id <= [A].id AND[B].dealer_id = [A].dealer_id) AS 'Balance' FROM dbo.tbl_dealer_ledger_master AS [A] INNER JOIN dbo.tbl_dealer_Master AS [C] ON [A].dealer_id = [C].id and dealer_id='" + ddldealer.SelectedValue + "' ORDER BY dealer_id, id;");
    }

    //[WebMethod]
    //public static string GetCustomers(int pageIndex)
    //{
    //    string query = "[GetCustomers_Pager]";
    //    SqlCommand cmd = new SqlCommand(query);
    //    cmd.CommandType = CommandType.StoredProcedure;
    //    cmd.Parameters.AddWithValue("@PageIndex", pageIndex);
    //    cmd.Parameters.AddWithValue("@PageSize", PageSize);
    //    cmd.Parameters.Add("@RecordCount", SqlDbType.Int, 4).Direction = ParameterDirection.Output;
    //    return GetData(cmd, pageIndex).GetXml();
    //}
    //private static DataSet GetData(SqlCommand cmd, int pageIndex)
    //{
    //    string strConnString = ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
    //    using (SqlConnection con = new SqlConnection(strConnString))
    //    {
    //        using (SqlDataAdapter sda = new SqlDataAdapter())
    //        {
    //            cmd.Connection = con;
    //            sda.SelectCommand = cmd;
    //            using (DataSet ds = new DataSet())
    //            {
    //                sda.Fill(ds, "tbl_dealer_ledger_master");
    //                DataTable dt = new DataTable("Pager");
    //                dt.Columns.Add("PageIndex");
    //                dt.Columns.Add("PageSize");
    //                dt.Columns.Add("RecordCount");
    //                dt.Rows.Add();
    //                dt.Rows[0]["PageIndex"] = pageIndex;
    //                dt.Rows[0]["PageSize"] = PageSize;
    //                dt.Rows[0]["RecordCount"] = cmd.Parameters["@RecordCount"].Value;
    //                ds.Tables.Add(dt);
    //                return ds;
    //            }
    //        }
    //    }
    //}
   
}