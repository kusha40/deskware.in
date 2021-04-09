using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class add_complaint : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ConnectionString);
    SqlCommand cmd;
    Class1 cls = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] == null && Session["type"] == null)
        {
            Response.Redirect("~/login.aspx");
        }
        else
        {
            if (!IsPostBack)
            {
                cls.bind_ddl(DropDownList1, "SELECT distinct id,user_id,name FROM user_master  where   type!='Administrator' and status='Active' order by name asc", "name", "user_id");
                DropDownList1.Items.Insert(0, "Select");
            }
        }
    }
    protected void btnview_Click(object sender, EventArgs e)
    {
        cls.gridbind(GridView1, "select top 250 * from tbl_complaint where created_by='" + Session["Username"].ToString() + "'  order by date desc");
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        cmd = conn.CreateCommand();
        conn.Open();
        cmd.CommandText = "insert into tbl_complaint values('" + txtreport.Text.Trim() + "',getdate(),'" + Session["Username"].ToString() + "','" + DropDownList1.SelectedValue +"','')";
        cmd.ExecuteNonQuery();
        conn.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Submitted Sucessfully');window.location='add_complaint.aspx';", true);
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lbldeleteid = (Label)row.FindControl("Label1");
        Label Label2 = (Label)row.FindControl("Label2");
        if (Label2.Text != "Action Taken")
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("delete FROM tbl_complaint where id='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Deleted Sucessfully');", true);
            cls.gridbind(GridView1, "select top 250 * from tbl_complaint where created_by='" + Session["Username"].ToString() + "'  order by date desc");
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Access Denied');", true);
        }
        
    }
}