using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class assign_lead : System.Web.UI.Page
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
            if (Session["type"].ToString() == "Administrator")
            {
                cls.gridbind(GridView1, "Select  * from tbl_medors_lead_master  order by date desc");
            }
            if (Session["type"].ToString() == "User")
            {
                cls.gridbind(GridView1, "Select  * from tbl_medors_lead_master where assigned_to in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "') order by date desc");
            }

            cls.bind_ddl(ddlassign, "select (name)as name,user_id from user_master where (type='Administrator' or type='User') and status='Active'  order by name asc ", "name", "user_id");
            cls.bind_ddl(DropDownList2, "select (name)as name,user_id from user_master where (type='Administrator' or type='User') and status='Active'  order by name asc ", "name", "user_id");
            cls.bind_ddl(DropDownList1, " select distinct type from tbl_lead_type_master order by type asc", "type", "type");
        }

    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;

        if (Session["type"].ToString() == "Administrator")
        {
            cls.gridbind(GridView1, "Select  * from tbl_medors_lead_master  order by date desc");
        }
        if (Session["type"].ToString() == "User")
        {
            cls.gridbind(GridView1, "Select  * from tbl_medors_lead_master where  assigned_to in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "') order by date desc");
        }
    }
    [WebMethod(EnableSession = true)]
    public static List<string> GetAutoCompleteData1(string username, string flag)
    {
        string st = flag;
        string commnd = "";
        string type = (string)HttpContext.Current.Session["type"];
        string name = (string)HttpContext.Current.Session["Username"];
        List<string> result = new List<string>();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
        if (type == "User")
        {
            commnd = "select (lead_id+' ~ '+fname+' ~ '+lname+' ~ '+email_id+' ~ '+mob) as Test from [tbl_medors_lead_master] where  (lead_id+' ~ '+fname+' ~ '+lname+' ~ '+email_id+' ~ '+mob) like '%'+@SearchText+'%' and  assigned_to in (select uid from tbl_team where aid='" + name + "')    ";
        }
        //else if (type == "Manager")
        //{
        //    commnd = "select (customer_id+' ~ '+customer_name+' ~ '+mob_no+' ~ '+email_id+' ~ '+requirement+' ~ '+state+' ~ '+created_by+' ~ '+district) as Test from [enquiry_master] where  (customer_id+' ~ '+customer_name+' ~ '+mob_no+' ~ '+email_id+' ~ '+requirement+' ~ '+state+' ~ '+created_by+' ~ '+district) like '%'+@SearchText+'%' and (manager='" + name + "' or created_by='" + name + "' or assigned_by='" + name + "')   ";
        //}
        else if (type == "Administrator")
        {
            commnd = "select (lead_id+' ~ '+fname+' ~ '+lname+' ~ '+email_id+' ~ '+mob) as Test from [tbl_medors_lead_master] where  (lead_id+' ~ '+fname+' ~ '+lname+' ~ '+email_id+' ~ '+mob) like '%'+@SearchText+'%'   ";
        }
        using (SqlCommand cmd = new SqlCommand(commnd, con))
        {
            con.Open();
            cmd.Parameters.AddWithValue("@SearchText", username);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                result.Add(dr["Test"].ToString());
            }
            if (result.Count > 0)
            {
                return result;
            }
            else
            {
                result.Add("New Customer");
                return result;
            }
        }

    }
    protected void btnview2_Click(object sender, EventArgs e)
    {
        try
        {
            string[] arr_search = new string[4];
            arr_search = txtMenuTitle.Text.Split('~');
            SqlDataAdapter adap = new SqlDataAdapter("select * from tbl_medors_lead_master where lead_id='" + arr_search[0].Trim() + "' ", con);
            DataSet ds = new DataSet();
            adap.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                cls.gridbind(GridView1, "Select  * from tbl_medors_lead_master where lead_id='" + arr_search[0].Trim() + "' order by date desc");

            }
        }

        catch (Exception er)
        {
        }
    }
    protected void ChkAllRows(object sender, EventArgs e)
    {

        CheckBox chkall = (CheckBox)GridView1.HeaderRow.FindControl("chkAll");
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            CheckBox chkrow = (CheckBox)GridView1.Rows[i].FindControl("chkAll0");
            if (chkall.Checked == true)
            {
                chkrow.Checked = true;
            }
            else
            {
                chkrow.Checked = false;
            }
        }

    }
    public void status()
    {
        cmd = con.CreateCommand();
        con.Open();
        cmd.CommandText = "update tbl_medors_followup_master set status=1 where id=(select max(id) from tbl_medors_followup_master where lead_id='" + Lead_id + "'  ) and nfd<=getdate()";
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public void Update_pending_followup()
    {
        cmd = con.CreateCommand();
        con.Open();
        cmd.CommandText = " DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:30:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101) update  tbl_medors_followup_master set status=1  where lead_id='" + Lead_id + "' and   datediff(day,date,@date_new)>=0  and status='0' and  id not in(select top 1 id from  tbl_medors_followup_master where lead_id='" + Lead_id + "'  order by id desc)";
        cmd.ExecuteNonQuery();
        con.Close();
    }
    string Lead_id = "";
    protected void Button3_Click(object sender, EventArgs e)
    {
        int count = 0;
        int j;
        for (j = 0; j < GridView1.Rows.Count; j++)
        {
            CheckBox cb = (CheckBox)GridView1.Rows[j].FindControl("chkAll0");
            Label id = (Label)GridView1.Rows[j].FindControl("Label1");
            Label Label2 = (Label)GridView1.Rows[j].FindControl("Label2");
            Lead_id = id.Text;
            if (cb.Checked == true)
            {
                count++;
                cmd = con.CreateCommand();
                con.Open();
                cmd.CommandText = "update tbl_medors_lead_master set assigned_to='" + ddlassign.SelectedValue + "' where lead_id='" + id.Text + "' ";
                cmd.ExecuteNonQuery();
                con.Close();

                status();
                SqlCommand  cmd1 = con.CreateCommand();
                con.Open();
                cmd1.CommandText = "insert into tbl_medors_followup_master values('" + Lead_id + "','" + Label2.Text.Trim() + "','" + DateTime.ParseExact(TextBox1.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "','Today Followup','" + ddlassign.SelectedValue + "',getdate(),'0')";
                cmd1.ExecuteNonQuery();
                con.Close();
                Update_pending_followup();
            }
        }
        if (count > 0)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Lead Assigned Sucessfully');window.location='assign_lead.aspx';", true);
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Select Leads in the below List ');", true);
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        GridView1.AllowPaging = false;
        if (Session["type"].ToString() == "Administrator")
        {
            cls.gridbind(GridView1, "Select  * from tbl_medors_lead_master where ltype='" + DropDownList1.SelectedValue + "' order by date desc");
        }
        if (Session["type"].ToString() == "User")
        {
            cls.gridbind(GridView1, "Select  * from tbl_medors_lead_master where ltype='" + DropDownList1.SelectedValue + "'  and assigned_to in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "') order by date desc");
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        GridView1.AllowPaging = false;
        if (Session["type"].ToString() == "Administrator")
        {
            cls.gridbind(GridView1, "Select  * from tbl_medors_lead_master where (created_by='" + DropDownList2.SelectedValue + "' and assigned_to='" + DropDownList2.SelectedValue + "')  order by date desc");
        }
    }
}