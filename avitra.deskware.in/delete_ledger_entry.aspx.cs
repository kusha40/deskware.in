using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class delete_ledger_entry : System.Web.UI.Page
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
            cmd.CommandText = "select password from user_master where password='" + TextBox2.Text.Trim() + "'  and user_id='admin'  ";
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Close();
                if (Request.QueryString["typ"] == "dealer")
                {
                    commd = "delete FROM tbl_dealer_ledger_master where id='" + Request.QueryString["id"].ToString() + "' ";
                }
                if (Request.QueryString["typ"] == "company")
                {
                    commd = "delete FROM tbl_company_ledger_master where id='" + Request.QueryString["id"].ToString() + "' ";
                }
                if (Request.QueryString["typ"] == "labour")
                {
                    commd = "delete FROM tbl_daily_labour_ledger_master where id='" + Request.QueryString["id"].ToString() + "' ";
                }
                if (Request.QueryString["typ"] == "trolla")
                {
                    commd = "delete FROM tbl_trolla_labour_ledger_master where id='" + Request.QueryString["id"].ToString() + "' ";
                }
                if (Request.QueryString["typ"] == "driver")
                {
                    commd = "delete FROM tbl_driver_ledger_master where id='" + Request.QueryString["id"].ToString() + "' ";
                }
                if (Request.QueryString["typ"] == "cash")
                {
                    commd = "delete FROM tbl_cash_ledger_master where id='" + Request.QueryString["id"].ToString() + "' ";
                }
                if (Request.QueryString["typ"] == "saleman")
                {
                    commd = "delete FROM tbl_salesman_ledger_master where id='" + Request.QueryString["id"].ToString() + "' ";
                }
                if (Request.QueryString["typ"] == "employee")
                {
                    commd = "delete FROM tbl_employee_ledger_master where id='" + Request.QueryString["id"].ToString() + "' ";
                }
                if (Request.QueryString["typ"] == "admincash")
                {
                    commd = "delete FROM tbl_admin_cash_ledger_master where id='" + Request.QueryString["id"].ToString() + "' ";
                }
                if (Request.QueryString["typ"] == "currentledger" || Request.QueryString["typ"] == "hdfcledger" || Request.QueryString["typ"] == "obcledger")
                {
                    commd = "delete FROM tbl_bank_ledger_master where id='" + Request.QueryString["id"].ToString() + "' ";
                }
                if (Request.QueryString["typ"] == "adminemp")
                {
                    commd = "delete FROM tbl_admin_employee_ledger_master where id='" + Request.QueryString["id"].ToString() + "' ";
                }
                if (Request.QueryString["typ"] == "assets")
                {
                    commd = "delete FROM tbl_assets_master where id='" + Request.QueryString["id"].ToString() + "' ";
                }
                if (Request.QueryString["typ"] == "capital")
                {
                    commd = "delete FROM tbl_capital_master where id='" + Request.QueryString["id"].ToString() + "' ";
                }

                SqlCommand cmd1 = con.CreateCommand();
                cmd1.CommandText = commd;
                cmd1.ExecuteNonQuery();
                ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Deleted Sucessfully');", true);
                con.Close();
            }
                
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Current Password is Wrong');", true);
            }
    }
}