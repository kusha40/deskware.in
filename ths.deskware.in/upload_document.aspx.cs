using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class upload_document : System.Web.UI.Page
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
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Reset Sucessfully');window.location='upload_document.aspx';", true);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            string folder = Server.MapPath("");
            var newPath1 = DateTime.Now.ToString("yyyymmhhddMMss") + FileUpload1.PostedFile.FileName;
            FileUpload1.SaveAs(folder + "\\docs\\" + newPath1);
            string path = "docs/" + newPath1;

            cmd = con.CreateCommand();
            con.Open();
            cmd.CommandText = " insert into tbl_document_details  values('" + txttitle.Text.Trim() + "','" + path + "')  ";
            cmd.ExecuteNonQuery();
            con.Close();
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Submitted Sucessfully');window.location='upload_document.aspx';", true);
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Please Chosse File for Upload');", true);
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        cls.gridbind(GridView1, "select * from tbl_document_details order by title asc ");
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edit1")
        {
            cmd = con.CreateCommand();
            con.Open();
            cmd.CommandText = " delete tbl_document_details  where id='" + e.CommandArgument.ToString() + "' ";
            cmd.ExecuteNonQuery();
            con.Close();
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Deleted Sucessfully');", true);
            cls.gridbind(GridView1, "select * from tbl_document_details order by title asc ");
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        cls.gridbind(GridView1, "select * from tbl_document_details order by title asc ");
    }
}