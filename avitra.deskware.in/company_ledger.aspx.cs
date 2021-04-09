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

public partial class company_ledger : System.Web.UI.Page
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
            cls.bind_ddl(ddlcom, "Select name from tbl_company_master order by name asc", "name", "name");
            if (Session["type"].ToString() != "Administrator")
            {
                GridView1.Columns[0].Visible = false;
                TextBox3.Visible = Button4.Visible = false;
            }
        }

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        h3.Visible = true;
        cls.gridbind(GridView1, "select * from tbl_company_ledger_master where c_name='" + ddlcom.SelectedValue + "' order by date asc ");
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
        Label5.Text = Convert.ToDouble(double.Parse(Label4.Text) - double.Parse(Label3.Text)).ToString("n2");      

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "del")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "", "window.open('delete_ledger_entry.aspx?id=" + e.CommandArgument.ToString() + "&typ=company','Graph','height=724px,width=900px,scrollbars=1' );", true);
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
    protected void btnview3_Click(object sender, EventArgs e)
    {
        h3.Visible = true;
        string from_date = DateTime.ParseExact(TextBox1.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
        string to_date = DateTime.ParseExact(TextBox2.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
        cls.gridbind(GridView1, "select * from tbl_company_ledger_master where c_name='" + ddlcom.SelectedValue + "' and date between '" + from_date + "' and '" + to_date + "' order by date asc ");
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
        Label5.Text = Convert.ToDouble(double.Parse(Label4.Text) - double.Parse(Label3.Text)).ToString("n2");   
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label debit = e.Row.FindControl("Label6") as Label;
            Label credit = e.Row.FindControl("Label7") as Label;
            Label bal = e.Row.FindControl("lblbal") as Label;
            Int32 index = GridView1.Rows.Count - 1;
            if (index >= 0)
            {

                if (index == 0)
                {
                    Label L1 = GridView1.Rows[index].FindControl("Label6") as Label;
                    bal.Text = L1.Text;
                    double c = double.Parse(bal.Text) + double.Parse(debit.Text) - double.Parse(credit.Text);
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

    protected void ChkAllRows(object sender, EventArgs e)
    {

        CheckBox chkall = (CheckBox)GridView1.HeaderRow.FindControl("chkAll");
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            CheckBox chkrow = (CheckBox)GridView1.Rows[i].FindControl("chkAll0");
            if (chkall.Checked == true)
            {
                chkrow.Checked = true;
            }
            else
            {
                chkrow.Checked = false;
            }
        }


    }

    protected void Button4_Click(object sender, EventArgs e)
    {
        SqlDataAdapter adap = new SqlDataAdapter("select password from user_master where password='" + TextBox3.Text.Trim() + "'  and user_id='admin'", con);
        DataSet ds = new DataSet();
        adap.Fill(ds);
        if (ds.Tables[0].Rows.Count != 0)
        {
            int count = 0;
            int j;
            for (j = 0; j < GridView1.Rows.Count; j++)
            {
                CheckBox cb = (CheckBox)GridView1.Rows[j].FindControl("chkAll0");
                Label id = (Label)GridView1.Rows[j].FindControl("Label1");
                if (cb.Checked == true)
                {
                    count++;
                    cmd = con.CreateCommand();
                    con.Open();
                    cmd.CommandText = "Delete tbl_company_ledger_master    where id='" + id.Text + "' ";
                    cmd.ExecuteNonQuery();
                    con.Close();

                }
            }
            if (count > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Deleted Sucessfully');window.location='company_ledger.aspx';", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Check Item in the List');", true);
            }
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Password Invalid');", true);
        }

    }
}