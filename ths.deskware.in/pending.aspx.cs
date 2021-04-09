using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pending : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
    SqlCommand cmd;
    Class1 cls = new Class1();
    string user_type, name = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] == null && Session["type"] == null)
        {
            Response.Redirect("~/login.aspx");
        }
        if (!IsPostBack)
        {
            if (Session["type"].ToString() == "Administrator")
            {
                cls.gridbind(GridView1, "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:30:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101)              SELECT distinct max(tbl_medors_followup_master.remarks)as remarks, max(tbl_medors_followup_master.nfd)as follow_date, max(tbl_medors_lead_master.lead_id)as lead_id, max(tbl_medors_lead_master.ctype)as ctype,                          max(tbl_medors_lead_master.dsource)as dsource,max(tbl_medors_lead_master.product)as product, max(tbl_medors_lead_master.fname)as fname, max(tbl_medors_lead_master.mob)as mob,max(tbl_medors_lead_master.email_id)as email_id,max(tbl_medors_lead_master.assigned_to)as assigned_to,max(tbl_medors_lead_master.created_by)as created_by FROM  tbl_medors_lead_master INNER JOIN  tbl_medors_followup_master ON tbl_medors_lead_master.lead_id = tbl_medors_followup_master.lead_id  where (datediff(day,nfd,@date_new)>0) and tbl_medors_followup_master.status=0   group by (tbl_medors_followup_master.id)");
            }
            if (Session["type"].ToString() == "User")
            {
                cls.gridbind(GridView1, "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:30:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101)              SELECT distinct max(tbl_medors_followup_master.remarks)as remarks, max(tbl_medors_followup_master.nfd)as follow_date, max(tbl_medors_lead_master.lead_id)as lead_id, max(tbl_medors_lead_master.ctype)as ctype,                          max(tbl_medors_lead_master.dsource)as dsource,max(tbl_medors_lead_master.product)as product, max(tbl_medors_lead_master.fname)as fname, max(tbl_medors_lead_master.mob)as mob,max(tbl_medors_lead_master.email_id)as email_id,max(tbl_medors_lead_master.assigned_to)as assigned_to,max(tbl_medors_lead_master.created_by)as created_by FROM  tbl_medors_lead_master INNER JOIN  tbl_medors_followup_master ON tbl_medors_lead_master.lead_id = tbl_medors_followup_master.lead_id  where (datediff(day,nfd,@date_new)>0) and tbl_medors_followup_master.status=0 and tbl_medors_followup_master.lead_id in (select lead_id from  tbl_medors_lead_master where  assigned_to in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "')  )  group by (tbl_medors_followup_master.id)");
            }
        }

    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        if (Session["type"].ToString() == "Administrator")
        {
            cls.gridbind(GridView1, "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:30:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101)              SELECT distinct max(tbl_medors_followup_master.remarks)as remarks, max(tbl_medors_followup_master.nfd)as follow_date, max(tbl_medors_lead_master.lead_id)as lead_id, max(tbl_medors_lead_master.ctype)as ctype,                          max(tbl_medors_lead_master.dsource)as dsource,max(tbl_medors_lead_master.product)as product, max(tbl_medors_lead_master.fname)as fname, max(tbl_medors_lead_master.mob)as mob,max(tbl_medors_lead_master.email_id)as email_id,max(tbl_medors_lead_master.assigned_to)as assigned_to,max(tbl_medors_lead_master.created_by)as created_by FROM  tbl_medors_lead_master INNER JOIN  tbl_medors_followup_master ON tbl_medors_lead_master.lead_id = tbl_medors_followup_master.lead_id  where (datediff(day,nfd,@date_new)>0) and tbl_medors_followup_master.status=0   group by (tbl_medors_followup_master.id)");
        }
        if (Session["type"].ToString() == "User")
        {
            cls.gridbind(GridView1, "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:30:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101)              SELECT distinct max(tbl_medors_followup_master.remarks)as remarks, max(tbl_medors_followup_master.nfd)as follow_date, max(tbl_medors_lead_master.lead_id)as lead_id, max(tbl_medors_lead_master.ctype)as ctype,                          max(tbl_medors_lead_master.dsource)as dsource,max(tbl_medors_lead_master.product)as product, max(tbl_medors_lead_master.fname)as fname, max(tbl_medors_lead_master.mob)as mob,max(tbl_medors_lead_master.email_id)as email_id,max(tbl_medors_lead_master.assigned_to)as assigned_to,max(tbl_medors_lead_master.created_by)as created_by FROM  tbl_medors_lead_master INNER JOIN  tbl_medors_followup_master ON tbl_medors_lead_master.lead_id = tbl_medors_followup_master.lead_id  where (datediff(day,nfd,@date_new)>0) and tbl_medors_followup_master.status=0 and tbl_medors_followup_master.lead_id in (select lead_id from  tbl_medors_lead_master where  assigned_to in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "')  )  group by (tbl_medors_followup_master.id)");
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "follow")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "", "window.open('Add_followup2.aspx?id=" + e.CommandArgument.ToString() + "','Graph','height=724px,width=900px,scrollbars=1' );", true);
            //Response.Redirect("add_follow_up.aspx?id=" + e.CommandArgument.ToString() + "");
        }
        else  if (e.CommandName == "view")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "", "window.open('view_remarks.aspx?id=" + e.CommandArgument.ToString() + "','Graph','height=724px,width=900px,scrollbars=1' );", true);
            //Response.Redirect("add_follow_up.aspx?id=" + e.CommandArgument.ToString() + "");
        }
        else if (e.CommandName == "meeting1")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "", "window.open('view_order_history.aspx?id=" + e.CommandArgument.ToString() + "','Graph','height=724px,width=900px,scrollbars=1' );", true);
        }
        else if (e.CommandName == "meeting2")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "", "window.open('view_quotation_history.aspx?id=" + e.CommandArgument.ToString() + "','Graph','height=724px,width=900px,scrollbars=1' );", true);
        }
      else  if (e.CommandName == "edit12")
        {
            GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
            Label lead_id = (Label)row.FindControl("Label1");
            Label name = (Label)row.FindControl("Label2");

            TextBox nfd = (TextBox)row.FindControl("TextBox1");
            TextBox remarks = (TextBox)row.FindControl("TextBox2");


            SqlCommand cmd1 = con.CreateCommand();
            con.Open();
            cmd1.CommandText = " update tbl_medors_followup_master set status='1' where lead_id='" + lead_id.Text + "'  ";
            cmd1.ExecuteNonQuery();
            con.Close();


            cmd = con.CreateCommand();
            con.Open();
            cmd.CommandText = "insert into tbl_medors_followup_master values('" + lead_id.Text.Trim() + "','" + name.Text.Trim() + "','" + DateTime.ParseExact(nfd.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "','" + remarks.Text.Trim() + "','" + Session["Username"].ToString() + "',getdate(),'0')";
            cmd.ExecuteNonQuery();
            con.Close();
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Follow Up Added Sucessfully');window.location='pending.aspx';", true);
        }
        else if (e.CommandName == "pnp")
        {
            GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
            Label lead_id = (Label)row.FindControl("Label1");
            Label name = (Label)row.FindControl("Label2");

            TextBox nfd = (TextBox)row.FindControl("TextBox1");
            TextBox remarks = (TextBox)row.FindControl("TextBox2");

            DateTime tomorrow = DateTime.Now.AddDays(1);
            DateTime followup;

            string day = tomorrow.ToString("dddd");

            if (day == "Sunday")
            {
                followup = DateTime.Now.AddDays(2);
            }
            else
            {
                followup = DateTime.Now.AddDays(1);
            }

            SqlCommand cmd1 = con.CreateCommand();
            con.Open();
            cmd1.CommandText = " update tbl_medors_followup_master set status='1' where lead_id='" + lead_id.Text + "'  ";
            cmd1.ExecuteNonQuery();
            con.Close();

            cmd = con.CreateCommand();
            con.Open();
            cmd.CommandText = "insert into tbl_medors_followup_master values('" + lead_id.Text.Trim() + "','" + name.Text.Trim() + "','" + DateTime.ParseExact(nfd.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "','Phone Not Picked','" + Session["Username"].ToString() + "',getdate(),'0')";
            cmd.ExecuteNonQuery();
            con.Close();

            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Added Sucessfully');", true);
        }

    }
}