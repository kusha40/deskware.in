using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class daily_report : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ConnectionString);
    SqlCommand cmd;
    Class1 cls = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] == null && Session["type"] == null)
        {
            Response.Redirect("~/login.aspx");
        }
        else
        {
            if (!IsPostBack)
            {
                if (Session["type"].ToString() == "Administrator")
                {
                    cls.bind_ddl(DropDownList1, "SELECT distinct id,user_id,name FROM user_master  where   type!='Administrator' and status='Active' order by name asc", "name", "user_id");
                    DropDownList1.Items.Insert(0, "Select");
                }
                else
                {
                    cls.bind_ddl(DropDownList1, "select * from user_master where user_id in (select uid from tbl_team  where aid='" + Session["Username"].ToString() + "') and status='Active'   order by name asc", "name", "user_id");
                    //and user_id='" + Session["Username"].ToString() + "'
                    DropDownList1.Items.Insert(0, "Select");
                }

            }
        }

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        cls.gridbind(GridView1, "select max(created_by)as created_by,max(date)as date from tbl_daily_reporting  where created_by='" + DropDownList1.SelectedValue + "' group by date");
    }
}