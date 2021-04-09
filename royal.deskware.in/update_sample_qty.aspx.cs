using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class update_sample_qty : System.Web.UI.Page
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
        }

    }
    protected void btnview_Click(object sender, EventArgs e)
    {
        cls.gridbind(GridView1, "select * from tbl_product_master where  size='" + ddlcompname.SelectedValue + "' order by c_name,p_code asc");
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
    protected void Button1_Click(object sender, EventArgs e)
    {
        int count = 0;
        int j;
        for (j = 0; j < GridView1.Rows.Count; j++)
        {
            CheckBox cb = (CheckBox)GridView1.Rows[j].FindControl("chkAll0");

            Label size = (Label)GridView1.Rows[j].FindControl("Label1");
            Label cname = (Label)GridView1.Rows[j].FindControl("Label2");
            Label pcode = (Label)GridView1.Rows[j].FindControl("Label3");

            Label pid = (Label)GridView1.Rows[j].FindControl("Label11");

            TextBox TextBox1 = (TextBox)GridView1.Rows[j].FindControl("TextBox1");
            if (cb.Checked == true)
            {
                count++;
                cmd = con.CreateCommand();
                con.Open();
                cmd.CommandText = "update tbl_product_master set sqty='" + TextBox1.Text.Trim() + "' where id='"+pid.Text+"' ";
                cmd.ExecuteNonQuery();
                con.Close();

            }
        }
        if (count > 0)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Updated Sucessfully');window.location='update_sample_qty.aspx';", true);
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Check Item in the List');", true);
        }
    }
}