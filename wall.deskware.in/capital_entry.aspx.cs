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

public partial class Admin_capital_entry : System.Web.UI.Page
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
          
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string date = DateTime.ParseExact(txtdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
        double totlvalue = Convert.ToDouble(double.Parse(txtstock.Text.Trim()) + double.Parse(txtdealer.Text.Trim()) + double.Parse(txtcomp.Text.Trim()) + double.Parse(txttilehub.Text.Trim()) + double.Parse(txtadmincash.Text.Trim()) + double.Parse(txtobc.Text.Trim()) + double.Parse(txthdfc.Text.Trim()) + double.Parse(txtcurrent.Text.Trim()) + double.Parse(txtassets.Text.Trim()));
        cmd = con.CreateCommand();
        con.Open();
        cmd.CommandText = " insert into tbl_capital_master values('" + totlvalue + "','" + txtstock.Text.Trim() + "','" + txtdealer.Text.Trim() + "','" + txtcomp.Text.Trim() + "','" + txttilehub.Text.Trim() + "','" + txtadmincash.Text.Trim() + "','" + txtobc.Text.Trim() + "','" + txthdfc.Text.Trim() + "','" + txtcurrent.Text.Trim() + "','" + txtassets.Text.Trim() + "','" + date + "')";
        cmd.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Submitted Sucessfully');window.location='capital_entry.aspx';", true);
    }

    public void stock_bind()
    {
        string date = DateTime.ParseExact(txtdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
        SqlDataAdapter adap = new SqlDataAdapter("select isnull(sum(totlvalue),0)as totlvalue  from tbl_avg_stock_pricing where cast(date as date )='" + date + "' ", con);
        DataSet ds = new DataSet();
        adap.Fill(ds);
        if (ds.Tables[0].Rows.Count != 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];
            txtstock.Text = double.Parse(dr["totlvalue"].ToString()).ToString("n2");
        }
    }
    public void dealer_bind()
    {
        string date = DateTime.ParseExact(txtdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
        SqlDataAdapter adap = new SqlDataAdapter("select isnull((sum(debit)-sum(credit)),0)as bal from tbl_dealer_ledger_master where cast(date as date )<= '" + date + "' ", con);
        DataSet ds = new DataSet();
        adap.Fill(ds);
        if (ds.Tables[0].Rows.Count != 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];
            txtdealer.Text = double.Parse(dr["bal"].ToString()).ToString("n2");
        }
    }
    public void company_bind()
    {
        string date = DateTime.ParseExact(txtdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
        SqlDataAdapter adap = new SqlDataAdapter("select isnull((sum(credit)-sum(debit)),0)as bal from tbl_company_ledger_master where cast(date as date )<= '" + date + "' ", con);
        DataSet ds = new DataSet();
        adap.Fill(ds);
        if (ds.Tables[0].Rows.Count != 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];
            txtcomp.Text = double.Parse(dr["bal"].ToString()).ToString("n2");
        }
    }
    public void assets_bind()
    {
        string date = DateTime.ParseExact(txtdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
        SqlDataAdapter adap = new SqlDataAdapter("select isnull((sum(credit)-sum(debit)),0)as bal from tbl_assets_master where cast(date as date )<= '" + date + "' ", con);
        DataSet ds = new DataSet();
        adap.Fill(ds);
        if (ds.Tables[0].Rows.Count != 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];
            txtassets.Text = double.Parse(dr["bal"].ToString()).ToString("n2");
        }
    }

    public void obc_bind()
    {
        string date = DateTime.ParseExact(txtdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
        SqlDataAdapter adap = new SqlDataAdapter("select isnull((sum(credit)-sum(debit)),0)as bal from tbl_bank_ledger_master where cast(date as date )<= '" + date + "' and bank='OBC' ", con);
        DataSet ds = new DataSet();
        adap.Fill(ds);
        if (ds.Tables[0].Rows.Count != 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];
            txtobc.Text = double.Parse(dr["bal"].ToString()).ToString("n2");
        }
    }
    public void hdfc_bind()
    {
        string date = DateTime.ParseExact(txtdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
        SqlDataAdapter adap = new SqlDataAdapter("select isnull((sum(credit)-sum(debit)),0)as bal from tbl_bank_ledger_master where cast(date as date )<= '" + date + "' and bank='HDFC' ", con);
        DataSet ds = new DataSet();
        adap.Fill(ds);
        if (ds.Tables[0].Rows.Count != 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];
            txthdfc.Text = double.Parse(dr["bal"].ToString()).ToString("n2");
        }
    }
    public void current_bind()
    {
        string date = DateTime.ParseExact(txtdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
        SqlDataAdapter adap = new SqlDataAdapter("select isnull((sum(credit)-sum(debit)),0)as bal from tbl_bank_ledger_master where cast(date as date )<= '" + date + "' and bank='Current' ", con);
        DataSet ds = new DataSet();
        adap.Fill(ds);
        if (ds.Tables[0].Rows.Count != 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];
            txtcurrent.Text = double.Parse(dr["bal"].ToString()).ToString("n2");
        }
    }
    public void thub_bind()
    {
        string date = DateTime.ParseExact(txtdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
        SqlDataAdapter adap = new SqlDataAdapter("select isnull((sum(credit)-sum(debit)),0)as bal from tbl_cash_ledger_master where cast(date as date )<= '" + date + "'", con);
        DataSet ds = new DataSet();
        adap.Fill(ds);
        if (ds.Tables[0].Rows.Count != 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];
            txttilehub.Text = double.Parse(dr["bal"].ToString()).ToString("n2");
        }
    }
    public void admincash_bind()
    {
        string date = DateTime.ParseExact(txtdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
        SqlDataAdapter adap = new SqlDataAdapter("select isnull((sum(credit)-sum(debit)),0)as bal from tbl_admin_cash_ledger_master where cast(date as date )<= '" + date + "' ", con);
        DataSet ds = new DataSet();
        adap.Fill(ds);
        if (ds.Tables[0].Rows.Count != 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];
            txtadmincash.Text = double.Parse(dr["bal"].ToString()).ToString("n2");
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        stock_bind();
        dealer_bind();
        company_bind();
        assets_bind();
        obc_bind();
        hdfc_bind();
        current_bind();
        thub_bind();
        admincash_bind();
    }
}