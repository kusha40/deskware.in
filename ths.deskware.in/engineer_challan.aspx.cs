using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class engineer_challan : System.Web.UI.Page
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
            cls.bind_ddl(DropDownList1, "select user_id,name from user_master where status='Active'   order by name asc", "name", "user_id");
        }

    }
    string command = "";
    protected void Button1_Click(object sender, EventArgs e)
    {
        string date = DateTime.ParseExact(TextBox1.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
        if (RadioButtonList1.SelectedValue == "Credit")
        {
            command = "insert into tbl_engineer_ledger values('" + DropDownList1.SelectedValue + "','" + DropDownList1.SelectedValue + "','','" + TextBox2.Text + "','" + TextBox3.Text + "','" + Session["Username"].ToString() + "','" + date + "')";
        }
        if (RadioButtonList1.SelectedValue == "Debit")
        {
            command = "insert into tbl_engineer_ledger values('" + DropDownList1.SelectedValue + "','" + DropDownList1.SelectedValue + "','" + TextBox2.Text + "','','" + TextBox3.Text + "','" + Session["Username"].ToString() + "','" + date + "')";
        }
        cmd = con.CreateCommand();
        con.Open();
        cmd.CommandText = command;
        cmd.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Submitted Sucessfully');window.location='engineer_challan.aspx';", true);

    }
}