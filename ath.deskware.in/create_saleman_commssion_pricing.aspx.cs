using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class create_saleman_commssion_pricing : System.Web.UI.Page
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
            cls.bind_ddl(ddlsalesman, " select name,id from tbl_salesman_master", "name", "id");
            product_bind();
        }
    }
    
    public void product_bind()
    {
        SqlDataAdapter adap = new SqlDataAdapter("select * from tbl_salesman_master where id='" + ddlsalesman.SelectedValue +"'", con);
        DataSet ds = new DataSet();
        adap.Fill(ds);
        {
            DataRow dr = ds.Tables[0].Rows[0];
             dealer_id.Text = dr["dealer_id"].ToString();
             dealer_name.Text = dr["dealer_name"].ToString();

             cls.gridbind(GridView2, "select  max(size)as size , max(c_name) as c_name, max(p_type)as p_type, max(price)as price,max(unit)as unit,max(id)as id from tbl_dealer_product_pricing  where dealer_id='" + dealer_id.Text + "' and name='" + dealer_name.Text + "'  group by c_name,size");

            
        }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        int count = 0;
        int j;
        for (j = 0; j < GridView2.Rows.Count; j++)
        {
            CheckBox cb = (CheckBox)GridView2.Rows[j].FindControl("chkAll0");
            Label size = (Label)GridView2.Rows[j].FindControl("Label2");
            Label c_name = (Label)GridView2.Rows[j].FindControl("Label3");
            Label p_type = (Label)GridView2.Rows[j].FindControl("Label4");
            Label unit = (Label)GridView2.Rows[j].FindControl("Label6");
            TextBox price = (TextBox)GridView2.Rows[j].FindControl("TextBox4");
            
            if (cb.Checked == true)
            {
                count++;

                cmd = con.CreateCommand();
                con.Open();
                cmd.CommandText = "insert into tbl_salesman_commission_pricing values('" + dealer_id.Text + "','" + dealer_name.Text + "','" + ddlsalesman.SelectedValue + "','" + ddlsalesman.SelectedItem.Text + "','" + size.Text + "','" + c_name.Text + "','" + p_type.Text + "','" + price.Text + "','" + unit.Text + "')";
                cmd.ExecuteNonQuery();
                con.Close();
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
    public void bind()
    {
        cls.gridbind(GridView1, " Select * from tbl_salesman_commission_pricing where salesman_id='" + ddlsalesman.SelectedValue + "'and salesman_name='" + ddlsalesman.SelectedItem.Text + "' order by size asc");
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lbldeleteid = (Label)row.FindControl("Label1");
        con.Open();
        SqlCommand cmd = new SqlCommand("delete FROM tbl_salesman_commission_pricing where id='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Deleted Sucessfully');", true);
        bind();

    }
    protected void btnview_Click(object sender, EventArgs e)
    {
        bind();
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
    protected void ddlsalesman_SelectedIndexChanged(object sender, EventArgs e)
    {
        bind();
        product_bind();
    }
    protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label size = e.Row.FindControl("Label2") as Label;
            Label c_name = e.Row.FindControl("Label3") as Label;
            Label s_price = e.Row.FindControl("Label8") as Label;
            TextBox TextBox4 = e.Row.FindControl("TextBox4") as TextBox;

            SqlDataAdapter adap = new SqlDataAdapter("select top 1 s_price from tbl_dealer_salesman_minimum_pricing where size='" + size.Text + "' and c_name='" + c_name.Text + "'  order by id desc ", con);
            DataSet ds = new DataSet();
            adap.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dr = ds.Tables[0].Rows[0];
                double getbal = double.Parse(dr["s_price"].ToString());
                s_price.Text = getbal.ToString("n2");
               // TextBox4.Text = getbal.ToString("n2");
            }
            else
            {
                s_price.Text = "0.00";
                TextBox4.Text = "0.00";
            }
        }
    }
    protected void txtBox_TextChanged(object sender, EventArgs e)
    {
        TextBox txt = (TextBox)sender;
        GridViewRow gvRow = (GridViewRow)txt.Parent.Parent;

        Label max = (Label)gvRow.FindControl("Label8");
        TextBox d_price1 = (TextBox)gvRow.FindControl("TextBox4");

        double a = double.Parse(max.Text.ToString());
        double b = double.Parse(d_price1.Text.ToString());

        if (b > a)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Exceed Amount');", true);
            d_price1.Text = "0";
        }
        else
        {

        }
    }
    protected void btnview0_Click(object sender, EventArgs e)
    {
        cmd = con.CreateCommand();
        con.Open();
        cmd.CommandText = " delete tbl_salesman_commission_pricing where salesman_id='" + ddlsalesman.SelectedValue + "'and salesman_name='" + ddlsalesman.SelectedItem.Text + "' ";
        cmd.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Deleted Sucessfully');", true);
    }
    protected void btnview1_Click(object sender, EventArgs e)
    {
        cmd = con.CreateCommand();
        con.Open();
        cmd.CommandText = " delete tbl_salesman_commission_pricing ";
        cmd.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Deleted Sucessfully');", true);
    }
}