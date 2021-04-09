using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class create_account : System.Web.UI.Page
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
            cls.bind_ddl(ddlemailid, "select distinct user_id from user_master order by user_id asc", "user_id", "user_id");
            ddlemailid.Items.Insert(0, "-select-");
        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label user_id = (Label)row.FindControl("Label6");
        con.Open();
        SqlCommand cmd = new SqlCommand("delete FROM user_master where user_id='" + user_id.Text.Trim() + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();

        div2.Visible = false;
        div1.Visible = true;
        spn1.InnerText = "User Details Deleted Sucessfully";

        cls.gridbind(GridView1, "select * from user_master order by name asc");

    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        DropDownList DdlCountry = GridView1.Rows[GridView1.EditIndex].FindControl("DdlCountry") as DropDownList;
        cls.gridbind(GridView1, "select * from user_master order by name asc");

    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        cls.gridbind(GridView1, "select * from user_master order by name asc");
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
        SqlCommand cmd = new SqlCommand("update user_master set name='" + name.Text.Trim() + "',contact_no='" + contact_no.Text.Trim() + "',email_id='" + email_id.Text.Trim() + "',password='" + password.Text.Trim() + "',type='" + type.Text.Trim() + "',designation='" + operation.Text + "',status='" + status.Text.Trim() + "' where user_id='" + user_id.Text.Trim() + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();

        div2.Visible = false;
        div1.Visible = true;
        spn1.InnerText = "User Details Updated Sucessfully";
        cls.gridbind(GridView1, "select * from user_master order by name asc");
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        cls.gridbind(GridView1, "select * from user_master order by name asc");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        div1.Visible = div2.Visible = false;
        txtemailid.Text = txtname.Text = txtpwd.Text = txtmob.Text = txtdesignation.Text = "";
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            cmd = con.CreateCommand();
            con.Open();
            cmd.CommandText = "user_mstr";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter(@"user_id", txtuid.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter(@"name", txtname.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter(@"contact_no", txtmob.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter(@"email_id", txtemailid.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter(@"password", txtpwd.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter(@"type", ddltype.SelectedValue));
            cmd.Parameters.Add(new SqlParameter(@"status", "Active"));
            //cmd.Parameters.Add(new SqlParameter(@"created_by", Session["Username"].ToString()));
            cmd.Parameters.Add(new SqlParameter(@"created_by",""));
            cmd.Parameters.Add(new SqlParameter(@"designation", txtdesignation.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter(@"location", ""));

            cmd.Parameters.Add(new SqlParameter(@"rm", ""));
            cmd.Parameters.Add(new SqlParameter(@"rm_name", ""));
            cmd.Parameters.Add(new SqlParameter(@"action", "I"));
            SqlParameter parm = new SqlParameter("@return_value", SqlDbType.NVarChar);
            parm.Direction = ParameterDirection.ReturnValue;
            cmd.Parameters.Add(parm);
            cmd.ExecuteNonQuery();
            con.Close();
            string actn = Convert.ToString(parm.Value);
            if (actn == "1")
            {
                div2.Visible = false;
                div1.Visible = true;
                spn1.InnerText = "User Details Updated Sucessfully";
                txtemailid.Text = txtname.Text = txtpwd.Text = txtmob.Text = txtdesignation.Text = "";
            }
            else if (actn == "2")
            {
                div1.Visible = false;
                div2.Visible = true;
                spn2.InnerText = "User ID  Already Exists , please enter another User ID";
            }
        }
        catch (Exception er)
        {
        }
     
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        cls.gridbind(GridView1, "select * from user_master order by name asc");
    }
    protected void ddlemailid_SelectedIndexChanged(object sender, EventArgs e)
    {
        cls.gridbind(GridView1, "select * from user_master where  user_id='"+ddlemailid.SelectedValue+"' order by name asc");
    }
}