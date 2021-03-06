using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_employee_ledger : System.Web.UI.Page
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

            cls.bind_ddl(ddldealer, "Select name,id from tbl_admin_employee_master order by name asc", "name", "id");

            //Label3.Text = Label4.Text = Label5.Text = "0";
            //h3.Visible = true;
            //cls.gridbind(GridView1, "select * from [tbl_admin_employee_ledger_master]  order by id asc,date asc ");

            //int i; double totl = 0; double totl1 = 0;
            //for (i = 0; i < GridView1.Rows.Count; i++)
            //{
            //    Label debit = GridView1.Rows[i].FindControl("Label6") as Label;
            //    Label credit = GridView1.Rows[i].FindControl("Label7") as Label;
            //    totl += double.Parse(debit.Text);
            //    totl1 += double.Parse(credit.Text);
            //}
            //Label3.Text = totl.ToString("n2");
            //Label4.Text = totl1.ToString("n2");
            //Label5.Text = Convert.ToDouble(double.Parse(Label3.Text) - double.Parse(Label4.Text)).ToString("n2");

          
        }

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "del")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "", "window.open('../delete_ledger_entry.aspx?id=" + e.CommandArgument.ToString() + "&typ=adminemp','Graph','height=724px,width=900px,scrollbars=1' );", true);
        }
    }
    double bal1 = 0.00;
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label debit = e.Row.FindControl("Label6") as Label;
            Label credit = e.Row.FindControl("Label7") as Label;
            Label bal = e.Row.FindControl("lblbal") as Label;

            Int32 index = GridView1.Rows.Count - 1;
            if (index >= 0 || index == -1)
            {
                if (index == -1)
                {
                    //Label L1 = GridView1.Rows[index].FindControl("Label6") as Label;
                    //bal.Text = L1.Text;
                    //double c = double.Parse(bal.Text) + double.Parse(debit.Text) - double.Parse(credit.Text);
                    double balance = double.Parse(debit.Text);
                    bal1 = balance;
                    bal.Text = bal1.ToString("n2");
                }
                else if (index == 0)
                {
                    Label L1 = GridView1.Rows[index].FindControl("Label6") as Label;
                    bal.Text = L1.Text;
                    double c = bal1 + double.Parse(debit.Text) - double.Parse(credit.Text);
                    bal.Text = c.ToString("n2");
                }
                else
                {
                    Label L = GridView1.Rows[index].FindControl("lblbal") as Label;
                    bal.Text = L.Text;
                    double c = double.Parse(bal.Text) + double.Parse(debit.Text) - double.Parse(credit.Text);
                    bal.Text = c.ToString("n2");
                }

            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string from_date = DateTime.ParseExact(txtfdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
        string to_date = DateTime.ParseExact(txttdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);

        Label3.Text = Label4.Text = Label5.Text = "0";
        h3.Visible = true;
        cls.gridbind(GridView1, "select * from [tbl_admin_employee_ledger_master] where date between '" + from_date + "' and '" + to_date + "'  order by id asc,date asc ");

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
    protected void Button2_Click(object sender, EventArgs e)
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
    protected void Button3_Click(object sender, EventArgs e)
    {
        Label3.Text = Label4.Text = Label5.Text = "0";
        h3.Visible = true;
      //  cls.gridbind(GridView1, "select * from [tbl_admin_employee_ledger_master] where dealer_id='" + ddldealer.SelectedValue + "' order by id asc,date asc ");

        cls.gridbind(GridView1, "select max(id)as id,max(dealer_name)as dealer_name ,sum(debit)as debit,sum(credit)as credit,max(date)as date,max(remarks)as remarks,max(dealer_id)as dealer_id from tbl_admin_employee_ledger_master where dealer_id='" + ddldealer.SelectedValue + "' group by month(date),dealer_id ");

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