using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class change_password : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
    SqlCommand cmd;
    Class1 cls = new Class1();
    string sesion;
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
    protected void btnupdate_Click(object sender, EventArgs e)
    {
        try
        {
            sesion = Session["Username"].ToString();
            cmd = con.CreateCommand();
            con.Open();
            cmd.CommandText  = "select password from user_master where password='" + txtcurrent.Text.Trim() + "'  and user_id='" + sesion + "'  ";
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Close();
                cmd.CommandText = "update user_master set password='" + txtconfirmpassword.Text.Trim() + "' where user_id='" + sesion + "' and password='" + txtcurrent.Text.Trim() + "' ";
                cmd.ExecuteNonQuery();
                ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Password Changed Sucessfully');", true);
                con.Close();
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Current Password is Wrong');", true);
            }
        }
        catch (Exception er)
        {
            string test = er.Message.Replace("'", " ");
        }
    }
}