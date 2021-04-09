using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dd_report : System.Web.UI.Page
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
    protected void btnview_Click(object sender, EventArgs e)
    {
        string date1 = DateTime.ParseExact(txtfrom.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
        string date2 = DateTime.ParseExact(txtto.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
        cls.gridbind(GridView1, "select sum(qty)as qty,max(unit)as unit,max(size)as size,max(p_code)as p_code,max(c_name)as c_name from tbl_challan_details_master where  date between '" + date1 + "' and '" + date2 + "' and type in ('RI','FI') and p_code in (select p_Code from tbl_product_master ) group by p_code order by size asc   ");
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblcname = e.Row.FindControl("lblcname") as Label;
            Label lblpcode = e.Row.FindControl("lblpcode") as Label;
            Label lblsize = e.Row.FindControl("lblsize") as Label;


            Label Label1 = e.Row.FindControl("Label1") as Label;
            Label Label2 = e.Row.FindControl("Label2") as Label;
            Label Label3 = e.Row.FindControl("Label3") as Label;
            Label Label4 = e.Row.FindControl("Label4") as Label;

            DateTime FromYear = Convert.ToDateTime(txtfrom.Text);
            DateTime ToYear = Convert.ToDateTime(txtto.Text);
            double month = ToYear.Month - FromYear.Month; 

            SqlDataAdapter adap = new SqlDataAdapter("select top 1 min_stock from tbl_product_master where p_code='" + lblpcode.Text + "' and size='" + lblsize.Text + "' and c_name='" + lblcname.Text + "'  order by id desc ", con);
            DataSet ds = new DataSet();
            adap.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dr = ds.Tables[0].Rows[0];
                double getbal = double.Parse(dr["min_stock"].ToString());
                Label3.Text = getbal.ToString("n2");

                double qty = double.Parse(Label1.Text);
                double avgqty = qty / month;
                Label2.Text = avgqty.ToString("n2");

                double finqty = double.Parse(Label2.Text) - double.Parse(Label3.Text);
                Label4.Text = finqty.ToString("n2");

                
            }
            else
            {
                Label3.Text = "0.00";
            }
        }
    }
}