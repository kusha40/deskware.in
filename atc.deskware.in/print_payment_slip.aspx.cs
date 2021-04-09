using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class print_payment_slip : System.Web.UI.Page
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
            cls.gridbind(GridView1, " select * from tbl_dealer_Master where week='"+Request.QueryString["id"].ToString()+"'");



        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label id = e.Row.FindControl("Label1") as Label;
            Label bal = e.Row.FindControl("Label2") as Label;


            SqlDataAdapter adap = new SqlDataAdapter("select isnull((sum(debit)-sum(credit)),0)as bal from tbl_dealer_ledger_master where dealer_id='" + id.Text + "' and CAST(date as DATE)<=CAST(DATEADD(DD, DATEDIFF(DY, 0, GETDATE()), -1) as DATE)  group by dealer_name", con);
        DataSet ds = new DataSet();
        adap.Fill(ds);
        if (ds.Tables[0].Rows.Count != 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];
            double getbal = double.Parse(dr["bal"].ToString());
            bal.Text = getbal.ToString("n2");
        }
        else
        {
            bal.Text = "0.00";
        }


       // storid = Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "id").ToString());

        }
    }
    //int storid = 0;
    //int rowIndex = 1;

    //public void AddNewRow(object sender, GridViewRowEventArgs e)
    //{
    //    GridView GridView1 = (GridView)sender;
    //    GridViewRow NewTotalRow = new GridViewRow(0, 0, DataControlRowType.DataRow, DataControlRowState.Insert);
    //    NewTotalRow.Font.Bold = true;
    //    NewTotalRow.BackColor = System.Drawing.Color.Aqua;
    //    TableCell HeaderCell = new TableCell();
    //    HeaderCell.Height = 10;
    //    HeaderCell.HorizontalAlign = HorizontalAlign.Center;
    //    HeaderCell.ColumnSpan = 4;
    //    NewTotalRow.Cells.Add(HeaderCell);
    //    GridView1.Controls[0].Controls.AddAt(e.Row.RowIndex + rowIndex, NewTotalRow);
    //    rowIndex++;
    //}
    //protected void GridView1_RowCreated(object sender, GridViewRowEventArgs e)
    //{
    //    bool newRow = false;
    //    if ((storid > 0) && (DataBinder.Eval(e.Row.DataItem, "id") != null))
    //    {
    //        if (storid != Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "id").ToString()))
    //            newRow = true;
    //    }
    //    if ((storid > 0) && (DataBinder.Eval(e.Row.DataItem, "id") == null))
    //    {
    //        newRow = true;
    //        rowIndex = 0;
    //    }
    //    if (newRow)
    //    {
    //        AddNewRow(sender, e);
    //    }
    //}
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