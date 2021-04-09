using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class set_target : System.Web.UI.Page
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
        if (!IsPostBack)
        {
            cls.bind_ddl(ddlassign, "select (name)as name,user_id from user_master where (type='Administrator' or type='User') and status='Active'  order by name asc ", "name", "user_id");
           
        }

    }
    public void sales()
    {
        string command = "";
        command = "select * from tbl_sales_target where user_id='" + ddlassign.SelectedValue + "' and year='" + System.DateTime.Now.Year + "' ";
        SqlDataAdapter adap = new SqlDataAdapter(command, con);
        DataSet ds = new DataSet();
        adap.Fill(ds);
        if (ds.Tables[0].Rows.Count != 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];
            TextBox1.Text = double.Parse(dr["m4"].ToString()).ToString("n2");
            TextBox2.Text = double.Parse(dr["m5"].ToString()).ToString("n2");
            TextBox3.Text = double.Parse(dr["m6"].ToString()).ToString("n2");
            TextBox4.Text = double.Parse(dr["m7"].ToString()).ToString("n2");
            TextBox5.Text = double.Parse(dr["m8"].ToString()).ToString("n2");
            TextBox6.Text = double.Parse(dr["m9"].ToString()).ToString("n2");
            TextBox7.Text = double.Parse(dr["m10"].ToString()).ToString("n2");
            TextBox8.Text = double.Parse(dr["m11"].ToString()).ToString("n2");
            TextBox9.Text = double.Parse(dr["m12"].ToString()).ToString("n2");
            TextBox10.Text = double.Parse(dr["m1"].ToString()).ToString("n2");
            TextBox11.Text = double.Parse(dr["m2"].ToString()).ToString("n2");
            TextBox12.Text = double.Parse(dr["m3"].ToString()).ToString("n2");

        }
        else
        {
            TextBox1.Text = TextBox2.Text = TextBox3.Text = TextBox4.Text = TextBox5.Text = TextBox6.Text = TextBox7.Text = TextBox8.Text = TextBox9.Text = TextBox10.Text = TextBox11.Text = TextBox12.Text = "0";
        }
    }
    public void meetings()
    {
        string command = "";
        command = "select * from tbl_meeting_target where user_id='" + ddlassign.SelectedValue + "' and year='"+System.DateTime.Now.Year+"' ";
        SqlDataAdapter adap = new SqlDataAdapter(command, con);
        DataSet ds = new DataSet();
        adap.Fill(ds);
        if (ds.Tables[0].Rows.Count != 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];
            TextBox13.Text = double.Parse(dr["m4"].ToString()).ToString("n0");
            TextBox14.Text = double.Parse(dr["m5"].ToString()).ToString("n0");
            TextBox15.Text = double.Parse(dr["m6"].ToString()).ToString("n0");
            TextBox16.Text = double.Parse(dr["m7"].ToString()).ToString("n0");
            TextBox17.Text = double.Parse(dr["m8"].ToString()).ToString("n0");
            TextBox18.Text = double.Parse(dr["m9"].ToString()).ToString("n0");
            TextBox19.Text = double.Parse(dr["m10"].ToString()).ToString("n0");
            TextBox20.Text = double.Parse(dr["m11"].ToString()).ToString("n0");
            TextBox21.Text = double.Parse(dr["m12"].ToString()).ToString("n0");
            TextBox22.Text = double.Parse(dr["m1"].ToString()).ToString("n0");
            TextBox23.Text = double.Parse(dr["m2"].ToString()).ToString("n0");
            TextBox24.Text = double.Parse(dr["m3"].ToString()).ToString("n0");

        }
        else
        {
            TextBox13.Text = TextBox14.Text = TextBox15.Text = TextBox16.Text = TextBox17.Text = TextBox18.Text = TextBox19.Text = TextBox20.Text = TextBox21.Text = TextBox22.Text = TextBox23.Text = TextBox24.Text = "0";
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        sales();
        meetings();
    }

    public void insert_sales()
    {
        string commnd = "";
        SqlCommand cmd1 = con.CreateCommand();
        con.Open();
        cmd1.CommandText = "select count(user_id) from tbl_sales_target where user_id='" + ddlassign.SelectedValue + "' and year='" + System.DateTime.Now.Year + "'";
        int a = int.Parse(cmd1.ExecuteScalar().ToString());
        if (a >= 1)
        {
            commnd = " update tbl_sales_target set m4='" + TextBox1.Text + "',m5='" + TextBox2.Text + "',m6='" + TextBox3.Text + "',m7='" + TextBox4.Text + "',m8='" + TextBox5.Text + "',m9='" + TextBox6.Text + "',m10='" + TextBox7.Text + "',m11='" + TextBox8.Text + "',m12='" + TextBox9.Text + "',m1='" + TextBox10.Text + "',m2='" + TextBox11.Text + "',m3='" + TextBox12.Text + "' where user_id='" + ddlassign.SelectedValue + "' and year='" + System.DateTime.Now.Year + "'";
        }
        else
        {
            commnd = " insert into tbl_sales_target values('" + ddlassign.SelectedValue + "','" + System.DateTime.Now.Year + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox5.Text + "','" + TextBox6.Text + "','" + TextBox7.Text + "','" + TextBox8.Text + "','" + TextBox9.Text + "','" + TextBox10.Text + "','" + TextBox11.Text + "','" + TextBox12.Text + "')";
        }
        cmd = con.CreateCommand();
        cmd.CommandText = commnd;
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public void insert_meetings()
    {
        string commnd = "";
        SqlCommand cmd1 = con.CreateCommand();
        con.Open();
        cmd1.CommandText = "select count(user_id) from tbl_meeting_target where user_id='" + ddlassign.SelectedValue + "' and year='" + System.DateTime.Now.Year + "'";
        int a = int.Parse(cmd1.ExecuteScalar().ToString());
        if (a >= 1)
        {
            commnd = " update tbl_meeting_target set m4='" + TextBox13.Text + "',m5='" + TextBox14.Text + "',m6='" + TextBox15.Text + "',m7='" + TextBox16.Text + "',m8='" + TextBox17.Text + "',m9='" + TextBox18.Text + "',m10='" + TextBox19.Text + "',m11='" + TextBox20.Text + "',m12='" + TextBox21.Text + "',m1='" + TextBox22.Text + "',m2='" + TextBox23.Text + "',m3='" + TextBox24.Text + "' where user_id='" + ddlassign.SelectedValue + "' and year='" + System.DateTime.Now.Year + "'";
        }
        else
        {
            commnd = " insert into tbl_meeting_target values('" + ddlassign.SelectedValue + "','" + System.DateTime.Now.Year + "','" + TextBox13.Text + "','" + TextBox14.Text + "','" + TextBox15.Text + "','" + TextBox16.Text + "','" + TextBox17.Text + "','" + TextBox18.Text + "','" + TextBox19.Text + "','" + TextBox20.Text + "','" + TextBox21.Text + "','" + TextBox22.Text + "','" + TextBox23.Text + "','" + TextBox24.Text + "')";
        }
        cmd = con.CreateCommand();
        cmd.CommandText = commnd;
        cmd.ExecuteNonQuery();
        con.Close();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        insert_sales();
        insert_meetings();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Updated Sucessfully');", true);
    }
}