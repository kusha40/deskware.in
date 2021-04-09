using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class create_session : System.Web.UI.Page
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
    protected void btnsave_Click(object sender, EventArgs e)
    {
        string command = "";
        command = "select * from tble_session_master where session='" + txtsession.Text.Trim() + "' ";
        SqlDataAdapter adap = new SqlDataAdapter(command, con);
        DataSet ds = new DataSet();
        adap.Fill(ds);
        if (ds.Tables[0].Rows.Count != 0)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Session Already Exists');", true);
        }
        else
        {
            cmd = con.CreateCommand();
            con.Open();
            cmd.CommandText = "insert into tble_session_master values('" + txtsession.Text.Trim() + "')";
            cmd.ExecuteNonQuery();
            con.Close();
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Created Sucessfully');", true);
        }
    }
    protected void btnviewall_Click(object sender, EventArgs e)
    {
        cls.gridbind(GridView1, "select * from tble_session_master order by id desc");
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lbldeleteid = (Label)row.FindControl("lblid");
        con.Open();
        SqlCommand cmd = new SqlCommand("delete FROM tble_session_master where id='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Deleted Sucessfully');", true);
        cls.gridbind(GridView1, "select * from tble_session_master order by id desc");
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lblID = (Label)row.FindControl("lblid");
        TextBox txtclassname = (TextBox)row.FindControl("txtclassname");
        GridView1.EditIndex = -1;
        con.Open();
        SqlCommand cmd = new SqlCommand("update tble_session_master set session='" + txtclassname.Text.Trim() + "' where id='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Updated Sucessfully');", true);
        cls.gridbind(GridView1, "select * from tble_session_master order by id desc");
    }
}