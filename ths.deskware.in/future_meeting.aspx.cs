using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class future_meeting : System.Web.UI.Page
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
                cls.gridbind(GridView1, "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:30:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101)              SELECT distinct * from tbl_meeting_details   where (tbl_meeting_details.md>@date_new) and tbl_meeting_details.status='0' and type!='Converted'");
            }
            if (Session["type"].ToString() == "User")
            {
                cls.gridbind(GridView1, "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:30:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101)              SELECT distinct * from tbl_meeting_details   where (tbl_meeting_details.md>@date_new) and tbl_meeting_details.status='0' and type!='Converted' and assign_to in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "')");
            }
        }

    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        if (Session["type"].ToString() == "Administrator")
        {
            cls.gridbind(GridView1, "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:30:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101)              SELECT distinct * from tbl_meeting_details   where (tbl_meeting_details.md>@date_new) and tbl_meeting_details.status='0' and type!='Converted'");
        }
        if (Session["type"].ToString() == "User")
        {
            cls.gridbind(GridView1, "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:30:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101)              SELECT distinct * from tbl_meeting_details   where (tbl_meeting_details.md>@date_new) and tbl_meeting_details.status='0' and type!='Converted' and assign_to in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "')");
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
}