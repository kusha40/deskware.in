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

public partial class add_followup_meeting : System.Web.UI.Page
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
            user_type = Session["type"].ToString();
            name = Session["username"].ToString();
            if (!IsPostBack)
            {
              
                Label4.Text = Request.QueryString["id"].ToString();
                view_details();
                User_details();
                if (Session["type"].ToString() == "Administrator")
                {
                    cls.bind_ddl(ddlemailid, "select distinct user_id from user_master order by user_id asc", "user_id", "user_id");
                }
                else
                {
                    cls.bind_ddl(ddlemailid, "select distinct user_id from user_master where user_id  in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "') order by user_id asc", "user_id", "user_id");
                    ddlemailid.SelectedValue = Session["Username"].ToString();
                }
            }
           // TextBox1.Text = System.DateTime.Now.ToString("MM/dd/yyyy");
            if (RadioButtonList1.SelectedValue == "3")
            {
                divfooter.Visible = true;
                div2.Visible = false;
                div3.Visible = false;
                div4.Visible = false;

            }
            if (RadioButtonList1.SelectedValue == "2")
            {
                divfooter.Visible = true;
                div2.Visible = false;
                div3.Visible = false;
                div4.Visible = false;

            }
            if (RadioButtonList1.SelectedValue == "4")
            {
                divfooter.Visible = true;
                div2.Visible = true;
                div3.Visible = true;
                div4.Visible = true;
            }
        }
    }
    string email_id = "";
    public void view_details()
    {
        try
        {
            adap = new SqlDataAdapter("select * from tbl_medors_lead_master where lead_id='" + Label4.Text + "' ", con);
            ds = new DataSet();
            adap.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dr = ds.Tables[0].Rows[0];
                Label4.Text = dr["lead_id"].ToString();
                Label5.Text = dr["title"].ToString() + " " + dr["fname"].ToString() + " " + dr["lname"].ToString();
                Label6.Text = dr["mob"].ToString();
                Label10.Text = dr["product"].ToString();
                Label12.Text = dr["phone"].ToString();
                Label3.Text = dr["address"].ToString();
            }
        }
        catch (Exception er)
        {
        }
    }

    string Username, Mob_no,user_mob,c2 = "";
    public void User_details()
    {
        try
        {
            adap = new SqlDataAdapter("select * from user_master where user_id='" + Session["Username"].ToString() + "' ", con);
            ds = new DataSet();
            adap.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dr = ds.Tables[0].Rows[0];
                Username = dr["name"].ToString();
                Mob_no = dr["contact_no"].ToString();
            }
        }
        catch (Exception er)
        {
        }
    }

    
    protected void btnviewhistory_Click(object sender, EventArgs e)
    {
        //if (Session["type"].ToString() == "Administrator")
        {
            cls.gridbind(GridView4, "select * from tbl_meeting_details where lead_id='" + Label4.Text + "' and status='0' order by md desc ");
        }
    }
    public void converted()
    {
        cmd = con.CreateCommand();
       SqlCommand cmd1 = con.CreateCommand();
        con.Open();
      string cmmd = " update tbl_medors_lead_master set ctype='Converted' where lead_id ='" + Label4.Text + "'  ";
      string cmmd1 = " update tbl_meeting_details set type='Converted',md=getdate() where lead_id ='" + Label4.Text + "'  ";
        cmd.CommandText = cmmd;
        cmd1.CommandText = cmmd1;
        cmd.ExecuteNonQuery();
        cmd1.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Converted Sucessfully');", true);
        followup_status();
    }
    public void followup_status()
    {
        cmd = con.CreateCommand();
        con.Open();
        cmd.CommandText = " update tbl_meeting_details set status='1' where lead_id='" + Label4.Text + "'  ";
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public void add_feedback()
    {
        cmd = con.CreateCommand();
        con.Open();
        cmd.CommandText = " insert into tbl_feedback values('" + Label4.Text.Trim() + "','" + Label5.Text.Trim() + "','" + Label6.Text.Trim() + "','" + Session["Username"].ToString() + "','" + txtremark.Text.Trim() + "',getdate())";
        cmd.ExecuteNonQuery();
        con.Close();
    }
    protected void btnaddfollowup_Click(object sender, EventArgs e)
    {

        if (RadioButtonList1.SelectedValue == "3")
        {
            converted();
            SqlCommand cmd1 = con.CreateCommand();
            con.Open();
            cmd1.CommandText = "insert into tbl_meeting_details values('" + Label4.Text.Trim() + "','" + Label5.Text.Trim() + "','" + Label6.Text.Trim() + "','" + Label10.Text.Trim() + "',getdate(),'" + txtremark.Text.Trim() + "','" + Session["Username"].ToString() + "','" + Session["Username"].ToString() + "',getdate(),'1','Converted')";
            cmd1.ExecuteNonQuery();
            con.Close();
        }
        if (RadioButtonList1.SelectedValue == "2")
        {
            cmd = con.CreateCommand();
            con.Open();
            string cmmd = " update tbl_medors_lead_master set ctype='Rejected' where lead_id ='" + Label4.Text + "' ";
            cmd.CommandText = cmmd;
            cmd.ExecuteNonQuery();
            con.Close();

            followup_status();
            SqlCommand cmd1 = con.CreateCommand();
            con.Open();
            cmd1.CommandText = "insert into tbl_meeting_details values('" + Label4.Text.Trim() + "','" + Label5.Text.Trim() + "','" + Label6.Text.Trim() + "','" + Label10.Text.Trim() + "',getdate(),'" + txtremark.Text.Trim() + "','" + Session["Username"].ToString() + "','" + Session["Username"].ToString() + "',getdate(),'1','Converted')";
            cmd1.ExecuteNonQuery();
            con.Close();
            add_feedback();
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Rejected Sucessfully');", true);
        }
        if (RadioButtonList1.SelectedValue == "4")
        {
            cmd = con.CreateCommand();
            con.Open();
            cmd.CommandText = " DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:30:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101) insert into tbl_meeting_details values('" + Label4.Text.Trim() + "','" + Label5.Text.Trim() + "','" + Label6.Text.Trim() + "','" + Label10.Text.Trim() + "','" + DateTime.ParseExact(TextBox1.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "','" + txtremark.Text.Trim() + "','" + Session["Username"].ToString() + "','" + ddlemailid.SelectedValue + "',getdate(),'0','')";
            cmd.ExecuteNonQuery();
            con.Close();
            add_feedback();
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Meeting Scheduled Sucessfully');", true);
            txtremark.Text = "";
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        cls.gridbind(GridView2, "select * from tbl_meeting_details where assign_to='" + ddlemailid.SelectedValue + "' order by md desc ");
    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtremark.Text = "";
       
        if (RadioButtonList1.SelectedValue == "3")
        {
            divfooter.Visible = true;
            div2.Visible = false;
            div3.Visible = false;
            div4.Visible = false;

        }
        if (RadioButtonList1.SelectedValue == "2")
        {
            divfooter.Visible = true;
            div2.Visible = false;
            div3.Visible = false;
            div4.Visible = false;

        }
        if (RadioButtonList1.SelectedValue == "4")
        {
            divfooter.Visible = true;
            div2.Visible = true;
            div3.Visible = true;
            div4.Visible = true;
        }
    }
    protected void GridView4_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView4.Rows[e.RowIndex];
        con.Open();
        SqlCommand cmd = new SqlCommand("delete FROM tbl_meeting_details where id='" + Convert.ToInt32(GridView4.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Deleted Sucessfully');", true);
        cls.gridbind(GridView4, "select * from tbl_meeting_details where assign_to='" + ddlemailid.SelectedValue + "' order by md desc ");
    }
    string path = "";
    protected void Button6_Click(object sender, EventArgs e)
    {
        if (FileUpload3.HasFile)
        {
            string folder = Server.MapPath("");
            var newPath1 = DateTime.Now.ToString("yyyymmhhddMMss") + FileUpload3.PostedFile.FileName;
            FileUpload3.SaveAs(folder + "\\docs\\" + newPath1);
            path = "docs/" + newPath1;
        }
        cmd = con.CreateCommand();
        con.Open();
        cmd.CommandText = " insert into tbl_meeting_expense values ('" + Label4.Text.Trim() + "','" + Label5.Text.Trim() + "','" + txtexpremarks.Text + "','" + txtamount.Text + "','','','" + Session["Username"].ToString() + "',getdate(),'" + path + "','" + txtparticular.Text + "') ";
        cmd.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Added Sucessfully');", true);
        txtexpremarks.Text = txtamount.Text = txtparticular.Text = "";
    }
}