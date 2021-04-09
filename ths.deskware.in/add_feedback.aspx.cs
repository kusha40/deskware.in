using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class add_feedback : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
    SqlCommand cmd;
    Class1 cls = new Class1(); SqlDataAdapter adap;
    DataSet ds; string user_type, name = "";
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
            if (!IsPostBack)
            {
                view_details();
                cls.gridbind(GridView1, "select * from tbl_feedback_master");
            }
        }

    }
    public void view_details()
    {
        try
        {
            adap = new SqlDataAdapter("select * from tbl_feedback where id='" + Request.QueryString["id"].ToString() + "' ", con);
            ds = new DataSet();
            adap.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dr = ds.Tables[0].Rows[0];
                Label4.Text = dr["cid"].ToString();
                Label5.Text = dr["name"].ToString() ;
                Label6.Text = dr["mob"].ToString();
                Label12.Text = dr["remarks"].ToString();
            }
        }
        catch (Exception er)
        {
        }
    }
    protected void btnaddfollowup_Click(object sender, EventArgs e)
    {
         int j;
         int count = 0;

         for (j = 0; j < GridView1.Rows.Count; j++)
         {
             count++;
             Label title = (Label)GridView1.Rows[j].FindControl("Label1");
             RadioButtonList sts = (RadioButtonList)GridView1.Rows[j].FindControl("RadioButtonList1");
             cmd = con.CreateCommand();
             con.Open();
             cmd.CommandText = " insert into tbl_feedback_reply values ('" + Request.QueryString["id"].ToString() + "','" + title.Text + "','" + sts.SelectedValue + "','" + TextBox1.Text + "','" + txtremark.Text + "',getdate())";
             cmd.ExecuteNonQuery();
             con.Close();
         }
         if (count > 0)
         {
             ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Submitted Sucessfully');", true);
         }
    }
}