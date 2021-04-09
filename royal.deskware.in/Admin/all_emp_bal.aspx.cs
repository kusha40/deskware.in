using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_all_emp_bal : System.Web.UI.Page
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
        }
    }
    public void bind()
    {
        h3.Visible = true;
        cls.gridbind(GridView1, "select max(date)as date,max(dealer_name) as dealer_name,max(dealer_id) as dealer_id,sum(debit)as debit,sum(credit) as credit,(sum(debit)-sum(credit))as bal from tbl_admin_employee_ledger_master group by dealer_name  union  all select max(date)as date,max(dealer_name) as dealer_name,max(dealer_id) as dealer_id,sum(debit)as debit,sum(credit) as credit,(sum(debit)-sum(credit))as bal from tbl_employee_ledger_master group by dealer_name ");

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

    }
    protected void Button2_Click(object sender, EventArgs e)
    {

    }
}