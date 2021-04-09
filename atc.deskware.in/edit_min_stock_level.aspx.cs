using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class edit_min_stock_level : System.Web.UI.Page

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
            cls.bind_ddl(ddlcompname, "Select distinct c_name from tbl_product_master order by c_name asc", "c_name", "c_name");
            bind();
        }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        int count = 0;
        int j;
        for (j = 0; j < GridView1.Rows.Count; j++)
        {
            CheckBox cb = (CheckBox)GridView1.Rows[j].FindControl("chkAll0");
            Label id = (Label)GridView1.Rows[j].FindControl("Label1");
            TextBox stock = (TextBox)GridView1.Rows[j].FindControl("TextBox1");

            if (cb.Checked == true)
            {
                count++;

                cmd = con.CreateCommand();
                con.Open();
                cmd.CommandText = " update tbl_product_master set min_stock='"+stock.Text.Trim()+"' where id='"+id.Text+"'";
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

    protected void ChkAllRows(object sender, EventArgs e)
    {

        CheckBox chkall = (CheckBox)GridView1.HeaderRow.FindControl("chkAll");
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            CheckBox chkrow = (CheckBox)GridView1.Rows[i].FindControl("chkAll0");
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
    public void bind()
    {
        cls.gridbind(GridView1, " Select * from tbl_product_master where c_name='" + ddlcompname.SelectedValue + "' order by size asc");
    }
    protected void ddlcompname_SelectedIndexChanged(object sender, EventArgs e)
    {
        bind();
    }
}