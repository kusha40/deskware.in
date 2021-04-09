using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class knowledge_base : System.Web.UI.Page
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
            cls.gridbind(GridView1, "select * from tbl_document_details order by title asc ");
            cls.bind_ddl(ddlname, " select title,id from tbl_document_details order by title asc", "title", "id");
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        cls.gridbind(GridView1, "select * from tbl_document_details order by title asc ");
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Reset Sucessfully');window.location='knowledge_base.aspx';", true);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        cls.gridbind(GridView1, "select * from tbl_document_details where id='"+ddlname.SelectedValue+"' order by title asc ");
    }
}