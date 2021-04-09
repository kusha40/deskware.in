using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class create_school : System.Web.UI.Page
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
        try
        {
            cmd = con.CreateCommand();
            con.Open();
            cmd.CommandText = "SP_school_mstr";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter(@"name", txtschoolname.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter(@"address", txtaddress.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter(@"city", txtcity.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter(@"state", txtstate.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter(@"country", txtcountry.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter(@"pincode", txtpincode.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter(@"contact_no", txtcontact.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter(@"email_id", txtemail.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter(@"remarks", txtremarks.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter(@"username",  txtschoolname.Text.Substring(0, 3)+cls.rand("")));
            cmd.Parameters.Add(new SqlParameter(@"password", cls.rand("")));
            cmd.Parameters.Add(new SqlParameter(@"status", "1"));
            cmd.Parameters.Add(new SqlParameter(@"created_by", Session["Username"].ToString()));
            cmd.Parameters.Add(new SqlParameter(@"action", "I"));
            SqlParameter parm = new SqlParameter("@return_value", SqlDbType.NVarChar);
            parm.Direction = ParameterDirection.ReturnValue;
            cmd.Parameters.Add(parm);
            cmd.ExecuteNonQuery();
            con.Close();
            string actn = Convert.ToString(parm.Value);
            if (actn == "1")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Created Sucessfully');window.location='create_school.aspx';", true);
                create_folder();
            }
            else if (actn == "2")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Deatils Already Exists');", true);
            }
        }
        catch (Exception ex)
        {
        }
    }

    public void create_folder()
    {
        string directoryPath1 = Request.PhysicalApplicationPath + "PDF"+"\\" + "" + txtschoolname.Text.Trim() + "";
        if (!Directory.Exists(directoryPath1))
        {
            Directory.CreateDirectory(directoryPath1);
            //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Directory Created');", true);
        }
        else
        {
            //ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Directory already exists.');", true);
        }
    }
    protected void btnviewall_Click(object sender, EventArgs e)
    {
        cls.gridbind(GridView1, "Select * from tbl_school_master order by name asc");

    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        cls.gridbind(GridView1, "Select * from tbl_school_master order by name asc");
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
      //  cls.gridbind(GridView1, "Select * from tbl_school_master order by name asc");
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lbldeleteid = (Label)row.FindControl("lblid");
        con.Open();
        SqlCommand cmd = new SqlCommand("delete FROM tbl_school_master where id='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Deleted Sucessfully');", true);
        cls.gridbind(GridView1, "Select * from tbl_school_master order by name asc");
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
     //   cls.gridbind(GridView1, "Select * from tbl_school_master order by name asc");
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lblID = (Label)row.FindControl("lblid");
        TextBox txtschoolname = (TextBox)row.FindControl("txtschoolname");
        TextBox txtaddress = (TextBox)row.FindControl("txtaddress");
        TextBox txtcity = (TextBox)row.FindControl("txtcity");
        TextBox txtstate = (TextBox)row.FindControl("txtstate");
        TextBox txtcountry = (TextBox)row.FindControl("txtcountry");
        TextBox txtpincode = (TextBox)row.FindControl("txtpincode");
        TextBox txtcontact = (TextBox)row.FindControl("txtcontact");
        TextBox txtemail = (TextBox)row.FindControl("txtemail");
        TextBox txtremarks = (TextBox)row.FindControl("txtremarks");
        TextBox txtusername = (TextBox)row.FindControl("txtusername");
        TextBox txtpassword = (TextBox)row.FindControl("txtpassword");
        TextBox txtstatus = (TextBox)row.FindControl("txtstatus");
        GridView1.EditIndex = -1;
        con.Open();
        SqlCommand cmd = new SqlCommand("update tbl_school_master set name='" + txtschoolname.Text.Trim() + "',address='" + txtaddress.Text.Trim() + "',city='" + txtcity.Text.Trim() + "',state='" + txtstate.Text.Trim() + "',country='" + txtcountry.Text.Trim() + "',pincode='" + txtpincode.Text.Trim() + "',contact_no='" + txtcontact.Text.Trim() + "',email_id='" + txtemail.Text.Trim() + "',remarks='" + txtremarks.Text.Trim() + "',username='" + txtusername.Text.Trim() + "',password='" + txtpassword.Text.Trim() + "',status='" + txtstatus.Text.Trim() + "' where id='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Updated Sucessfully');", true);
        cls.gridbind(GridView1, "Select * from tbl_school_master order by name asc");
    }
    protected void btnsearch_Click(object sender, EventArgs e)
    {
        try
        {
            GridView1.AllowPaging = false;
            string[] arr_search = new string[2];
            arr_search = txtMenuTitle.Text.Split('~');
            SqlDataAdapter adap = new SqlDataAdapter("select * from tbl_school_master where id='" + arr_search[0].Trim() + "'", con);
            DataSet ds = new DataSet();
            adap.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                cls.gridbind(GridView1, "select * from tbl_school_master where  id='" + arr_search[0].Trim() + "' order by name asc");
                }
            }
        
        catch (Exception er)
        {
        }
    }
    [WebMethod]

    public static List<string> GetAutoCompleteData1(string username, string flag)
    {
        string st = flag;
        string commnd = "";
        List<string> result = new List<string>();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
        commnd = "select (convert(nvarchar(max),id)+'~'+name) as Test from [tbl_school_master] where  (name) like '%'+@SearchText+'%'  ";
        using (SqlCommand cmd = new SqlCommand(commnd, con))
        {
            con.Open();
            cmd.Parameters.AddWithValue("@SearchText", username);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                result.Add(dr["Test"].ToString());
            }
            if (result.Count > 0)
            {
                return result;
            }
            else
            {
                result.Add("No Record Found !........");
                return result;
            }
        }

    }
}