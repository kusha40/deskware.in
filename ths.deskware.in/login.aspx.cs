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

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
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
    string login_tp, designation,pic = "";
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
            pic = dr["pic"].ToString();
        }
    }
}