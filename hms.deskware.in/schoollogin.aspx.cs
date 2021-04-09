using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class schoollogin : System.Web.UI.Page
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
            string strQuery = "select * from tbl_school_master where (username=@username) and (password=@password)  and status='True'";
            SqlCommand cmd = new SqlCommand(strQuery, con);
            cmd.Parameters.AddWithValue("@username", txtusername.Text.Trim());
            cmd.Parameters.AddWithValue("@password", txtpassword.Text.Trim());
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                con.Close();
                Session["uid"] = txtusername.Text.Trim();
                Session["school_name"] = login_tp;
                Response.Redirect("school_dashboardaspx.aspx");
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Authentication Failed !..');", true);
            }
        }
        catch (Exception er)
        {
            string test = er.Message.Replace("'", " ");
        }

    }
    string login_tp = "";
    public void login_type()
    {
        string command = "";
        command = "select * from tbl_school_master where username='" + txtusername.Text.Trim() + "' ";
        SqlDataAdapter adap = new SqlDataAdapter(command, con);
        DataSet ds = new DataSet();
        adap.Fill(ds);
        if (ds.Tables[0].Rows.Count != 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];
            login_tp = dr["name"].ToString();
        }
    }
}