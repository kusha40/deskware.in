using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class reschedule_todo : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ConnectionString);
    SqlCommand cmd;
    Class1 cls = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] == null && Session["type"] == null)
        {
            Response.Redirect("~/login.aspx");
        }
        if (Request.QueryString["id"] == null)
        {
            Response.Redirect("~/login.aspx");
        }
        else
        {
            SqlDataAdapter adap = new SqlDataAdapter("select * from tbl_todo where id='" + Request.QueryString["id"] .ToString()+ "' ", conn);
            DataSet ds = new DataSet();
            adap.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dr = ds.Tables[0].Rows[0];
                txt1.Text = Convert.ToDateTime( dr["date"].ToString()).ToString("dd-MMM-yyyy");
                txt2.Text = dr["time"].ToString();
            }

        }

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string time = DropDownList2.SelectedValue + ":" + DropDownList3.SelectedValue + ":" + DropDownList4.SelectedValue;
        string date = DateTime.ParseExact(TextBox1.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
        conn.Open();
        SqlCommand cmd = new SqlCommand("update  tbl_todo set req='Reschedule',time='"+time+"',date='"+date+"' where id='" + Request.QueryString["id"].ToString() + "' ", conn);
        cmd.ExecuteNonQuery();
        conn.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('To Do Reschedule Sucessfully');", true);
    }
}