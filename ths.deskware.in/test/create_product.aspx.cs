using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class create_product : System.Web.UI.Page
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
            cls.bind_ddl(ddlcompname, "Select name from tbl_company_master order by name asc", "name", "name");
            cls.bind_ddl(ddlsize, "Select size from tbl_size_master order by size asc", "size", "size");

        }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        cmd = con.CreateCommand();
        con.Open();
        cmd.CommandText = " insert into tbl_product_master values ('" + ddlsize.SelectedValue + "','" + ddlcompname.SelectedValue + "','" + ddlprotype.SelectedValue + "','" + txtpcode.Text.Trim() + "','" + ddlunit.SelectedValue + "','"+txtstocklevel.Text.Trim()+"')";
        cmd.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Created Sucessfully');window.location='create_product.aspx';", true);
    }
     
    protected void btnview_Click(object sender, EventArgs e)
    {
        bind();
    }
    public void bind()
    {

        cls.gridbind(GridView1, "Select * from tbl_product_master order by c_name asc  ");
    }
    
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lbldeleteid = (Label)row.FindControl("Label1");
        con.Open();
        SqlCommand cmd = new SqlCommand("delete FROM tbl_product_master where id='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Deleted Sucessfully');", true);
        bind();
    }
}