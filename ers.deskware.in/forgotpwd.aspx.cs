using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class forgotpwd : System.Web.UI.Page
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
            string strQuery = "select * from user_master where (user_id=@user_id) and (email_id=@email_id) and status='Active'";
            SqlCommand cmd = new SqlCommand(strQuery, con);
            cmd.Parameters.AddWithValue("@user_id", txtuserid.Text.Trim());
            cmd.Parameters.AddWithValue("@email_id", txtemail.Text.Trim());
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                con.Close();
                login_type();

              
               
            }
            else
            {
                div1.Visible = false;
                div2.Visible = true;
                spn2.InnerText = "Invalid Details !..";

            }
        }
        catch (Exception er)
        {
            string test = er.Message.Replace("'", " ");
        }
    }
    string password = "";
    public void login_type()
    {
        string command = "";
        command = "select password from user_master where user_id='" + txtuserid.Text.Trim() + "' and email_id='" + txtemail.Text.Trim() + "' ";
        SqlDataAdapter adap = new SqlDataAdapter(command, con);
        DataSet ds = new DataSet();
        adap.Fill(ds);
        if (ds.Tables[0].Rows.Count != 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];
            password = dr["password"].ToString();
            div2.Visible = false;
            div1.Visible = true;
            spn1.InnerText = "Your Password is :"+password;

        }
    }
}