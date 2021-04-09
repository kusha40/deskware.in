using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_assests : System.Web.UI.Page
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
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedValue == "C")
        {
            SqlCommand cmd2 = con.CreateCommand();
            con.Open();
            cmd2.CommandText = " insert into tbl_assets_master values ('" + txtname.Text.Trim() + "','','" + txtamount.Text.Trim() + "','" + txtreamrks.Text.Trim() + "','" + DateTime.ParseExact(txtdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "')";
            cmd2.ExecuteNonQuery();
            con.Close();
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Submitted Sucessfully');window.location='assests.aspx';", true);
        }
        if (RadioButtonList1.SelectedValue == "D")
        {
            SqlCommand cmd2 = con.CreateCommand();
            con.Open();
            cmd2.CommandText = " insert into tbl_assets_master values ('" + txtname.Text.Trim() + "','" + txtamount.Text.Trim() + "','','" + txtreamrks.Text.Trim() + "','" + DateTime.ParseExact(txtdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "')";
            cmd2.ExecuteNonQuery();

            //dump ledger
            SqlCommand cmd311 = con.CreateCommand();
            cmd311.CommandText = " insert into tbl_dump_debit_master values ('" + txtname.Text.Trim() + "','" + txtreamrks.Text.Trim() + "','" + DateTime.ParseExact(txtdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "','','ASD','" + txtamount.Text.Trim() + "')";
            cmd311.ExecuteNonQuery();
            con.Close();

            con.Close();
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Submitted Sucessfully');window.location='assests.aspx';", true);
        }
    }
}