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

public partial class dealer_cash_in : System.Web.UI.Page
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
            cls.bind_ddl(ddldealer, "Select distinct dealer_name,dealer_id from tbl_dealer_ledger_master order by dealer_name asc", "dealer_name", "dealer_id");

            bind_temp();
        }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        submit_1st();
        submit_2nd();
    }
    public void submit_1st()
    {
        int count = 0;
        int j;
        for (j = 0; j < GridView1.Rows.Count; j++)
        {
            Label id = (Label)GridView1.Rows[j].FindControl("Label1");
            Label name = (Label)GridView1.Rows[j].FindControl("Label2");
            TextBox credit = (TextBox)GridView1.Rows[j].FindControl("TextBox2");
            TextBox remarks = (TextBox)GridView1.Rows[j].FindControl("TextBox3");
            count++;
            string date = DateTime.ParseExact(txtdate.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            cmd = con.CreateCommand();
           SqlCommand cmd1 = con.CreateCommand();
            con.Open();
            cmd.CommandText = "insert into tbl_dealer_ledger_master values('" + name.Text + "','" + id.Text + "','','" + credit.Text.Trim() + "','" + date + "','','" + remarks.Text.Trim() + "')";


            //add in cash ledger//
            cmd1.CommandText = " insert into tbl_cash_ledger_master values ('" + name.Text + "','" + id.Text + "','','" + credit.Text.Trim() + "','" + date + "','','" + remarks.Text.Trim() + "')";

            cmd.ExecuteNonQuery();
            cmd1.ExecuteNonQuery();
            con.Close();
        }
        if (count > 0)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Submitted Sucessfully');window.location='dealer_cash_in.aspx';", true);
        }
    }

    public void submit_2nd()
    {
        int count = 0;
        int j;
        for (j = 0; j < GridView2.Rows.Count; j++)
        {
            Label id = (Label)GridView2.Rows[j].FindControl("Label3");
            Label name = (Label)GridView2.Rows[j].FindControl("Label4");
            TextBox discount = (TextBox)GridView2.Rows[j].FindControl("TextBox4");
            TextBox remarks = (TextBox)GridView2.Rows[j].FindControl("TextBox5");
            count++;
            string date = DateTime.ParseExact(txtdate.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            cmd = con.CreateCommand();
            con.Open();
            cmd.CommandText = "insert into tbl_dealer_discount_approve_details values('" + name.Text + "','" + id.Text + "','" + discount.Text.Trim() + "','" + remarks.Text.Trim() + "','" + date + "','Not Approved')";
            cmd.ExecuteNonQuery();

            //dump ledger
            SqlCommand cmd311 = con.CreateCommand();
            cmd311.CommandText = " insert into tbl_dump_debit_master values ('" + name.Text + "','" + remarks.Text.Trim() + "','" + DateTime.ParseExact(txtdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "','','DD','" + discount.Text.Trim() + "')";
            cmd311.ExecuteNonQuery();
            con.Close();
        }
        if (count > 0)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Submitted Sucessfully');window.location='dealer_cash_in.aspx';", true);
        }
    }

    protected void ddlweek_SelectedIndexChanged(object sender, EventArgs e)
    {
        cls.gridbind(GridView1, " select * from tbl_dealer_Master where week='" + ddlweek.SelectedValue + "'");
        cls.gridbind(GridView2, " select * from tbl_dealer_Master where week='" + ddlweek.SelectedValue + "'");
        GridView1.Columns[5].Visible = GridView2.Columns[5].Visible = false;

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        GridView1.Columns[5].Visible = GridView2.Columns[5].Visible = true;

        DataTable dt = (DataTable)ViewState["dealer"];
        dt.Rows.Add(ddldealer.SelectedValue, ddldealer.SelectedItem.Text);
        ViewState["dealer"] = dt;
        GridView1.DataSource = (DataTable)ViewState["dealer"];
        GridView1.DataBind();

        DataTable dt1 = (DataTable)ViewState["dealer1"];
        dt1.Rows.Add(ddldealer.SelectedValue, ddldealer.SelectedItem.Text);
        ViewState["dealer1"] = dt1;
        GridView2.DataSource = (DataTable)ViewState["dealer1"];
        GridView2.DataBind();


    }
    public void bind_temp()
    {
        DataTable dt = new DataTable();
        dt.Columns.AddRange(
              new DataColumn[2] 
            { 
                                new DataColumn("id", typeof(string)),

                new DataColumn("name", typeof(string)),
                                                                            
            }

          );
        ViewState["dealer"] = dt;
        GridView1.DataSource = (DataTable)ViewState["dealer"];
        GridView1.DataBind();


        DataTable dt1 = new DataTable();
        dt1.Columns.AddRange(
              new DataColumn[2] 
            { 
                                new DataColumn("id", typeof(string)),

                new DataColumn("name", typeof(string)),
                                                                            
            }

          );
        ViewState["dealer1"] = dt1;
        GridView2.DataSource = (DataTable)ViewState["dealer1"];
        GridView2.DataBind();

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "delete1")
        {
            if (GridView1.Rows.Count > 0)
            {
                DataTable dt = (DataTable)ViewState["dealer"];
                GridViewRow row = (GridViewRow)(((Control)e.CommandSource).NamingContainer);
                DataTable dtCurrentTable = new DataTable();
                int RowIndex = row.RowIndex;
                dtCurrentTable = dt;
                dtCurrentTable.Rows.RemoveAt(row.RowIndex);
                GridView1.DataSource = dt;
                GridView1.DataBind();
            }
        }
    }
    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "delete1")
        {
            if (GridView1.Rows.Count > 0)
            {
                DataTable dt1 = (DataTable)ViewState["dealer1"];
                GridViewRow row = (GridViewRow)(((Control)e.CommandSource).NamingContainer);
                DataTable dtCurrentTable1 = new DataTable();
                int RowIndex = row.RowIndex;
                dtCurrentTable1 = dt1;
                dtCurrentTable1.Rows.RemoveAt(row.RowIndex);
                GridView2.DataSource = dt1;
                GridView2.DataBind();
            }
        }
    }
}