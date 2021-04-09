using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class comp_ledger_edit : System.Web.UI.Page
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
        if (Request.QueryString["cno"] == null)
        {
            Response.Redirect("dashboard.aspx");
        }
        if (!IsPostBack)
        {
            cls.gridbind(GridView1, "Select * from tbl_challan_details_master where challan_no='" + Request.QueryString["cno"].ToString() + "'");
        }
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        cls.gridbind(GridView1, "Select * from tbl_challan_details_master where challan_no='" + Request.QueryString["cno"].ToString() + "'");
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label MRP = e.Row.FindControl("Label5") as Label;
            Label Amount = e.Row.FindControl("Label1") as Label;
            TextBox txtmrp = e.Row.FindControl("txtmrp") as TextBox;

            Label cname1 = e.Row.FindControl("lblcname") as Label;
            Label size1 = e.Row.FindControl("lblsize") as Label;

             Label lblqty = e.Row.FindControl("lblqty") as Label;
             Label lblcompid = e.Row.FindControl("lblcompid") as Label;
            

            SqlDataAdapter adap = new SqlDataAdapter("select price from tbl_comp_product_pricing where cname='" + cname1.Text + "' and size='" + size1.Text + "'", con);
            DataSet ds = new DataSet();
            adap.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dr = ds.Tables[0].Rows[0];
              double  cmprice = double.Parse(dr["price"].ToString());
              MRP.Text = cmprice.ToString("n2");

              double a1 = cmprice * double.Parse(lblqty.Text);
              Amount.Text = a1.ToString("n2");

            }

        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label cname1 = (Label)row.FindControl("lblcname") ;
        Label size1 = (Label)row.FindControl("lblsize");
        Label lblqty = (Label)row.FindControl("lblqty");
        Label pcode = (Label)row.FindControl("Label31");

        
        //con.Open();
        //SqlCommand cmd = new SqlCommand("delete FROM tbl_company_master where c_name='" + id.Text.Trim() + "',", con);
        //cmd.ExecuteNonQuery();
        //con.Close();
        //cls.gridbind(GridView1, "Select * from tbl_challan_details_master where challan_no='" + Request.QueryString["cno"].ToString() + "'");
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
     GridView1.EditIndex = e.NewEditIndex;
      //cls.gridbind(GridView1, "Select * from tbl_challan_details_master where challan_no='" + Request.QueryString["cno"].ToString() + "'");
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {

    }
    protected void txtqty_TextChanged(object sender, EventArgs e)
    {
        TextBox txt = (TextBox)sender;
        GridViewRow gvRow = (GridViewRow)txt.Parent.Parent;

        Label AMOUNT = (Label)gvRow.FindControl("Label1");
        TextBox txtqty = (TextBox)gvRow.FindControl("txtqty");
        TextBox txtmrp = (TextBox)gvRow.FindControl("txtmrp");

        double a = double.Parse(txtqty.Text.ToString());
        double b = double.Parse(txtmrp.Text.ToString());
        double c = a * b;
        AMOUNT.Text = c.ToString();
    }
    protected void txtmrp_TextChanged(object sender, EventArgs e)
    {
        TextBox txt = (TextBox)sender;
        GridViewRow gvRow = (GridViewRow)txt.Parent.Parent;

        Label AMOUNT = (Label)gvRow.FindControl("Label1");
        TextBox txtqty = (TextBox)gvRow.FindControl("txtqty");
        TextBox txtmrp = (TextBox)gvRow.FindControl("txtmrp");

        double a = double.Parse(txtqty.Text.ToString());
        double b = double.Parse(txtmrp.Text.ToString());
        double c = a * b;
        AMOUNT.Text = c.ToString();
    }
}