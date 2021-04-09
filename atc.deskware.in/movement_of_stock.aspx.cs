using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class movement_of_stock : System.Web.UI.Page
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
     cls.bind_ddl(ddlcompname, "Select distinct c_name from tbl_product_master order by c_name asc", "c_name", "c_name");
     ddlcompname.Items.Insert(0, new ListItem("All", "All"));
 }
    }
    protected void btnview_Click(object sender, EventArgs e)
    {
        if (ddlcompname.SelectedValue == "All")
        {
            string date1 = DateTime.ParseExact(txtfrom.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            string date2 = DateTime.ParseExact(txtto.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            cls.gridbind(GridView1, "select max(date)as date,sum(qty)as qty,max(unit)as unit,max(challan_no)as challan_no,max(size)as size,max(p_code)as p_code,max(c_name)as c_name,max(type)as type from tbl_challan_details_master where  date between '" + date1 + "' and '" + date2 + "'  and type='FI' group by p_code   ");
        }
        else
        {
            string date1 = DateTime.ParseExact(txtfrom.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            string date2 = DateTime.ParseExact(txtto.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            cls.gridbind(GridView1, "select max(date)as date,sum(qty)as qty,max(unit)as unit,max(challan_no)as challan_no,max(size)as size,max(p_code)as p_code,max(c_name)as c_name,max(type)as type from tbl_challan_details_master where  date between '" + date1 + "' and '" + date2 + "' and c_name='" + ddlcompname.SelectedValue + "'  and type='FI'   group by p_code   ");
        }
    }
    protected void btnview0_Click(object sender, EventArgs e)
    {
        if (ddlcompname.SelectedValue == "All")
        {
            string date1 = DateTime.ParseExact(txtfrom.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            string date2 = DateTime.ParseExact(txtto.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            cls.gridbind(GridView1, "select max(date)as date,sum(qty)as qty,max(unit)as unit,max(challan_no)as challan_no,max(size)as size,max(p_code)as p_code,max(c_name)as c_name,max(type)as type from tbl_challan_details_master where  date between '" + date1 + "' and '" + date2 + "'  and type='RI' group by p_code   ");
        }
        else
        {
            string date1 = DateTime.ParseExact(txtfrom.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            string date2 = DateTime.ParseExact(txtto.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            cls.gridbind(GridView1, "select max(date)as date,sum(qty)as qty,max(unit)as unit,max(challan_no)as challan_no,max(size)as size,max(p_code)as p_code,max(c_name)as c_name,max(type)as type from tbl_challan_details_master where  date between '" + date1 + "' and '" + date2 + "' and c_name='" + ddlcompname.SelectedValue + "'  and type='RI' group by p_code   ");
        }

    }
    protected void btnview1_Click(object sender, EventArgs e)
    {
        if (ddlcompname.SelectedValue == "All")
        {
            string date1 = DateTime.ParseExact(txtfrom.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            string date2 = DateTime.ParseExact(txtto.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            cls.gridbind(GridView1, "select max(date)as date,sum(qty)as qty,max(unit)as unit,max(challan_no)as challan_no,max(size)as size,max(p_code)as p_code,max(c_name)as c_name,max(type)as type from tbl_challan_details_master where  date between '" + date1 + "' and '" + date2 + "'  and Status='Cancel' group by p_code   ");
        }
        else
        {
            string date1 = DateTime.ParseExact(txtfrom.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            string date2 = DateTime.ParseExact(txtto.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            cls.gridbind(GridView1, "select max(date)as date,sum(qty)as qty,max(unit)as unit,max(challan_no)as challan_no,max(size)as size,max(p_code)as p_code ,max(c_name)as c_name,max(type)as type from tbl_challan_details_master where  date between '" + date1 + "' and '" + date2 + "' and c_name='" + ddlcompname.SelectedValue + "'  and Status='Cancel' group by p_code   ");
        }
    }
    protected void btnview2_Click(object sender, EventArgs e)
    {
        if (ddlcompname.SelectedValue == "All")
        {
        string date1 = DateTime.ParseExact(txtfrom.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
        string date2 = DateTime.ParseExact(txtto.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
        cls.gridbind(GridView1, "select max(date)as date,sum(qty)as qty,max(unit)as unit,max(challan_no)as challan_no,max(size)as size,max(p_code)as p_code,max(c_name)as c_name,max(type)as type from tbl_challan_details_master where  date between '" + date1 + "' and '" + date2 + "' group by p_code     ");
            }
        else
        {
            string date1 = DateTime.ParseExact(txtfrom.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            string date2 = DateTime.ParseExact(txtto.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            cls.gridbind(GridView1, "select max(date)as date,sum(qty)as qty,max(unit)as unit,max(challan_no)as challan_no,max(size)as size,max(p_code)as p_code,max(c_name)as c_name,max(type)as type from tbl_challan_details_master where  date between '" + date1 + "' and '" + date2 + "' and c_name='" + ddlcompname.SelectedValue + "' group by p_code     ");
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