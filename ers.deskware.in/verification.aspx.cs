using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class verification : System.Web.UI.Page
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
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lbldeleteid = (Label)row.FindControl("Label1");
            conn.Open();
            SqlCommand cmd = new SqlCommand("delete FROM tbl_verify_daily_report where id='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Deleted Sucessfully');", true);
            cls.gridbind(GridView1, "select top 250 * from tbl_verify_daily_report   order by date desc");
    }
    protected void btnview_Click(object sender, EventArgs e)
    {
        cls.gridbind(GridView1, "select top 250 * from tbl_verify_daily_report   order by date desc");
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        cmd = conn.CreateCommand();
        conn.Open();
        cmd.CommandText = "insert into tbl_verify_daily_report values('" + DropDownList1.SelectedValue + "','" + RadioButtonList1.SelectedValue + "','" + txtreport.Text.Trim() + "','" + DateTime.ParseExact(TextBox1.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "','" + Session["Username"].ToString() + "')";
        cmd.ExecuteNonQuery();
        conn.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Submitted Sucessfully');window.location='verification.aspx';", true);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("user_daily_report.aspx?id="+DropDownList1.SelectedValue+"");
    }
}