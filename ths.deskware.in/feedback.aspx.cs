using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class feedback : System.Web.UI.Page
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
           
                cls.bind_ddl(ddlname, "select user_id,name from user_master where status='Active'  order by name asc", "name", "user_id");
                ddlname.Items.Insert(0, new ListItem("Select", ""));

                cls.gridbind(GridView1, "select * from tbl_feedback where id  not in (select fid from tbl_feedback_reply) order by date desc");
        }

    }
   
    protected void Button2_Click(object sender, EventArgs e)
    {
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Reset Sucessfully');window.location='feedback.aspx';", true);
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
                subqry = "tbl_feedback.a_user='" + _p_name + "'";
            }

            else
            {
                subqry = subqry + "and tbl_feedback.a_user = '" + _p_name + "'";
            }
        }

        if (txtfrom.Text != String.Empty && txtto.Text != String.Empty)
        {
            _fromdate = DateTime.ParseExact(txtfrom.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            _todate = DateTime.ParseExact(txtto.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            if (subqry == String.Empty)
            {
                subqry = "tbl_feedback.date between '" + _fromdate + "' and '" + _todate + "'";
            }

            else
            {
                subqry = subqry + "and tbl_feedback.date between '" + _fromdate + "' and '" + _todate + "' ";
            }
        }

        qry = "select * from tbl_feedback where id  not in (select fid from tbl_feedback_reply) and ";
        mainqry = qry + subqry + " order by date asc";
        GridView1.AllowPaging = false;
        cls.gridbind(GridView1, mainqry);
       
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;


        cls.gridbind(GridView1, "select * from tbl_feedback where id  not in (select fid from tbl_feedback_reply) order by date desc");
      
        
    }

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "edit1")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "", "window.open('add_feedback.aspx?id=" + e.CommandArgument.ToString() + "','Graph','height=auto,width=auto,scrollbars=1' );", true);
        }
    }
}