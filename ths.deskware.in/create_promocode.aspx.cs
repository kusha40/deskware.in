using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class create_promocode : System.Web.UI.Page
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
        cmd = con.CreateCommand();
        con.Open();
        cmd.CommandText = " select count(promocode) from  tbl_arkaya_promocode where promocode='" + TextBox1.Text.Trim() + "'";
        int a = int.Parse(cmd.ExecuteScalar().ToString());
        if (a == 0)
        {
            SqlCommand cmd1 = con.CreateCommand();
            cmd1.CommandText = " insert into tbl_arkaya_promocode values('" + TextBox1.Text.Trim() + "','" + TextBox2.Text.Trim() + "')";
            cmd1.ExecuteNonQuery();
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Created Sucessfully');window.location='create_promocode.aspx';", true);
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert(' Already Exists');window.location='create_promocode.aspx';", true);
        }
        con.Close();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        con.Open();
        SqlCommand cmd = new SqlCommand("delete FROM tbl_arkaya_promocode where id='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Deleted Sucessfully');", true);
        cls.gridbind(GridView1, "select * from tbl_arkaya_promocode order by promocode asc");

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        cls.gridbind(GridView1, "select * from tbl_arkaya_promocode order by promocode asc");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Reset Sucessfully');window.location='create_promocode.aspx';", true);
    }
}