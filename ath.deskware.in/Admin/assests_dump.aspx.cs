using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_assests_dump : System.Web.UI.Page
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
           // cls.gridbind(GridView1, "select * from tbl_dump_debit_master where type='ASD'  order by date asc ");
            if (DropDownList1.SelectedValue == "AM")
            {

                SqlConnection con = new SqlConnection(@"Data source=DESKWARE45984RB\SQLEXPRESS;initial catalog=db_amark;uid=sa;pwd=CUk_amD9W4c$");
                SqlCommand cmd = new SqlCommand("select * from tbl_dump_debit_master where type='ASD'  order by date asc", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();

            }
            if (DropDownList1.SelectedValue == "AV")
            {

                SqlConnection con = new SqlConnection(@"Data source=DESKWARE45984RB\SQLEXPRESS;initial catalog=db_avitra;uid=sa;pwd=CUk_amD9W4c$");
                SqlCommand cmd = new SqlCommand("select * from tbl_dump_debit_master where type='ASD'  order by date asc", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();

            }
            if (DropDownList1.SelectedValue == "RO")
            {

                SqlConnection con = new SqlConnection(@"Data source=DESKWARE45984RB\SQLEXPRESS;initial catalog=db_royal;uid=sa;pwd=CUk_amD9W4c$");
                SqlCommand cmd = new SqlCommand("select * from tbl_dump_debit_master where type='ASD'  order by date asc", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();

            }
            if (DropDownList1.SelectedValue == "WA")
            {

                SqlConnection con = new SqlConnection(@"Data source=DESKWARE45984RB\SQLEXPRESS;initial catalog=db_wall;uid=sa;pwd=CUk_amD9W4c$");
                SqlCommand cmd = new SqlCommand("select * from tbl_dump_debit_master where type='ASD'  order by date asc", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();

            }
            if (DropDownList1.SelectedValue == "ATH")
            {

                SqlConnection con = new SqlConnection(@"Data source=DESKWARE45984RB\SQLEXPRESS;initial catalog=db_ath;uid=sa;pwd=CUk_amD9W4c$");
                SqlCommand cmd = new SqlCommand("select * from tbl_dump_debit_master where type='ASD'  order by date asc", con);
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataSet ds = new DataSet();
                sda.Fill(ds);
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            if (DropDownList1.SelectedValue == "TH")
            {

                SqlConnection con = new SqlConnection(@"Data source=182.50.133.109;initial catalog=db_tilehub;uid=db_tilehub;pwd=Leh%it999");
                SqlCommand cmd = new SqlCommand("select * from tbl_dump_debit_master where type='ASD'  order by date asc", con);
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
            SqlCommand cmd = new SqlCommand("select * from tbl_dump_debit_master where type='ASD'  order by date asc", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();

        }
        if (DropDownList1.SelectedValue == "AV")
        {

            SqlConnection con = new SqlConnection(@"Data source=DESKWARE45984RB\SQLEXPRESS;initial catalog=db_avitra;uid=sa;pwd=CUk_amD9W4c$");
            SqlCommand cmd = new SqlCommand("select * from tbl_dump_debit_master where type='ASD'  order by date asc", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();

        }
        if (DropDownList1.SelectedValue == "RO")
        {

            SqlConnection con = new SqlConnection(@"Data source=DESKWARE45984RB\SQLEXPRESS;initial catalog=db_royal;uid=sa;pwd=CUk_amD9W4c$");
            SqlCommand cmd = new SqlCommand("select * from tbl_dump_debit_master where type='ASD'  order by date asc", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();

        }
        if (DropDownList1.SelectedValue == "WA")
        {

            SqlConnection con = new SqlConnection(@"Data source=DESKWARE45984RB\SQLEXPRESS;initial catalog=db_wall;uid=sa;pwd=CUk_amD9W4c$");
            SqlCommand cmd = new SqlCommand("select * from tbl_dump_debit_master where type='ASD'  order by date asc", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();

        }
        if (DropDownList1.SelectedValue == "ATH")
        {

            SqlConnection con = new SqlConnection(@"Data source=DESKWARE45984RB\SQLEXPRESS;initial catalog=db_ath;uid=sa;pwd=CUk_amD9W4c$");
            SqlCommand cmd = new SqlCommand("select * from tbl_dump_debit_master where type='ASD'  order by date asc", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
        if (DropDownList1.SelectedValue == "TH")
        {

            SqlConnection con = new SqlConnection(@"Data source=182.50.133.109;initial catalog=db_tilehub;uid=db_tilehub;pwd=Leh%it999");
            SqlCommand cmd = new SqlCommand("select * from tbl_dump_debit_master where type='ASD'  order by date asc", con);
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataSet ds = new DataSet();
            sda.Fill(ds);
            GridView1.DataSource = ds;
            GridView1.DataBind();
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {

        Response.Clear();
        Response.AddHeader("content-disposition", "attachment;filename=Report.xls");
        Response.Charset = "";
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = "application/vnd.xls";
        System.IO.StringWriter stringWrite = new System.IO.StringWriter();
        System.Web.UI.HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);
        GridView1.RenderControl(htmlWrite);
        Response.Write(stringWrite.ToString());
        Response.End();
    }
    public override void VerifyRenderingInServerForm(Control control)
    { }
}