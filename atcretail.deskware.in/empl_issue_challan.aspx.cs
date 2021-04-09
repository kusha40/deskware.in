using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class empl_issue_challan : System.Web.UI.Page
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
            cls.bind_ddl(ddlcom, "Select name,id from tbl_employee_master order by name asc", "name", "id");
        }

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedValue == "D")
        {
            string date = DateTime.ParseExact(txtdate.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            cmd = con.CreateCommand();
            con.Open();
            cmd.CommandText = " insert into tbl_employee_ledger_master values ('" + ddlcom.SelectedItem.Text + "','" + ddlcom.SelectedValue + "','" + txtamount.Text.Trim() + "','','" + date + "','" + txtremarks.Text.Trim() + "')";
            cmd.ExecuteNonQuery();
            con.Close();
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Created Sucessfully');window.location='empl_issue_challan.aspx';", true);
        }
        if (RadioButtonList1.SelectedValue == "C")
        {
            string date = DateTime.ParseExact(txtdate.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            cmd = con.CreateCommand();
            con.Open();
            cmd.CommandText = " insert into tbl_employee_ledger_master values ('" + ddlcom.SelectedItem.Text + "','" + ddlcom.SelectedValue + "','','" + txtamount.Text.Trim() + "','" + date + "','" + txtremarks.Text.Trim() + "')";
            cmd.ExecuteNonQuery();
            con.Close();
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Created Sucessfully');window.location='empl_issue_challan.aspx';", true);
        }
    }
    protected void btnview_Click(object sender, EventArgs e)
    {
        bind();
    }
    public void bind()
    {
        cls.gridbind(GridView1, "Select * from tbl_employee_ledger_master ");
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lbldeleteid = (Label)row.FindControl("Label1");
        con.Open();
        SqlCommand cmd = new SqlCommand("delete FROM tbl_employee_ledger_master where id='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Deleted Sucessfully');", true);
        bind();
    }
}