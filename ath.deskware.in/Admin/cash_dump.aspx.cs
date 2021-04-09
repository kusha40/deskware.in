using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_cash_dump : System.Web.UI.Page
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
         // cls.gridbind(GridView1, "select max(date)as date  from tbl_dump_debit_master where type='CD' group by date  order by date asc ");
            if (DropDownList1.SelectedValue == "AM")
            {

                SqlConnection con = new SqlConnection(@"Data source=DESKWARE45984RB\SQLEXPRESS;initial catalog=db_amark;uid=sa;pwd=CUk_amD9W4c$");
                SqlCommand cmd = new SqlCommand("select max(date)as date  from tbl_dump_debit_master where type='CD' group by date  order by date asc", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();

            }
            if (DropDownList1.SelectedValue == "AV")
            {

                SqlConnection con = new SqlConnection(@"Data source=DESKWARE45984RB\SQLEXPRESS;initial catalog=db_avitra;uid=sa;pwd=CUk_amD9W4c$");
                SqlCommand cmd = new SqlCommand("select max(date)as date  from tbl_dump_debit_master where type='CD' group by date  order by date asc", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();

            }
            if (DropDownList1.SelectedValue == "RO")
            {

                SqlConnection con = new SqlConnection(@"Data source=DESKWARE45984RB\SQLEXPRESS;initial catalog=db_royal;uid=sa;pwd=CUk_amD9W4c$");
                SqlCommand cmd = new SqlCommand("select max(date)as date  from tbl_dump_debit_master where type='CD' group by date  order by date asc", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();

            }
            if (DropDownList1.SelectedValue == "WA")
            {

                SqlConnection con = new SqlConnection(@"Data source=DESKWARE45984RB\SQLEXPRESS;initial catalog=db_wall;uid=sa;pwd=CUk_amD9W4c$");
                SqlCommand cmd = new SqlCommand("select max(date)as date  from tbl_dump_debit_master where type='CD' group by date  order by date asc", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();

            }
            if (DropDownList1.SelectedValue == "ATH")
            {

                SqlConnection con = new SqlConnection(@"Data source=DESKWARE45984RB\SQLEXPRESS;initial catalog=db_ath;uid=sa;pwd=CUk_amD9W4c$");
                SqlCommand cmd = new SqlCommand("select max(date)as date  from tbl_dump_debit_master where type='CD' group by date  order by date asc", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            if (DropDownList1.SelectedValue == "TH")
            {

                SqlConnection con = new SqlConnection(@"Data source=182.50.133.109;initial catalog=db_tilehub;uid=db_tilehub;pwd=Leh%it999");
                SqlCommand cmd = new SqlCommand("select max(date)as date  from tbl_dump_debit_master where type='CD' group by date  order by date asc", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
        }

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedValue == "AM")
        {

            SqlConnection con = new SqlConnection(@"Data source=DESKWARE45984RB\SQLEXPRESS;initial catalog=db_amark;uid=sa;pwd=CUk_amD9W4c$");
            SqlCommand cmd = new SqlCommand("select max(date)as date  from tbl_dump_debit_master where type='CD' group by date  order by date asc", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();

        }
        if (DropDownList1.SelectedValue == "AV")
        {

            SqlConnection con = new SqlConnection(@"Data source=DESKWARE45984RB\SQLEXPRESS;initial catalog=db_avitra;uid=sa;pwd=CUk_amD9W4c$");
            SqlCommand cmd = new SqlCommand("select max(date)as date  from tbl_dump_debit_master where type='CD' group by date  order by date asc", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();

        }
        if (DropDownList1.SelectedValue == "RO")
        {

            SqlConnection con = new SqlConnection(@"Data source=DESKWARE45984RB\SQLEXPRESS;initial catalog=db_royal;uid=sa;pwd=CUk_amD9W4c$");
            SqlCommand cmd = new SqlCommand("select max(date)as date  from tbl_dump_debit_master where type='CD' group by date  order by date asc", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();

        }
        if (DropDownList1.SelectedValue == "WA")
        {

            SqlConnection con = new SqlConnection(@"Data source=DESKWARE45984RB\SQLEXPRESS;initial catalog=db_wall;uid=sa;pwd=CUk_amD9W4c$");
            SqlCommand cmd = new SqlCommand("select max(date)as date  from tbl_dump_debit_master where type='CD' group by date  order by date asc", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();

        }
        if (DropDownList1.SelectedValue == "ATH")
        {

            SqlConnection con = new SqlConnection(@"Data source=DESKWARE45984RB\SQLEXPRESS;initial catalog=db_ath;uid=sa;pwd=CUk_amD9W4c$");
            SqlCommand cmd = new SqlCommand("select max(date)as date  from tbl_dump_debit_master where type='CD' group by date  order by date asc", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        if (DropDownList1.SelectedValue == "TH")
        {

            SqlConnection con = new SqlConnection(@"Data source=182.50.133.109;initial catalog=db_tilehub;uid=db_tilehub;pwd=Leh%it999");
            SqlCommand cmd = new SqlCommand("select max(date)as date  from tbl_dump_debit_master where type='CD' group by date  order by date asc", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "del")
        {
            Response.Redirect("view_cash_dump.aspx?dt=" + e.CommandArgument.ToString() + "&cp=" + DropDownList1.SelectedValue + "");
            //  ClientScript.RegisterStartupScript(this.Page.GetType(), "", "window.open('view_dealer_dump.aspx?dt=" + e.CommandArgument.ToString() + "'&cp="+DropDownList1.SelectedValue+",'Graph','height=724px,width=900px,scrollbars=1' );", true);
        }
    }
}