using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class add_cheque_entry : System.Web.UI.Page
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
            Response.Redirect("cheque_entry.aspx");
        }
        else
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["type"] == "Dealer")
                {
                    cls.bind_ddl(DropDownList1, "Select name,id from tbl_dealer_Master order by name asc", "name", "id");
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
            }
        }
    }
    string commnd = "";
    protected void Button1_Click(object sender, EventArgs e)
    {
        txtremarks.Text = "Cheque Details: " + txtremarks.Text + " || Cheque no:" + txtchequeno.Text.Trim() + " || Cheque Date:" + txtchequedate.Text + " || Bank Name:            " + txtbankname.Text + "";

        string date = DateTime.ParseExact(txtdate.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
        if (Request.QueryString["type"] == "Dealer")
        {
            commnd = "insert into tbl_dealer_ledger_master values('" + DropDownList1.SelectedItem.Text + "','" + DropDownList1.SelectedValue + "','','" + txtamount.Text.Trim() + "','" + date + "','','" + txtremarks.Text.Trim() + "')";
        }
        else if (Request.QueryString["type"] == "Company")
        {
            commnd = "insert into tbl_company_ledger_master values('" + DropDownList1.SelectedValue + "','','" + txtamount.Text.Trim() + "','" + date + "','','" + txtremarks.Text.Trim() + "')";
        }
        else if (Request.QueryString["type"] == "Driver")
        {
            commnd = " insert into tbl_driver_ledger_master values('" + DropDownList1.SelectedItem.Text + "','" + DropDownList1.SelectedValue + "','','" + txtamount.Text.Trim() + "','" + txtremarks.Text.Trim() + "','" + date + "','')";
        }
        else if (Request.QueryString["type"] == "Daily Labour")
        {
            commnd = " insert into tbl_daily_labour_ledger_master values('Daily Labour','','" + txtamount.Text.Trim() + "','" + date + "','','" + txtremarks.Text.Trim() + "')";
        }
        else if (Request.QueryString["type"] == "Trolla Labour")
        {
            commnd = " insert into tbl_trolla_labour_ledger_master values('Trolla Labour','','" + txtamount.Text.Trim() + "','" + date + "','','" + txtremarks.Text.Trim() + "')";
        }
        cmd = con.CreateCommand();
        con.Open();
        cmd.CommandText = commnd;
        cmd.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Saved Sucessfully');", true);
        txtamount.Text =txtbankname.Text=txtchequeno.Text=  "";
        txtremarks.Text = "Cheque";
    }
}