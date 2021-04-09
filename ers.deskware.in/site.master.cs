using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class site : System.Web.UI.MasterPage
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
    SqlCommand cmd;
    Class1 cls = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] == null && Session["type"] == null )
        {
            Response.Redirect("~/login.aspx");
        }
        else
        {
         
            usrname.InnerText = Session["Username"].ToString();
            desig.InnerText =  Session["designation"].ToString();
            img.Src = Session["pic"].ToString();
            if (Session["type"].ToString() == "Administrator")
            {
                report_mis3.Visible = true;
                li1.Visible = true;
                Li6.Visible = true;
                a7.Visible = true;
            }
            reminder();
            Li6.Visible = true;
        }
    }

    string commnd = "";

    public void reminder()
    {


        if (Session["type"].ToString() != "Administrator")
        {
            string command = "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '00:00:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101) select * from tbl_todo where date=@date_new and created_by='" + Session["Username"].ToString() + "' and type='Self' and status='Pending' and req='' union all select * from tbl_todo where date=@date_new and assign_to='" + Session["Username"].ToString() + "' and type='Assign' and status='Pending' and req=''";
            SqlDataAdapter adap = new SqlDataAdapter(command, con);
            DataSet ds = new DataSet();
            adap.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dr = ds.Tables[0].Rows[0];
                Response.Write("<script>alert('You have a new to do Task . Please check to do List')</script>");
            }


            //ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Today Followup Reminder \\r\\nStudent ID :" + student_id + " \\r\\nName:" + name + " \\r\\nMobile No: " + mob_no + "\\r\\nEmail ID:"+email_id+"');", true);
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
         try
        {
            Session.Abandon();
            FormsAuthentication.SignOut();
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Buffer = true;
            Response.ExpiresAbsolute = DateTime.Now.AddDays(-1d);
            Response.Expires = -1000;
            Response.CacheControl = "no-cache";
            Response.Redirect("login.aspx", true);
        }
        catch (Exception er)
        {
            string test = er.Message.Replace("'", " ");
            Response.Write("<script>alert('" + test + "')</script>");
        }
    }
   
}

