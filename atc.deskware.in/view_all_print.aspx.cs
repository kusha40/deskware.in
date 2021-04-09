using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

public partial class view_all_print : System.Web.UI.Page
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
        if (Request.QueryString["id"] == null )
        {
             Response.Redirect("print_all_challan.aspx");
        }
        if (!IsPostBack)
        {
            

                //if (Request.QueryString["typ"].ToString() == "today")
                //{
                //    cls.datalist(DataList1, " DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '00:00:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101) select distinct date, challan_no,dealer_name,dealer_area,totlamount,fraight,netamount,inwords,created_by,status,type from tbl_challan_details_master where date=@date_new and dealer_id='" + Request.QueryString["id"].ToString() + "'  order by challan_no asc");
                //    if (DataList1.Items.Count == 0)
                //    {
                //        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Not Records Found')';", true);
                //    }
                //}
                //if (Request.QueryString["typ"].ToString() == "todayall")
                //{
                //    cls.datalist(DataList1, " DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '00:00:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101) select distinct date, challan_no,dealer_name,dealer_area,totlamount,fraight,netamount,inwords,created_by,status,type from tbl_challan_details_master where date=@date_new   order by challan_no asc");
                //    if (DataList1.Items.Count == 0)
                //    {
                //        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Not Records Found')';", true);
                //    }
                //}
                if (Request.QueryString["typ"].ToString() == "particulardatedealer")
                {
                    cls.datalist(DataList1, "select distinct date, challan_no,dealer_name,dealer_area,totlamount,fraight,netamount,inwords,created_by,status,type from tbl_challan_details_master where  dealer_id='" + Request.QueryString["id"].ToString() + "' and cast(DATE as date)='" + Request.QueryString["pdate"].ToString() + "' and status!='Cancel'     order by challan_no asc");
                    if (DataList1.Items.Count == 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Not Records Found')';", true);
                    }


                  
                }
                if (Request.QueryString["typ"].ToString() == "particulardatealldealer")
                {
                    cls.datalist(DataList1, "select distinct date, challan_no,dealer_name,dealer_area,totlamount,fraight,netamount,inwords,created_by,status,type from tbl_challan_details_master where  cast(DATE as date)='" + Request.QueryString["pdate"].ToString() + "' and status!='Cancel'     order by challan_no asc");
                    if (DataList1.Items.Count == 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Not Records Found')';", true);
                    }


                  
                }
            
                if (Request.QueryString["typ"].ToString() == "datebetweendealer")
                {
                    cls.datalist(DataList1, "select distinct date, challan_no,dealer_name,dealer_area,totlamount,fraight,netamount,inwords,created_by,status,type from tbl_challan_details_master where dealer_id='" + Request.QueryString["id"].ToString() + "' and date between '" + Request.QueryString["from"].ToString() + "' and '" + Request.QueryString["to"].ToString() + "'  and status!='Cancel'    order by challan_no asc");
                    if (DataList1.Items.Count == 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Not Records Found')';", true);
                    }
                }
                if (Request.QueryString["typ"].ToString() == "datebetweenalldealer")
                {
                    cls.datalist(DataList1, "select distinct date, challan_no,dealer_name,dealer_area,totlamount,fraight,netamount,inwords,created_by,status,type from tbl_challan_details_master where  date between '" + Request.QueryString["from"].ToString() + "' and '" + Request.QueryString["to"].ToString() + "' and status!='Cancel'    order by challan_no asc");
                    if (DataList1.Items.Count == 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Not Records Found')';", true);
                    }
                }
            
            }      

        }          
    
    protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
    {
        DataRowView drv = e.Item.DataItem as DataRowView;

        GridView innerDataList = e.Item.FindControl("GridView1") as GridView;

        Literal lbl = (Literal)e.Item.FindControl("Literal2");
        Literal lbl110 = (Literal)e.Item.FindControl("Literal10");
        //HtmlTableRow td1 = (HtmlTableRow)e.Item.FindControl("td1");
        //HtmlTableRow td2 = (HtmlTableRow)e.Item.FindControl("td2");
        //HtmlTableRow td3 = (HtmlTableRow)e.Item.FindControl("td3");

        Label Label6 = (Label)e.Item.FindControl("Label6");
        Label Label7 = (Label)e.Item.FindControl("Label7");
        Label Label8 = (Label)e.Item.FindControl("Label8");
        Label Label32 = (Label)e.Item.FindControl("Label32");

        Literal Literal5 = (Literal)e.Item.FindControl("Literal5");
        Literal Literal6 = (Literal)e.Item.FindControl("Literal6");
        Literal Literal8 = (Literal)e.Item.FindControl("Literal8");
        Literal Literal9 = (Literal)e.Item.FindControl("Literal9");
        Image Image1 = (Image)e.Item.FindControl("Image1");

        if (Literal9.Text == "RI")
        {
            Image1.Visible = true;
        }

        cls.gridbind(innerDataList, "Select * from tbl_challan_details_master where challan_no='" + lbl.Text + "' ");

        int i; double totl = 0;
        for (i = 0; i < innerDataList.Rows.Count; i++)
        {
            Label bal1 = innerDataList.Rows[i].FindControl("Label31") as Label;
            totl += double.Parse(bal1.Text);
        }
        Label32.Text = totl.ToString();

        SqlDataAdapter adap1 = new SqlDataAdapter("select remarks from tbl_dealer_ledger_master where challan_no='" + lbl.Text + "' ", con);
        DataSet ds1 = new DataSet();
        adap1.Fill(ds1);
        if (ds1.Tables[0].Rows.Count != 0)
        {
            DataRow dr1 = ds1.Tables[0].Rows[0];
            lbl110.Text = dr1["remarks"].ToString();
            if (lbl110.Text != string.Empty)
            {
                innerDataList.Visible = false;
                Label6.Visible = Label7.Visible = Label8.Visible = false;
                Literal5.Visible = Literal6.Visible = Literal8.Visible = false;
            }
        }
        else
        {
            innerDataList.Visible = true;
            Label6.Visible = Label7.Visible = Label8.Visible = true;
            Literal5.Visible = Literal6.Visible = Literal8.Visible = true;

        }
       

        
    }
    
}
