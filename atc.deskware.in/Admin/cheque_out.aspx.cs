using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_cheque_out : System.Web.UI.Page
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
           // bind2();
        }
    }
    string type = "";
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd1 = con.CreateCommand();
        SqlCommand cmd3 = con.CreateCommand();
        SqlCommand cmd4 = con.CreateCommand();

        con.Open();

        if (RadioButtonList1.SelectedValue == "E")
        {
            type = ddltype.SelectedItem.Text;
        }
        else
        {
            type = ddltype.SelectedValue;
        }

        //cmd1.CommandText = " insert into tbl_bank_ledger_master values ('" + type + "','','" + txtamount.Text.Trim() + "','','" + DateTime.ParseExact(txtdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "','','" + txtreamrks.Text.Trim() + "','" + ddlbank.SelectedValue + "')";
        //cmd1.ExecuteNonQuery();


        if (ddltype.SelectedValue == "AGW")
        {
            cmd3.CommandText = " insert into tbl_cash_ledger_master values ('" + ddltype.SelectedValue + "','','','" + txtamount.Text.Trim() + "','" + DateTime.ParseExact(txtdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "','','" + txtreamrks.Text.Trim() + "')";
            cmd3.ExecuteNonQuery();
        }

        if (ddltype.SelectedValue == "Admin Cash")
        {
            cmd3.CommandText = " insert into tbl_admin_cash_ledger_master values ('" + ddltype.SelectedValue + "','','" + txtamount.Text.Trim() + "','" + DateTime.ParseExact(txtdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "','" + txtreamrks.Text.Trim() + "')";
            cmd3.ExecuteNonQuery();
        }
        if (ddltype.SelectedValue == "HDFC" || ddltype.SelectedValue == "OBC" || ddltype.SelectedValue == "Current")
        {
            cmd3.CommandText = " insert into tbl_bank_ledger_master values ('" + ddltype.SelectedValue + "','','','" + txtamount.Text.Trim() + "','" + DateTime.ParseExact(txtdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "','','" + txtreamrks.Text.Trim() + "','" + ddltype.SelectedValue + "')";
            cmd3.ExecuteNonQuery();

            //debit//
             SqlCommand  cmd31=con.CreateCommand();
             cmd31.CommandText = " insert into tbl_bank_ledger_master values ('" + ddltype.SelectedValue + "','','" + txtamount.Text.Trim() + "','','" + DateTime.ParseExact(txtdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "','','" + txtreamrks.Text.Trim() + "','" + ddlbank.SelectedValue + "')";
            cmd31.ExecuteNonQuery();
        }

        if (RadioButtonList1.SelectedValue == "C")
        {
            cmd4.CommandText = "insert into tbl_company_ledger_master values('" + ddltype.SelectedValue + "','','" + txtamount.Text.Trim() + "','" + DateTime.ParseExact(txtdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "','','" + txtreamrks.Text.Trim() + "')";
            cmd4.ExecuteNonQuery();

            //debit//
            SqlCommand cmd31 = con.CreateCommand();
            cmd31.CommandText = " insert into tbl_bank_ledger_master values ('" + ddltype.SelectedValue + "','','" + txtamount.Text.Trim() + "','','" + DateTime.ParseExact(txtdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "','','" + txtreamrks.Text.Trim() + "','" + ddlbank.SelectedValue + "')";
            cmd31.ExecuteNonQuery();
        }
        if (RadioButtonList1.SelectedValue == "E")
        {
            if (RadioButtonList2.SelectedValue == "1")
            {
                cmd4.CommandText = "insert into tbl_admin_employee_ledger_master values('" + ddltype.SelectedItem.Text + "','" + ddltype.SelectedValue + "','','" + txtamount.Text.Trim() + "','" + DateTime.ParseExact(txtdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "','" + txtreamrks.Text.Trim() + "')";
                cmd4.ExecuteNonQuery();

                //debit//
                SqlCommand cmd31 = con.CreateCommand();
                cmd31.CommandText = " insert into tbl_bank_ledger_master values ('" + ddltype.SelectedValue + "','','" + txtamount.Text.Trim() + "','','" + DateTime.ParseExact(txtdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "','','" + txtreamrks.Text.Trim() + "','" + ddlbank.SelectedValue + "')";
                cmd31.ExecuteNonQuery();

            }
            if (RadioButtonList2.SelectedValue == "2")
            {
                cmd4.CommandText = "insert into tbl_employee_ledger_master values('" + ddltype.SelectedItem.Text + "','" + ddltype.SelectedValue + "','','" + txtamount.Text.Trim() + "','" + DateTime.ParseExact(txtdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "','" + txtreamrks.Text.Trim() + "')";
                cmd4.ExecuteNonQuery();

                //debit//
                SqlCommand cmd31 = con.CreateCommand();
                cmd31.CommandText = " insert into tbl_bank_ledger_master values ('" + ddltype.SelectedValue + "','','" + txtamount.Text.Trim() + "','','" + DateTime.ParseExact(txtdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "','','" + txtreamrks.Text.Trim() + "','" + ddlbank.SelectedValue + "')";
                cmd31.ExecuteNonQuery();
            }
        }


        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Submitted Sucessfully');window.location='cheque_out.aspx';", true);
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        bind();
    }
    public void bind()
    {
        if (RadioButtonList1.SelectedValue == "A")
        {
            div1.Visible = false; 
           cls.bind_ddl(ddltype, "Select type from tbl_admin_expense_head order by type asc", "type", "type");
        }
        if (RadioButtonList1.SelectedValue == "E")
        {
            div1.Visible = true;
            bind2();
          //  cls.bind_ddl(ddltype, "Select name from tbl_admin_employee_master order by name asc", "name", "name");
        }
        if (RadioButtonList1.SelectedValue == "C")
        {
            div1.Visible = false;
            cls.bind_ddl(ddltype, "Select name from tbl_company_master order by name asc", "name", "name");
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