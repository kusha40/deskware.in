using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class issue_cash_Challan_without_material : System.Web.UI.Page
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
            ddldealer.Items.Add(new ListItem("Cash", "151"));
            po_no();
        }

    }
    public void po_no()
    {

        cmd = con.CreateCommand();
        con.Open();
        cmd.CommandText = "  SELECT  RIGHT('00000'+ isnull(CONVERT(VARCHAR,max(cast(challan_no as bigint))+1),0),5) as id FROM tbl_challan_details_master";
        txtchallanno.Text = cmd.ExecuteScalar().ToString();
        con.Close();
        if (txtchallanno.Text == "00000")
        {
            txtchallanno.Text = "00001";
        }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        po_no();
        string date = DateTime.ParseExact(txtdate.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
        cmd = con.CreateCommand();
        SqlCommand cmd1 = con.CreateCommand();
        con.Open();
        cmd.CommandText = " insert into tbl_cash_ledger_master values ('" + ddldealer.SelectedItem.Text + "','" + ddldealer.SelectedValue + "','','" + txtamount.Text.Trim() + "','" + date + "','" + txtchallanno.Text.Trim() + "','" + txtremarks.Text.Trim() + "')";

        cmd1.CommandText = " insert into tbl_challan_details_master values ('" + txtchallanno.Text.Trim() + "','" + date + "','" + ddldealer.SelectedItem + "','" + ddldealer.SelectedValue + "','','','','','','','','','','','" + txtamount.Text.Trim() + "','','" + Session["Username"].ToString() + "','','','WM')";
        cmd1.ExecuteNonQuery();

        cmd.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Created Sucessfully');window.location='issue_cash_Challan_without_material.aspx';", true);
    }
    protected void btnview_Click(object sender, EventArgs e)
    {
        bind();
    }
    public void bind()
    {
        cls.gridbind(GridView1, "Select * from tbl_cash_ledger_master order by dealer_name asc  ");
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lbldeleteid = (Label)row.FindControl("Label1");
        con.Open();
        SqlCommand cmd = new SqlCommand("delete FROM tbl_cash_ledger_master where id='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Deleted Sucessfully');", true);
        bind();
    }
}