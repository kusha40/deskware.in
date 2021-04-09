using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class customer_challan : System.Web.UI.Page
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
            cls.bind_ddl(DropDownList1, "select lead_id,(fname+' '+lname+' - '+mob)as fname from tbl_medors_lead_master order by fname asc", "fname", "lead_id");
            DropDownList1.Items.Insert(0, "Select");
        }

    }
    string command = "";
    protected void Button1_Click(object sender, EventArgs e)
    {
        string date = DateTime.ParseExact(TextBox1.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
        if (RadioButtonList1.SelectedValue == "Credit")
        {
            command = "insert into tbl_customer_ledger values('" + DropDownList1.SelectedValue + "','" + DropDownList1.SelectedItem.Text + "','','" + TextBox2.Text + "','" + TextBox3.Text + "','" + Session["Username"].ToString() + "','" + date + "')";
        }
        if (RadioButtonList1.SelectedValue == "Debit")
        {
            command = "insert into tbl_customer_ledger values('" + DropDownList1.SelectedValue + "','" + DropDownList1.SelectedItem.Text + "','" + TextBox2.Text + "','','" + TextBox3.Text + "','" + Session["Username"].ToString() + "','" + date + "')";
        }
        cmd = con.CreateCommand();
        con.Open();
        cmd.CommandText = command;
        cmd.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Submitted Sucessfully');window.location='customer_challan.aspx';", true);

    }
}