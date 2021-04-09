using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class dead_future_have_todo : System.Web.UI.Page
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
                    cls.gridbind(GridView1, " DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '00:00:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101) select * from tbl_todo where datediff(day,date,@date_new)>0 and  type='Self' and status='Pending' and todo_type='FHTD' and req=''  union all select * from tbl_todo where datediff(day,date,@date_new)>0  and type='Assign' and status='Pending' and todo_type='FHTD' and req='' order by order_by asc");
                }
                else
                {
                    cls.gridbind(GridView1, "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '00:00:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101) select * from tbl_todo where datediff(day,date,@date_new)>0 and created_by='" + Session["Username"].ToString() + "' and type='Self' and status='Pending' and todo_type='FHTD' and req='' union all select * from tbl_todo where datediff(day,date,@date_new)>0 and assign_to='" + Session["Username"].ToString() + "' and type='Assign' and status='Pending' and todo_type='FHTD' and req='' order by order_by asc");
                }


            }
        }
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
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lbldeleteid = (Label)row.FindControl("Label1");
        TextBox TextBox1 = (TextBox)row.FindControl("TextBox1");
        conn.Open();
        SqlCommand cmd = new SqlCommand("update  tbl_todo set reply='" + TextBox1.Text + "',status='Completed' where id='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", conn);
        cmd.ExecuteNonQuery();
        conn.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Task Completed Sucessfully');", true);
        if (Session["type"].ToString() == "Administrator")
        {
            cls.gridbind(GridView1, " DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '00:00:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101) select * from tbl_todo where datediff(day,date,@date_new)>0 and  type='Self' and status='Pending' and todo_type='FHTD' and req=''  union all select * from tbl_todo where datediff(day,date,@date_new)>0  and type='Assign' and status='Pending' and todo_type='FHTD' and req='' order by order_by asc");
        }
        else
        {
            cls.gridbind(GridView1, "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '00:00:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101) select * from tbl_todo where datediff(day,date,@date_new)>0 and created_by='" + Session["Username"].ToString() + "' and type='Self' and status='Pending' and todo_type='FHTD' and req='' union all select * from tbl_todo where datediff(day,date,@date_new)>0 and assign_to='" + Session["Username"].ToString() + "' and type='Assign' and status='Pending' and todo_type='FHTD' and req='' order by order_by asc");
        }
    }
}