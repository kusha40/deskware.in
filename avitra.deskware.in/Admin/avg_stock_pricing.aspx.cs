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

public partial class Admin_avg_stock_pricing : System.Web.UI.Page
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
                cls.gridbind(GridView2, "select distinct size,c_name,unit,P_type from  tbl_product_master order by size asc");
            }
    }
    protected void ChkAllRows(object sender, EventArgs e)
    {

        CheckBox chkall = (CheckBox)GridView2.HeaderRow.FindControl("chkAll");
        for (int i = 0; i < GridView2.Rows.Count; i++)
        {
            CheckBox chkrow = (CheckBox)GridView2.Rows[i].FindControl("chkAll0");
            if (chkall.Checked == true)
            {
                chkrow.Checked = true;
            }
            else
            {
                chkrow.Checked = false;
            }
        }


    }
    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label size = e.Row.FindControl("Label1") as Label;
            Label c_name = e.Row.FindControl("Label3") as Label;
            Label d_price = e.Row.FindControl("Label8") as Label;
            TextBox TextBox4 = e.Row.FindControl("TextBox4") as TextBox;


            SqlDataAdapter adap = new SqlDataAdapter("select isnull(sum(qty),0)as qty from tbl_stock_qty_master where size='" + size.Text + "' and c_name='" + c_name.Text + "'", con);
            DataSet ds = new DataSet();
            adap.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dr = ds.Tables[0].Rows[0];
                //double getbal = double.Parse(dr["qty"].ToString());
                d_price.Text = dr["qty"].ToString();
               // TextBox4.Text = getbal.ToString("n2");

            }
            else
            {
                d_price.Text = "0.00";
                //TextBox4.Text = "0.00";
            }

            SqlDataAdapter adap1 = new SqlDataAdapter("select top 1 isnull(avgprice,0)as qty from tbl_avg_stock_pricing where size='" + size.Text + "' and c_name='" + c_name.Text + "' order by id desc", con);
            DataSet ds1 = new DataSet();
            adap1.Fill(ds1);
            if (ds1.Tables[0].Rows.Count != 0)
            {
                DataRow dr1 = ds1.Tables[0].Rows[0];
                double getbal = double.Parse(dr1["qty"].ToString());
                TextBox4.Text = getbal.ToString();
                // TextBox4.Text = getbal.ToString("n2");

            }
            else
            {
                TextBox4.Text = "0.00";
                //TextBox4.Text = "0.00";
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int count = 0;
        int j;
        for (j = 0; j < GridView2.Rows.Count; j++)
        {
            CheckBox cb = (CheckBox)GridView2.Rows[j].FindControl("chkAll0");
            Label size = (Label)GridView2.Rows[j].FindControl("Label1");
            Label c_name = (Label)GridView2.Rows[j].FindControl("Label3");
            Label unit = (Label)GridView2.Rows[j].FindControl("Label6");
            Label stock = (Label)GridView2.Rows[j].FindControl("Label8");
            TextBox price = (TextBox)GridView2.Rows[j].FindControl("TextBox4");
            string date = DateTime.ParseExact(txtfdate.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);

            double totlvalue = Convert.ToDouble(double.Parse(stock.Text.Trim())* double.Parse(price.Text.Trim()));

            if (cb.Checked == true)
            {
                count++;
                cmd = con.CreateCommand();
                con.Open();
                //cmd.CommandText = " insert into tbl_avg_stock_pricing values ('" + size.Text + "','" + c_name.Text + "','" + stock.Text + "','" + price.Text.Trim() + "','" + unit.Text + "','" + totlvalue + "','" + date + "')";
                cmd.CommandText = "update tbl_avg_stock_pricing  set stock='" + stock.Text + "',avgprice='" + price.Text + "',totlvalue='" + totlvalue + "',date='"+date+"'  where size='" + size.Text + "' and c_name='" + c_name.Text + "' ";
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        if (count > 0)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Submitted Sucessfully');window.location='avg_stock_pricing.aspx';", true);
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Check Item in the List');", true);
        }
    }
}