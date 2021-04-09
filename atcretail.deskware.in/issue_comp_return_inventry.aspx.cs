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

public partial class issue_comp_return_inventry : System.Web.UI.Page
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
            cls.bind_ddl(ddlcompname, "Select name from tbl_company_master order by name asc", "name", "name");
            cls.bind_ddl(ddlpcode, "select p_code from tbl_product_master", "p_code", "p_code");
            cls.bind_ddl(ddlsize, "Select size from tbl_size_master order by size asc", "size", "size");
            po_no();
            bind_temp();
        }
    }
    public void po_no()
    {

        cmd = con.CreateCommand();
        con.Open();
        cmd.CommandText = "  SELECT  RIGHT('0000'+ isnull(CONVERT(VARCHAR,max(cast(challan_no as bigint))+1),0),4) as id FROM tbl_comp_return_challan_details ";
        txtchallanno.Text = cmd.ExecuteScalar().ToString();
        con.Close();
        if (txtchallanno.Text == "0000")
        {
            txtchallanno.Text = "0001";
        }
    }
    public void bind_temp()
    {
        DataTable dt = new DataTable();
        dt.Columns.AddRange(
              new DataColumn[7] 
            { 
                                new DataColumn("qty", typeof(string)),

                new DataColumn("unit", typeof(string)),
                    new DataColumn("size", typeof(string)),
                            new DataColumn("c_name", typeof(string)),
                             new DataColumn("p_code", typeof(string)),
                                new DataColumn("rate", typeof(string)),
                                   new DataColumn("amount", typeof(string))
            }

          );
        ViewState["challan"] = dt;
        GridView1.DataSource = (DataTable)ViewState["challan"];
        GridView1.DataBind();
    }
    public void bind_mrp()
    {
        SqlDataAdapter adap = new SqlDataAdapter("select price from tbl_comp_product_pricing where cname='" + ddlcompname.SelectedValue + "' and size='" + ddlsize.SelectedValue + "' ", con);
        DataSet ds = new DataSet();
        adap.Fill(ds);
        if (ds.Tables[0].Rows.Count != 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];
            txtmrp.Text = dr["price"].ToString();
        }
        else
        {
            txtmrp.Text = "0";
        }
        con.Close();
    }
    protected void txtmrp_TextChanged(object sender, EventArgs e)
    {
        TextBox txt = (TextBox)sender;
        GridViewRow gvRow = (GridViewRow)txt.Parent.Parent;

        Label AMOUNT = (Label)gvRow.FindControl("Label1");
        Label txtqty = (Label)gvRow.FindControl("Label2");
        TextBox txtmrp = (TextBox)gvRow.FindControl("Label5");

        double a = double.Parse(txtqty.Text.ToString());
        double b = double.Parse(txtmrp.Text.ToString());
        double c = a * b;
        AMOUNT.Text = c.ToString();

        int i; double totl = 0;
        for (i = 0; i < GridView1.Rows.Count; i++)
        {
            Label bal1 = GridView1.Rows[i].FindControl("Label1") as Label;
            totl += double.Parse(bal1.Text);
        }
        txttotlamt.Text = totl.ToString();

       

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //bind_mrp();
       // double amount = (double.Parse(txtmrp.Text.Trim()) * (double.Parse(txtqty.Text.Trim())));
        DataTable dt = (DataTable)ViewState["challan"];
        dt.Rows.Add(txtqty.Text.Trim(), ddlsize0.SelectedValue, ddlsize.SelectedValue, ddlcompname.SelectedValue, ddlpcode.SelectedValue, txtmrp.Text.Trim(), '0');
        ViewState["challan"] = dt;
        GridView1.DataSource = (DataTable)ViewState["challan"];
        GridView1.DataBind();
        txtqty.Text = string.Empty;



        int i; double totl = 0;
        for (i = 0; i < GridView1.Rows.Count; i++)
        {
            Label bal1 = GridView1.Rows[i].FindControl("Label1") as Label;
            totl += double.Parse(bal1.Text);
        }
        txttotlamt.Text = totl.ToString();
    }
    string ddlsize1, ddlcompname1, ddlpcode1, ddlprotype1, qty2 = "";
    int count = 0;
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            int j;
            po_no();
            for (j = 0; j < GridView1.Rows.Count; j++)
            {
                Label qty = (Label)GridView1.Rows[j].FindControl("Label2");
                Label unit = (Label)GridView1.Rows[j].FindControl("Label4");
                Label size = (Label)GridView1.Rows[j].FindControl("Label40");
                Label c_name = (Label)GridView1.Rows[j].FindControl("Label41");
                Label p_code = (Label)GridView1.Rows[j].FindControl("Label31");
                TextBox rate = (TextBox)GridView1.Rows[j].FindControl("Label5");
                Label amount = (Label)GridView1.Rows[j].FindControl("Label1");
                count++;

                ddlsize1 = size.Text;
                ddlcompname1 = c_name.Text;
                ddlpcode1 = p_code.Text;
                qty2 = qty.Text;




                string date = DateTime.ParseExact(txtdate.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
                cmd = con.CreateCommand();
                SqlCommand cmd1 = con.CreateCommand();
                con.Open();
                cmd.CommandText = "insert into tbl_comp_return_challan_details values('" + txtchallanno.Text.Trim() + "','" + c_name.Text.Trim() + "','" + size.Text.Trim() + "','" + qty.Text + "','" + p_code.Text + "','" + unit.Text + "','" + rate.Text + "','" + amount.Text + "','" + txttotlamt.Text + "','" + date + "','" + Session["Username"].ToString() + "')";
                cmd.ExecuteNonQuery();

                cmd1.CommandText = "insert into tbl_company_ledger_master values('" + c_name.Text.Trim() + "','" + txttotlamt.Text + "','','" + date + "','" + txtchallanno.Text.Trim() + "','Inventory Purchase')";
                cmd1.ExecuteNonQuery();

                con.Close();





            }

            if (count > 0)
            {
                bind_stock();
                ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Created Sucessfully');window.location='issue_comp_return_inventry.aspx';", true);

            }
        }
        catch (Exception er)
        {
        }
        finally
        {

        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "delete1")
        {


            if (GridView1.Rows.Count > 0)
            {

                DataTable dt = (DataTable)ViewState["challan"];
                GridViewRow row = (GridViewRow)(((Control)e.CommandSource).NamingContainer);
                DataTable dtCurrentTable = new DataTable();
                int RowIndex = row.RowIndex;
                dtCurrentTable = dt;
                dtCurrentTable.Rows.RemoveAt(row.RowIndex);
                GridView1.DataSource = dt;
                GridView1.DataBind();

                int i; double totl = 0;
                for (i = 0; i < GridView1.Rows.Count; i++)
                {
                    Label bal1 = GridView1.Rows[i].FindControl("Label1") as Label;
                    totl += double.Parse(bal1.Text);
                }
                txttotlamt.Text = totl.ToString();
            }
        }
    }
    public void bind_stock()
    {
        SqlDataAdapter adap1 = new SqlDataAdapter("select sum(qty) as qty from tbl_stock_qty_master where size='" + ddlsize1 + "' and c_name='" + ddlcompname1 + "' and p_code='" + ddlpcode1 + "'", con);
        DataSet ds1 = new DataSet();
        adap1.Fill(ds1);
        {
            DataRow dr1 = ds1.Tables[0].Rows[0];
            Label3.Text = dr1["qty"].ToString();

            Label3.Text = Convert.ToDouble(double.Parse(Label3.Text.Trim()) + double.Parse(qty2)).ToString();

            SqlCommand cmd5 = con.CreateCommand();
            con.Open();
            //cmd5.CommandText = " update tbl_stock_qty_master set  qty='" + Label3.Text + "' where   size= '" + ddlsize.SelectedValue + "' and c_name='" + ddlcompname.SelectedValue + "' and p_code='" + ddlpcode.SelectedValue + "' and p_grade='" + ddlprotype.SelectedValue + "'";

            cmd5.CommandText = " update tbl_stock_qty_master set  qty='" + Label3.Text + "' where   size= '" + ddlsize1 + "' and c_name='" + ddlcompname1 + "' and p_code='" + ddlpcode1 + "' ";

            cmd5.ExecuteNonQuery();
            con.Close();

        }
    }
}