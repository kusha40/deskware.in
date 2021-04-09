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

public partial class Admin_print_all : System.Web.UI.Page
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
        if (Request.QueryString["df"] == null || Request.QueryString["dt"] == null)
        {
            Response.Redirect("~/admin/dealer_volume_print.aspx");
        }
        if (!IsPostBack)
        {
            string from_date = DateTime.ParseExact(Request.QueryString["df"].ToString(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            string to_date = DateTime.ParseExact(Request.QueryString["dt"].ToString(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            cls.datalist(DataList1, "select distinct dealer_name,dealer_id from tbl_challan_details_master where  type='FI' and status!='Cancel' and dealer_name not in ('Sample','Breakage','Lost','Trolla Breakage') and date between '" + from_date + "' and '" + to_date + "'  ");

            if (DataList1.Items.Count == 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Not Records Found')';", true);
            }
        }
    }
    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        DataRowView drv = e.Item.DataItem as DataRowView;

        GridView innerDataList = e.Item.FindControl("GridView1") as GridView;

        Literal lbl = (Literal)e.Item.FindControl("Literal1");
        Literal amt = (Literal)e.Item.FindControl("Literal3");
        Literal id = (Literal)e.Item.FindControl("Literal4");

        lbl.Text = Convert.ToDateTime(Request.QueryString["df"]).ToString("dd-MMM-yy") + "       -- To --      " + Convert.ToDateTime(Request.QueryString["dt"]).ToString("dd-MMM-yy");


        string from_date = DateTime.ParseExact(Request.QueryString["df"].ToString(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
        string to_date = DateTime.ParseExact(Request.QueryString["dt"].ToString(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);

        cls.gridbind(innerDataList, "select sum(qty)as qty, max(size+c_name)as size,max(dealer_name)as Name from tbl_challan_details_master where  type='FI' and status!='Cancel' and dealer_name not in ('Sample','Breakage','Lost','Trolla Breakage') and date between '" + from_date + "' and '" + to_date + "' and dealer_id='"+id.Text+"' group by size,c_name");

        string commnd = "select sum(amount)as id from tbl_challan_details_master where date between '" + from_date + "' and '" + to_date + "' and dealer_id='" + id.Text + "' ";

        SqlDataAdapter adap = new SqlDataAdapter(commnd, con);
        DataSet ds = new DataSet();
        adap.Fill(ds);
        if (ds.Tables[0].Rows.Count != 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];
            amt.Text = double.Parse(dr["id"].ToString()).ToString("n2");
        }
        else
        {
            amt.Text = "0.00";
        }

    }
}