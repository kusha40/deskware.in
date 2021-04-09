using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_issue_salesman_challan : System.Web.UI.Page
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
            cls.bind_ddl(ddldriver, "Select name,id from tbl_salesman_master order by name asc", "name", "id");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedValue == "C")
        {
            SqlCommand cmd2 = con.CreateCommand();
            con.Open();
            cmd2.CommandText = " insert into tbl_salesman_ledger_master values ('" + ddldriver.SelectedItem.Text + "','" + ddldriver.SelectedValue + "','','" + txtamount.Text.Trim() + "','" + txtreamrks.Text.Trim() + "','" + DateTime.ParseExact(txtdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "','')";
            cmd2.ExecuteNonQuery();
            con.Close();
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Submitted Sucessfully');window.location='issue_salesman_challan.aspx';", true);
        }
        if (RadioButtonList1.SelectedValue == "D")
        {
            SqlCommand cmd2 = con.CreateCommand();
            con.Open();
            cmd2.CommandText = " insert into tbl_salesman_ledger_master values ('" + ddldriver.SelectedItem.Text + "','" + ddldriver.SelectedValue + "','" + txtamount.Text.Trim() + "','','" + txtreamrks.Text.Trim() + "','" + DateTime.ParseExact(txtdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "','')";
            cmd2.ExecuteNonQuery();
            con.Close();
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Submitted Sucessfully');window.location='issue_salesman_challan.aspx';", true);
        }
    }
}