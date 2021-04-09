using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_cash_out : System.Web.UI.Page
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
            bind2();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd2 = con.CreateCommand();
        SqlCommand cmd3 = con.CreateCommand();
        SqlCommand cmd4 = con.CreateCommand();
        SqlCommand cmd5 = con.CreateCommand();
        SqlCommand cmd6 = con.CreateCommand();
        con.Open();

        if (RadioButtonList1.SelectedValue == "1")
        {
            if (RadioButtonList2.SelectedValue == "1")
            {
                cmd5.CommandText = " insert into tbl_admin_cash_ledger_master values ('" + ddltype.SelectedItem.Text + "','" + txtamount.Text.Trim() + "','','" + DateTime.ParseExact(txtdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "','" + txtreamrks.Text.Trim() + "')";
                cmd5.ExecuteNonQuery();

                cmd6.CommandText = "insert into tbl_admin_employee_ledger_master values('" + ddltype.SelectedItem.Text + "','" + ddltype.SelectedValue + "','','" + txtamount.Text.Trim() + "','" + DateTime.ParseExact(txtdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "','" + txtreamrks.Text.Trim() + "')";
                cmd6.ExecuteNonQuery();
            }
            if (RadioButtonList2.SelectedValue == "2")
            {
                cmd5.CommandText = " insert into tbl_admin_cash_ledger_master values ('" + ddltype.SelectedItem.Text + "','" + txtamount.Text.Trim() + "','','" + DateTime.ParseExact(txtdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "','" + txtreamrks.Text.Trim() + "')";
                cmd5.ExecuteNonQuery();

                cmd6.CommandText = "insert into tbl_employee_ledger_master values('" + ddltype.SelectedItem.Text + "','" + ddltype.SelectedValue + "','','" + txtamount.Text.Trim() + "','" + DateTime.ParseExact(txtdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "','" + txtreamrks.Text.Trim() + "')";
                cmd6.ExecuteNonQuery();
            }
          
        }
        if (RadioButtonList1.SelectedValue == "2")
        {
            cmd2.CommandText = " insert into tbl_admin_cash_ledger_master values ('" + ddltype.SelectedValue + "','" + txtamount.Text.Trim() + "','','" + DateTime.ParseExact(txtdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "','" + txtreamrks.Text.Trim() + "')";
            cmd2.ExecuteNonQuery();

            if (ddltype.SelectedValue == "AGW")
            {
                cmd3.CommandText = " insert into tbl_cash_ledger_master values ('" + ddltype.SelectedValue + "','','','" + txtamount.Text.Trim() + "','" + DateTime.ParseExact(txtdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "','','" + txtreamrks.Text.Trim() + "')";
                cmd3.ExecuteNonQuery();
            }
        }
        if (RadioButtonList1.SelectedValue == "3")
        {

            cmd5.CommandText = " insert into tbl_admin_cash_ledger_master values ('" + ddltype.SelectedValue + "','" + txtamount.Text.Trim() + "','','" + DateTime.ParseExact(txtdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "','" + txtreamrks.Text.Trim() + "')";
            cmd5.ExecuteNonQuery();

            cmd6.CommandText = "insert into tbl_company_ledger_master values('" + ddltype.SelectedValue + "','','" + txtamount.Text.Trim() + "','" + DateTime.ParseExact(txtdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "','','" + txtreamrks.Text.Trim() + "')";
            cmd6.ExecuteNonQuery();

        }

        if (RadioButtonList1.SelectedValue == "4")
        {

            cmd5.CommandText = " insert into tbl_admin_cash_ledger_master values ('" + ddltype.SelectedValue + "','" + txtamount.Text.Trim() + "','','" + DateTime.ParseExact(txtdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "','" + txtreamrks.Text.Trim() + "')";
            cmd5.ExecuteNonQuery();

            cmd6.CommandText = " insert into tbl_bank_ledger_master values ('" + ddltype.SelectedValue + "','','','" + txtamount.Text.Trim() + "','" + DateTime.ParseExact(txtdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "','','" + txtreamrks.Text.Trim() + "','" + ddltype.SelectedValue + "')";
            cmd6.ExecuteNonQuery();

        }

        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Submitted Sucessfully');window.location='cash_out.aspx';", true);
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        bind();
    }
    public void bind()
    {
        if (RadioButtonList1.SelectedValue == "1")
        {
            div1.Visible = true;
            bind2();
            //cls.bind_ddl(ddltype, "Select name,id from tbl_admin_employee_master order by name asc", "name", "id");
        }
        if (RadioButtonList1.SelectedValue == "2")
        {
            div1.Visible = false;
            cls.bind_ddl(ddltype, "Select type from tbl_admin_expense_head where type not in('Admin Cash','HDFC','OBC','Current') order by type asc", "type", "type");
        }
        if (RadioButtonList1.SelectedValue == "3")
        {
            div1.Visible = false;
            cls.bind_ddl(ddltype, "Select name from tbl_company_master order by name asc", "name", "name");
        }
        if (RadioButtonList1.SelectedValue == "4")
        {
            ddltype.Items.Clear();
            div1.Visible = false;
            ddltype.Items.Insert(0, new ListItem("Current", "Current"));
            ddltype.Items.Insert(1, new ListItem("OBC", "OBC"));
            ddltype.Items.Insert(2, new ListItem("HDFC", "HDFC"));
            //cls.bind_ddl(ddltype, "Select name from tbl_company_master order by name asc", "name", "name");
        }
    }
    protected void RadioButtonList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        bind2();
    }
    public void bind2()
    {
        if (RadioButtonList2.SelectedValue == "1")
        {
            cls.bind_ddl(ddltype, "Select name,id from tbl_admin_employee_master order by name asc", "name", "id");
        }
        if (RadioButtonList2.SelectedValue == "2")
        {
            cls.bind_ddl(ddltype, "Select name,id from tbl_employee_master order by name asc", "name", "id");
        }
    }
}