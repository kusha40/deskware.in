using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_issue_emp_challan : System.Web.UI.Page
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
            bind_emp();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (RadioButtonList2.SelectedValue == "1")
        {
            if (RadioButtonList1.SelectedValue == "C")
            {
                SqlCommand cmd2 = con.CreateCommand();
                con.Open();
                cmd2.CommandText = " insert into tbl_admin_employee_ledger_master values ('" + ddldriver.SelectedItem.Text + "','" + ddldriver.SelectedValue + "','','" + txtamount.Text.Trim() + "','" + DateTime.ParseExact(txtdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "','" + txtreamrks.Text.Trim() + "')";
                cmd2.ExecuteNonQuery();
                con.Close();
                ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Submitted Sucessfully');window.location='issue_emp_challan.aspx';", true);
            }
            if (RadioButtonList1.SelectedValue == "D")
            {
                SqlCommand cmd2 = con.CreateCommand();
                con.Open();
                cmd2.CommandText = " insert into tbl_admin_employee_ledger_master values ('" + ddldriver.SelectedItem.Text + "','" + ddldriver.SelectedValue + "','" + txtamount.Text.Trim() + "','','" + DateTime.ParseExact(txtdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "','" + txtreamrks.Text.Trim() + "')";
                cmd2.ExecuteNonQuery();

                //emp debit ledger
                SqlCommand cmd311 = con.CreateCommand();
                cmd311.CommandText = " insert into tbl_dump_debit_master values ('" + ddldriver.SelectedItem.Text + "','" + txtreamrks.Text.Trim() + "','" + DateTime.ParseExact(txtdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "','','ED','" + txtamount.Text.Trim() + "')";
                cmd311.ExecuteNonQuery();

                con.Close();
                ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Submitted Sucessfully');window.location='issue_emp_challan.aspx';", true);
            }
        }
        if (RadioButtonList2.SelectedValue == "2")
        {
            if (RadioButtonList1.SelectedValue == "C")
            {
                SqlCommand cmd2 = con.CreateCommand();
                con.Open();
                cmd2.CommandText = " insert into tbl_employee_ledger_master values ('" + ddldriver.SelectedItem.Text + "','" + ddldriver.SelectedValue + "','','" + txtamount.Text.Trim() + "','" + DateTime.ParseExact(txtdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "','" + txtreamrks.Text.Trim() + "')";
                cmd2.ExecuteNonQuery();
                con.Close();
                ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Submitted Sucessfully');window.location='issue_emp_challan.aspx';", true);
            }
            if (RadioButtonList1.SelectedValue == "D")
            {
                SqlCommand cmd2 = con.CreateCommand();
                con.Open();
                cmd2.CommandText = " insert into tbl_employee_ledger_master values ('" + ddldriver.SelectedItem.Text + "','" + ddldriver.SelectedValue + "','" + txtamount.Text.Trim() + "','','" + DateTime.ParseExact(txtdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "','" + txtreamrks.Text.Trim() + "')";
                cmd2.ExecuteNonQuery();

                //emp debit ledger
                SqlCommand cmd311 = con.CreateCommand();
                cmd311.CommandText = " insert into tbl_dump_debit_master values ('" + ddldriver.SelectedItem.Text + "','" + txtreamrks.Text.Trim() + "','" + DateTime.ParseExact(txtdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "','','ED','" + txtamount.Text.Trim() + "')";
                cmd311.ExecuteNonQuery();

                con.Close();
                ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Submitted Sucessfully');window.location='issue_emp_challan.aspx';", true);
            }
        }
    }
    protected void RadioButtonList2_SelectedIndexChanged(object sender, EventArgs e)
    {
        bind_emp();
    }
    public void bind_emp()
    {
        if (RadioButtonList2.SelectedValue == "1")
        {
            cls.bind_ddl(ddldriver, "Select name,id from tbl_admin_employee_master order by name asc", "name", "id");
        }
        if (RadioButtonList2.SelectedValue == "2")
        {
            cls.bind_ddl(ddldriver, "Select name,id from tbl_employee_master order by name asc", "name", "id");
        }
    }

}