using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class terms_condition : System.Web.UI.Page
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
            cls.bind_ddl(DropDownList1, " select distinct pname from tbl_arkaya_product_master order by pname asc", "pname", "pname");
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        cmd = con.CreateCommand();
        con.Open();
        cmd.CommandText = " select count(pname) from  tbl_arkaya_terms_condition where pname='" + DropDownList1.SelectedValue + "'";
        int a = int.Parse(cmd.ExecuteScalar().ToString());
        if (a == 0)
        {
            SqlCommand cmd1 = con.CreateCommand();
            cmd1.CommandText = " insert into tbl_arkaya_terms_condition values('" + DropDownList1.SelectedValue + "','" + CKEditorControl1.Text.Trim() + "','"+RadioButtonList1.SelectedValue+"')";
            cmd1.ExecuteNonQuery();
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Created Sucessfully');window.location='terms_condition.aspx';", true);
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert(' Already Exists');window.location='terms_condition.aspx';", true);
        }
        con.Close();
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        con.Open();
        SqlCommand cmd = new SqlCommand("delete FROM tbl_arkaya_terms_condition where id='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Deleted Sucessfully');", true);
        cls.gridbind(GridView1, "select * from tbl_arkaya_terms_condition order by pname asc");

    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        cls.gridbind(GridView1, "select * from tbl_arkaya_terms_condition order by pname asc");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Reset Sucessfully');window.location='terms_condition.aspx';", true);
    }
}