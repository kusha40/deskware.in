using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class all_salesman_bal_sheet : System.Web.UI.Page
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
            bind();
            cls.bind_ddl(ddldealer, "Select distinct salesman,salesman_id from tbl_salesman_ledger_master order by salesman asc", "salesman", "salesman_id");
        }

    }
    public void bind()
    {
        h3.Visible = true;
        cls.gridbind(GridView1, "select max(date)as date,max(salesman) as salesman,max(salesman_id) as salesman_id,sum(debit)as debit,sum(credit) as credit,(sum(debit)-sum(credit))as bal from tbl_salesman_ledger_master group by salesman order by bal desc");

        int i; double totl = 0; double totl1 = 0; double totl2 = 0;
        for (i = 0; i < GridView1.Rows.Count; i++)
        {
            //Label debit = GridView1.Rows[i].FindControl("Label6") as Label;
            //Label credit = GridView1.Rows[i].FindControl("Label7") as Label;
            Label bal = GridView1.Rows[i].FindControl("Label8") as Label;
            //totl += double.Parse(debit.Text);
            //totl1 += double.Parse(credit.Text);
            totl2 += double.Parse(bal.Text);
        }
        //Label3.Text = totl.ToString("n2");
        //Label4.Text = totl1.ToString("n2");
        Label5.Text = totl2.ToString("n2");
        // Label5.Text = Convert.ToDouble(double.Parse(Label3.Text) - double.Parse(Label4.Text)).ToString("n2");    
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        h3.Visible = true;
        cls.gridbind(GridView1, "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '00:00:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101) select max(date)as date,max(salesman) as salesman,max(salesman_id) as salesman_id,sum(debit)as debit,sum(credit) as credit,(sum(debit)-sum(credit))as bal from tbl_salesman_ledger_master where  date=@date_new  group by salesman order by bal desc ");
        int i; double totl2 = 0;
        for (i = 0; i < GridView1.Rows.Count; i++)
        {
            Label bal = GridView1.Rows[i].FindControl("Label8") as Label;
            totl2 += double.Parse(bal.Text);
        }
        Label5.Text = totl2.ToString("n2");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        h3.Visible = true;
        cls.gridbind(GridView1, " select max(date)as date,max(salesman) as salesman,max(salesman_id) as salesman_id,sum(debit)as debit,sum(credit) as credit,(sum(debit)-sum(credit))as bal from tbl_salesman_ledger_master where  date between '" + DateTime.ParseExact(txtfrom.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "' and '" + DateTime.ParseExact(txtto.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "'  group by salesman order by bal desc");
        int i; double totl2 = 0;
        for (i = 0; i < GridView1.Rows.Count; i++)
        {
            Label bal = GridView1.Rows[i].FindControl("Label8") as Label;
            totl2 += double.Parse(bal.Text);
        }
        Label5.Text = totl2.ToString("n2");
    }
    protected void ddldealer_SelectedIndexChanged(object sender, EventArgs e)
    {
        h3.Visible = true;
        cls.gridbind(GridView1, "select max(date)as date,max(salesman) as salesman,max(salesman_id) as salesman_id,sum(debit)as debit,sum(credit) as credit,(sum(debit)-sum(credit))as bal from tbl_salesman_ledger_master where salesman_id='" + ddldealer.SelectedValue + "'  group by salesman order by bal desc");

        int i; double totl2 = 0;
        for (i = 0; i < GridView1.Rows.Count; i++)
        {
            Label bal = GridView1.Rows[i].FindControl("Label8") as Label;
            totl2 += double.Parse(bal.Text);
        }
        Label5.Text = totl2.ToString("n2");
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