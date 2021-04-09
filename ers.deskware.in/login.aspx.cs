using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
    SqlCommand cmd;
    Class1 cls = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.Cookies["UserName"] != null && Request.Cookies["Password"] != null)
        {
            txtuid.Text = Request.Cookies["UserName"].Value;
            txtpwd.Attributes["value"] = Request.Cookies["Password"].Value;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            if (chkRememberMe.Checked)
            {
                Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(30);
                Response.Cookies["Password"].Expires = DateTime.Now.AddDays(30);
            }
            else
            {
                Response.Cookies["UserName"].Expires = DateTime.Now.AddDays(-1);
                Response.Cookies["Password"].Expires = DateTime.Now.AddDays(-1);

            }
            Response.Cookies["UserName"].Value = txtuid.Text.Trim();
            Response.Cookies["Password"].Value = txtpwd.Text.Trim();


            login_type();
            string strQuery = "select * from user_master where (user_id=@user_id) and (password=@password) and type='" + login_tp + "' and status='Active'";
            SqlCommand cmd = new SqlCommand(strQuery, con);
            cmd.Parameters.AddWithValue("@user_id", txtuid.Text.Trim());
            cmd.Parameters.AddWithValue("@password", txtpwd.Text.Trim());
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                con.Close();
                Session["Username"] = txtuid.Text.Trim();
                Session["type"] = login_tp;
                Session["designation"] = designation;
                Session["name"] = name;
                Session["pic"] = pic;
             
                    Response.Redirect("Dashboard.aspx", false);
            
            }
            else
            {
                div2.Visible = true;
                spn2.InnerText = "Authentication Failed !..";
                
            }
        }
        catch (Exception er)
        {
            string test = er.Message.Replace("'", " ");
        }
        
    }
    string login_tp, designation,pic,name = "";
    public void login_type()
    {
        string command = "";
        command = "select * from user_master where user_id='" + txtuid.Text.Trim() + "' ";
        SqlDataAdapter adap = new SqlDataAdapter(command, con);
        DataSet ds = new DataSet();
        adap.Fill(ds);
        if (ds.Tables[0].Rows.Count != 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];
            login_tp = dr["type"].ToString();
            designation = dr["designation"].ToString();
            name = dr["name"].ToString();
            pic = dr["pic"].ToString();
        }
    }

    public void insert_login()
    {
        Session["session_id"] = System.Guid.NewGuid().ToString();
        cmd = con.CreateCommand();
        con.Open();
        cmd.CommandText = "login_history_mstr";
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Parameters.Add(new SqlParameter(@"user_id", txtuid.Text.Trim()));
        cmd.Parameters.Add(new SqlParameter(@"name", name));
        cmd.Parameters.Add(new SqlParameter(@"session_id", Session["session_id"].ToString()));
        cmd.Parameters.Add(new SqlParameter(@"action", "I"));
        cmd.ExecuteNonQuery();
        con.Close();
    }
}