using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class order_generation : System.Web.UI.Page
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
          //  cls.bind_ddl(ddldealer, "Select distinct dealer_name,dealer_id from tbl_dealer_ledger_master order by dealer_name asc", "dealer_name", "dealer_id");
            cls.bind_ddl(ddlcompname, "Select distinct c_name from tbl_product_master where size='" + ddlsize.SelectedValue + "' order by c_name asc", "c_name", "c_name");
            ddlcompname.Items.Insert(0, new ListItem("-----", ""));
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
      //  cls.gridbind(GridView1, "SELECT   tbl_product_master.p_code, tbl_product_master.size, tbl_product_master.c_name, tbl_product_master.unit,tbl_product_master.min_stock,                          tbl_stock_qty_master.qty,(qty-min_stock) as actucal FROM            tbl_product_master INNER JOIN                          tbl_stock_qty_master ON tbl_product_master.p_code = tbl_stock_qty_master.p_code  order by c_name asc");
        Response.Clear();
        Response.AddHeader("content-disposition", "attachment;filename=Order_sheet.xls");
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
    protected void btnsubmit1_Click(object sender, EventArgs e)
    {
        cls.gridbind(GridView1, "SELECT   tbl_product_master.p_code, tbl_product_master.size, tbl_product_master.c_name, tbl_product_master.unit,tbl_product_master.min_stock,                          tbl_stock_qty_master.qty,(qty-min_stock) as actucal FROM            tbl_product_master INNER JOIN                          tbl_stock_qty_master ON tbl_product_master.p_code = tbl_stock_qty_master.p_code where (tbl_stock_qty_master.qty-tbl_product_master.min_stock) >=20 order by c_name asc");
        h3.Visible = true;
        int i; double totl = 0;
        for (i = 0; i < GridView1.Rows.Count; i++)
        {
            Label debit = GridView1.Rows[i].FindControl("Label3") as Label;
            totl += double.Parse(debit.Text);
        }
        Label5.Text = totl.ToString("n2");
    }
    protected void ddlsize_SelectedIndexChanged(object sender, EventArgs e)
    {
        cls.bind_ddl(ddlcompname, "Select distinct c_name from tbl_product_master where size='" + ddlsize.SelectedValue + "' order by c_name asc", "c_name", "c_name");
        ddlcompname.Items.Insert(0, new ListItem("-----", ""));
    }
    String _size;
    String _cname;
    protected void btnsubmit2_Click(object sender, EventArgs e)
    {
      
        string mainqry = String.Empty;
        string subqry = String.Empty;
        string qry = String.Empty;

        if (ddlcompname.SelectedValue != String.Empty)
        {
            _cname = ddlcompname.SelectedValue;
            if (subqry == String.Empty)
            {
                subqry = "tbl_product_master.c_name like '" + _cname + "%'";
            }

            else
            {
                subqry = subqry + "and tbl_product_master.c_name like '" + _cname + "%'";
            }
        }
        if (ddlsize.SelectedValue != String.Empty)
        {
            _size = ddlsize.SelectedValue;
            if (subqry == String.Empty)
            {
                subqry = "tbl_product_master.size='" + _size + "' ";
            }

            else
            {
                subqry = subqry + "and tbl_product_master.size='" + _size + "' ";
            }
        }

        {
           // qry = "SELECT   tbl_product_master.p_code, tbl_product_master.size, tbl_product_master.c_name, tbl_product_master.unit,tbl_product_master.min_stock,                          tbl_stock_qty_master.qty,(qty-min_stock) as actucal FROM            tbl_product_master INNER JOIN                          tbl_stock_qty_master ON tbl_product_master.p_code = tbl_stock_qty_master.p_code where (tbl_stock_qty_master.qty-tbl_product_master.min_stock) >=20  and  ";

            qry = "SELECT   tbl_product_master.p_code, tbl_product_master.size, tbl_product_master.c_name, tbl_product_master.unit,tbl_product_master.min_stock                    FROM            tbl_product_master  where   ";

        }
        mainqry = qry + subqry + " order by c_name asc";
        cls.gridbind(GridView1, mainqry);

        h3.Visible = true;
        int i; double totl = 0;
        for (i = 0; i < GridView1.Rows.Count; i++)
        {
            Label debit = GridView1.Rows[i].FindControl("Label3") as Label;
            totl += double.Parse(debit.Text);
        }
        Label5.Text = totl.ToString("n2");

    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label p_code = e.Row.FindControl("Label1") as Label;
            Label Actual = e.Row.FindControl("Label2") as Label;
            Label Final = e.Row.FindControl("Label3") as Label;
            Label Minimuim = e.Row.FindControl("Label4") as Label;

            SqlDataAdapter adap = new SqlDataAdapter("select top 1 qty from tbl_stock_qty_master where p_code='" + p_code.Text + "'  order by id desc ", con);
            DataSet ds = new DataSet();
            adap.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dr = ds.Tables[0].Rows[0];
                double getbal = double.Parse(dr["qty"].ToString());
                Actual.Text = getbal.ToString("n2");
            }
            else
            {
                Actual.Text = "0.00";
            }

            double a = double.Parse(Minimuim.Text);
            double b = double.Parse(Actual.Text);

            double c = a - b;
            if (c <= 0)
            {
                Final.Text = "0.00";
            }
            else
            {

                Final.Text = c.ToString("n2");
            }
                 
        }
    }
   

}