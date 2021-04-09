using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class create_dealer : System.Web.UI.Page
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
            cls.bind_ddl(ddldealer, "Select distinct name,id from tbl_dealer_Master order by name asc", "name", "id");
        }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        cmd = con.CreateCommand();
        con.Open();
        cmd.CommandText = " insert into tbl_dealer_Master values ('" + txtname.Text.Trim() + "','" + txtmob.Text.Trim() + "','" + txtaddress.Text.Trim() + "','" + ddlweek.SelectedValue + "')";
        cmd.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Created Sucessfully');window.location='create_dealer.aspx';", true);
    }
    protected void btnview_Click(object sender, EventArgs e)
    {
        bind();
    }
    public void bind()
    {
        cls.gridbind(GridView1, "Select * from tbl_dealer_Master order by name asc  ");
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lbldeleteid = (Label)row.FindControl("Label1");
        con.Open();
        SqlCommand cmd = new SqlCommand("delete FROM tbl_dealer_Master where id='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
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
        DropDownList ddlwek = (DropDownList)row.FindControl("ddlweek1");
        GridView1.EditIndex = -1;
        con.Open();
        SqlCommand cmd = new SqlCommand("update tbl_dealer_Master set name='" + txtcompname.Text.Trim() + "' ,mob_no='" + txtmob.Text.Trim() + "',area='" + txtadress.Text.Trim() + "',Week='" + ddlwek.SelectedValue + "' where id='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Updated Sucessfully');", true);
        bind();
    }
    protected void ddldealer_SelectedIndexChanged(object sender, EventArgs e)
    {
        cls.gridbind(GridView1, "Select * from tbl_dealer_Master where id='"+ddldealer.SelectedValue+"' order by name asc  ");
    }
}