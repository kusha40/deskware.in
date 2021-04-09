using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class create_team : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ConnectionString);
    SqlCommand cmd;
    Class1 cls = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            cls.bind_ddl(ddlSelectUser, "SELECT distinct id,user_id,name FROM user_master  where   type!='Administrator'  and status='Active' order by name asc", "name", "user_id");
            ddlSelectUser.Items.Insert(0, "Select");
            cls.bind_ddl(DropDownList1, "SELECT distinct id,user_id,name FROM user_master  where   type!='Administrator' and status='Active' order by name asc", "name", "user_id");
            DropDownList1.Items.Insert(0, "Select");
            _bindcheckBox();
        }

    }
    protected void ddloperation_SelectedIndexChanged(object sender, EventArgs e)
    {
        cls.bind_ddl(ddlSelectUser, "SELECT distinct id,user_id,name FROM user_master  where   type!='Administrator' and status='Active' order by name asc", "name", "user_id");
        _bindcheckBox();
    }
    private void _bindcheckBox()
    {
        try
        {
            if (conn.State == ConnectionState.Closed)
            {
                conn.Open();
            }
            string query = "SELECT distinct id,user_id,name FROM user_master where   type!='Administrator' and status='Active' order by name asc";
            SqlDataAdapter da = new SqlDataAdapter(query, conn);
            DataSet ds = new DataSet();
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                checkSelectMenu.DataSource = ds;
                checkSelectMenu.DataTextField = "name";
                checkSelectMenu.DataValueField = "user_id";
                checkSelectMenu.DataBind();
            }
            else
            {
                Response.Write("No Results found");
            }

        }
        catch (Exception ex)
        {
            Response.Write("<br>" + ex);
        }
        finally
        {
            conn.Close();
        }
    }

    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        int count = 0;
        foreach (ListItem chk in checkSelectMenu.Items)
        {
            if (chk.Selected == true)
            {
                string c2 = chk.Value;
                count++;
                cmd = conn.CreateCommand();
                conn.Open();
                cmd.CommandText = "insert into tbl_team values('" + ddlSelectUser.SelectedValue + "','" + c2 + "')";
                cmd.ExecuteNonQuery();
                conn.Close();
            }
        }
        if (count > 0)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Created Sucessfully');window.location='create_team.aspx';", true);
        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lbldeleteid = (Label)row.FindControl("Label1");
        conn.Open();
        SqlCommand cmd = new SqlCommand("delete FROM tbl_team where id='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", conn);
        cmd.ExecuteNonQuery();
        conn.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Deleted Sucessfully');", true);
        cls.gridbind(GridView1, "select * from tbl_team order by aid asc");

    }
    protected void btnview_Click(object sender, EventArgs e)
    {
        cls.gridbind(GridView1, "select * from tbl_team order by aid asc");
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label a1 = e.Row.FindControl("Label2") as Label;
            Label u1 = e.Row.FindControl("Label21") as Label;

            Label aname = e.Row.FindControl("Label15") as Label;
            Label uname = e.Row.FindControl("Label16") as Label;

            SqlDataAdapter adap11 = new SqlDataAdapter("select top 1  name from user_master where user_id='" + a1.Text + "'  order by id asc  ", conn);
            DataSet ds11 = new DataSet();
            adap11.Fill(ds11);
            if (ds11.Tables[0].Rows.Count != 0)
            {
                DataRow dr11 = ds11.Tables[0].Rows[0];
                aname.Text = dr11["name"].ToString();
            }
            else
            {
                aname.Text = "";
            }

            SqlDataAdapter adap111 = new SqlDataAdapter("select top 1  name from user_master where user_id='" + u1.Text + "'  order by id asc  ", conn);
            DataSet ds111 = new DataSet();
            adap111.Fill(ds111);
            if (ds111.Tables[0].Rows.Count != 0)
            {
                DataRow dr111 = ds111.Tables[0].Rows[0];
                uname.Text = dr111["name"].ToString();
            }
            else
            {
                uname.Text = "";
            }
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        cls.gridbind(GridView1, "select * from tbl_team where aid='"+DropDownList1.SelectedValue+"'  order by aid asc");
    }
}