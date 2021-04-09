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

public partial class total_meetings : System.Web.UI.Page
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
                if (Request.QueryString["id"] == null)
                {
                    cls.gridbind(GridView1, "Select  * from tbl_meeting_details where status='0' and type!='Converted'  order by date desc");
                }
                else
                {
                    if (Request.QueryString["id"].ToString() == "1")
                    {
                        cls.gridbind(GridView1, "Select  * from tbl_meeting_details where  type!='Converted'  order by date desc");
                    }
                    if (Request.QueryString["id"].ToString() == "2")
                    {
                        cls.gridbind(GridView1, "Select  * from tbl_meeting_details where status!='0' and type!='Converted' order by date desc");
                    }
                    if (Request.QueryString["id"].ToString() == "3")
                    {
                        cls.gridbind(GridView1, "Select  * from tbl_meeting_details where status='0' and type!='Converted' order by date desc");
                    }
                    if (Request.QueryString["id"].ToString() == null)
                    {
                        cls.gridbind(GridView1, "Select  * from tbl_meeting_details where status='0' and type!='Converted' order by date desc");
                    }
                }
            }
            if (Session["type"].ToString() == "User")
            {
                if (Request.QueryString["id"] == null)
                {
                    cls.gridbind(GridView1, "Select  * from tbl_meeting_details where status='0' and type!='Converted' and assign_to in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "')  order by date desc");
                }
                else
                {
                    if (Request.QueryString["id"].ToString() == "1")
                    {
                        cls.gridbind(GridView1, "Select  * from tbl_meeting_details  where  assign_to in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "') and type!='Converted' order by date desc");
                    }
                    if (Request.QueryString["id"].ToString() == "2")
                    {
                        cls.gridbind(GridView1, "Select  * from tbl_meeting_details where status!='0' and type!='Converted' and assign_to in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "')  order by date desc");
                    }
                    if (Request.QueryString["id"].ToString() == "3")
                    {
                        cls.gridbind(GridView1, "Select  * from tbl_meeting_details where status='0' and type!='Converted' and assign_to in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "') order by date desc");
                    }
                    if (Request.QueryString["id"].ToString() == null)
                    {
                        cls.gridbind(GridView1, "Select  * from tbl_meeting_details where status='0' and type!='Converted' and assign_to in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "')  order by date desc");
                    }
                }
            }
        }

    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        if (Session["type"].ToString() == "Administrator")
        {
            if (Request.QueryString["id"] == null)
            {
                cls.gridbind(GridView1, "Select  * from tbl_meeting_details where status='0' and type!='Converted'  order by date desc");
            }
            else
            {
                if (Request.QueryString["id"].ToString() == "1")
                {
                    cls.gridbind(GridView1, "Select  * from tbl_meeting_details where  type!='Converted'  order by date desc");
                }
                if (Request.QueryString["id"].ToString() == "2")
                {
                    cls.gridbind(GridView1, "Select  * from tbl_meeting_details where status!='0' and type!='Converted'  order by date desc");
                }
                if (Request.QueryString["id"].ToString() == "3")
                {
                    cls.gridbind(GridView1, "Select  * from tbl_meeting_details where status='0' and type!='Converted'  order by date desc");
                }
                if (Request.QueryString["id"].ToString() == null)
                {
                    cls.gridbind(GridView1, "Select  * from tbl_meeting_details where status='0' and type!='Converted'  order by date desc");
                }
            }
        }
        if (Session["type"].ToString() == "User")
        {
            if (Request.QueryString["id"] == null)
            {
                cls.gridbind(GridView1, "Select  * from tbl_meeting_details where status='0' and type!='Converted' and assign_to in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "')  order by date desc");
            }
            else
            {
                if (Request.QueryString["id"].ToString() == "1")
                {
                    cls.gridbind(GridView1, "Select  * from tbl_meeting_details  where  assign_to in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "') and type!='Converted' order by date desc");
                }
                if (Request.QueryString["id"].ToString() == "2")
                {
                    cls.gridbind(GridView1, "Select  * from tbl_meeting_details where status!='0' and type!='Converted' and assign_to in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "')  order by date desc");
                }
                if (Request.QueryString["id"].ToString() == "3")
                {
                    cls.gridbind(GridView1, "Select  * from tbl_meeting_details where status='0' and type!='Converted' and assign_to in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "') order by date desc");
                }
                if (Request.QueryString["id"].ToString() == null)
                {
                    cls.gridbind(GridView1, "Select  * from tbl_meeting_details where status='0' and type!='Converted' and assign_to in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "')  order by date desc");
                }
            }
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "follow")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "", "window.open('add_followup_meeting.aspx?id=" + e.CommandArgument.ToString() + "','Graph','height=auto,width=auto,scrollbars=1' );", true);
            //Response.Redirect("add_follow_up.aspx?id=" + e.CommandArgument.ToString() + "");
        }
        if (e.CommandName == "view")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "", "window.open('view_meeting_history.aspx?id=" + e.CommandArgument.ToString() + "','Graph','height=724px,width=900px,scrollbars=1' );", true);
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
            commnd = "select (lead_id+' ~ '+name+' ~ '+mobno+' ~ '+product+' ~ '+assign_to) as Test from [tbl_meeting_details] where  (lead_id+' ~ '+name+' ~ '+mobno+' ~ '+product+' ~ '+assign_to) like '%'+@SearchText+'%' and (assign_to in (select uid from tbl_team where aid='" + name + "'))    ";
        }
        //else if (type == "Manager")
        //{
        //    commnd = "select (customer_id+' ~ '+customer_name+' ~ '+mob_no+' ~ '+email_id+' ~ '+requirement+' ~ '+state+' ~ '+created_by+' ~ '+district) as Test from [enquiry_master] where  (customer_id+' ~ '+customer_name+' ~ '+mob_no+' ~ '+email_id+' ~ '+requirement+' ~ '+state+' ~ '+created_by+' ~ '+district) like '%'+@SearchText+'%' and (manager='" + name + "' or created_by='" + name + "' or assigned_by='" + name + "')   ";
        //}
       else if (type == "Administrator")
       {
        commnd = "select (lead_id+' ~ '+name+' ~ '+mobno+' ~ '+product+' ~ '+assign_to) as Test from [tbl_meeting_details] where  (lead_id+' ~ '+name+' ~ '+mobno+' ~ '+product+' ~ '+assign_to) like '%'+@SearchText+'%'   ";
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
                cls.gridbind(GridView1, "Select  * from tbl_meeting_details where lead_id='" + arr_search[0].Trim() + "' order by date desc");

            }
        }

        catch (Exception er)
        {
        }
    }
    protected void Button8_Click(object sender, EventArgs e)
    {
        if (Session["type"].ToString() == "Administrator")
        {
            cls.gridbind(GridView1, "Select  * from tbl_meeting_details where status!='0' and type='Converted'  order by date desc");
        }
        if (Session["type"].ToString() == "User")
        {
            cls.gridbind(GridView1, "Select  * from tbl_meeting_details where status!='0' and type='Converted' and assign_to in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "') order by date desc");
        }
    }
    protected void Button9_Click(object sender, EventArgs e)
    {
        if (Session["type"].ToString() == "Administrator")
        {
            cls.gridbind(GridView1, "Select  * from tbl_meeting_details where status='0' and type!='Converted'  order by date desc");
        }
        if (Session["type"].ToString() == "User")
        {
            cls.gridbind(GridView1, "Select  * from tbl_meeting_details where status='0' and type!='Converted' and assign_to in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "') order by date desc");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Session["type"].ToString() == "Administrator")
        {
            cls.gridbind(GridView1, "Select  * from tbl_meeting_details   order by date desc");
        }
        if (Session["type"].ToString() == "User")
        {
            cls.gridbind(GridView1, "Select  * from tbl_meeting_details  where assign_to in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "')   order by date desc");
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.AddHeader("content-disposition", "attachment;filename=Report.xls");
        Response.Charset = "";
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = "application/vnd.xls";
        System.IO.StringWriter stringWrite = new System.IO.StringWriter();
        System.Web.UI.HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);
        GridView1.RenderControl(htmlWrite);
        Response.Write(stringWrite.ToString());
        Response.End();
    }
    public override void VerifyRenderingInServerForm(Control control)
    { }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label id = e.Row.FindControl("Label1") as Label;
            Label Address = e.Row.FindControl("Label2") as Label;
          
            SqlDataAdapter adap = new SqlDataAdapter("select * from tbl_medors_lead_master where lead_id='" + id.Text + "' ", con);
            DataSet ds = new DataSet();
            adap.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dr = ds.Tables[0].Rows[0];
                Address.Text = dr["address"].ToString();
              
            }
            
        }
    }
}