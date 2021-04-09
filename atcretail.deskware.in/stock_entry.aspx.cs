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

public partial class stock_entry : System.Web.UI.Page
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
            GridView1.Columns[6].Visible = false;
            bind();
            
        }
    }
    
    string cmnd = "";
    string p_size, pro_code, p_unit, pro_grade, pro_cname, pro_qty = "";
   
    double total = 0;
  

    
    
 
    double del_p_qty = 0;
    string del_p_code = "";
    
   
    public void bind()
    {
        //cls.gridbind(GridView1, "select top 150 * from tbl_stock_master where stock_id in (select stock_id from tbl_company_ledger_master) and size='" + ddlsize.SelectedValue + "' and c_name='" + ddlcompname.SelectedValue + "' and p_type='" + ddlprotype.SelectedValue + "'  order by date desc");

        cls.gridbind(GridView1, "select max(date)as date, max(size)as size,max(c_name)as c_name,max(p_type)as p_type,sum(qty)as qty,max(unit)as unit,max(stock_id)as stock_id from tbl_stock_master where stock_id in (select stock_id from tbl_company_ledger_master) group by size ,c_name");
        int i; double totl = 0;
        for (i = 0; i < GridView1.Rows.Count; i++)
        {
            Label debit = GridView1.Rows[i].FindControl("Label201") as Label;
            totl += double.Parse(debit.Text);
        }
        Label4.Text = totl.ToString("n2");
    }
    double labour_price = 0;
  
    
    
    
    protected void btn2_Click(object sender, EventArgs e)
    {
        GridView1.Columns[6].Visible = true;
        cls.gridbind(GridView1, "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:30:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101) select max(date)as date, max(size)as size,max(c_name)as c_name,max(p_type)as p_type,sum(qty)as qty,max(unit)as unit,max(stock_id)as stock_id from tbl_stock_master where stock_id in (select stock_id from tbl_company_ledger_master) and   date=@date_new group by size ,c_name");
        int i; double totl = 0;
        for (i = 0; i < GridView1.Rows.Count; i++)
        {
            Label debit = GridView1.Rows[i].FindControl("Label201") as Label;
            totl += double.Parse(debit.Text);
        }
        Label4.Text = totl.ToString("n2");
    }
    protected void btn1_Click(object sender, EventArgs e)
    {
        GridView1.Columns[6].Visible = true;
        cls.gridbind(GridView1, "select max(date)as date, max(size)as size,max(c_name)as c_name,max(p_type)as p_type,sum(qty)as qty,max(unit)as unit,max(stock_id)as stock_id from tbl_stock_master where stock_id in (select stock_id from tbl_company_ledger_master) and date between '" + DateTime.ParseExact(txtfrom.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "' and '" + DateTime.ParseExact(txtto.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "'   group by size ,c_name");
        int i; double totl = 0;
        for (i = 0; i < GridView1.Rows.Count; i++)
        {
            Label debit = GridView1.Rows[i].FindControl("Label201") as Label;
            totl += double.Parse(debit.Text);
        }
        Label4.Text = totl.ToString("n2");
    }
    
}