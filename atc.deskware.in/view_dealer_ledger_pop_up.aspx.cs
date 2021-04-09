using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class view_dealer_ledger_pop_up : System.Web.UI.Page
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
        cls.gridbind(GridView1, "select * from tbl_dealer_ledger_master where dealer_id='" + Request.QueryString["id"].ToString() + "' order by date asc ");

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
}