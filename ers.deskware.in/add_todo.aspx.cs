using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class add_todo : System.Web.UI.Page
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
                cls.bind_ddl(DropDownList1, "SELECT distinct id,user_id,name FROM user_master  where  status='Active' order by name asc", "name", "user_id");
                DropDownList1.Items.Insert(0, new ListItem("Select", ""));
            }
        }
    }
    protected void btnview_Click(object sender, EventArgs e)
    {
        cls.gridbind(GridView1, "select top 150 * from tbl_todo where created_by='" + Session["Username"].ToString() + "' and CAST(date AS DATE)='" + System.DateTime.Now.ToString("MM/dd/yyyy") + "' and todo_type='DTD' order by date desc");
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        string time = DropDownList2.SelectedValue + ":" + DropDownList3.SelectedValue + ":" + DropDownList4.SelectedValue;
        cmd = conn.CreateCommand();
        conn.Open();
        cmd.CommandText = "insert into tbl_todo values('" + RadioButtonList1.SelectedItem.Text + "','" + txtreport.Text.Trim() + "','" + DateTime.ParseExact(TextBox1.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "','" + time + "','" + DropDownList1.SelectedValue + "','" + Session["Username"].ToString() + "','Pending',getdate(),'Pending','','DTD','','','" + DropDownList5 .SelectedValue+ "')";
        cmd.ExecuteNonQuery();
        conn.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Submitted Sucessfully');window.location='add_todo.aspx';", true);
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lbldeleteid = (Label)row.FindControl("Label1");
        Label Label2 = (Label)row.FindControl("Label2");
        if (Label2.Text != "Completed")
        {
            conn.Open();
            SqlCommand cmd = new SqlCommand("delete FROM tbl_todo where id='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", conn);
            cmd.ExecuteNonQuery();
            conn.Close();
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Deleted Sucessfully');", true);
            cls.gridbind(GridView1, "select top 150 * from tbl_todo where created_by='" + Session["Username"].ToString() + "' and CAST(date AS DATE)='" + System.DateTime.Now.ToString("MM/dd/yyyy") + "' and todo_type='DTD'  order by date desc");
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Access Denied');", true);
        }

    }
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedValue == "1")
        {
            div1.Visible=false;
        }
        else
        {
             div1.Visible=true;
        }
    }
}