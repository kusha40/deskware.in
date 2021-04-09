using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Media;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

public partial class Dashboard : System.Web.UI.Page
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
        user_type = Session["type"].ToString();
        name = Session["username"].ToString();

        if (!IsPostBack)
        {
            if (user_type == "Administrator")
            {
                tbl1.Visible = true;
                //and date=@date_new 
                cls.gridbind(GridView2, "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:30:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101) select * from tbl_dealer_discount_approve_details where status='Not Approved' and discount!='0.00'  order by date asc");

                cls.bind_ddl(ddldealer, "Select distinct dealer_name,dealer_id from tbl_dealer_ledger_master order by dealer_name asc", "dealer_name", "dealer_id");

                cls.gridbind(GridView1, "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:30:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101) select * from tbl_permission_expense_Approval where status='Not Approved' and amount!='0.00'   order by date asc");

                cls.gridbind(GridView3, "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:30:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101) select * from tbl_checking_expense_Approval where status='Not Approved' and amount!='0.00'   order by date asc");
                img1.Visible = true;
                Panel2.Visible = true;
            }
            else
            {
                tbl1.Visible = false;
                img1.Visible = false;
                   
            }
            if (Session["Username"].ToString() == "accounts" || Session["Username"].ToString() == "Accounts" || Session["Username"].ToString() == "ACCOUNTS" || Session["Username"].ToString() == "amit001" || Session["Username"].ToString() == "as001" || Session["Username"].ToString() == "mu001")
            {
                tbl1.Visible = false;
                img1.Visible = false;
                Panel2.Visible = false;
                a5.Visible = true;
            }
            if (user_type == "Executive")
            {
                img1.Visible = false;
                Panel2.Visible = false;
            }
           

            if (Session["Username"].ToString() == "amit-pat")
            {
                img1.Visible = true;
                tbl1.Visible = true;
                pnl.Visible =   true;
                cls.gridbind(GridView2, "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:30:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101) select * from tbl_dealer_discount_approve_details where status='Not Approved' and discount!='0.00'  order by date asc");

                cls.bind_ddl(ddldealer, "Select distinct dealer_name,dealer_id from tbl_dealer_ledger_master order by dealer_name asc", "dealer_name", "dealer_id");

                cls.gridbind(GridView1, "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:30:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101) select * from tbl_permission_expense_Approval where status='Not Approved' and amount!='0.00'   order by date asc");

                cls.gridbind(GridView3, "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:30:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101) select * from tbl_checking_expense_Approval where status='Not Approved' and amount!='0.00'   order by date asc");


                Panel1.Visible = false;
                thp.Visible = false;
            }
            if (Session["Username"].ToString() == "satish-pat")
            {
                tda.Visible = false;
                img1.Visible = true;
                tbl1.Visible = true;
                Panel1.Visible = true;
                pnl.Visible = false;
                td1.Visible = false;
                cls.gridbind(GridView1, "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:30:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101) select * from tbl_permission_expense_Approval where status='Not Approved' and amount!='0.00'   order by date asc");
            }
            if (Session["Username"].ToString() != "admin")
            {
                Panel2.Visible = false;
            }

            if (Session["Username"].ToString() == "amit001" || Session["Username"].ToString() == "mu001")
            {
                a2.Visible = true;
            }
        }
    }
    
    string query1, query2, query3 = "";
   

   //[WebMethod(EnableSession = true)]
   // public static List<object> GetChartData()
   // {
   //     string type = (string)HttpContext.Current.Session["type"];
   //     string name = (string)HttpContext.Current.Session["Username"];
   //     string query = "";
   //     if (type == "Executive")
   //     {
   //         query = string.Format(" select customer_type+'-'+cast(count(id) As varchar)as totl,count(id) as qty from enquiry_master where (assigned_by='" + name + "' or created_by='" + name + "')  group by customer_type");
   //     }
   //     else if (type == "Administrator")
   //     {
   //         query = string.Format(" select customer_type+'-'+cast(count(id) As varchar)as totl,count(id) as qty from enquiry_master group by customer_type");
   //     }
   //     else if (type == "Manager")
   //     {
   //        // query = string.Format(" select customer_type+'-'+cast(count(id) As varchar)as totl,count(id) as qty from enquiry_master where manager='" + name + "' group by customer_type");
   //     }
   //     string constr = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
   //     List<object> chartData = new List<object>();
   //     chartData.Add(new object[]
   //     {
   //         "totl", "qty" 
   //     });
   //     using (SqlConnection con = new SqlConnection(constr))
   //     {
   //         using (SqlCommand cmd = new SqlCommand(query))
   //         {
   //             cmd.CommandType = CommandType.Text;
   //             cmd.Connection = con;
   //             con.Open();
   //             using (SqlDataReader sdr = cmd.ExecuteReader())
   //             {
   //                 while (sdr.Read())
   //                 {
   //                     chartData.Add(new object[]
   //                 {
   //                     sdr["totl"], sdr["qty"] 
   //                 });
   //                 }
   //             }
   //             con.Close();
   //             return chartData;
   //         }
   //     }
   // }

   //[WebMethod(EnableSession = true)]
   //public static List<object> GetChartData1()
   //{
   //    string user_type = (string)HttpContext.Current.Session["type"];
   //    string name = (string)HttpContext.Current.Session["Username"];
   //    string query2 = "";
   //    if (user_type == "Executive")
   //    {

   //        //query2 = string.Format("DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:30:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101)select 'Today-'+Cast(Count(follow_up_master.customer_id)As varchar) as qty,Count(follow_up_master.customer_id)as totl from follow_up_master where (follow_up_master.next_followup_date=@date_new  or  datediff(day,follow_up_master.next_followup_date,@date_new)>@date_new)  and follow_up_master.status=0 and follow_up_master.created_by='" + name + "'  union all  select 'Pending-'+Cast(Count(follow_up_master.customer_id)As varchar)as qty ,Count(follow_up_master.customer_id)as totl from follow_up_master where  datediff(day,next_followup_date,@date_new)>0  and follow_up_master.status=0    and follow_up_master.next_followup_date!='01/01/1900'  and customer_id  in  (select customer_id from enquiry_master where customer_type!='Close') and follow_up_master.created_by='" + name + "' union all select 'Future-'+Cast(Count(follow_up_master.customer_id)As varchar)as qty,Count(follow_up_master.customer_id)as totl from follow_up_master where (follow_up_master.next_followup_date>@date_new)  and follow_up_master.status=0 and follow_up_master.created_by='" + name + "'");

   //        query2 = string.Format("DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:30:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101)       select 'Today-'+Cast(Count(follow_up_master.customer_id)As varchar) as qty,Count(follow_up_master.customer_id)as totl from follow_up_master where (follow_up_master.next_followup_date=@date_new  or  datediff(day,follow_up_master.next_followup_date,@date_new)>@date_new)  and follow_up_master.status=0 and customer_id in (select customer_id from  enquiry_master where created_by='" + name + "' or assigned_by ='" + name + "'  )          union all  select 'Pending-'+Cast(Count(follow_up_master.customer_id)As varchar)as qty ,Count(follow_up_master.customer_id)as totl from follow_up_master where  datediff(day,next_followup_date,@date_new)>0  and follow_up_master.status=0    and follow_up_master.next_followup_date!='01/01/1900'   and customer_id in (select customer_id from  enquiry_master where created_by='" + name + "' or assigned_by ='" + name + "'  ) union all select 'Future-'+Cast(Count(follow_up_master.customer_id)As varchar)as qty,Count(follow_up_master.customer_id)as totl from follow_up_master where (follow_up_master.next_followup_date>@date_new)  and follow_up_master.status=0 and customer_id in (select customer_id from  enquiry_master where created_by='" + name + "' or assigned_by ='" + name + "'  )");

   //    }
   //    else if (user_type == "Administrator")
   //    {

   //        query2 = string.Format("DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:30:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101)select 'Today-'+Cast(Count(follow_up_master.customer_id)As varchar)as qty,Count(follow_up_master.customer_id)as totl from follow_up_master where (follow_up_master.next_followup_date=@date_new  or  datediff(day,follow_up_master.next_followup_date,@date_new)>@date_new)  and follow_up_master.status=0union all            select 'Pending-'+Cast(Count(follow_up_master.customer_id)As varchar)as qty,Count(follow_up_master.customer_id)as totl from follow_up_master where datediff(day,next_followup_date,@date_new)>0  and follow_up_master.status=0    and follow_up_master.next_followup_date!='01/01/1900'  and customer_id  in  (select customer_id from enquiry_master where customer_type!='Close')union all select 'Future-'+Cast(Count(follow_up_master.customer_id)As varchar)as qty,Count(follow_up_master.customer_id)as totl from follow_up_master where (follow_up_master.next_followup_date>@date_new)  and follow_up_master.status=0");
   //    }
   //    else if (user_type == "Manager")
   //    {
   //      //  query2 = string.Format("DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:30:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101)  SELECT  'Today-'+Cast(Count(enquiry_master.id)As varchar)as qty,Count(enquiry_master.id)as totl FROM enquiry_master INNER JOIN follow_up_master ON enquiry_master.customer_id = follow_up_master.customer_id where  where (follow_up_master.next_followup_date=@date_new  or  datediff(day,follow_up_master.next_followup_date,@date_new)>@date_new)  and follow_up_master.status=0 and customer_type!='Close' and enquiry_master.manager='" + name + "' union all SELECT  'Pending-'+Cast(Count(enquiry_master.id)As varchar)as qty,Count(enquiry_master.id)as totl FROM enquiry_master INNER JOIN follow_up_master ON enquiry_master.customer_id = follow_up_master.customer_id where  datediff(day,next_followup_date,@date_new)>0  and follow_up_master.status=0    and follow_up_master.next_followup_date!='01/01/1900'  and customer_id  in  (select customer_id from enquiry_master where customer_type!='Close')  and enquiry_master.customer_type!='Close' and enquiry_master.manager='" + name + "' union all select 'Future-'+Cast(Count(follow_up_master.customer_id)As varchar)as qty,Count(follow_up_master.customer_id)as totl from follow_up_master where (follow_up_master.next_followup_date>@date_new)  and follow_up_master.status=0");

   //    }
   //    string constr = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
   //    List<object> chartData = new List<object>();
   //    chartData.Add(new object[]
   //     {
   //         "qty", "totl" 
   //     });
   //    using (SqlConnection con = new SqlConnection(constr))
   //    {
   //        using (SqlCommand cmd = new SqlCommand(query2))
   //        {
   //            cmd.CommandType = CommandType.Text;
   //            cmd.Connection = con;
   //            con.Open();
   //            using (SqlDataReader sdr = cmd.ExecuteReader())
   //            {
   //                while (sdr.Read())
   //                {
   //                    chartData.Add(new object[]
   //                 {
   //                     sdr["qty"], sdr["totl"] 
   //                 });
   //                }
   //            }
   //            con.Close();
   //            return chartData;
   //        }
   //    }
   //}

   //[WebMethod(EnableSession = true)]
   //public static List<object> GetChartData2()
   //{
   //    string query = "";
   //    string name = (string)HttpContext.Current.Session["Username"];
   //    query = string.Format("DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:30:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101)select 'Today'+'-'+cast(count(id) As varchar)as totl,count(id)as qty from enquiry_master where  assigned_by='" + name + "' and assigned_status=1 and assigned_date=@date_new and customer_type!='Close' union select 'Pending'+'-'+cast(count(id) As varchar)as totl,count(id) as qty from enquiry_master where  assigned_by='" + name + "' and assigned_status=1 and datediff(day,assigned_date,@date_new)>0  and enquiry_master.customer_type!='Close'");
      
   //    string constr = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
   //    List<object> chartData = new List<object>();
   //    chartData.Add(new object[]
   //     {
   //         "totl", "qty" 
   //     });
   //    using (SqlConnection con = new SqlConnection(constr))
   //    {
   //        using (SqlCommand cmd = new SqlCommand(query))
   //        {
   //            cmd.CommandType = CommandType.Text;
   //            cmd.Connection = con;
   //            con.Open();
   //            using (SqlDataReader sdr = cmd.ExecuteReader())
   //            {
   //                while (sdr.Read())
   //                {
   //                    chartData.Add(new object[]
   //                 {
   //                     sdr["totl"], sdr["qty"] 
   //                 });
   //                }
   //            }
   //            con.Close();
   //            return chartData;
   //        }
   //    }
   //}

   //[WebMethod(EnableSession = true)]
   //public static List<object> GetChartData3()
   //{
   //    string query = "";
   //    string name = (string)HttpContext.Current.Session["Username"];
   //    query = string.Format("DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:30:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101)  SELECT  'Today-'+Cast(Count(todolist_master.id)As varchar)as qty,Count(todolist_master.id)as totl FROM todolist_master where  todolist_master.date=@date_new and todolist_master.status='Pending' and todolist_master.user_id='" + name + "' union all   SELECT  'Pending-'+Cast(Count(todolist_master.id)As varchar) as qty,Count(todolist_master.id)as totl FROM todolist_master where  datediff(day,todolist_master.date,@date_new)>0 and todolist_master.status='Pending' and todolist_master.user_id='" + name + "'");

   //    string constr = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
   //    List<object> chartData = new List<object>();
   //    chartData.Add(new object[]
   //     {
   //         "qty", "totl" 
   //     });
   //    using (SqlConnection con = new SqlConnection(constr))
   //    {
   //        using (SqlCommand cmd = new SqlCommand(query))
   //        {
   //            cmd.CommandType = CommandType.Text;
   //            cmd.Connection = con;
   //            con.Open();
   //            using (SqlDataReader sdr = cmd.ExecuteReader())
   //            {
   //                while (sdr.Read())
   //                {
   //                    chartData.Add(new object[]
   //                 {
   //                     sdr["qty"], sdr["totl"] 
   //                 });
   //                }
   //            }
   //            con.Close();
   //            return chartData;
   //        }
   //    }
   //}
 
    protected void GridView2_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView2.Rows[e.RowIndex];
        Label lbl_dealer_name = (Label)row.FindControl("lbl_dealer_name");
        Label lbl_discount = (Label)row.FindControl("lbl_discount");
        Label lbl_remarks = (Label)row.FindControl("lbl_remarks");
        Label dealer_id = (Label)row.FindControl("Label2");
        Label date = (Label)row.FindControl("Label1");
        //string date = System.DateTime.Now.ToString("MM/dd/yyyy");
        cmd = con.CreateCommand();
        con.Open();
        SqlCommand cmd1 = con.CreateCommand();
        cmd1.CommandText = "update tbl_dealer_discount_approve_details set status='Approved' where id='"+Convert.ToInt32(GridView2.DataKeys[e.RowIndex].Value.ToString())+"'";
        cmd.CommandText = "insert into tbl_dealer_ledger_master values('" + lbl_dealer_name.Text + "','" + dealer_id.Text + "','','" + lbl_discount.Text.Trim() + "','" + DateTime.ParseExact(date.Text, "dd-MM-yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "','','" + "Discount:" + lbl_remarks.Text.Trim() + "')";
        cmd.ExecuteNonQuery();
        cmd1.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Discount Approved Sucessfully');", true);
        cls.gridbind(GridView2, "select * from tbl_dealer_discount_approve_details where status='Not Approved' and discount!='0.00' order by date asc");
    }
    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "edit1")
        {
            cmd = con.CreateCommand();
            con.Open();
            cmd.CommandText = " delete tbl_dealer_discount_approve_details where id=" + e.CommandArgument.ToString() + "";
            cmd.ExecuteNonQuery();
            con.Close();
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Removed Sucessfully');", true);
            cls.gridbind(GridView2, "select * from tbl_dealer_discount_approve_details where status='Not Approved' and discount!='0.00' order by date asc");

        }
    }
    protected void btnsubmit1_Click(object sender, EventArgs e)
    {
        tbl1.Visible = true;
        cls.gridbind(GridView2, "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:30:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101) select * from tbl_dealer_discount_approve_details where status='Not Approved' and discount!='0.00' and dealer_id='" + ddldealer.SelectedValue + "' and date between '" + DateTime.ParseExact(txtfrom.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "' and '" + DateTime.ParseExact(txtto.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "'  order by date asc");

    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lbl_dealer_name1 = (Label)row.FindControl("lbl_dealer_name1");
        Label lbl_discount1 = (Label)row.FindControl("lbl_discount1");
        Label lbl_Remarks1 = (Label)row.FindControl("lbl_Remarks1");
        Label date = (Label)row.FindControl("Label11");
       // string date = System.DateTime.Now.ToString("MM/dd/yyyy");
        cmd = con.CreateCommand();
        con.Open();
        SqlCommand cmd1 = con.CreateCommand();
        cmd1.CommandText = "update tbl_permission_expense_Approval set status='Approved' where id='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'";
        cmd.CommandText = " insert into tbl_cash_ledger_master values ('" + lbl_dealer_name1.Text + "','','" + lbl_discount1.Text.Trim() + "','','" + DateTime.ParseExact(date.Text, "dd-MM-yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "','','" + lbl_Remarks1.Text + "')";

        if (lbl_dealer_name1.Text == "AGW")
        {
            SqlCommand cmd2 = con.CreateCommand();
            cmd2.CommandText = " insert into tbl_admin_cash_ledger_master values ('" + lbl_dealer_name1.Text + "','','" + lbl_discount1.Text.Trim() + "','" + DateTime.ParseExact(date.Text, "dd-MM-yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "','" + lbl_Remarks1.Text + "')";
            cmd2.ExecuteNonQuery();

        }



        cmd.ExecuteNonQuery();
        cmd1.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Approved Sucessfully');", true);
        cls.gridbind(GridView1, "select * from tbl_permission_expense_Approval where status='Not Approved' and amount!='0.00' order by date asc");
    }


    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "edit1")
        {
            cmd = con.CreateCommand();
            con.Open();
            cmd.CommandText = " delete tbl_permission_expense_Approval where id=" + e.CommandArgument.ToString() + "";
            cmd.ExecuteNonQuery();
            con.Close();
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Removed Sucessfully');", true);
            cls.gridbind(GridView1, "select * from tbl_permission_expense_Approval where status='Not Approved' and amount!='0.00' order by date asc");

        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        tbl1.Visible = true;
        cls.gridbind(GridView1, "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:30:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101) select * from tbl_permission_expense_Approval where status='Not Approved' and amount!='0.00' and date between '" + DateTime.ParseExact(TextBox1.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "' and '" + DateTime.ParseExact(TextBox2.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "'  order by date asc");
    }

    protected void GridView3_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView3.Rows[e.RowIndex];
        Label lbl_dealer_name1 = (Label)row.FindControl("lbl_dealer_name11");
        Label lbl_discount1 = (Label)row.FindControl("lbl_discount11");
        Label lbl_Remarks1 = (Label)row.FindControl("lbl_Remarks11");
        Label date = (Label)row.FindControl("Label111");
        // string date = System.DateTime.Now.ToString("MM/dd/yyyy");
        cmd = con.CreateCommand();
        con.Open();
        SqlCommand cmd1 = con.CreateCommand();
        cmd1.CommandText = "update tbl_checking_expense_Approval set status='Approved' where id='" + Convert.ToInt32(GridView3.DataKeys[e.RowIndex].Value.ToString()) + "'";

        cmd.CommandText = " insert into tbl_cash_ledger_master values ('" + lbl_dealer_name1.Text + "','','" + lbl_discount1.Text.Trim() + "','','" + DateTime.ParseExact(date.Text, "dd-MM-yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "','','" + lbl_Remarks1.Text + "')";

        cmd.ExecuteNonQuery();
        cmd1.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Approved Sucessfully');", true);
        cls.gridbind(GridView3, "select * from tbl_checking_expense_Approval where status='Not Approved' and amount!='0.00' order by date asc");
    }


    protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "edit1")
        {
            cmd = con.CreateCommand();
            con.Open();
            cmd.CommandText = " delete tbl_checking_expense_Approval where id=" + e.CommandArgument.ToString() + "";
            cmd.ExecuteNonQuery();
            con.Close();
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Removed Sucessfully');", true);
            cls.gridbind(GridView3, "select * from tbl_checking_expense_Approval where status='Not Approved' and amount!='0.00' order by date asc");

        }
    }
} 