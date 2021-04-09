using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class todo_report : System.Web.UI.Page
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
                    cls.gridbind(GridView1, "select * from tbl_todo where   type='Self' and todo_type='DTD'  union all select * from tbl_todo where  type='Assign' and todo_type='DTD' order by order_by asc");
                }
                else
                {
                    cls.bind_ddl(DropDownList1, "select * from user_master where user_id in (select uid from tbl_team  where aid='" + Session["Username"].ToString() + "') and status='Active'   order by name asc", "name", "user_id");
                    DropDownList1.Items.Insert(0, "Select");
                    cls.gridbind(GridView1, "select * from tbl_todo where  created_by='" + Session["Username"].ToString() + "' and type='Self' and todo_type='DTD'  union all select * from tbl_todo where  assign_to='" + Session["Username"].ToString() + "' and type='Assign' and todo_type='DTD' order by order_by asc");
                }


            }
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        cls.gridbind(GridView1, "select * from tbl_todo where  created_by='" + DropDownList1.SelectedValue + "' and type='Self' and todo_type='DTD'  union all select * from tbl_todo where  assign_to='" + DropDownList1.SelectedValue + "' and type='Assign' and todo_type='DTD' order by order_by asc");
    }
    protected void btnsubmit2_Click(object sender, EventArgs e)
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
}