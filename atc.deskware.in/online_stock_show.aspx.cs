using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class online_stock_show : System.Web.UI.Page
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
            cls.bind_ddl(ddlcompname, "Select distinct c_name from tbl_product_master where size='" + ddlsize.SelectedValue + "' order by c_name asc", "c_name", "c_name");
            cls.bind_ddl(ddlproductcode, "select distinct  p_code from tbl_product_master where size='" + ddlsize.SelectedValue + "' and c_name='" + ddlcompname.SelectedValue + "'", "p_code", "p_code");
        }
    }
    protected void btnview_Click(object sender, EventArgs e)
    {
        cls.gridbind(GridView1, "select * from tbl_stock_qty_master where size='" + ddlsize.SelectedValue + "' and c_name='" + ddlcompname.SelectedValue + "' and p_grade='" + ddlprotype.SelectedValue + "' and p_code='" + ddlproductcode.SelectedValue + "'");
    }
  
    protected void ddlsize_SelectedIndexChanged(object sender, EventArgs e)
    {
        cls.bind_ddl(ddlcompname, "Select distinct c_name from tbl_product_master where size='" + ddlsize.SelectedValue + "' order by c_name asc", "c_name", "c_name");
        cls.bind_ddl(ddlproductcode, "select distinct  p_code from tbl_product_master where size='" + ddlsize.SelectedValue + "' and c_name='" + ddlcompname.SelectedValue + "'", "p_code", "p_code");
    }
    protected void ddlcompname_SelectedIndexChanged(object sender, EventArgs e)
    {
        cls.bind_ddl(ddlproductcode, "select distinct  p_code from tbl_product_master where size='" + ddlsize.SelectedValue + "' and c_name='" + ddlcompname.SelectedValue + "'", "p_code", "p_code");
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