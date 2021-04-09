using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class view_lead : System.Web.UI.Page
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
               if (Request.QueryString["id"] == "c")
               {
                   cls.gridbind(GridView1, "Select  * from tbl_medors_lead_master where ctype='Converted' order by date desc");
               }
               if (Request.QueryString["id"] == "o")
               {
                   cls.gridbind(GridView1, "Select  * from tbl_medors_lead_master where ctype='On going' order by date desc");
               }
               if (Request.QueryString["id"] == "r")
               {
                   cls.gridbind(GridView1, "Select  * from tbl_medors_lead_master where ctype='Rejected' order by date desc");
               }
           }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "follow")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "", "window.open('Add_followup2.aspx?id=" + e.CommandArgument.ToString() + "','Graph','height=724px,width=900px,scrollbars=1' );", true);
            //Response.Redirect("add_follow_up.aspx?id=" + e.CommandArgument.ToString() + "");
        }
        if (e.CommandName == "view")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "", "window.open('view_remarks.aspx?id=" + e.CommandArgument.ToString() + "','Graph','height=724px,width=900px,scrollbars=1' );", true);
            //Response.Redirect("add_follow_up.aspx?id=" + e.CommandArgument.ToString() + "");
        }
    }
}