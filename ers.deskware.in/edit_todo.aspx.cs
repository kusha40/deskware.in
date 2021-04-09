using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class edit_todo : System.Web.UI.Page
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
                    cls.gridbind(GridView1, " DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '00:00:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101) select * from tbl_todo where   type='Self' and status='Pending' and todo_type='DTD' and req='' union all select * from tbl_todo where  type='Assign' and status='Pending' and todo_type='DTD' and req=''  order by order_by asc");
                }
                else
                {
                    cls.gridbind(GridView1, " DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '00:00:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101) select * from tbl_todo where  created_by='" + Session["Username"].ToString() + "' and type='Self' and status='Pending' and todo_type='DTD' and req='' union all select * from tbl_todo where  assign_to='" + Session["Username"].ToString() + "' and type='Assign' and status='Pending' and todo_type='DTD' and req=''  order by order_by asc");
                }


            }
        }
    }

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lbldeleteid = (Label)row.FindControl("Label1");
        DropDownList DropDownList1 = (DropDownList)row.FindControl("DropDownList1");
        conn.Open();
        SqlCommand cmd = new SqlCommand("update  tbl_todo set order_by='" + DropDownList1.SelectedValue + "' where id='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", conn);
        cmd.ExecuteNonQuery();
        conn.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Updated Sucessfully');", true);
        if (Session["type"].ToString() == "Administrator")
        {
            cls.gridbind(GridView1, "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '00:00:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101) select * from tbl_todo where   type='Self' and status='Pending' and todo_type='DTD' and req='' union all select * from tbl_todo where date=@date_new  and type='Assign' and status='Pending' and todo_type='DTD' and req='' order by order_by asc");
        }
        else
        {
            cls.gridbind(GridView1, "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '00:00:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101) select * from tbl_todo where  created_by='" + Session["Username"].ToString() + "' and type='Self' and status='Pending' and todo_type='DTD' and req=''  union all select * from tbl_todo where  assign_to='" + Session["Username"].ToString() + "' and type='Assign' and status='Pending' and todo_type='DTD' and req='' order by order_by asc");
        }

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (Session["type"].ToString() == "Administrator")
        {
            cls.gridbind(GridView1, "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '00:00:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101) select * from tbl_todo where   type='Self' and status='Pending' and todo_type='DTD' and req='' union all select * from tbl_todo where date=@date_new  and type='Assign' and status='Pending' and todo_type='DTD' and req='' order by order_by asc");
        }
        else
        {
            cls.gridbind(GridView1, "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '00:00:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101) select * from tbl_todo where  created_by='" + Session["Username"].ToString() + "' and type='Self' and status='Pending' and todo_type='DTD' and req='' union all select * from tbl_todo where  assign_to='" + Session["Username"].ToString() + "' and type='Assign' and status='Pending' and todo_type='DTD' and req='' order by order_by asc");
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Session["type"].ToString() == "Administrator")
        {
            cls.gridbind(GridView1, "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '00:00:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101) select * from tbl_todo where   type='Self' and status='Pending' and todo_type='FHTD' and req='' union all select * from tbl_todo where date=@date_new  and type='Assign' and status='Pending' and todo_type='FHTD' and req='' order by order_by asc");
        }
        else
        {
            cls.gridbind(GridView1, "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '00:00:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101) select * from tbl_todo where  created_by='" + Session["Username"].ToString() + "' and type='Self' and status='Pending' and todo_type='FHTD' and req='' union all select * from tbl_todo where  assign_to='" + Session["Username"].ToString() + "' and type='Assign' and status='Pending' and todo_type='FHTD' and req='' order by order_by asc");
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        if (Session["type"].ToString() == "Administrator")
        {
            cls.gridbind(GridView1, "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '00:00:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101) select * from tbl_todo where   type='Self' and status='Pending' and todo_type='FMTD' and req='' union all select * from tbl_todo where date=@date_new  and type='Assign' and status='Pending' and todo_type='FMTD' and req='' order by order_by asc");
        }
        else
        {
            cls.gridbind(GridView1, "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '00:00:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101) select * from tbl_todo where  created_by='" + Session["Username"].ToString() + "' and type='Self' and status='Pending' and todo_type='FMTD' and req='' union all select * from tbl_todo where  assign_to='" + Session["Username"].ToString() + "' and type='Assign' and status='Pending' and todo_type='FMTD' and req='' order by order_by asc");
        }
    }
}