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

public partial class total_lead : System.Web.UI.Page
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
                Button2.Visible = true;
                cls.gridbind(GridView1, "Select  * from tbl_medors_lead_master where ctype='On going' order by date desc");
            }
            if (Session["type"].ToString() == "User")
            {
                cls.gridbind(GridView1, "Select  * from tbl_medors_lead_master where ctype='On going'  and assigned_to in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "') order by date desc");
            }
            cls.bind_ddl(DropDownList1, " select distinct type from tbl_lead_type_master order by type asc", "type", "type");
        }

    }
    protected void Button8_Click(object sender, EventArgs e)
    {
        GridView1.AllowPaging = false;
       
        if (Session["type"].ToString() == "Administrator")
        {
            cls.gridbind(GridView1, "Select  * from tbl_medors_lead_master where ctype='On going' order by date desc");
        }
        if (Session["type"].ToString() == "User")
        {
            cls.gridbind(GridView1, "Select  * from tbl_medors_lead_master where ctype='On going'  and assigned_to in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "') order by date desc");
        }
       
    }
    protected void Button9_Click(object sender, EventArgs e)
    {
        GridView1.AllowPaging = false;
       
        if (Session["type"].ToString() == "Administrator")
        {
            cls.gridbind(GridView1, "Select  * from tbl_medors_lead_master where ctype='Rejected' order by date desc");
        }
        if (Session["type"].ToString() == "User")
        {
            cls.gridbind(GridView1, "Select  * from tbl_medors_lead_master where ctype='Rejected'  and assigned_to in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "') order by date desc");
        }
    }
    protected void Button10_Click(object sender, EventArgs e)
    {
        GridView1.AllowPaging = false;
        if (Session["type"].ToString() == "Administrator")
        {
            cls.gridbind(GridView1, "Select  * from tbl_medors_lead_master where ctype='Converted' order by date desc");
        }
        if (Session["type"].ToString() == "User")
        {
            cls.gridbind(GridView1, "Select  * from tbl_medors_lead_master where ctype='Converted'  and assigned_to in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "') order by date desc");
        }
    
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
      
        if (Session["type"].ToString() == "Administrator")
        {
            cls.gridbind(GridView1, "Select  * from tbl_medors_lead_master where ctype='On going' order by date desc");
        }
        if (Session["type"].ToString() == "User")
        {
            cls.gridbind(GridView1, "Select  * from tbl_medors_lead_master where ctype='On going'  and assigned_to in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "') order by date desc");
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "follow")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "", "window.open('Add_followup2.aspx?id=" + e.CommandArgument.ToString() + "','Graph','height=auto,width=auto,scrollbars=1' );", true);
            //Response.Redirect("add_follow_up.aspx?id=" + e.CommandArgument.ToString() + "");
        }
        if (e.CommandName == "view")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "", "window.open('view_remarks.aspx?id=" + e.CommandArgument.ToString() + "','Graph','height=724px,width=900px,scrollbars=1' );", true);
            //Response.Redirect("add_follow_up.aspx?id=" + e.CommandArgument.ToString() + "");
        }
        else if (e.CommandName == "edit5")
        {
            Response.Redirect("edit_lead.aspx?id=" + e.CommandArgument.ToString() + "");
        }
        else if (e.CommandName == "meeting")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "", "window.open('view_meeting_history.aspx?id=" + e.CommandArgument.ToString() + "','Graph','height=724px,width=900px,scrollbars=1' );", true);
        }
        else if (e.CommandName == "meeting1")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "", "window.open('view_order_history.aspx?id=" + e.CommandArgument.ToString() + "','Graph','height=724px,width=900px,scrollbars=1' );", true);
        }
        else if (e.CommandName == "meeting2")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "", "window.open('view_quotation_history.aspx?id=" + e.CommandArgument.ToString() + "','Graph','height=724px,width=900px,scrollbars=1' );", true);
        }
        if (e.CommandName == "del")
        {
            cmd = con.CreateCommand();
            SqlCommand cmd1 = con.CreateCommand();
            con.Open();
            cmd.CommandText = " delete  tbl_medors_lead_master  where lead_id=" + e.CommandArgument.ToString() + " ";
            cmd1.CommandText = " delete  tbl_medors_followup_master  where lead_id=" + e.CommandArgument.ToString() + " ";
            cmd.ExecuteNonQuery();
            cmd1.ExecuteNonQuery();
            con.Close();
            if (Session["type"].ToString() == "Administrator")
            {
                cls.gridbind(GridView1, "Select  * from tbl_medors_lead_master where ctype='On going' order by date desc");
            }
            if (Session["type"].ToString() == "User")
            {
                cls.gridbind(GridView1, "Select  * from tbl_medors_lead_master where ctype='On going'  and assigned_to in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "') order by date desc");
            }
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Deleted Sucessfully');;", true);

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
    protected void Button1_Click(object sender, EventArgs e)
    {
        GridView1.AllowPaging = false;
        if (Session["type"].ToString() == "Administrator")
        {
            cls.gridbind(GridView1, "Select  * from tbl_medors_lead_master where ltype='"+DropDownList1.SelectedValue+"' order by date desc");
        }
        if (Session["type"].ToString() == "User")
        {
            cls.gridbind(GridView1, "Select  * from tbl_medors_lead_master where ltype='" + DropDownList1.SelectedValue + "'  and assigned_to in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "') order by date desc");
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        ClientScript.RegisterStartupScript(this.Page.GetType(), "", "window.open('duplicate.aspx','Graph','height=724px,width=900px,scrollbars=1' );", true);
      //  Response.Redirect("duplicate.aspx");
        //GridView1.AllowPaging = false;
        //if (Session["type"].ToString() == "Administrator")
        //{
        //    cls.gridbind(GridView1, "SELECT lead_id,date,ltype,ctype,dsource,title,lname,fname,address,city,postcode,mob,email_id,created_by,assigned_to ,COUNT(*) FROM tbl_medors_lead_master GROUP BY lead_id,date,ltype,ctype,dsource,title,lname,fname,address,city,postcode,mob,email_id,created_by,assigned_to HAVING COUNT(*) > 1 order by date desc");
        //}
    }
}