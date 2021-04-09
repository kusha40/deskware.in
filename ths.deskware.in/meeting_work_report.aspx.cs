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

public partial class meeting_work_report : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
    SqlCommand cmd;
    Class1 cls = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["type"].ToString() == "Administrator")
            {
                cls.bind_ddl(ddlname, "select user_id,name from user_master where status='Active'  order by name asc", "name", "user_id");
                ddlname.Items.Insert(0, new ListItem("Select", ""));

                cls.gridbind(GridView1, "select * from tbl_meeting_details order by date desc");
            }
            else
            {
                cls.bind_ddl(ddlname, "select user_id,name from user_master where status='Active' and user_id in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "')  order by name asc", "name", "user_id");
                ddlname.Items.Insert(0, new ListItem("Select", ""));

                cls.gridbind(GridView1, "select * from tbl_meeting_details where created_by in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "') order by date desc");
            }
            Span1.InnerHtml = GridView1.Rows.Count.ToString();
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
    protected void Button2_Click(object sender, EventArgs e)
    {
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Reset Sucessfully');window.location='meeting_work_report.aspx';", true);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        search();
    }

    String _p_name;
    String _fromdate;
    String _todate;
    string mainqry = String.Empty;
    string subqry = String.Empty;
    string qry = String.Empty;
    public void search()
    {
        if (ddlname.SelectedValue != String.Empty)
        {
            _p_name = ddlname.SelectedValue;
            if (subqry == String.Empty)
            {
                subqry = "tbl_meeting_details.created_by='" + _p_name + "'";
            }

            else
            {
                subqry = subqry + "and tbl_meeting_details.created_by = '" + _p_name + "'";
            }
        }

        if (txtfrom.Text != String.Empty && txtto.Text != String.Empty)
        {
            _fromdate = DateTime.ParseExact(txtfrom.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            _todate = DateTime.ParseExact(txtto.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            if (subqry == String.Empty)
            {
                subqry = "tbl_meeting_details.date between '" + _fromdate + "' and '" + _todate + "'";
            }

            else
            {
                subqry = subqry + "and tbl_meeting_details.date between '" + _fromdate + "' and '" + _todate + "' ";
            }
        }

        qry = "select * from tbl_meeting_details where ";
        mainqry = qry + subqry + " order by date asc";
        GridView1.AllowPaging = false;
        cls.gridbind(GridView1, mainqry);
        Span1.InnerHtml = GridView1.Rows.Count.ToString();
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;

        if (Session["type"].ToString() == "Administrator")
        {
            cls.gridbind(GridView1, "select * from tbl_meeting_details order by date desc");
        }
        else
        {
            cls.gridbind(GridView1, "select * from tbl_meeting_details where created_by in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "') order by date desc");
        }
        Span1.InnerHtml = GridView1.Rows.Count.ToString();
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label id = e.Row.FindControl("Label1") as Label;
            Label type = e.Row.FindControl("Label2") as Label;
            Label status = e.Row.FindControl("Label3") as Label;
            SqlDataAdapter adap = new SqlDataAdapter("select * from tbl_medors_lead_master where lead_id='" + id.Text + "' ", con);
            DataSet ds = new DataSet();
            adap.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dr = ds.Tables[0].Rows[0];
                type.Text = dr["ltype"].ToString();
                status.Text = dr["ctype"].ToString();
            }
        }
    }
}