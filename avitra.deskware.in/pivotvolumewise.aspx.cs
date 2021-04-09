using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class pivotvolumewise : System.Web.UI.Page
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
            cls.gridbind(GridView1, "select * from ( select qty, (size+replace(c_name, ' ', ''))as size1,[dealer_name]as Name from tbl_challan_details_master where  type='FI' and status!='Cancel' and dealer_name not in ('Sample','Breakage','Lost','Trolla Breakage') )as source Pivot (  SUM(qty) for size1  in([12x18Allient],[12x18exclusive],[12x18Murano],[12x18Pioneer],[12x18Specto],[12x18TILEX],[12x24Allient],[12x24Arido],[12x24Capsun],[12x24exclusive],[12x24Murano],[12x24Pioneer],[12x24Savitra],[2x2exclusive],[2x2Livanto],[2x2PREM],[2x2Senso],[2x2Veeta],[2x2veetadarkseries],[2x2Zed],[2x4blackberry],[2x4exclusive],[2x4HIGHGLOSSY],[2x4PREM],[2x4Veeta],[2x4Zed],[32x32PREM],[32x32Veeta]))as pvt");

            cls.bind_ddl(ddlcom, "Select name from tbl_company_master order by name asc", "name", "name");
            cls.bind_ddl(ddldealer, "Select distinct dealer_name,dealer_id from tbl_dealer_ledger_master order by dealer_name asc", "dealer_name", "dealer_id");
            ddlcom.Items.Insert(0, "All");
            ddldealer.Items.Insert(0, "All");
            cls.bind_ddl(ddlarea, "select distinct area from tbl_dealer_Master order by area asc", "area", "area");
            ddlarea.Items.Insert(0, "Select");
        }

    }

    //private void BindGrid()
    //{
    //    string query = "select * from ( select qty, (size+replace(c_name, ' ', ''))as size1,[dealer_name]as Name from tbl_challan_details_master )as source Pivot (  SUM(qty) for size1  in( [12x18Allient],[12x18Murano],[12x18Specto],[12x24Arido],[12x24Capsun],[12x24Murano],[12x24Pioneer],[12x24Savitra],[2x2Livanto],[2x2Senso],[2x2Veeta],[2x2Zed],[2x4Veeta],[2x4Zed],[32x32Veeta]))as pvt";

    //    string constr = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
    //    using (SqlConnection con = new SqlConnection(constr))
    //    {
    //        using (SqlCommand cmd = new SqlCommand(query))
    //        {
    //            using (SqlDataAdapter sda = new SqlDataAdapter())
    //            {
    //                cmd.Connection = con;
    //                sda.SelectCommand = cmd;
    //                using (DataTable dt = new DataTable())
    //                {
    //                    sda.Fill(dt);
    //                    GridView1.DataSource = dt;
    //                    GridView1.DataBind();

    //                    //Calculate Sum and display in Footer Row
    //                    decimal total = dt.AsEnumerable().Sum(row => row.Field<decimal>("12x18Allient"));

    //                    GridView1.FooterRow.Cells[2].Text = "Total";
    //                    GridView1.FooterRow.Cells[2].HorizontalAlign = HorizontalAlign.Right;

    //                    GridView1.FooterRow.Cells[3].Text = total.ToString("N2");
    //                }
    //            }
    //        }
    //    }
    //}

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
    protected void ddlarea_SelectedIndexChanged(object sender, EventArgs e)
    {
        string from_date = DateTime.ParseExact(txtfdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
        string to_date = DateTime.ParseExact(txttdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
        cls.gridbind(GridView1, "select * from ( select qty, (size+replace(c_name, ' ', ''))as size1,[dealer_name]as Name from tbl_challan_details_master where date between '" + from_date + "' and '" + to_date + "'  and  dealer_name in (select name from tbl_dealer_Master where area='" + ddlarea.SelectedValue + "' ) and type='FI' and status!='Cancel' and dealer_name not in ('Sample','Breakage','Lost','Trolla Breakage') )as source Pivot (  SUM(qty) for size1  in([12x18Allient],[12x18exclusive],[12x18Murano],[12x18Pioneer],[12x18Specto],[12x18TILEX],[12x24Allient],[12x24Arido],[12x24Capsun],[12x24exclusive],[12x24Murano],[12x24Pioneer],[12x24Savitra],[2x2exclusive],[2x2Livanto],[2x2PREM],[2x2Senso],[2x2Veeta],[2x2veetadarkseries],[2x2Zed],[2x4blackberry],[2x4exclusive],[2x4HIGHGLOSSY],[2x4PREM],[2x4Veeta],[2x4Zed],[32x32PREM],[32x32Veeta]))as pvt");

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

        if (ddlcom.SelectedValue == "All" && ddldealer.SelectedValue == "All" && ddlsize.SelectedValue == "All")
        {
            string from_date = DateTime.ParseExact(txtfdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            string to_date = DateTime.ParseExact(txttdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            cls.gridbind(GridView1, "select * from ( select qty, (size+replace(c_name, ' ', ''))as size1,[dealer_name]as Name from tbl_challan_details_master where date between '" + from_date + "' and '" + to_date + "' and type='FI' and status!='Cancel' and dealer_name not in([12x18Allient],[12x18exclusive],[12x18Murano],[12x18Pioneer],[12x18Specto],[12x18TILEX],[12x24Allient],[12x24Arido],[12x24Capsun],[12x24exclusive],[12x24Murano],[12x24Pioneer],[12x24Savitra],[2x2exclusive],[2x2Livanto],[2x2PREM],[2x2Senso],[2x2Veeta],[2x2veetadarkseries],[2x2Zed],[2x4blackberry],[2x4exclusive],[2x4HIGHGLOSSY],[2x4PREM],[2x4Veeta],[2x4Zed],[32x32PREM],[32x32Veeta]))as pvt");
        }
        if (ddlcom.SelectedValue != "All" && ddldealer.SelectedValue == "All" && ddlsize.SelectedValue != "All")
        {
            string from_date = DateTime.ParseExact(txtfdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            string to_date = DateTime.ParseExact(txttdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            cls.gridbind(GridView1, "select * from ( select qty, (size+replace(c_name, ' ', ''))as size1,[dealer_name]as Name from tbl_challan_details_master where date between '" + from_date + "' and '" + to_date + "' and c_name='" + ddlcom.SelectedValue + "' and size='" + ddlsize.SelectedValue + "' and type='FI' and status!='Cancel' and dealer_name not in ('Sample','Breakage','Lost','Trolla Breakage') )as source Pivot (  SUM(qty) for size1  in([12x18Allient],[12x18exclusive],[12x18Murano],[12x18Pioneer],[12x18Specto],[12x18TILEX],[12x24Allient],[12x24Arido],[12x24Capsun],[12x24exclusive],[12x24Murano],[12x24Pioneer],[12x24Savitra],[2x2exclusive],[2x2Livanto],[2x2PREM],[2x2Senso],[2x2Veeta],[2x2veetadarkseries],[2x2Zed],[2x4blackberry],[2x4exclusive],[2x4HIGHGLOSSY],[2x4PREM],[2x4Veeta],[2x4Zed],[32x32PREM],[32x32Veeta]))as pvt");
        }
        if (ddlcom.SelectedValue == "All" && ddldealer.SelectedValue != "All" && ddlsize.SelectedValue == "All")
        {
            string from_date = DateTime.ParseExact(txtfdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            string to_date = DateTime.ParseExact(txttdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            cls.gridbind(GridView1, "select * from ( select qty, (size+replace(c_name, ' ', ''))as size1,[dealer_name]as Name from tbl_challan_details_master where date between '" + from_date + "' and '" + to_date + "' and dealer_id='" + ddldealer.SelectedValue + "' and type='FI' and status!='Cancel' and dealer_name not in ('Sample','Breakage','Lost','Trolla Breakage') )as source Pivot (  SUM(qty) for size1  in([12x18Allient],[12x18exclusive],[12x18Murano],[12x18Pioneer],[12x18Specto],[12x18TILEX],[12x24Allient],[12x24Arido],[12x24Capsun],[12x24exclusive],[12x24Murano],[12x24Pioneer],[12x24Savitra],[2x2exclusive],[2x2Livanto],[2x2PREM],[2x2Senso],[2x2Veeta],[2x2veetadarkseries],[2x2Zed],[2x4blackberry],[2x4exclusive],[2x4HIGHGLOSSY],[2x4PREM],[2x4Veeta],[2x4Zed],[32x32PREM],[32x32Veeta]))as pvt");
        }
        if (ddlcom.SelectedValue != "All" && ddldealer.SelectedValue != "All" && ddlsize.SelectedValue != "All")
        {
            string from_date = DateTime.ParseExact(txtfdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            string to_date = DateTime.ParseExact(txttdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            cls.gridbind(GridView1, "select * from ( select qty, (size+replace(c_name, ' ', ''))as size1,[dealer_name]as Name from tbl_challan_details_master where date between '" + from_date + "' and '" + to_date + "' and dealer_id='" + ddldealer.SelectedValue + "' and c_name='" + ddlcom.SelectedValue + "' and size='" + ddlsize.SelectedValue + "' and type='FI' and status!='Cancel' and dealer_name not in ('Sample','Breakage','Lost','Trolla Breakage') )as source Pivot (  SUM(qty) for size1  in([12x18Allient],[12x18exclusive],[12x18Murano],[12x18Pioneer],[12x18Specto],[12x18TILEX],[12x24Allient],[12x24Arido],[12x24Capsun],[12x24exclusive],[12x24Murano],[12x24Pioneer],[12x24Savitra],[2x2exclusive],[2x2Livanto],[2x2PREM],[2x2Senso],[2x2Veeta],[2x2veetadarkseries],[2x2Zed],[2x4blackberry],[2x4exclusive],[2x4HIGHGLOSSY],[2x4PREM],[2x4Veeta],[2x4Zed],[32x32PREM],[32x32Veeta]))as pvt");
        }
    }
    int t1, t2, t3, t4, t5, t6, t7, t8, t9, t10, t11, t12, t13, t14, t15, t16, t17, t18, t19, t20, t21, t22, t23, t24, t25, t26, t27, t28 = 0;
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {


        if (e.Row.RowType == DataControlRowType.DataRow)
        {

            if (DataBinder.Eval(e.Row.DataItem, "12x18Allient") != DBNull.Value)
            {
                t1 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "12x18Allient"));
            }
            if (DataBinder.Eval(e.Row.DataItem, "12x18Murano") != DBNull.Value)
            {
                t2 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "12x18Murano"));
            }
            if (DataBinder.Eval(e.Row.DataItem, "12x18Specto") != DBNull.Value)
            {
                t3 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "12x18Specto"));
            }
            if (DataBinder.Eval(e.Row.DataItem, "12x24Arido") != DBNull.Value)
            {
                t4 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "12x24Arido"));
            }
            if (DataBinder.Eval(e.Row.DataItem, "12x24Capsun") != DBNull.Value)
            {
                t5 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "12x24Capsun"));
            }
            if (DataBinder.Eval(e.Row.DataItem, "12x24Murano") != DBNull.Value)
            {
                t6 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "12x24Murano"));
            }
            if (DataBinder.Eval(e.Row.DataItem, "12x24Pioneer") != DBNull.Value)
            {
                t7 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "12x24Pioneer"));
            }
            if (DataBinder.Eval(e.Row.DataItem, "12x24Savitra") != DBNull.Value)
            {
                t8 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "12x24Savitra"));
            }
            if (DataBinder.Eval(e.Row.DataItem, "2x2Livanto") != DBNull.Value)
            {
                t9 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "2x2Livanto"));
            }
            if (DataBinder.Eval(e.Row.DataItem, "2x2Senso") != DBNull.Value)
            {
                t10 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "2x2Senso"));
            }
            if (DataBinder.Eval(e.Row.DataItem, "2x2Veeta") != DBNull.Value)
            {
                t11 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "2x2Veeta"));
            }
            if (DataBinder.Eval(e.Row.DataItem, "2x2Zed") != DBNull.Value)
            {
                t12 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "2x2Zed"));
            }
            if (DataBinder.Eval(e.Row.DataItem, "2x4Veeta") != DBNull.Value)
            {
                t13 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "2x4Veeta"));
            }
            if (DataBinder.Eval(e.Row.DataItem, "2x4Zed") != DBNull.Value)
            {
                t14 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "2x4Zed"));
            }
            if (DataBinder.Eval(e.Row.DataItem, "32x32Veeta") != DBNull.Value)
            {
                t15 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "32x32Veeta"));
            }
            if (DataBinder.Eval(e.Row.DataItem, "12x18Pioneer") != DBNull.Value)
            {
                t16 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "12x18Pioneer"));
            }
            if (DataBinder.Eval(e.Row.DataItem, "12x18TILEX") != DBNull.Value)
            {
                t17 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "12x18TILEX"));
            }
            if (DataBinder.Eval(e.Row.DataItem, "2x2veetadarkseries") != DBNull.Value)
            {
                t18 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "2x2veetadarkseries"));
            }
            if (DataBinder.Eval(e.Row.DataItem, "2x4blackberry") != DBNull.Value)
            {
                t19 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "2x4blackberry"));
            }

            //new
            if (DataBinder.Eval(e.Row.DataItem, "12x18exclusive") != DBNull.Value)
            {
                t20 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "12x18exclusive"));
            }
            if (DataBinder.Eval(e.Row.DataItem, "12x24Allient") != DBNull.Value)
            {
                t21 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "12x24Allient"));
            }
            if (DataBinder.Eval(e.Row.DataItem, "12x24exclusive") != DBNull.Value)
            {
                t22 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "12x24exclusive"));
            }
            if (DataBinder.Eval(e.Row.DataItem, "2x2exclusive") != DBNull.Value)
            {
                t23 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "2x2exclusive"));
            }
            if (DataBinder.Eval(e.Row.DataItem, "2x2PREM") != DBNull.Value)
            {
                t24 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "2x2PREM"));
            }
            if (DataBinder.Eval(e.Row.DataItem, "2x4exclusive") != DBNull.Value)
            {
                t25 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "2x4exclusive"));
            }
            if (DataBinder.Eval(e.Row.DataItem, "2x4HIGHGLOSSY") != DBNull.Value)
            {
                t26 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "2x4HIGHGLOSSY"));
            }
            if (DataBinder.Eval(e.Row.DataItem, "2x4PREM") != DBNull.Value)
            {
                t27 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "2x4PREM"));
            }
            if (DataBinder.Eval(e.Row.DataItem, "32x32PREM") != DBNull.Value)
            {
                t28 += Convert.ToInt32(DataBinder.Eval(e.Row.DataItem, "32x32PREM"));
            }
        }
        if (e.Row.RowType == DataControlRowType.Footer)
        {
            Label Label16 = (Label)e.Row.FindControl("Label16");
            Label Label17 = (Label)e.Row.FindControl("Label17");
            Label Label18 = (Label)e.Row.FindControl("Label18");
            Label Label19 = (Label)e.Row.FindControl("Label19");
            Label Label20 = (Label)e.Row.FindControl("Label20");
            Label Label21 = (Label)e.Row.FindControl("Label21");
            Label Label22 = (Label)e.Row.FindControl("Label22");
            Label Label23 = (Label)e.Row.FindControl("Label23");
            Label Label24 = (Label)e.Row.FindControl("Label24");
            Label Label25 = (Label)e.Row.FindControl("Label25");
            Label Label26 = (Label)e.Row.FindControl("Label26");
            Label Label27 = (Label)e.Row.FindControl("Label27");
            Label Label28 = (Label)e.Row.FindControl("Label28");
            Label Label29 = (Label)e.Row.FindControl("Label29");
            Label Label30 = (Label)e.Row.FindControl("Label30");


            Label Label200 = (Label)e.Row.FindControl("Label200");
            Label Label201 = (Label)e.Row.FindControl("Label201");
            Label Label203 = (Label)e.Row.FindControl("Label203");
            Label Label204 = (Label)e.Row.FindControl("Label204");

            Label lbl2001 = (Label)e.Row.FindControl("lbl2001");
            Label lbl2002 = (Label)e.Row.FindControl("lbl2002");
            Label lbl2003 = (Label)e.Row.FindControl("lbl2003");
            Label lbl2004 = (Label)e.Row.FindControl("lbl2004");
            Label lbl2005 = (Label)e.Row.FindControl("lbl2005");
            Label lbl2006 = (Label)e.Row.FindControl("lbl2006");
            Label lbl2007 = (Label)e.Row.FindControl("lbl2007");
            Label lbl2008 = (Label)e.Row.FindControl("lbl2008");
            Label lbl2009 = (Label)e.Row.FindControl("lbl2009");

            Label16.Text = t1.ToString("n2");
            Label17.Text = t2.ToString("n2");
            Label18.Text = t3.ToString("n2");
            Label19.Text = t4.ToString("n2");
            Label20.Text = t5.ToString("n2");
            Label21.Text = t6.ToString("n2");
            Label22.Text = t7.ToString("n2");
            Label23.Text = t8.ToString("n2");
            Label24.Text = t9.ToString("n2");
            Label25.Text = t10.ToString("n2");
            Label26.Text = t11.ToString("n2");
            Label27.Text = t12.ToString("n2");
            Label28.Text = t13.ToString("n2");
            Label29.Text = t14.ToString("n2");
            Label30.Text = t15.ToString("n2");

            Label200.Text = t16.ToString("n2");
            Label201.Text = t17.ToString("n2");
            Label203.Text = t18.ToString("n2");
            Label204.Text = t19.ToString("n2");

            lbl2001.Text = t20.ToString("n2");
            lbl2002.Text = t21.ToString("n2");
            lbl2003.Text = t22.ToString("n2");
            lbl2004.Text = t23.ToString("n2");
            lbl2005.Text = t24.ToString("n2");
            lbl2006.Text = t25.ToString("n2");
            lbl2007.Text = t26.ToString("n2");
            lbl2008.Text = t27.ToString("n2");
            lbl2009.Text = t28.ToString("n2");
        }
    }
}