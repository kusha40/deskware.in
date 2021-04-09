using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class routine_job_task : System.Web.UI.Page
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
        if (!IsPostBack)
        {
            cls.gridbind(GridView1, "select  * from tbl_job_type where type='" + Session["Username"] .ToString()+ "'   order by type asc");
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
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        int count = 0;
        int j;
        for (j = 0; j < GridView1.Rows.Count; j++)
        {
            CheckBox cb = (CheckBox)GridView1.Rows[j].FindControl("chkAll0");
            Label username = (Label)GridView1.Rows[j].FindControl("Label1");
            Label task = (Label)GridView1.Rows[j].FindControl("Label2");
            TextBox TextBox1 = (TextBox)GridView1.Rows[j].FindControl("TextBox1") as TextBox;

            if (cb.Checked == true)
            {
                               count++;
                cmd = conn.CreateCommand();
                conn.Open();
                cmd.CommandText = "insert into tbl_routine_job values('" + username.Text + "','" + task.Text.Trim() + "','" + TextBox1.Text.Trim() + "',getdate(),'')";
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }
        if (count > 0)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Updated Sucessfully');", true);
            cls.gridbind(GridView1, "select  * from tbl_job_type where type='" + Session["Username"].ToString() + "'   order by type asc");
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Check Item in the List');", true);
        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            TextBox TextBox1 = e.Row.FindControl("TextBox1") as TextBox;
            //Label type = e.Row.FindControl("Label1") as Label;
            Label task = e.Row.FindControl("Label2") as Label;

            SqlDataAdapter adap = new SqlDataAdapter("select * from tbl_routine_job where user_name='" + Session["Username"].ToString() + "'  and task='" + task.Text + "' and month(date)='"+System.DateTime.Now.Month.ToString()+"' ", conn);
            DataSet ds = new DataSet();
            adap.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dr = ds.Tables[0].Rows[0];
                TextBox1.Text = dr["remarks"].ToString();
            }
        }
    }
}