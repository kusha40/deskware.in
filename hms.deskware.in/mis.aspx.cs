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

public partial class mis : System.Web.UI.Page
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
            cls.bind_ddl(ddlschoolname, "select * from tbl_school_master", "name", "name");
            cls.bind_ddl(ddlsession, "select * from tble_session_master order by id desc", "session", "session");
            cls.bind_ddl(ddlClass, "Select (class_name+'-'+section) as class_name  from tbl_class_master where school_name='" + ddlschoolname.SelectedValue + "'", "class_name", "class_name");
            Session["schoolname"] = ddlschoolname.SelectedValue;
            Session["session"] = ddlsession.SelectedValue;
        }

    }
    protected void ddlschoolname_SelectedIndexChanged(object sender, EventArgs e)
    {
        Session["schoolname"] = ddlschoolname.SelectedValue;
        Session["session"] = ddlsession.SelectedValue;
        cls.bind_ddl(ddlClass, "Select (class_name+'-'+section) as class_name  from tbl_class_master where school_name='" + ddlschoolname.SelectedValue + "'", "class_name", "class_name");

    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        cls.gridbind(GridView1, "select * from tbl_reportMaster where schooname='"+ddlschoolname.SelectedValue+"' and class='"+ddlClass.SelectedValue+"' and session='"+ddlsession.SelectedValue+"' order by unqueid asc");
    }
    protected void btnsearch_Click(object sender, EventArgs e)
    {
        try
        {
            GridView1.AllowPaging = false;
            string[] arr_search = new string[3];
            arr_search = txtMenuTitle.Text.Split('~');
            SqlDataAdapter adap = new SqlDataAdapter("select * from tbl_reportMaster where id='" + arr_search[0].Trim() + "'", con);
            DataSet ds = new DataSet();
            adap.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                cls.gridbind(GridView1, "select * from tbl_reportMaster where  id='" + arr_search[0].Trim() + "' order by NAME asc");
            }
        }

        catch (Exception er)
        {
        }
    }
    [WebMethod(EnableSession = true)]

    public static List<string> GetAutoCompleteData1(string username, string flag)
    {
        string st = flag;
        string commnd = "";
        string schoolname = (string)HttpContext.Current.Session["schoolname"];
        string session = (string)HttpContext.Current.Session["session"];
        List<string> result = new List<string>();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
        commnd = "select distinct (convert(nvarchar(max),id)+'~'+UNQUEID+'~'+NAME) as Test from [tbl_reportMaster] where  (UNQUEID+'~'+NAME) like '%'+@SearchText+'%' and SchooName='" + schoolname + "' and session='" + session + "'  ";
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
                result.Add("No Record Found !........");
                return result;
            }
        }

    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            HyperLink hylnk = e.Row.FindControl("HyperLink1") as HyperLink ;
            Label lblremarks = e.Row.FindControl("lblremarks") as Label;
            string command = "";
            command = "select * from tbl_pdf_master where school_name='" + ddlschoolname.SelectedValue + "' AND session ='" + ddlsession.SelectedValue + "' and unique_id='" + lblremarks.Text + "'";
            SqlDataAdapter adap = new SqlDataAdapter(command, con);
            DataSet ds = new DataSet();
            adap.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dr = ds.Tables[0].Rows[0];
                hylnk.NavigateUrl = dr["path"].ToString();
            }
        }
    }
}