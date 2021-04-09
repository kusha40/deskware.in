using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cancel_challan_view : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
    SqlCommand cmd;
    Class1 cls = new Class1();
    string sesion;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] == null && Session["type"] == null)
        {
            Response.Redirect("~/login.aspx");
        }
    }
    string commd = "";
    protected void Button1_Click(object sender, EventArgs e)
    {
        sesion = Session["Username"].ToString();
        cmd = con.CreateCommand();
        con.Open();
        cmd.CommandText = "select password from user_master where password='" + TextBox2.Text.Trim() + "'  and user_id='accounts'  ";
        SqlDataReader dr = cmd.ExecuteReader();
        if (dr.HasRows)
        {
            dr.Close();
            con.Close();
            stock_Update_cancel();
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Current Password is Wrong');", true);
        }
    }

    public void stock_Update_cancel()
    {
        cls.gridbind(GridView2, "select * from tbl_challan_details_master where challan_no='" + Request.QueryString["id"].ToString() + "' ");

        con.Open();
        SqlCommand cmd = new SqlCommand("delete FROM tbl_daily_labour_ledger_master where challan_no='" + Request.QueryString["id"].ToString() + "'", con);
        SqlCommand cmd1 = new SqlCommand("delete FROM tbl_dealer_ledger_master where challan_no='" + Request.QueryString["id"].ToString() + "'", con);
        SqlCommand cmd2 = new SqlCommand("delete FROM tbl_driver_ledger_master where challan_no='" + Request.QueryString["id"].ToString() + "'", con);
        SqlCommand cmd3 = new SqlCommand("update  tbl_challan_details_master set status='Cancel' where challan_no='" + Request.QueryString["id"].ToString() + "'", con);
        SqlCommand cmd4 = new SqlCommand("delete from  tbl_salesman_ledger_master  where challan_no='" + Request.QueryString["id"].ToString() + "'", con);

        cmd.ExecuteNonQuery();
        cmd1.ExecuteNonQuery();
        cmd2.ExecuteNonQuery();
        cmd3.ExecuteNonQuery();
        cmd4.ExecuteNonQuery();
        con.Close();
        update_stock();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Cancelled Sucessfully');", true);
           }
    public void update_stock()
    {
        for (int i = 0; i < GridView2.Rows.Count; i++)
        {

            Label lblqty = (Label)GridView2.Rows[i].FindControl("lblqty");
            Label lblsize = (Label)GridView2.Rows[i].FindControl("lblsize");
            Label lblc_name = (Label)GridView2.Rows[i].FindControl("lblc_name");
            Label lblp_code = (Label)GridView2.Rows[i].FindControl("lblp_code");
            Label lblp_grade = (Label)GridView2.Rows[i].FindControl("lblp_grade");

            SqlDataAdapter adap1 = new SqlDataAdapter("select sum(qty) as qty from tbl_stock_qty_master where size='" + lblsize.Text + "' and c_name='" + lblc_name.Text + "' and p_code='" + lblp_code.Text + "' and p_grade='" + lblp_grade.Text + "'", con);
            DataSet ds1 = new DataSet();
            adap1.Fill(ds1);
            {
                DataRow dr1 = ds1.Tables[0].Rows[0];
                Label41.Text = dr1["qty"].ToString();

                if (Request.QueryString["typ"].ToString() == "FI")
                {
                    Label41.Text = Convert.ToDouble(double.Parse(Label41.Text.Trim()) + double.Parse(lblqty.Text.Trim())).ToString();
                }
                if (Request.QueryString["typ"].ToString() == "RI")
                {
                    Label41.Text = Convert.ToDouble(double.Parse(Label41.Text.Trim()) - double.Parse(lblqty.Text.Trim())).ToString();
                }
                if (Request.QueryString["typ"].ToString() == "WM")
                {
                    return;
                }
                SqlCommand cmd5 = con.CreateCommand();
                con.Open();
                cmd5.CommandText = " update tbl_stock_qty_master set  qty='" + Label41.Text + "' where    size='" + lblsize.Text + "' and c_name='" + lblc_name.Text + "' and p_code='" + lblp_code.Text + "' and p_grade='" + lblp_grade.Text + "'";
                cmd5.ExecuteNonQuery();
                con.Close();
            }
        }

    }
}