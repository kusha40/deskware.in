using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class school_dashboardaspx : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
    SqlCommand cmd;
    Class1 cls = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uid"] == null && Session["school_name"] == null)
        {
            Response.Redirect("~/schoollogin.aspx");
        }
        if (!IsPostBack)
        {
            //
            cls.bind_ddl(ddlsession, "select * from tble_session_master order by id desc", "session", "session");
          //  ddlsession.Items.RemoveAt(0);
            count_student();
        }
    }
   
    public void count_student()
    {
        string command = "";
        command = "select count(id) as name from tbl_reportMaster where schooname='" + Session["school_name"].ToString() + "' and session='"+ddlsession.SelectedValue+"'";
        SqlDataAdapter adap = new SqlDataAdapter(command, con);
        DataSet ds = new DataSet();
        adap.Fill(ds);
        if (ds.Tables[0].Rows.Count != 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];
            totlstudent.InnerText = dr["name"].ToString();
        }
    }
    protected void ddlsession_SelectedIndexChanged(object sender, EventArgs e)
    {
        count_student();
    }
}