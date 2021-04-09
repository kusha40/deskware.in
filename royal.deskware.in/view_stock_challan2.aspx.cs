using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class view_stock_challan2 : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
    SqlCommand cmd;
    Class1 cls = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] == null)
        {
            Response.Redirect("stock_entry_without_purchase.aspx");
        }
        if (!IsPostBack)
        {
            cls.gridbind(GridView1, "select *  from tbl_stock_master where stock_id='" + Request.QueryString["id"].ToString() + "' and c_name='" + Request.QueryString["cname"].ToString() + "' ");
            int i; double totl = 0;
            for (i = 0; i < GridView1.Rows.Count; i++)
            {
                Label debit = GridView1.Rows[i].FindControl("Label201") as Label;
                totl += double.Parse(debit.Text);
            }
            Label4.Text = totl.ToString("n2");
        }
    }
    double labour_price, del_p_qty = 0;
    string del_p_code = "";
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lbldeleteid = (Label)row.FindControl("Label1");
        Label pp_CODE = (Label)row.FindControl("Label4");
        Label ppp_qty = (Label)row.FindControl("Label201");

        Label id = (Label)row.FindControl("Label2");

        del_p_code = pp_CODE.Text;
        del_p_qty = Convert.ToDouble(ppp_qty.Text);
        con.Open();
        SqlCommand cmd = new SqlCommand("delete FROM tbl_stock_master where id='" + id.Text + "'", con);
        SqlCommand cmd2 = new SqlCommand("delete FROM tbl_trolla_labour_ledger_master where stock_id='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
        cmd.ExecuteNonQuery();
        cmd2.ExecuteNonQuery();
        cmd.ExecuteNonQuery();
        con.Close();
        stock_updation_reverse();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Deleted Sucessfully');", true);
        cls.gridbind(GridView1, "select *  from tbl_stock_master where stock_id='" + Request.QueryString["id"].ToString() + "' and c_name='" + Request.QueryString["cname"].ToString() + "' ");
    }
    public void stock_updation_reverse()
    {
        SqlDataAdapter adap1 = new SqlDataAdapter("select  qty from tbl_stock_qty_master where p_code='" + del_p_code + "'", con);
        DataSet ds1 = new DataSet();
        adap1.Fill(ds1);
        if (ds1.Tables[0].Rows.Count != 0)
        {
            DataRow dr1 = ds1.Tables[0].Rows[0];
            Label8.Text = dr1["qty"].ToString();
        }
        else
        {
            Label8.Text = "0";
        }

        //  Label8.Text = Convert.ToDouble(double.Parse(Label8.Text) + double.Parse(txtqty.Text.Trim())).ToString();
        Label8.Text = Convert.ToDouble(double.Parse(Label8.Text) - del_p_qty).ToString();
           
        SqlCommand cmd5 = con.CreateCommand();
             con.Open();
            cmd5.CommandText = "update tbl_stock_qty_master  set qty= '" + Label8.Text + "' where   p_code='" + del_p_code + "' ";
            cmd5.ExecuteNonQuery();
              con.Close();
        }
  
}