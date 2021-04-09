using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class all_dealer_pricing_once : System.Web.UI.Page
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
            
            cls.bind_chklist(CheckBoxList1 ,"select name,id from tbl_dealer_Master order by name asc", "name", "id");



            CheckBoxList1.Items.Insert(0, new ListItem("Sample", "5001"));
            CheckBoxList1.Items.Insert(1, new ListItem("Breakage", "5002"));
            CheckBoxList1.Items.Insert(2, new ListItem("Lost", "5003"));
            CheckBoxList1.Items.Insert(3, new ListItem("Trolla Breakage", "5004"));

          
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
    protected void btnsubmit_Click(object sender, EventArgs e)
    {

      

        int count = 0;
        int j;
        for (j = 0; j < GridView2.Rows.Count; j++)
        {
            CheckBox cb = (CheckBox)GridView2.Rows[j].FindControl("chkAll0");
            Label size = (Label)GridView2.Rows[j].FindControl("Label1");
            Label c_name = (Label)GridView2.Rows[j].FindControl("Label3");
            Label p_type = (Label)GridView2.Rows[j].FindControl("Label4");
            Label unit = (Label)GridView2.Rows[j].FindControl("Label6");
            TextBox price = (TextBox)GridView2.Rows[j].FindControl("TextBox4");

            if (cb.Checked == true)
            {
                foreach (ListItem item in CheckBoxList1.Items)
                {
                    if (item.Selected == true)
                    {
                count++;
                cmd = con.CreateCommand();
                con.Open();
                cmd.CommandText = " insert into tbl_dealer_product_pricing values ('" + item.Value + "','" + item.Text + "','" + size.Text + "','" + c_name.Text + "','" + p_type.Text + "','" + price.Text.Trim() + "','" + unit.Text + "')";
                cmd.ExecuteNonQuery();
                con.Close();
                    }
                }
            }
        }
        if (count > 0)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Submitted Sucessfully');", true);
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Check Item in the List');", true);
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

            SqlDataAdapter adap = new SqlDataAdapter("select top 1 d_price from tbl_dealer_salesman_minimum_pricing where size='" + size.Text + "' and c_name='" + c_name.Text + "'  order by id desc ", con);
            DataSet ds = new DataSet();
            adap.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dr = ds.Tables[0].Rows[0];
                double getbal = double.Parse(dr["d_price"].ToString());
                d_price.Text = getbal.ToString("n2");
                TextBox4.Text = getbal.ToString("n2");
            }
            else
            {
                d_price.Text = "0.00";
                TextBox4.Text = "0.00";
            }
        }
    }
}