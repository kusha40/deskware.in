using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class my_team : System.Web.UI.Page
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
                cls.gridbind(GridView1, "Select * from user_master where status='Active' and type not in ('Administrator') order by name asc");
            }
            else
            {
                cls.gridbind(GridView1, "select * from user_master where user_id in (select uid from tbl_team  where aid='" + Session["Username"].ToString() + "') and status='Active' and user_id='" + Session["Username"].ToString() + "'  order by name asc");
            }
        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label id = e.Row.FindControl("Label1") as Label;
            GridView GridView2 = e.Row.FindControl("GridView2") as GridView;

            cls.gridbind(GridView2, "select * from user_master where user_id in (select uid from tbl_team  where aid='" + id.Text + "') and status='Active' and user_id!='" + id.Text + "'  order by name asc");


        }
    }
    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label id = e.Row.FindControl("Label2") as Label;
            GridView GridView3 = e.Row.FindControl("GridView3") as GridView;

            cls.gridbind(GridView3, "select * from user_master where user_id in (select uid from tbl_team  where aid='" + id.Text + "') and status='Active' and user_id!='" + id.Text + "' order by name asc");


        }
    }
}