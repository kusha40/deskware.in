using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Dashboard : System.Web.UI.Page
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
            bind_dashboard53();
            //followup//
            bind_dashboard54();
            bind_dashboard55();
            bind_dashboard56();
            //lead//
            bind_dashboard57();
            bind_dashboard58();
            bind_dashboard59();


            //followup-meetings//
            bind_dashboard61();
            bind_dashboard62();
            bind_dashboard63();
            bind_dashboard64();
            bind_dashboard65();
            bind_dashboard66();
            if (Session["type"].ToString() == "Administrator")
            {
                cls.gridbind(GridView1, "select * from tbl_sales_target order by user_id asc");
                cls.gridbind(GridView2, "select * from tbl_meeting_target order by user_id asc");
            }
            if (Session["type"].ToString() == "User")
            {
                cls.gridbind(GridView1, "select * from tbl_sales_target where user_id='" + Session["Username"].ToString() + "' order by user_id asc");
                cls.gridbind(GridView2, "select * from tbl_meeting_target where user_id='" + Session["Username"].ToString() + "' order by user_id asc");
            }
         
        }
      
    }
    public void bind_dashboard53()
    {
        string command = "";
        if (Session["type"].ToString() == "Administrator")
        {
            command = "select count(distinct id) as myly from tbl_medors_lead_master   ";
        }
        if (Session["type"].ToString() == "User")
        {
            command = "select count(distinct id) as myly from tbl_medors_lead_master where assigned_to in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "')   ";
        }
            SqlDataAdapter adap = new SqlDataAdapter(command, con);
            DataSet ds = new DataSet();
            adap.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dr = ds.Tables[0].Rows[0];
                Span2.InnerText = dr["myly"].ToString();
            }
            else
            {
                Span2.InnerText = "0";
            }
        }

    

    public void bind_dashboard64()
    {
        string command = "";
          if (Session["type"].ToString() == "Administrator")
        {
            command = "select count(distinct id) as myly from tbl_meeting_details where type!='Converted'   ";
        }
        if (Session["type"].ToString() == "User")
        {
            command = "select count(distinct id) as myly from tbl_meeting_details where assign_to in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "') and type!='Converted'   ";
        }
            
            SqlDataAdapter adap = new SqlDataAdapter(command, con);
            DataSet ds = new DataSet();
            adap.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dr = ds.Tables[0].Rows[0];
                Span11.InnerText = dr["myly"].ToString();
            }
            else
            {
                Span11.InnerText = "0";
            }
        
    }
    public void bind_dashboard65()
    {
        string command = "";
           if (Session["type"].ToString() == "Administrator")
        {
            command = "select count(distinct id) as myly from tbl_meeting_details where status!='0' and type!='Converted'   ";
        }
        if (Session["type"].ToString() == "User")
        {
            command = "select count(distinct id) as myly from tbl_meeting_details where status!='0' and type!='Converted' and assign_to in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "')   ";
        }
           
            SqlDataAdapter adap = new SqlDataAdapter(command, con);
            DataSet ds = new DataSet();
            adap.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dr = ds.Tables[0].Rows[0];
                Span12.InnerText = dr["myly"].ToString();
            }
            else
            {
                Span12.InnerText = "0";
            }
        
    }
    public void bind_dashboard66()
    {
        string command = "";
         if (Session["type"].ToString() == "Administrator")
        {
            command = "select count(distinct id) as myly from tbl_meeting_details where status='0' and type!='Converted'   ";
        }
        if (Session["type"].ToString() == "User")
        {
            command = "select count(distinct id) as myly from tbl_meeting_details where status='0' and type!='Converted' and assign_to in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "')   ";
        }
          
            SqlDataAdapter adap = new SqlDataAdapter(command, con);
            DataSet ds = new DataSet();
            adap.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dr = ds.Tables[0].Rows[0];
                Span13.InnerText = dr["myly"].ToString();
            }
            else
            {
                Span13.InnerText = "0";
            }
        
    }


    //followup//
    public void bind_dashboard54()
    {
        string command = "";
        if (Session["type"].ToString() == "Administrator")
        {
            command = "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:30:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101)              SELECT count(tbl_medors_followup_master.lead_id)as myly FROM  tbl_medors_lead_master INNER JOIN  tbl_medors_followup_master ON tbl_medors_lead_master.lead_id = tbl_medors_followup_master.lead_id  where (tbl_medors_followup_master.nfd=@date_new) and tbl_medors_followup_master.status=0   ";
        }
        if (Session["type"].ToString() == "User")
        {
            command = "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:30:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101)              SELECT count(tbl_medors_followup_master.lead_id)as myly FROM  tbl_medors_lead_master INNER JOIN  tbl_medors_followup_master ON tbl_medors_lead_master.lead_id = tbl_medors_followup_master.lead_id  where (tbl_medors_followup_master.nfd=@date_new) and tbl_medors_followup_master.status=0 and assigned_to in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "')    ";
        }
        //group by (tbl_medors_followup_master.id)
            SqlDataAdapter adap = new SqlDataAdapter(command, con);
            DataSet ds = new DataSet();
            adap.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dr = ds.Tables[0].Rows[0];
                Span3.InnerText = dr["myly"].ToString();
            }
            else
            {
                Span3.InnerText = "0";
            }
        
    }
    public void bind_dashboard55()
    {
        string command = "";
         if (Session["type"].ToString() == "Administrator")
        {
            command = "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:30:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101)              SELECT count(tbl_medors_followup_master.lead_id)as myly FROM  tbl_medors_lead_master INNER JOIN  tbl_medors_followup_master ON tbl_medors_lead_master.lead_id = tbl_medors_followup_master.lead_id  where (datediff(day,nfd,@date_new)>0) and tbl_medors_followup_master.status=0   ";
        }
        if (Session["type"].ToString() == "User")
        {
            command = "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:30:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101)              SELECT count(tbl_medors_followup_master.lead_id)as myly FROM  tbl_medors_lead_master INNER JOIN  tbl_medors_followup_master ON tbl_medors_lead_master.lead_id = tbl_medors_followup_master.lead_id  where (datediff(day,nfd,@date_new)>0) and tbl_medors_followup_master.status=0 and assigned_to in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "')    ";
        }
            SqlDataAdapter adap = new SqlDataAdapter(command, con);
            DataSet ds = new DataSet();
            adap.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dr = ds.Tables[0].Rows[0];
                Span6.InnerText = dr["myly"].ToString();
            }
            else
            {
                Span6.InnerText = "0";
            }
        
    }
    public void bind_dashboard56()
    {
        string command = "";
           if (Session["type"].ToString() == "Administrator")
        {
            command = "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:30:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101)              SELECT  count(tbl_medors_followup_master.lead_id)as myly FROM  tbl_medors_lead_master INNER JOIN  tbl_medors_followup_master ON tbl_medors_lead_master.lead_id = tbl_medors_followup_master.lead_id  where (tbl_medors_followup_master.nfd>@date_new) and tbl_medors_followup_master.status=0   ";
        }
        if (Session["type"].ToString() == "User")
        {
            command = "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:30:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101)              SELECT  count(tbl_medors_followup_master.lead_id)as myly FROM  tbl_medors_lead_master INNER JOIN  tbl_medors_followup_master ON tbl_medors_lead_master.lead_id = tbl_medors_followup_master.lead_id  where (tbl_medors_followup_master.nfd>@date_new) and tbl_medors_followup_master.status=0 and assigned_to in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "')    ";
        }
           
            SqlDataAdapter adap = new SqlDataAdapter(command, con);
            DataSet ds = new DataSet();
            adap.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dr = ds.Tables[0].Rows[0];
                Span7.InnerText = dr["myly"].ToString();
            }
            else
            {
                Span7.InnerText = "0";
            }
        
    }

    //followup_meetings//
    public void bind_dashboard61()
    {
        string command = "";
        if (Session["type"].ToString() == "Administrator")
        {
            command = "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:30:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101)              SELECT count(tbl_meeting_details.lead_id)as myly from tbl_meeting_details   where (tbl_meeting_details.md=@date_new) and tbl_meeting_details.status='0' and type!='Converted'";
        }
        if (Session["type"].ToString() == "User")
        {
            command = "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:30:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101)              SELECT count(tbl_meeting_details.lead_id)as myly from tbl_meeting_details   where (tbl_meeting_details.md=@date_new) and tbl_meeting_details.status='0' and type!='Converted' and assign_to in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "')";
        }
            SqlDataAdapter adap = new SqlDataAdapter(command, con);
            DataSet ds = new DataSet();
            adap.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dr = ds.Tables[0].Rows[0];
                Span8.InnerText = dr["myly"].ToString();
            }
            else
            {
                Span8.InnerText = "0";
            }
        
    }
    public void bind_dashboard62()
    {
        string command = "";
           if (Session["type"].ToString() == "Administrator")
        {
            command = "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:30:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101)              SELECT  count(tbl_meeting_details.lead_id)as myly from tbl_meeting_details   where (datediff(day,md,@date_new)>0) and tbl_meeting_details.status='0' and type!='Converted'";
        }
        if (Session["type"].ToString() == "User")
        {
            command = "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:30:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101)              SELECT  count(tbl_meeting_details.lead_id)as myly from tbl_meeting_details   where (datediff(day,md,@date_new)>0) and tbl_meeting_details.status='0' and type!='Converted' and assign_to in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "')";
        }
           
            SqlDataAdapter adap = new SqlDataAdapter(command, con);
            DataSet ds = new DataSet();
            adap.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dr = ds.Tables[0].Rows[0];
                Span9.InnerText = dr["myly"].ToString();
            }
            else
            {
                Span9.InnerText = "0";
            }
        
    }
    public void bind_dashboard63()
    {
        string command = "";
         if (Session["type"].ToString() == "Administrator")
        {
            command = "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:30:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101)              SELECT  count(tbl_meeting_details.lead_id)as myly from tbl_meeting_details   where (tbl_meeting_details.md>@date_new) and tbl_meeting_details.status='0' and type!='Converted'";
        }
        if (Session["type"].ToString() == "User")
        {
            command = "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:30:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101)              SELECT  count(tbl_meeting_details.lead_id)as myly from tbl_meeting_details   where (tbl_meeting_details.md>@date_new) and tbl_meeting_details.status='0' and type!='Converted' and assign_to in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "')";
        }
          
            SqlDataAdapter adap = new SqlDataAdapter(command, con);
            DataSet ds = new DataSet();
            adap.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dr = ds.Tables[0].Rows[0];
                Span10.InnerText = dr["myly"].ToString();
            }
            else
            {
                Span10.InnerText = "0";
            }
        
    }

    //lead//
    public void bind_dashboard57()
    {
        string command = "";
        if (Session["type"].ToString() == "Administrator")
        {
            command = "Select  count(id)as myly from tbl_medors_lead_master where ctype='Converted' ";
        }
        if (Session["type"].ToString() == "User")
        {
            command = "Select  count(id)as myly from tbl_medors_lead_master where ctype='Converted' and assigned_to in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "') ";
        }
            SqlDataAdapter adap = new SqlDataAdapter(command, con);
            DataSet ds = new DataSet();
            adap.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dr = ds.Tables[0].Rows[0];
                Span1.InnerText = dr["myly"].ToString();
            }
            else
            {
                Span1.InnerText = "0";
            }
        
    }
    public void bind_dashboard58()
    {
        string command = "";
        if (Session["type"].ToString() == "Administrator")
        {
            command = "Select  count(id)as myly from tbl_medors_lead_master where ctype='On going' ";
        }
        if (Session["type"].ToString() == "User")
        {
            command = "Select  count(id)as myly from tbl_medors_lead_master where ctype='On going' and assigned_to in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "') ";
        }
          
            SqlDataAdapter adap = new SqlDataAdapter(command, con);
            DataSet ds = new DataSet();
            adap.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dr = ds.Tables[0].Rows[0];
                Span4.InnerText = dr["myly"].ToString();
            }
            else
            {
                Span4.InnerText = "0";
            }
        
    }
    public void bind_dashboard59()
    {
        string command = "";
           if (Session["type"].ToString() == "Administrator")
        {
            command = "Select  count(id)as myly from tbl_medors_lead_master where ctype='Rejected' ";
        }
        if (Session["type"].ToString() == "User")
        {
            command = "Select  count(id)as myly from tbl_medors_lead_master where ctype='Rejected' and assigned_to in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "') ";
        }
            SqlDataAdapter adap = new SqlDataAdapter(command, con);
            DataSet ds = new DataSet();
            adap.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dr = ds.Tables[0].Rows[0];
                Span5.InnerText = dr["myly"].ToString();
            }
            else
            {
                Span5.InnerText = "0";
            }
        
    }


    string commnd, commnd1, commnd2, commnd3, commnd4, commnd5, commnd6, commnd7, commnd8, commnd9, commnd10 , commnd11, commnd12 = "";
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lbluser_id = e.Row.FindControl("lbluser_id") as Label;
            Label apr = e.Row.FindControl("Label1") as Label;
            Label may = e.Row.FindControl("Label2") as Label;
            Label june = e.Row.FindControl("Label3") as Label;
            Label july = e.Row.FindControl("Label4") as Label;
            Label aug = e.Row.FindControl("Label5") as Label;
            Label sep = e.Row.FindControl("Label6") as Label;
            Label oct = e.Row.FindControl("Label7") as Label;
            Label nov = e.Row.FindControl("Label8") as Label;
            Label dec = e.Row.FindControl("Label9") as Label;
            Label jan = e.Row.FindControl("Label10") as Label;
            Label feb = e.Row.FindControl("Label11") as Label;
            Label mar = e.Row.FindControl("Label12") as Label;

            Label apr1 = e.Row.FindControl("Label51") as Label;
            Label may2 = e.Row.FindControl("Label52") as Label;
            Label june3 = e.Row.FindControl("Label53") as Label;
            Label july4 = e.Row.FindControl("Label54") as Label;
            Label aug5 = e.Row.FindControl("Label55") as Label;
            Label sep6 = e.Row.FindControl("Label56") as Label;
            Label oct7 = e.Row.FindControl("Label57") as Label;
            Label nov8 = e.Row.FindControl("Label58") as Label;
            Label dec9 = e.Row.FindControl("Label59") as Label;
            Label jan10 = e.Row.FindControl("Label60") as Label;
            Label feb11 = e.Row.FindControl("Label61") as Label;
            Label mar12 = e.Row.FindControl("Label62") as Label;

            Label lbltarget = e.Row.FindControl("lbltarget") as Label;
            Label lblachived = e.Row.FindControl("lblachived") as Label;
            Label lblbalance = e.Row.FindControl("lblbalance") as Label;

            if (Session["type"].ToString() == "Administrator")
            {
                commnd = "select isnull(sum(gtotal),0)as gtotal from tbl_order_history where month(date)='04' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + lbluser_id.Text + "'";
                commnd1 = "select isnull(sum(gtotal),0)as gtotal from tbl_order_history where month(date)='05' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + lbluser_id.Text + "'";
                commnd2 = "select isnull(sum(gtotal),0)as gtotal from tbl_order_history where month(date)='06' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + lbluser_id.Text + "'";
                commnd3 = "select isnull(sum(gtotal),0)as gtotal from tbl_order_history where month(date)='07' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + lbluser_id.Text + "'";
                commnd4 = "select isnull(sum(gtotal),0)as gtotal from tbl_order_history where month(date)='08' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + lbluser_id.Text + "'";
                commnd5 = "select isnull(sum(gtotal),0)as gtotal from tbl_order_history where month(date)='09' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + lbluser_id.Text + "'";
                commnd6 = "select isnull(sum(gtotal),0)as gtotal from tbl_order_history where month(date)='10' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + lbluser_id.Text + "'";
                commnd7 = "select isnull(sum(gtotal),0)as gtotal from tbl_order_history where month(date)='11' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + lbluser_id.Text + "'";
                commnd8 = "select isnull(sum(gtotal),0)as gtotal from tbl_order_history where month(date)='12' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + lbluser_id.Text + "'";
                commnd9 = "select isnull(sum(gtotal),0)as gtotal from tbl_order_history where month(date)='01' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + lbluser_id.Text + "'";
                commnd10 = "select isnull(sum(gtotal),0)as gtotal from tbl_order_history where month(date)='02' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + lbluser_id.Text + "'";
                commnd11 = "select isnull(sum(gtotal),0)as gtotal from tbl_order_history where month(date)='03' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + lbluser_id.Text + "'";

              
            }
            if (Session["type"].ToString() == "User")
            {
                commnd = "select isnull(sum(gtotal),0)as gtotal from tbl_order_history where month(date)='04' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + Session["Username"].ToString() + "'";
                commnd1 = "select isnull(sum(gtotal),0)as gtotal from tbl_order_history where month(date)='05' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + Session["Username"].ToString() + "'";
                commnd2 = "select isnull(sum(gtotal),0)as gtotal from tbl_order_history where month(date)='06' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + Session["Username"].ToString() + "'";
                commnd3 = "select isnull(sum(gtotal),0)as gtotal from tbl_order_history where month(date)='07' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + Session["Username"].ToString() + "'";
                commnd4 = "select isnull(sum(gtotal),0)as gtotal from tbl_order_history where month(date)='08' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + Session["Username"].ToString() + "'";
                commnd5 = "select isnull(sum(gtotal),0)as gtotal from tbl_order_history where month(date)='09' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + Session["Username"].ToString() + "'";
               
                commnd6 = "select isnull(sum(gtotal),0)as gtotal from tbl_order_history where month(date)='10' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + Session["Username"].ToString() + "'";
                commnd7 = "select isnull(sum(gtotal),0)as gtotal from tbl_order_history where month(date)='11' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + Session["Username"].ToString() + "'";
                commnd8 = "select isnull(sum(gtotal),0)as gtotal from tbl_order_history where month(date)='12' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + Session["Username"].ToString() + "'";
                commnd9 = "select isnull(sum(gtotal),0)as gtotal from tbl_order_history where month(date)='01' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + Session["Username"].ToString() + "'";
                commnd10 = "select isnull(sum(gtotal),0)as gtotal from tbl_order_history where month(date)='02' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + Session["Username"].ToString() + "'";
                commnd11 = "select isnull(sum(gtotal),0)as gtotal from tbl_order_history where month(date)='03' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + Session["Username"].ToString() + "'";

              
            }
            SqlCommand cmd1 = con.CreateCommand();
            SqlCommand cmd2 = con.CreateCommand();
            SqlCommand cmd3 = con.CreateCommand();
            SqlCommand cmd4 = con.CreateCommand();
            SqlCommand cmd5 = con.CreateCommand();
            SqlCommand cmd6 = con.CreateCommand();
            SqlCommand cmd7 = con.CreateCommand();
            SqlCommand cmd8 = con.CreateCommand();
            SqlCommand cmd9 = con.CreateCommand();
            SqlCommand cmd10 = con.CreateCommand();
            SqlCommand cmd11 = con.CreateCommand();
            SqlCommand cmd12 = con.CreateCommand();
          
            con.Open();
            cmd1.CommandText = commnd;
            cmd2.CommandText = commnd1;
            cmd3.CommandText = commnd2;
            cmd4.CommandText = commnd3;
            cmd5.CommandText = commnd4;
            cmd6.CommandText = commnd5;
            cmd7.CommandText = commnd6;
            cmd8.CommandText = commnd7;
            cmd9.CommandText = commnd8;
            cmd10.CommandText = commnd9;
            cmd11.CommandText = commnd10;
            cmd12.CommandText = commnd11;
           

            apr.Text = double.Parse (cmd1.ExecuteScalar().ToString()).ToString("n2");
            may.Text = double.Parse(cmd2.ExecuteScalar().ToString()).ToString("n2");
            june.Text = double.Parse(cmd3.ExecuteScalar().ToString()).ToString("n2");
            july.Text = double.Parse(cmd4.ExecuteScalar().ToString()).ToString("n2");
            aug.Text = double.Parse(cmd5.ExecuteScalar().ToString()).ToString("n2");
            sep.Text = double.Parse(cmd6.ExecuteScalar().ToString()).ToString("n2");
            oct.Text = double.Parse(cmd7.ExecuteScalar().ToString()).ToString("n2");
            nov.Text = double.Parse(cmd8.ExecuteScalar().ToString()).ToString("n2");
            dec.Text = double.Parse(cmd9.ExecuteScalar().ToString()).ToString("n2");
            jan.Text = double.Parse(cmd10.ExecuteScalar().ToString()).ToString("n2");
            feb.Text = double.Parse(cmd11.ExecuteScalar().ToString()).ToString("n2");
            mar.Text = double.Parse(cmd12.ExecuteScalar().ToString()).ToString("n2");

           

            double a = double.Parse(apr.Text) + double.Parse(may.Text) + double.Parse(june.Text) + double.Parse(july.Text) + double.Parse(aug.Text) + double.Parse(sep.Text) + double.Parse(oct.Text) + double.Parse(nov.Text) + double.Parse(dec.Text) + double.Parse(jan.Text) + double.Parse(feb.Text) + double.Parse(mar.Text);

            double a1 = double.Parse(apr1.Text) + double.Parse(may2.Text) + double.Parse(june3.Text) + double.Parse(july4.Text) + double.Parse(aug5.Text) + double.Parse(sep6.Text) + double.Parse(oct7.Text) + double.Parse(nov8.Text) + double.Parse(dec9.Text) + double.Parse(jan10.Text) + double.Parse(feb11.Text) + double.Parse(mar12.Text);

            lblachived.Text = a.ToString("n2");
            lbltarget.Text = a1.ToString("n2");

            lblbalance.Text = (a1 - a).ToString("n2");

            con.Close();
        }
    }
    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lbluser_id = e.Row.FindControl("lbluser_id1") as Label;
            Label apr = e.Row.FindControl("Label13") as Label;
            Label may = e.Row.FindControl("Label14") as Label;
            Label june = e.Row.FindControl("Label15") as Label;
            Label july = e.Row.FindControl("Label16") as Label;
            Label aug = e.Row.FindControl("Label17") as Label;
            Label sep = e.Row.FindControl("Label18") as Label;
            Label oct = e.Row.FindControl("Label19") as Label;
            Label nov = e.Row.FindControl("Label20") as Label;
            Label dec = e.Row.FindControl("Label21") as Label;
            Label jan = e.Row.FindControl("Label22") as Label;
            Label feb = e.Row.FindControl("Label23") as Label;
            Label mar = e.Row.FindControl("Label24") as Label;

            Label apr1 = e.Row.FindControl("Label71") as Label;
            Label may2 = e.Row.FindControl("Label72") as Label;
            Label june3 = e.Row.FindControl("Label73") as Label;
            Label july4 = e.Row.FindControl("Label74") as Label;
            Label aug5 = e.Row.FindControl("Label75") as Label;
            Label sep6 = e.Row.FindControl("Label76") as Label;
            Label oct7 = e.Row.FindControl("Label77") as Label;
            Label nov8 = e.Row.FindControl("Label78") as Label;
            Label dec9 = e.Row.FindControl("Label79") as Label;
            Label jan10 = e.Row.FindControl("Label80") as Label;
            Label feb11 = e.Row.FindControl("Label81") as Label;
            Label mar12 = e.Row.FindControl("Label82") as Label;

            Label lbltarget = e.Row.FindControl("lbltarget1") as Label;
            Label lblachived = e.Row.FindControl("lblachived1") as Label;
            Label lblbalance = e.Row.FindControl("lblbalance1") as Label;

            if (Session["type"].ToString() == "Administrator")
            {
                commnd = "select isnull(count(id),0)as id from tbl_meeting_details where month(date)='04' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + lbluser_id.Text + "'";
                commnd1 = "select isnull(count(id),0)as id from tbl_meeting_details where month(date)='05' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + lbluser_id.Text + "'";
                commnd2 = "select isnull(count(id),0)as id from tbl_meeting_details where month(date)='06' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + lbluser_id.Text + "'";
                commnd3 = "select isnull(count(id),0)as id from tbl_meeting_details where month(date)='07' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + lbluser_id.Text + "'";
                commnd4 = "select isnull(count(id),0)as id from tbl_meeting_details where month(date)='08' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + lbluser_id.Text + "'";
                commnd5 = "select isnull(count(id),0)as id from tbl_meeting_details where month(date)='09' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + lbluser_id.Text + "'";
                commnd6 = "select isnull(count(id),0)as id from tbl_meeting_details where month(date)='10' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + lbluser_id.Text + "'";
                commnd7 = "select isnull(count(id),0)as id from tbl_meeting_details where month(date)='11' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + lbluser_id.Text + "'";
                commnd8 = "select isnull(count(id),0)as id from tbl_meeting_details where month(date)='12' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + lbluser_id.Text + "'";
                commnd9 = "select isnull(count(id),0)as id from tbl_meeting_details where month(date)='01' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + lbluser_id.Text + "'";
                commnd10 = "select isnull(count(id),0)as id from tbl_meeting_details where month(date)='02' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + lbluser_id.Text + "'";
                commnd11 = "select isnull(count(id),0)as id from tbl_meeting_details where month(date)='03' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + lbluser_id.Text + "'";
            }
            if (Session["type"].ToString() == "User")
            {
                commnd = "select isnull(count(id),0)as id from tbl_meeting_details where month(date)='04' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + Session["Username"].ToString() + "'";
                commnd1 = "select isnull(count(id),0)as id from tbl_meeting_details where month(date)='05' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + Session["Username"].ToString() + "'";
                commnd2 = "select isnull(count(id),0)as id from tbl_meeting_details where month(date)='06' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + Session["Username"].ToString() + "'";
                commnd3 = "select isnull(count(id),0)as id from tbl_meeting_details where month(date)='07' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + Session["Username"].ToString() + "'";
                commnd4 = "select isnull(count(id),0)as id from tbl_meeting_details where month(date)='08' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + Session["Username"].ToString() + "'";
                commnd5 = "select isnull(count(id),0)as id from tbl_meeting_details where month(date)='09' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + Session["Username"].ToString() + "'";

                commnd6 = "select isnull(count(id),0)as id from tbl_meeting_details where month(date)='10' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + Session["Username"].ToString() + "'";
                commnd7 = "select isnull(count(id),0)as id from tbl_meeting_details where month(date)='11' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + Session["Username"].ToString() + "'";
                commnd8 = "select isnull(count(id),0)as id from tbl_meeting_details where month(date)='12' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + Session["Username"].ToString() + "'";
                commnd9 = "select isnull(count(id),0)as id from tbl_meeting_details where month(date)='01' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + Session["Username"].ToString() + "'";
                commnd10 = "select isnull(count(id),0)as id from tbl_meeting_details where month(date)='02' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + Session["Username"].ToString() + "'";
                commnd11 = "select isnull(count(id),0)as id from tbl_meeting_details where month(date)='03' and year(date)='" + System.DateTime.Now.Year + "' and created_by='" + Session["Username"].ToString() + "'";
            }
            SqlCommand cmd1 = con.CreateCommand();
            SqlCommand cmd2 = con.CreateCommand();
            SqlCommand cmd3 = con.CreateCommand();
            SqlCommand cmd4 = con.CreateCommand();
            SqlCommand cmd5 = con.CreateCommand();
            SqlCommand cmd6 = con.CreateCommand();
            SqlCommand cmd7 = con.CreateCommand();
            SqlCommand cmd8 = con.CreateCommand();
            SqlCommand cmd9 = con.CreateCommand();
            SqlCommand cmd10 = con.CreateCommand();
            SqlCommand cmd11 = con.CreateCommand();
            SqlCommand cmd12 = con.CreateCommand();
            con.Open();
            cmd1.CommandText = commnd;
            cmd2.CommandText = commnd1;
            cmd3.CommandText = commnd2;
            cmd4.CommandText = commnd3;
            cmd5.CommandText = commnd4;
            cmd6.CommandText = commnd5;
            cmd7.CommandText = commnd6;
            cmd8.CommandText = commnd7;
            cmd9.CommandText = commnd8;
            cmd10.CommandText = commnd9;
            cmd11.CommandText = commnd10;
            cmd12.CommandText = commnd11;

            apr.Text = double.Parse(cmd1.ExecuteScalar().ToString()).ToString("n0");
            may.Text = double.Parse(cmd2.ExecuteScalar().ToString()).ToString("n0");
            june.Text = double.Parse(cmd3.ExecuteScalar().ToString()).ToString("n0");
            july.Text = double.Parse(cmd4.ExecuteScalar().ToString()).ToString("n0");
            aug.Text = double.Parse(cmd5.ExecuteScalar().ToString()).ToString("n0");
            sep.Text = double.Parse(cmd6.ExecuteScalar().ToString()).ToString("n0");
            oct.Text = double.Parse(cmd7.ExecuteScalar().ToString()).ToString("n0");
            nov.Text = double.Parse(cmd8.ExecuteScalar().ToString()).ToString("n0");
            dec.Text = double.Parse(cmd9.ExecuteScalar().ToString()).ToString("n0");
            jan.Text = double.Parse(cmd10.ExecuteScalar().ToString()).ToString("n0");
            feb.Text = double.Parse(cmd11.ExecuteScalar().ToString()).ToString("n0");
            mar.Text = double.Parse(cmd12.ExecuteScalar().ToString()).ToString("n0");


            double a = double.Parse(apr.Text) + double.Parse(may.Text) + double.Parse(june.Text) + double.Parse(july.Text) + double.Parse(aug.Text) + double.Parse(sep.Text) + double.Parse(oct.Text) + double.Parse(nov.Text) + double.Parse(dec.Text) + double.Parse(jan.Text) + double.Parse(feb.Text) + double.Parse(mar.Text);

            double a1 = double.Parse(apr1.Text) + double.Parse(may2.Text) + double.Parse(june3.Text) + double.Parse(july4.Text) + double.Parse(aug5.Text) + double.Parse(sep6.Text) + double.Parse(oct7.Text) + double.Parse(nov8.Text) + double.Parse(dec9.Text) + double.Parse(jan10.Text) + double.Parse(feb11.Text) + double.Parse(mar12.Text);

           
            lbltarget.Text = a1.ToString("n0");
            lblachived.Text = a.ToString("n0");
            lblbalance.Text = (a1 - a).ToString("n0");
            con.Close();
        }
    }
    protected void GridView1_PreRender(object sender, EventArgs e)
    {
        foreach (GridViewRow row in GridView1.Rows)
        {
            if (System.DateTime.Now.Month==4)
            {
                row.Cells[3].BackColor = ColorTranslator.FromHtml("#fec200");
                row.Cells[4].BackColor = ColorTranslator.FromHtml("#fec200");
            }
            if (System.DateTime.Now.Month == 5)
            {
                row.Cells[5].BackColor = ColorTranslator.FromHtml("#fec200");
                row.Cells[6].BackColor = ColorTranslator.FromHtml("#fec200");
            }
            if (System.DateTime.Now.Month == 6)
            {
                row.Cells[7].BackColor = ColorTranslator.FromHtml("#fec200");
                row.Cells[8].BackColor = ColorTranslator.FromHtml("#fec200");
            }
            if (System.DateTime.Now.Month == 7)
            {
                row.Cells[9].BackColor = ColorTranslator.FromHtml("#fec200");
                row.Cells[10].BackColor = ColorTranslator.FromHtml("#fec200");
            }
            if (System.DateTime.Now.Month == 8)
            {
                row.Cells[11].BackColor = ColorTranslator.FromHtml("#fec200");
                row.Cells[12].BackColor = ColorTranslator.FromHtml("#fec200");
            }
            if (System.DateTime.Now.Month == 9)
            {
                row.Cells[13].BackColor = ColorTranslator.FromHtml("#fec200");
                row.Cells[14].BackColor = ColorTranslator.FromHtml("#fec200");
            }
            if (System.DateTime.Now.Month == 10)
            {
                row.Cells[15].BackColor = ColorTranslator.FromHtml("#fec200");
                row.Cells[16].BackColor = ColorTranslator.FromHtml("#fec200");
            }
            if (System.DateTime.Now.Month == 11)
            {
                row.Cells[17].BackColor = ColorTranslator.FromHtml("#fec200");
                row.Cells[18].BackColor = ColorTranslator.FromHtml("#fec200");
            }
            if (System.DateTime.Now.Month == 12)
            {
                row.Cells[19].BackColor = ColorTranslator.FromHtml("#fec200");
                row.Cells[20].BackColor = ColorTranslator.FromHtml("#fec200");
            }
            if (System.DateTime.Now.Month == 1)
            {
                row.Cells[21].BackColor = ColorTranslator.FromHtml("#fec200");
                row.Cells[22].BackColor = ColorTranslator.FromHtml("#fec200");
            }
            if (System.DateTime.Now.Month == 2)
            {
                row.Cells[23].BackColor = ColorTranslator.FromHtml("#fec200");
                row.Cells[24].BackColor = ColorTranslator.FromHtml("#fec200");
            }
            if (System.DateTime.Now.Month == 3)
            {
                row.Cells[25].BackColor = ColorTranslator.FromHtml("#fec200");
                row.Cells[26].BackColor = ColorTranslator.FromHtml("#fec200");
            }
            
        }
    }
    protected void GridView2_PreRender(object sender, EventArgs e)
    {
        foreach (GridViewRow row in GridView2.Rows)
        {
            if (System.DateTime.Now.Month == 4)
            {
                row.Cells[3].BackColor = ColorTranslator.FromHtml("#fec200");
                row.Cells[4].BackColor = ColorTranslator.FromHtml("#fec200");
            }
            if (System.DateTime.Now.Month == 5)
            {
                row.Cells[5].BackColor = ColorTranslator.FromHtml("#fec200");
                row.Cells[6].BackColor = ColorTranslator.FromHtml("#fec200");
            }
            if (System.DateTime.Now.Month == 6)
            {
                row.Cells[7].BackColor = ColorTranslator.FromHtml("#fec200");
                row.Cells[8].BackColor = ColorTranslator.FromHtml("#fec200");
            }
            if (System.DateTime.Now.Month == 7)
            {
                row.Cells[9].BackColor = ColorTranslator.FromHtml("#fec200");
                row.Cells[10].BackColor = ColorTranslator.FromHtml("#fec200");
            }
            if (System.DateTime.Now.Month == 8)
            {
                row.Cells[11].BackColor = ColorTranslator.FromHtml("#fec200");
                row.Cells[12].BackColor = ColorTranslator.FromHtml("#fec200");
            }
            if (System.DateTime.Now.Month == 9)
            {
                row.Cells[13].BackColor = ColorTranslator.FromHtml("#fec200");
                row.Cells[14].BackColor = ColorTranslator.FromHtml("#fec200");
            }
            if (System.DateTime.Now.Month == 10)
            {
                row.Cells[15].BackColor = ColorTranslator.FromHtml("#fec200");
                row.Cells[16].BackColor = ColorTranslator.FromHtml("#fec200");
            }
            if (System.DateTime.Now.Month == 11)
            {
                row.Cells[17].BackColor = ColorTranslator.FromHtml("#fec200");
                row.Cells[18].BackColor = ColorTranslator.FromHtml("#fec200");
            }
            if (System.DateTime.Now.Month == 12)
            {
                row.Cells[19].BackColor = ColorTranslator.FromHtml("#fec200");
                row.Cells[20].BackColor = ColorTranslator.FromHtml("#fec200");
            }
            if (System.DateTime.Now.Month == 1)
            {
                row.Cells[21].BackColor = ColorTranslator.FromHtml("#fec200");
                row.Cells[22].BackColor = ColorTranslator.FromHtml("#fec200");
            }
            if (System.DateTime.Now.Month == 2)
            {
                row.Cells[23].BackColor = ColorTranslator.FromHtml("#fec200");
                row.Cells[24].BackColor = ColorTranslator.FromHtml("#fec200");
            }
            if (System.DateTime.Now.Month == 3)
            {
                row.Cells[25].BackColor = ColorTranslator.FromHtml("#fec200");
                row.Cells[26].BackColor = ColorTranslator.FromHtml("#fec200");
            }

        }
    }
}