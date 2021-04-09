using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class company_master : System.Web.UI.Page
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
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        cmd = con.CreateCommand();
        con.Open();
        cmd.CommandText = " insert into tbl_company_master values ('" + txtname.Text.Trim() + "','" + txtmob.Text.Trim() + "','" + txtaddress.Text.Trim() + "','" + txtremarks.Text.Trim() + "')";
        cmd.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Created Sucessfully');window.location='company_master.aspx';", true);
    }
    protected void btnview_Click(object sender, EventArgs e)
    {
        bind();
    }
    public void bind()
    {
        cls.gridbind(GridView1, "Select * from tbl_company_master order by name asc  ");
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lbldeleteid = (Label)row.FindControl("Label1");
        con.Open();
        SqlCommand cmd = new SqlCommand("delete FROM tbl_company_master where id='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Deleted Sucessfully');", true);
        bind();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        bind();
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        bind();
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        bind();
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        TextBox txtcompname = (TextBox)row.FindControl("TextBox1");
        TextBox txtmob = (TextBox)row.FindControl("TextBox2");
        TextBox txtadress = (TextBox)row.FindControl("TextBox3");
        TextBox txtremarks = (TextBox)row.FindControl("TextBox4");
        GridView1.EditIndex = -1;
        con.Open();
        SqlCommand cmd = new SqlCommand("update tbl_company_master set name='" + txtcompname.Text.Trim() + "' ,mob_no='" + txtmob.Text.Trim() + "',address='" + txtadress.Text.Trim() + "',remarks='" + txtremarks.Text.Trim() + "' where id='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Updated Sucessfully');", true);
        bind();
    }
}