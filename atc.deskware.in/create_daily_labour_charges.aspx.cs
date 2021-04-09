using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class create_daily_labour_charges : System.Web.UI.Page
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
            if (ddlsize.SelectedValue == "12x24")
            {
                ddlunit.SelectedValue = "PCS";
            }
            else
            {
                ddlunit.SelectedValue = "Box";
            }
        }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        cmd = con.CreateCommand();
        con.Open();
        cmd.CommandText = " insert into tbl_daily_labour_charges values ('" + ddlsize.SelectedValue + "','" + ddlunit.SelectedValue + "','" + txtrate.Text.Trim() + "')";
        cmd.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Created Sucessfully');window.location='create_daily_labour_charges.aspx';", true);
    }

    protected void btnview_Click(object sender, EventArgs e)
    {
        bind();
    }
    public void bind()
    {

        cls.gridbind(GridView1, "Select * from tbl_daily_labour_charges order by size asc  ");
    }
    protected void ddlsize_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlsize.SelectedValue == "12x24")
        {
            ddlunit.SelectedValue = "PCS";
        }
        else
        {
            ddlunit.SelectedValue = "Box";
        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lbldeleteid = (Label)row.FindControl("Label1");
        con.Open();
        SqlCommand cmd = new SqlCommand("delete FROM tbl_daily_labour_charges where id='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Deleted Sucessfully');", true);
        bind();
    }
}