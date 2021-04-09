using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class feedback_report : System.Web.UI.Page
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
            cls.gridbind(GridView1, "select * from tbl_feedback order by date desc");
        }

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Reset Sucessfully');window.location='feedback.aspx';", true);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        GridView1.AllowPaging = false;
       string _fromdate = DateTime.ParseExact(txtfrom.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
       string _todate = DateTime.ParseExact(txtto.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
       cls.gridbind(GridView1, "select * from tbl_feedback where date between '"+_fromdate+"' and '"+_todate+"' order by date desc");
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        cls.gridbind(GridView1, "select * from tbl_feedback order by date desc");
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if (Session["type"].ToString() == "Administrator")
        {
            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
            con.Open();
            SqlCommand cmd = new SqlCommand("delete FROM tbl_feedback_reply where fid='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Deleted Sucessfully');", true);
            cls.gridbind(GridView1, "select * from tbl_feedback order by date desc");
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('You are not authorized for remove section');", true);
        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label id = e.Row.FindControl("Label1") as Label;
            Label rating = e.Row.FindControl("Label2") as Label;
            Label comment = e.Row.FindControl("Label3") as Label;

            GridView GridView2 = e.Row.FindControl("GridView2") as GridView;
            SqlDataAdapter adap = new SqlDataAdapter("select * from tbl_feedback_reply where fid='" + id.Text + "' ", con);
            DataSet ds = new DataSet();
            adap.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dr = ds.Tables[0].Rows[0];
                rating.Text = dr["rating"].ToString();
                comment.Text = dr["comment"].ToString();
            }
            cls.gridbind(GridView2, "select type,sts from tbl_feedback_reply where fid='" + id.Text + "'");
        }
    }
}