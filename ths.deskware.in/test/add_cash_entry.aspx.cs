using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class add_cash_entry : System.Web.UI.Page
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
        if (Request.QueryString["type"] == null)
        {
            Response.Redirect("cash_out.aspx");
        }
        else
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["type"] == "Expenses")
                {
                    cls.bind_ddl(DropDownList1, "Select type,id from tbl_expense_head order by type asc", "type", "id");
                }
                if (Request.QueryString["type"] == "PermissionExpenses")
                {
                    cls.bind_ddl(DropDownList1, "Select type,id from tbl_permission_expense_head order by type asc", "type", "id");
                }
                if (Request.QueryString["type"] == "Company")
                {
                    cls.bind_ddl(DropDownList1, "Select name from tbl_company_master order by name asc", "name", "name");
                }
                if (Request.QueryString["type"] == "Driver")
                {
                    cls.bind_ddl(DropDownList1, "Select name,id from tbl_driver_master order by name asc", "name", "id");
                }
                if (Request.QueryString["type"] == "Daily Labour")
                {
                    DropDownList1.Items.Insert(0, "Daily Labour");
                }
                if (Request.QueryString["type"] == "Trolla Labour")
                {
                    DropDownList1.Items.Insert(0, "Trolla Labour");
                }
                if (Request.QueryString["type"] == "Salesman")
                {
                    cls.bind_ddl(DropDownList1, "Select name,id from tbl_salesman_master order by name asc", "name", "id");
                }
                if (Request.QueryString["type"] == "EmployeeSalery")
                {
                    cls.bind_ddl(DropDownList1, "Select name,id from tbl_employee_master order by name asc", "name", "id");
                }
                if (Request.QueryString["type"] == "CheckingExpense")
                {
                    cls.bind_ddl(DropDownList1, "Select type,id from tbl_checking_expense_head order by type asc", "type", "id");
                }

                
                
            }   
        }
    }
    string commnd, commnd1 = "";
    protected void Button1_Click(object sender, EventArgs e)
    {
        string date = DateTime.ParseExact(txtdate.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);

        if (Request.QueryString["type"] == "Salesman")
        {
            commnd = " insert into tbl_salesman_ledger_master values('" + DropDownList1.SelectedItem.Text + "','" + DropDownList1.SelectedValue + "','','" + txtamount.Text.Trim() + "','" + txtremarks.Text.Trim() + "','" + date + "','')";
            //add  cash out ledger//
            commnd1 = " insert into tbl_cash_ledger_master values ('" + DropDownList1.SelectedItem.Text + "','" + DropDownList1.SelectedValue + "','" + txtamount.Text.Trim() + "','','" + date + "','','" + txtremarks.Text.Trim() + "')";
        }
        if (Request.QueryString["type"] == "Company")
        {
            commnd = "insert into tbl_company_ledger_master values('" + DropDownList1.SelectedValue + "','','" + txtamount.Text.Trim() + "','" + date + "','','" + txtremarks.Text.Trim() + "')";
            //add  cash out ledger//
            commnd1 = " insert into tbl_cash_ledger_master values ('" + DropDownList1.SelectedItem.Text + "','','" + txtamount.Text.Trim() + "','','" + date + "','','" + txtremarks.Text.Trim() + "')";
        }
         if (Request.QueryString["type"] == "Driver")
        {
            commnd = " insert into tbl_driver_ledger_master values('" + DropDownList1.SelectedItem.Text + "','" + DropDownList1.SelectedValue + "','','" + txtamount.Text.Trim() + "','" + txtremarks.Text.Trim() + "','" + date + "','')";
            //add  cash out ledger//
            commnd1 = " insert into tbl_cash_ledger_master values ('" + DropDownList1.SelectedItem.Text + "','" + DropDownList1.SelectedValue + "','" + txtamount.Text.Trim() + "','','" + date + "','','" + txtremarks.Text.Trim() + "')";
        }
         if (Request.QueryString["type"] == "Daily Labour")
        {
            commnd = " insert into tbl_daily_labour_ledger_master values('Daily Labour','','" + txtamount.Text.Trim() + "','" + date + "','','" + txtremarks.Text.Trim() + "')";
            //add  cash out ledger//
            commnd1 = " insert into tbl_cash_ledger_master values ('Daily Labour','','" + txtamount.Text.Trim() + "','','" + date + "','','" + txtremarks.Text.Trim() + "')";
        }
        if (Request.QueryString["type"] == "Trolla Labour")
        {
            commnd = " insert into tbl_trolla_labour_ledger_master values('Trolla Labour','','" + txtamount.Text.Trim() + "','" + date + "','','" + txtremarks.Text.Trim() + "')";
            //add  cash out ledger//
            commnd1 = " insert into tbl_cash_ledger_master values ('Trolla Labour','','" + txtamount.Text.Trim() + "','','" + date + "','','" + txtremarks.Text.Trim() + "')";
        }
        if (Request.QueryString["type"] == "Expenses")
        {
            commnd1 = " insert into tbl_cash_ledger_master values ('" + DropDownList1.SelectedItem.Text + "','" + DropDownList1.SelectedValue + "','" + txtamount.Text.Trim() + "','','" + date + "','','" + txtremarks.Text.Trim() + "')";
        }
        if (Request.QueryString["type"] == "PermissionExpenses")
        {
            commnd1 = " insert into tbl_permission_expense_Approval values ('" + date + "','" + DropDownList1.SelectedItem.Text + "','" + txtamount.Text.Trim() + "','" + txtremarks.Text.Trim() + "','Not Approved')";
        }
        if (Request.QueryString["type"] == "CheckingExpense")
        {
            commnd1 = " insert into tbl_checking_expense_Approval values ('" + date + "','" + DropDownList1.SelectedItem.Text + "','" + txtamount.Text.Trim() + "','" + txtremarks.Text.Trim() + "','Not Approved')";
        }
        if (Request.QueryString["type"] == "EmployeeSalery")
        {
            commnd = "insert into tbl_employee_ledger_master values('" + DropDownList1.SelectedItem.Text + "','" + DropDownList1.SelectedValue + "','','" + txtamount.Text.Trim() + "','" + date + "','" + txtremarks.Text.Trim() + "')";
            //add  cash out ledger//
            commnd1 = " insert into tbl_cash_ledger_master values ('" + DropDownList1.SelectedItem.Text + "','" + DropDownList1.SelectedValue + "','" + txtamount.Text.Trim() + "','','" + date + "','','" + txtremarks.Text.Trim() + "')";
        }
        if (Request.QueryString["type"] != "Expenses" && Request.QueryString["type"] != "PermissionExpenses" && Request.QueryString["type"] != "CheckingExpense")
        {
            cmd = con.CreateCommand();
            SqlCommand cmd1 = con.CreateCommand();
            con.Open();
            
            cmd.CommandText = commnd;
            cmd1.CommandText = commnd1;
            cmd.ExecuteNonQuery();
            cmd1.ExecuteNonQuery();
            con.Close();
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Saved Sucessfully');", true);
            txtamount.Text = "";
        }
        if (Request.QueryString["type"] == "Expenses")
        {
            cmd = con.CreateCommand();
            con.Open();
            cmd.CommandText = commnd1;
            cmd.ExecuteNonQuery();
            con.Close();
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Saved Sucessfully');", true);
            txtamount.Text = "";
        }
        if (Request.QueryString["type"] == "PermissionExpenses")
        {
            cmd = con.CreateCommand();
            con.Open();
            cmd.CommandText = commnd1;
            cmd.ExecuteNonQuery();
            con.Close();
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Saved Sucessfully');", true);
            txtamount.Text = "";
        }
        if (Request.QueryString["type"] == "CheckingExpense")
        {
            cmd = con.CreateCommand();
            con.Open();
            cmd.CommandText = commnd1;
            cmd.ExecuteNonQuery();
            con.Close();
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Saved Sucessfully');", true);
            txtamount.Text = "";
        }

    }
}