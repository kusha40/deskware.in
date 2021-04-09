using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class change_pwd : System.Web.UI.Page
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
    protected void Button1_Click(object sender, EventArgs e)
    {
        try
        {
            sesion = Session["Username"].ToString();
            cmd = con.CreateCommand();
            con.Open();
            cmd.CommandText = "select password from user_master where password='" + txtcurrent.Text.Trim() + "'  and user_id='" + sesion + "'  ";
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Close();
                cmd.CommandText = "update user_master set password='" + txtconfirmpassword.Text.Trim() + "' where user_id='" + sesion + "' and password='" + txtcurrent.Text.Trim() + "' ";
                cmd.ExecuteNonQuery();

                div2.Visible = false;

                div1.Visible = true;
                spn1.InnerText = "Password Changed Sucessfully";

                con.Close();

                txtcurrent.Text = txtconfirmpassword.Text = txtnew.Text = "";
            }
            else
            {
                div1.Visible = false;
                div2.Visible = true;
                spn2.InnerText = "Current Password is Wrong";
                txtcurrent.Text = txtconfirmpassword.Text = txtnew.Text = "";
            }
        }
        catch (Exception er)
        {
            string test = er.Message.Replace("'", " ");
        }
    }
}