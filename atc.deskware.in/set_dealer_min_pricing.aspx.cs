using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class set_dealer_min_pricing : System.Web.UI.Page
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
           
            cls.bind_ddl(ddldealer, "Select name,id from tbl_dealer_Master order by name asc", "name", "id");
            cls.bind_ddl(ddlcompname, "Select name from tbl_company_master order by name asc", "name", "name");
            bind_temp();
        }
    }
    protected void ddlsize_SelectedIndexChanged(object sender, EventArgs e)
    {
        cls.bind_ddl(ddlcompname, "Select distinct c_name from tbl_product_master where size='" + ddlsize.SelectedValue + "' order by c_name asc", "c_name", "c_name");
    }
    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "delete1")
        {
            if (GridView2.Rows.Count > 0)
            {
                DataTable dt = (DataTable)ViewState["stock1"];
                GridViewRow row = (GridViewRow)(((Control)e.CommandSource).NamingContainer);
                DataTable dtCurrentTable = new DataTable();
                int RowIndex = row.RowIndex;
                dtCurrentTable = dt;
                dtCurrentTable.Rows.RemoveAt(row.RowIndex);
                GridView2.DataSource = dt;
                GridView2.DataBind();
            }
        }
    }
    protected void btnview_Click(object sender, EventArgs e)
    {
      bind();
    }
    public void bind()
    {
        //cls.gridbind(GridView1, "select max(dealer_name)as dealer_name,max(dealer_id)as dealer_id,max(size)as size,max(c_name)as c_name,max(d_price)as d_price,max(s_price)as s_price from tbl_dealer_salesman_minimum_pricing   group by c_name,size");

        cls.gridbind(GridView1, "select * from tbl_dealer_salesman_minimum_pricing order by c_name asc ");
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
      
        int count = 0;
        int j;
        for (j = 0; j < GridView2.Rows.Count; j++)
        {
            Label size = (Label)GridView2.Rows[j].FindControl("lblsize");
            Label c_name = (Label)GridView2.Rows[j].FindControl("lblc_name");
            Label lbld_price = (Label)GridView2.Rows[j].FindControl("lbld_price");
            Label lbls_price = (Label)GridView2.Rows[j].FindControl("lbls_price");
            count++;
            cmd = con.CreateCommand();
            con.Open();
            cmd.CommandText = " insert into tbl_dealer_salesman_minimum_pricing values('','','" + size.Text + "','" + c_name.Text + "','" + lbld_price.Text + "','" + lbls_price.Text + "')";
                cmd.ExecuteNonQuery();
                con.Close();
               
            }
      
        if (count > 0)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Submitted Sucessfully');window.location='set_dealer_min_pricing.aspx';", true);
        }
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        con.Open();
        SqlCommand cmd = new SqlCommand("delete FROM tbl_dealer_salesman_minimum_pricing where id='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Deleted Sucessfully');", true);
        bind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        DataTable dt = (DataTable)ViewState["stock1"];
        dt.Rows.Add(ddlsize.SelectedValue, ddlcompname.SelectedValue, txtdprice.Text, txtsprice.Text);
        ViewState["stock1"] = dt;
        GridView2.DataSource = (DataTable)ViewState["stock1"];
        GridView2.DataBind();
        txtdprice.Text = txtsprice.Text = string.Empty;
    }
    public void bind_temp()
    {
        DataTable dt = new DataTable();
        dt.Columns.AddRange(
              new DataColumn[4] 
            { 
                                new DataColumn("size", typeof(string)),

                new DataColumn("c_name", typeof(string)),
                    new DataColumn("d_price", typeof(string)),
                            new DataColumn("s_price", typeof(string)),
                                                         
            }

          );
        ViewState["stock1"] = dt;
        GridView2.DataSource = (DataTable)ViewState["stock1"];
        GridView2.DataBind();
    }

    protected void btnview0_Click(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand("delete FROM tbl_dealer_salesman_minimum_pricing ", con);
        cmd.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Deleted Sucessfully');", true);
        bind();
    }
}