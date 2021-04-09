using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class register : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
    SqlCommand cmd;
    Class1 cls = new Class1();
    string customer_id = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] == null && Session["type"] == null)
        {
            Response.Redirect("~/login.aspx");
        }
        if (Session["Username"] == null && Session["type"] == null)
        {
            Response.Redirect("~/login.aspx");
        }

    }
    protected void btnRegistration_Click(object sender, EventArgs e)
    {
        try
        {
            cmd = con.CreateCommand();
            con.Open();
            cmd.CommandText = "user_mstr";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter(@"user_id", txtuserid.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter(@"name", txtname.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter(@"contact_no", txtcontact.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter(@"email_id", txtemail.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter(@"password", txtpassword.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter(@"type", ddltype.SelectedValue));
            cmd.Parameters.Add(new SqlParameter(@"status", "Active"));
            cmd.Parameters.Add(new SqlParameter(@"created_by", Session["Username"].ToString()));
            cmd.Parameters.Add(new SqlParameter(@"operation", ddltype.SelectedValue));
            cmd.Parameters.Add(new SqlParameter(@"action", "I"));
            SqlParameter parm = new SqlParameter("@return_value", SqlDbType.NVarChar);
            parm.Direction = ParameterDirection.ReturnValue;
            cmd.Parameters.Add(parm);
            cmd.ExecuteNonQuery();
            con.Close();
            string actn = Convert.ToString(parm.Value);
            if (actn == "1")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('User Created Sucessfully');window.location='register.aspx';", true);
            }
            else if (actn == "2")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('User ID  Already Exists');window.location='register.aspx';", true);
            }
        }
        catch (Exception er)
        {
        }
    }
    protected void btnview_Click(object sender, EventArgs e)
    {
        cls.gridbind(GridView1, "select * from user_master");
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label user_id = (Label)row.FindControl("Label6");
        con.Open();
        SqlCommand cmd = new SqlCommand("delete FROM user_master where user_id='" + user_id.Text.Trim() + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('User Details Deleted Sucessfully');", true);
        cls.gridbind(GridView1, "select * from user_master");

    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        DropDownList DdlCountry = GridView1.Rows[GridView1.EditIndex].FindControl("DdlCountry") as DropDownList;
        cls.gridbind(GridView1, "select * from user_master");
     
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        cls.gridbind(GridView1, "select * from user_master");
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label user_id = (Label)row.FindControl("Label6");
        TextBox name = (TextBox)row.FindControl("TextBox1");
        TextBox contact_no = (TextBox)row.FindControl("TextBox2");
        TextBox email_id = (TextBox)row.FindControl("TextBox3");
        TextBox password = (TextBox)row.FindControl("TextBox4");
        TextBox type = (TextBox)row.FindControl("TextBox5");
        TextBox status = (TextBox)row.FindControl("TextBox7");
        TextBox operation = (TextBox)row.FindControl("TextBox51");
        GridView1.EditIndex = -1;
        con.Open();
        SqlCommand cmd = new SqlCommand("update user_master set name='" + name.Text.Trim() + "',contact_no='" + contact_no.Text.Trim() + "',email_id='" + email_id.Text.Trim() + "',password='" + password.Text.Trim() + "',type='" + type.Text.Trim() + "',operation='" + operation .Text+ "',status='" + status.Text.Trim() + "' where user_id='" + user_id.Text.Trim() + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('User Details Updated Sucessfully');", true);
        cls.gridbind(GridView1, "select * from user_master");
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        cls.gridbind(GridView1, "select * from user_master");
    }
}