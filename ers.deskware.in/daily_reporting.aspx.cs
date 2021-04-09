using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class daily_reporting : System.Web.UI.Page
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
    }
    protected void btnview_Click(object sender, EventArgs e)
    {
        cls.gridbind(GridView1, "select top 150 * from tbl_daily_reporting where created_by='" + Session["Username"].ToString() + "' and CAST(date AS DATE)='" + System.DateTime.Now.ToString("MM/dd/yyyy") + "' order by date desc");
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        cmd = conn.CreateCommand();
        conn.Open();
        cmd.CommandText = "insert into tbl_daily_reporting values('" + txtreport.Text.Trim() + "',getdate(),'" + Session["Username"].ToString() + "')";
        cmd.ExecuteNonQuery();
        conn.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Submitted Sucessfully');window.location='daily_reporting.aspx';", true);
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lbldeleteid = (Label)row.FindControl("Label1");
        conn.Open();
        SqlCommand cmd = new SqlCommand("delete FROM tbl_daily_reporting where id='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", conn);
        cmd.ExecuteNonQuery();
        conn.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Deleted Sucessfully');", true);
        cls.gridbind(GridView1, "select top 150 * from tbl_daily_reporting where created_by='" + Session["Username"].ToString() + "' and CAST(date AS DATE)='" + System.DateTime.Now.ToString("MM/dd/yyyy") + "' order by date desc");

    }
}