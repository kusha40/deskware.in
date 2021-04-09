using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class stock_keeper : System.Web.UI.Page
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
            cls.bind_ddl(ddlcompname, "Select  c_name from tbl_product_master where size='" + ddlsize.SelectedValue + "' order by c_name asc", "c_name", "c_name");
            ddlcompname.Items.Insert(0, new ListItem("All", "All"));
        }
    }
    protected void ddlsize_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlsize.SelectedValue == "All")
        {
            cls.bind_ddl(ddlcompname, "Select  c_name from tbl_product_master  order by c_name asc", "c_name", "c_name");
            ddlcompname.Items.Insert(0, new ListItem("All", "All"));
        }
        else
        {

            cls.bind_ddl(ddlcompname, "Select  c_name from tbl_product_master where size='" + ddlsize.SelectedValue + "' order by c_name asc", "c_name", "c_name");
            ddlcompname.Items.Insert(0, new ListItem("All", "All"));
        }
    }
    protected void btnview_Click(object sender, EventArgs e)
    {
        if (ddlcompname.SelectedValue == "All" && ddlsize.SelectedValue != "All")
        {
            string date = DateTime.ParseExact(txtdate.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            cls.gridbind(GridView1, "select  p_code,qty,unit,size,c_name from tbl_stock_qty_master where p_code in (select p_code from tbl_challan_details_master where   CAST(date AS DATE)='" + date + "' and size='" + ddlsize.SelectedValue + "'  and type='FI' ) order by size asc,c_name asc  ");
        }

        else if (ddlsize.SelectedValue == "All" && ddlcompname.SelectedValue == "All")
        {
            string date = DateTime.ParseExact(txtdate.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            cls.gridbind(GridView1, "select  p_code,qty,unit,size,c_name from tbl_stock_qty_master where p_code in (select p_code from tbl_challan_details_master where   CAST(date AS DATE)='" + date + "'   and type='FI' ) order by size asc,c_name asc ");
        }
        else if (ddlsize.SelectedValue == "All" && ddlcompname.SelectedValue != "All")
        {
            string date = DateTime.ParseExact(txtdate.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            cls.gridbind(GridView1, "select  p_code,qty,unit,size,c_name from tbl_stock_qty_master where p_code in (select p_code from tbl_challan_details_master where   CAST(date AS DATE)='" + date + "' and c_name='" + ddlcompname.SelectedValue + "'   and type='FI' ) order by size asc,c_name asc ");
        }
        else
        {
            string date = DateTime.ParseExact(txtdate.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            cls.gridbind(GridView1, "select  p_code,qty,unit,size,c_name from tbl_stock_qty_master where p_code in (select p_code from tbl_challan_details_master where   CAST(date AS DATE)='" + date + "' and size='" + ddlsize.SelectedValue + "' and c_name='" + ddlcompname.SelectedValue + "' and p_grade='" + ddlprotype.SelectedValue + "' and type='FI' ) order by size asc,c_name asc  ");
        }
       


    }
    protected void btnview0_Click(object sender, EventArgs e)
    {
        if (ddlcompname.SelectedValue == "All" && ddlsize.SelectedValue != "All")
        {
            string date = DateTime.ParseExact(txtdate.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            cls.gridbind(GridView1, "select  p_code,qty,unit,size,c_name from tbl_stock_qty_master where p_code in (select p_code from tbl_challan_details_master where   CAST(date AS DATE)='" + date + "' and size='" + ddlsize.SelectedValue + "' and type='RI' ) order by size asc,c_name asc ");
        }
        else if (ddlsize.SelectedValue == "All" && ddlcompname.SelectedValue == "All")
        {
            string date = DateTime.ParseExact(txtdate.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            cls.gridbind(GridView1, "select  p_code,qty,unit,size,c_name from tbl_stock_qty_master where p_code in (select p_code from tbl_challan_details_master where   CAST(date AS DATE)='" + date + "'and type='RI' ) order by size asc,c_name asc ");
        }
        else if (ddlsize.SelectedValue == "All" && ddlcompname.SelectedValue != "All")
        {
            string date = DateTime.ParseExact(txtdate.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            cls.gridbind(GridView1, "select  p_code,qty,unit,size,c_name from tbl_stock_qty_master where p_code in (select p_code from tbl_challan_details_master where   CAST(date AS DATE)='" + date + "' and c_name='" + ddlcompname.SelectedValue + "' and type='RI' )  order by size asc,c_name asc");
        }
        else
        {
            string date = DateTime.ParseExact(txtdate.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            cls.gridbind(GridView1, "select  p_code,qty,unit,size,c_name from tbl_stock_qty_master where p_code in (select p_code from tbl_challan_details_master where   CAST(date AS DATE)='" + date + "' and size='" + ddlsize.SelectedValue + "' and c_name='" + ddlcompname.SelectedValue + "' and p_grade='" + ddlprotype.SelectedValue + "' and type='RI' ) order by size asc,c_name asc ");
        }
    }
    protected void btnview1_Click(object sender, EventArgs e)
    {
        if (ddlcompname.SelectedValue == "All" && ddlsize.SelectedValue != "All")
        {
            string date = DateTime.ParseExact(txtdate.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            cls.gridbind(GridView1, "select  p_code,qty,unit,size,c_name from tbl_stock_qty_master where p_code in (select p_code from tbl_challan_details_master where   CAST(date AS DATE)='" + date + "' and size='" + ddlsize.SelectedValue + "' and status='Cancel' ) order by size asc,c_name asc ");
        }
        else if (ddlsize.SelectedValue == "All" && ddlcompname.SelectedValue == "All")
        {
            string date = DateTime.ParseExact(txtdate.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            cls.gridbind(GridView1, "select  p_code,qty,unit,size,c_name from tbl_stock_qty_master where p_code in (select p_code from tbl_challan_details_master where   CAST(date AS DATE)='" + date + "'  and status='Cancel' ) order by size asc,c_name asc ");
        }
        else if (ddlsize.SelectedValue == "All" && ddlcompname.SelectedValue != "All")
        {
            string date = DateTime.ParseExact(txtdate.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            cls.gridbind(GridView1, "select  p_code,qty,unit,size,c_name from tbl_stock_qty_master where p_code in (select p_code from tbl_challan_details_master where   CAST(date AS DATE)='" + date + "'  and c_name='" + ddlcompname.SelectedValue + "'  and status='Cancel' ) order by size asc,c_name asc ");
        }
        else
        {
            string date = DateTime.ParseExact(txtdate.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            cls.gridbind(GridView1, "select  p_code,qty,unit,size,c_name from tbl_stock_qty_master where p_code in (select p_code from tbl_challan_details_master where   CAST(date AS DATE)='" + date + "' and size='" + ddlsize.SelectedValue + "' and c_name='" + ddlcompname.SelectedValue + "' and p_grade='" + ddlprotype.SelectedValue + "' and status='Cancel' ) order by size asc,c_name asc ");
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
    protected void btnview2_Click(object sender, EventArgs e)
    {
        if (ddlcompname.SelectedValue == "All" && ddlsize.SelectedValue != "All")
        {
            string date = DateTime.ParseExact(txtdate.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            cls.gridbind(GridView1, "select  p_code,qty,unit,size,c_name from tbl_stock_qty_master where p_code in (select p_code from tbl_challan_details_master where   CAST(date AS DATE)='" + date + "' and size='" + ddlsize.SelectedValue + "') order by size asc,c_name asc  ");
        }

        else if (ddlsize.SelectedValue == "All" && ddlcompname.SelectedValue == "All")
        {
            string date = DateTime.ParseExact(txtdate.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            cls.gridbind(GridView1, "select  p_code,qty,unit,size,c_name from tbl_stock_qty_master where p_code in (select p_code from tbl_challan_details_master where   CAST(date AS DATE)='" + date + "') order by size asc,c_name asc ");
        }
        else if (ddlsize.SelectedValue == "All" && ddlcompname.SelectedValue != "All")
        {
            string date = DateTime.ParseExact(txtdate.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            cls.gridbind(GridView1, "select  p_code,qty,unit,size,c_name from tbl_stock_qty_master where p_code in (select p_code from tbl_challan_details_master where   CAST(date AS DATE)='" + date + "' and c_name='" + ddlcompname.SelectedValue + "') order by size asc,c_name asc ");
        }
        else
        {
            string date = DateTime.ParseExact(txtdate.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            cls.gridbind(GridView1, "select  p_code,qty,unit,size,c_name from tbl_stock_qty_master where p_code in (select p_code from tbl_challan_details_master where   CAST(date AS DATE)='" + date + "' and size='" + ddlsize.SelectedValue + "' and c_name='" + ddlcompname.SelectedValue + "' and p_grade='" + ddlprotype.SelectedValue + "') order by size asc,c_name asc  ");
        }
    }
}