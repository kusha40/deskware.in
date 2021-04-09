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

    protected void btnSign_Click(object sender, EventArgs e)
    {
        try
        {
            login_type();
            string strQuery = "select * from user_master where user_id=@user_id COLLATE Latin1_General_CS_AS and password=@password COLLATE Latin1_General_CS_AS and type='" + login_tp + "' and status='Active'";
            SqlCommand cmd = new SqlCommand(strQuery,con);
            cmd.Parameters.AddWithValue("@user_id", txtUsername.Text.Trim());
            cmd.Parameters.AddWithValue("@password", txtPassword.Text.Trim());
            //cmd = con.CreateCommand();
            //cmd.CommandText = "select * from user_master where (user_id='" + txtUsername.Text.Trim() + "') and (password='" + txtPassword.Text.Trim() + "') and type='" + login_tp + "' and status='Active'";
            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                con.Close();
                Session["Username"] = txtUsername.Text.Trim();
                Session["type"] = login_tp;
                Session["operation"] = operation;

                if (txtUsername.Text == "tilehub" || txtUsername.Text == "Tilehub" || txtUsername.Text == "TILEHUB")
                {
                    Response.Redirect("online_stock_show.aspx");
                }
                if (login_tp == "Salesman")
                {
                    Response.Redirect("salesman_ledger.aspx");
                }
                else
                {
                    Response.Redirect("Dashboard.aspx", false);
                }
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
    string login_tp, operation = "";
    public void login_type()
    {
        string command = "";
        command = "select * from user_master where user_id='" + txtUsername.Text.Trim() + "' ";
        SqlDataAdapter adap = new SqlDataAdapter(command, con);
        DataSet ds = new DataSet();
        adap.Fill(ds);
        if (ds.Tables[0].Rows.Count != 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];
            login_tp = dr["type"].ToString();
            operation = dr["operation"].ToString();
        }
    }
}