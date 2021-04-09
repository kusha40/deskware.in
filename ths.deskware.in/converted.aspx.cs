using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class converted : System.Web.UI.Page
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
                cls.gridbind(GridView1, "Select max(lead_id)as lead_id,max(type)as type,max(date)as date,max(name)as name,max(mobno)as mobno,max(product)as product,max(assign_to)as assign_to,max(created_by)as created_by from tbl_meeting_details where status!='0' and type='Converted' group by lead_id order by date desc");
            }
            else
            {
                cls.gridbind(GridView1, "Select max(lead_id)as lead_id,max(type)as type,max(date)as date,max(name)as name,max(mobno)as mobno,max(product)as product,max(assign_to)as assign_to,max(created_by)as created_by from tbl_meeting_details where status!='0' and type='Converted' and assign_to in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "')  group by lead_id order by date desc");
            }
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
            commnd = "select distinct (lead_id+' ~ '+name+' ~ '+mobno+' ~ '+product) as Test from [tbl_meeting_details] where  (lead_id+' ~ '+name+' ~ '+mobno+' ~ '+product ) like '%'+@SearchText+'%' and status!='0' and type='Converted' and (assign_to in (select uid from tbl_team where aid='" + name + "'))    ";
        }
        //else if (type == "Manager")
        //{
        //    commnd = "select (customer_id+' ~ '+customer_name+' ~ '+mob_no+' ~ '+email_id+' ~ '+requirement+' ~ '+state+' ~ '+created_by+' ~ '+district) as Test from [enquiry_master] where  (customer_id+' ~ '+customer_name+' ~ '+mob_no+' ~ '+email_id+' ~ '+requirement+' ~ '+state+' ~ '+created_by+' ~ '+district) like '%'+@SearchText+'%' and (manager='" + name + "' or created_by='" + name + "' or assigned_by='" + name + "')   ";
        //}
        else if (type == "Administrator")
        {
            commnd = "select distinct (lead_id+' ~ '+name+' ~ '+mobno+' ~ '+product) as Test from [tbl_meeting_details] where  (lead_id+' ~ '+name+' ~ '+mobno+' ~ '+product) like '%'+@SearchText+'%' and status!='0' and type='Converted'   ";
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
                result.Add("No Record Found");
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
            SqlDataAdapter adap = new SqlDataAdapter("select * from tbl_meeting_details where lead_id='" + arr_search[0].Trim() + "' ", con);
            DataSet ds = new DataSet();
            adap.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                cls.gridbind(GridView1, "Select  max(lead_id)as lead_id,max(type)as type,max(date)as date,max(name)as name,max(mobno)as mobno,max(product)as product,max(assign_to)as assign_to,max(created_by)as created_by from tbl_meeting_details where lead_id='" + arr_search[0].Trim() + "' group by lead_id order by date desc");

            }
        }

        catch (Exception er)
        {
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "follow")
        {
            Response.Redirect("generate_order.aspx?id=" + e.CommandArgument.ToString() + "");
        }
        if (e.CommandName == "view")
        {
            Response.Redirect("view_order_history.aspx?id=" + e.CommandArgument.ToString() + "");
        }
        else if (e.CommandName == "meeting1")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "", "window.open('view_order_history.aspx?id=" + e.CommandArgument.ToString() + "','Graph','height=724px,width=900px,scrollbars=1' );", true);
        }
        else if (e.CommandName == "meeting2")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "", "window.open('view_quotation_history.aspx?id=" + e.CommandArgument.ToString() + "','Graph','height=724px,width=900px,scrollbars=1' );", true);
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        if (Session["type"].ToString() == "Administrator")
        {
            cls.gridbind(GridView1, "Select max(lead_id)as lead_id,max(type)as type,max(date)as date,max(name)as name,max(mobno)as mobno,max(product)as product,max(assign_to)as assign_to,max(created_by)as created_by from tbl_meeting_details where status!='0' and type='Converted' group by lead_id order by date desc");
        }
        else
        {
            cls.gridbind(GridView1, "Select max(lead_id)as lead_id,max(type)as type,max(date)as date,max(name)as name,max(mobno)as mobno,max(product)as product,max(assign_to)as assign_to,max(created_by)as created_by from tbl_meeting_details where status!='0' and type='Converted' and assign_to in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "')  group by lead_id order by date desc");
        }
    }
}