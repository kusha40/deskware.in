using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class purchase_price_master : System.Web.UI.Page
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
            //cls.bind_ddl(ddlcompname, "Select name from tbl_company_master order by name asc", "name", "name");
            //cls.bind_ddl(ddlpcode, "select p_code from tbl_product_master", "p_code", "p_code");
            //if (ddlsize.SelectedValue == "12x24")
            //{
            //    ddlunit.SelectedValue = "PCS";
            //}
            //else
            //{
            //    ddlunit.SelectedValue = "Box";
            //}
            //cls.bind_ddl(ddlcompname, "Select distinct c_name from tbl_product_master where size='" + ddlsize.SelectedValue + "' order by c_name asc", "c_name", "c_name");
            //cls.bind_ddl(ddlpcode, "select distinct p_code from tbl_product_master where size='" + ddlsize.SelectedValue + "' and c_name='" + ddlcompname.SelectedValue + "'", "p_code", "p_code");

            cls.gridbind(GridView2, "select distinct size,c_name,unit,P_type from  tbl_product_master order by size asc");
        }
    }
    protected void ChkAllRows(object sender, EventArgs e)
    {

        CheckBox chkall = (CheckBox)GridView2.HeaderRow.FindControl("chkAll");
        for (int i = 0; i < GridView2.Rows.Count; i++)
        {
            CheckBox chkrow = (CheckBox)GridView2.Rows[i].FindControl("chkAll0");
            if (chkall.Checked == true)
            {
                chkrow.Checked = true;
            }
            else
            {
                chkrow.Checked = false;
            }
        }


    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
           int count = 0;
        int j;
        for (j = 0; j < GridView2.Rows.Count; j++)
        {
            CheckBox cb = (CheckBox)GridView2.Rows[j].FindControl("chkAll0");
            Label size = (Label)GridView2.Rows[j].FindControl("Label1");
            Label c_name = (Label)GridView2.Rows[j].FindControl("Label3");
            Label p_type = (Label)GridView2.Rows[j].FindControl("Label4");
            Label unit = (Label)GridView2.Rows[j].FindControl("Label6");
            TextBox price = (TextBox)GridView2.Rows[j].FindControl("TextBox4");

            if (cb.Checked == true)
            {
                count++;
        cmd = con.CreateCommand();
        con.Open();
        cmd.CommandText = " insert into tbl_purchase_price_master values ('" + size.Text + "','" + c_name.Text + "','" + p_type.Text + "','" + ddlpcode.SelectedValue + "','" + unit.Text + "','" + price.Text.Trim() + "')";
        cmd.ExecuteNonQuery();
        con.Close();
            }
        }
        if (count > 0)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Submitted Sucessfully');", true);
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Check Item in the List');", true);
        }
    }

    protected void btnview_Click(object sender, EventArgs e)
    {
        bind();
    }
    public void bind()
    {

        cls.gridbind(GridView1, "Select * from tbl_purchase_price_master order by c_name asc  ");
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
        cls.bind_ddl(ddlcompname, "Select distinct c_name from tbl_product_master where size='" + ddlsize.SelectedValue + "' order by c_name asc", "c_name", "c_name");
        cls.bind_ddl(ddlpcode, "select distinct p_code from tbl_product_master where size='" + ddlsize.SelectedValue + "' and c_name='" + ddlcompname.SelectedValue + "'", "p_code", "p_code");
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lbldeleteid = (Label)row.FindControl("Label1");
        con.Open();
        SqlCommand cmd = new SqlCommand("delete FROM tbl_purchase_price_master where id='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Deleted Sucessfully');", true);
        bind();
    }
    protected void ddlcompname_SelectedIndexChanged(object sender, EventArgs e)
    {
        cls.bind_ddl(ddlpcode, "select distinct p_code from tbl_product_master where size='" + ddlsize.SelectedValue + "' and c_name='" + ddlcompname.SelectedValue + "'", "p_code", "p_code");
    }
}