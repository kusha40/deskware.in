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

public partial class challan_view : System.Web.UI.Page
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
            bind();
            if (Session["type"].ToString() == "Administrator")
            {
                ddluser.Visible = true;
                ddldealer.Visible = true;
                cls.bind_ddl(ddluser, " select user_id from user_master order by user_id asc ", "user_id", "user_id");
                ddluser.Items.Insert(0, "All");
                cls.bind_ddl(ddldealer, "Select distinct dealer_name,dealer_id from tbl_dealer_ledger_master order by dealer_name asc", "dealer_name", "dealer_id");
                ddldealer.Items.Insert(0, "All");
            }
            else
            {
                ddluser.Visible = false;
                ddldealer.Visible = true;
                Button2.Visible = false;
                ddluser.Items.Insert(0, "All");
                cls.bind_ddl(ddldealer, "Select distinct dealer_name,dealer_id from tbl_dealer_ledger_master order by dealer_name asc", "dealer_name", "dealer_id");
            }
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        bind();
    }

    public void bind()
    {
        if (Session["type"].ToString() == "Administrator")
        {
            cls.gridbind(GridView1, "select distinct challan_no,date,dealer_name,created_by,dealer_area,status,type from tbl_challan_details_master");
           
        }
        else
        {
            cls.gridbind(GridView1, "select distinct challan_no,date,dealer_name,created_by,dealer_area,status,type from tbl_challan_details_master where created_by='" + Session["Username"].ToString() + "'");
         
        }
        if (Session["Username"].ToString()!="Admin")
        {
               GridView1.Columns[13].Visible = false;
        }
    }
    
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lbltype = (Label)row.FindControl("lbltype");
        Label lblsts = (Label)row.FindControl("lblsts");
        if(lblsts.Text!="Cancel")
        {
            Label51.Text=lbltype.Text;

            ClientScript.RegisterStartupScript(this.Page.GetType(), "", "window.open('cancel_challan_view.aspx?id=" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "&typ=" + lbltype.Text + "','Graph','height=724px,width=900px,scrollbars=1' );", true);
 //cls.gridbind(GridView2, "select * from tbl_challan_details_master where challan_no='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "' ");

 //       con.Open();
 //       SqlCommand cmd = new SqlCommand("delete FROM tbl_daily_labour_ledger_master where challan_no='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
 //       SqlCommand cmd1 = new SqlCommand("delete FROM tbl_dealer_ledger_master where challan_no='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
 //       SqlCommand cmd2 = new SqlCommand("delete FROM tbl_driver_ledger_master where challan_no='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", con);

 //       SqlCommand cmd3 = new SqlCommand("update  tbl_challan_details_master set status='Cancel' where challan_no='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", con);

 //       cmd.ExecuteNonQuery();
 //       cmd1.ExecuteNonQuery();
 //       cmd2.ExecuteNonQuery();
 //       cmd3.ExecuteNonQuery();
 //       con.Close();
 //           update_stock();
 //       ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Cancelled Sucessfully');", true);
 //       bind();
        }
        else
        {
          ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Already Cancelled');", true);
        }
    }

    public void update_stock()
    {
        for (int i = 0; i < GridView2.Rows.Count; i++)
        {
         
            Label lblqty = (Label)GridView2.Rows[i].FindControl("lblqty");
            Label lblsize = (Label)GridView2.Rows[i].FindControl("lblsize");
            Label lblc_name = (Label)GridView2.Rows[i].FindControl("lblc_name");
            Label lblp_code = (Label)GridView2.Rows[i].FindControl("lblp_code");
            Label lblp_grade = (Label)GridView2.Rows[i].FindControl("lblp_grade");

            SqlDataAdapter adap1 = new SqlDataAdapter("select sum(qty) as qty from tbl_stock_qty_master where size='" + lblsize.Text + "' and c_name='" + lblc_name.Text + "' and p_code='" + lblp_code.Text + "' and p_grade='" + lblp_grade.Text + "'", con);
            DataSet ds1 = new DataSet();
            adap1.Fill(ds1);
            {
                DataRow dr1 = ds1.Tables[0].Rows[0];
                Label41.Text = dr1["qty"].ToString();

                if (Label51.Text == "FI")
                {
                    Label41.Text = Convert.ToDouble(double.Parse(Label41.Text.Trim()) + double.Parse(lblqty.Text.Trim())).ToString();
                }
                if (Label51.Text == "RI")
                {
                    Label41.Text = Convert.ToDouble(double.Parse(Label41.Text.Trim()) - double.Parse(lblqty.Text.Trim())).ToString();
                }

                SqlCommand cmd5 = con.CreateCommand();
                con.Open();
                cmd5.CommandText = " update tbl_stock_qty_master set  qty='" + Label41.Text + "' where    size='" + lblsize.Text + "' and c_name='" + lblc_name.Text + "' and p_code='" + lblp_code.Text + "' and p_grade='" + lblp_grade.Text + "'";
                cmd5.ExecuteNonQuery();
                con.Close();
            }
        }

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        int count = 0;
        int j;
        for (j = 0; j < GridView1.Rows.Count; j++)
        {
            CheckBox cb = (CheckBox)GridView1.Rows[j].FindControl("chkAll0");
            Label lblchallanno = (Label)GridView1.Rows[j].FindControl("lblchallanno");
            Label lbltype = (Label)GridView1.Rows[j].FindControl("lbltype");
            Label lblsts = (Label)GridView1.Rows[j].FindControl("lblsts");
            if (cb.Checked == true)
            {
                count++;

                if (lblsts.Text != "Cancel")
                {
                    Label51.Text = lbltype.Text;
                    cls.gridbind(GridView2, "select * from tbl_challan_details_master where challan_no='" + lblchallanno.Text + "' ");
                    con.Open();
                    SqlCommand cmd = new SqlCommand("delete FROM tbl_daily_labour_ledger_master where challan_no='" + lblchallanno.Text + "'", con);
                    SqlCommand cmd1 = new SqlCommand("delete FROM tbl_dealer_ledger_master where challan_no='" + lblchallanno.Text + "'", con);
                    SqlCommand cmd2 = new SqlCommand("delete FROM tbl_driver_ledger_master where challan_no='" + lblchallanno.Text + "'", con);
                    cmd.ExecuteNonQuery();
                    cmd1.ExecuteNonQuery();
                    cmd2.ExecuteNonQuery();
                    con.Close();
                    update_stock();
                 
                }
                else
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Already Cancelled');", true);
                }
            }
        }
        if (count > 0)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Cancelled Sucessfully');", true);
            bind();
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Check Item in the List');", true);
        }
    }
    protected void ChkAllRows(object sender, EventArgs e)
    {

        CheckBox chkall = (CheckBox)GridView1.HeaderRow.FindControl("chkAll");
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            CheckBox chkrow = (CheckBox)GridView1.Rows[i].FindControl("chkAll0");
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
    protected void ddluser_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddluser.SelectedValue == "All")
        {
            cls.gridbind(GridView1, "select distinct challan_no,date,dealer_name,created_by,dealer_area,status,type from tbl_challan_details_master ");
        }
        else
        {
            cls.gridbind(GridView1, "select distinct challan_no,date,dealer_name,created_by,dealer_area,status,type from tbl_challan_details_master where created_by='" + ddluser.SelectedValue + "'");
        }
        
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (Session["type"].ToString() == "Administrator")
        {

            GridView1.AllowPaging = false;
            if (ddluser.SelectedValue == "All")
            {
                cls.gridbind(GridView1, " DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '00:00:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101) select distinct challan_no,date,dealer_name,created_by,dealer_area,status,type from tbl_challan_details_master where date=@date_new ");
            }
            else
            {
                cls.gridbind(GridView1, "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '00:00:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101) select distinct challan_no,date,dealer_name,created_by,dealer_area,status,type from tbl_challan_details_master where created_by='" + ddluser.SelectedValue + "' and  date=@date_new");
            }
        }
        else
        {
            cls.gridbind(GridView1, "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '00:00:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101) select distinct challan_no,date,dealer_name,created_by,dealer_area,status,type from tbl_challan_details_master where created_by='" + Session["Username"].ToString() + "' and  date=@date_new");
        }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        GridView1.AllowPaging = false;
        if (ddluser.SelectedValue == "All")
        {
            cls.gridbind(GridView1, "select distinct challan_no,date,dealer_name,created_by,dealer_area,status,type from tbl_challan_details_master where date between '" + DateTime.ParseExact(txtfrom.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "' and '" + DateTime.ParseExact(txtto.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "' ");
        }
        else
        {
            cls.gridbind(GridView1, "select distinct challan_no,date,dealer_name,created_by,dealer_area,status,type from tbl_challan_details_master where created_by='" + ddluser.SelectedValue + "' and date between '" + DateTime.ParseExact(txtfrom.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "' and '" + DateTime.ParseExact(txtto.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "'");
        }
        
    }
    protected void ddldealer_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (Session["type"].ToString() == "Administrator")
        {
            GridView1.AllowPaging = false;
            cls.gridbind(GridView1, "select distinct challan_no,date,dealer_name,created_by,dealer_area,status,type from tbl_challan_details_master where dealer_id='" + ddldealer.SelectedValue + "'");
        }
        else
        {
            GridView1.AllowPaging = false;
            cls.gridbind(GridView1, "select distinct challan_no,date,dealer_name,created_by,dealer_area,status,type from tbl_challan_details_master where dealer_id='" + ddldealer.SelectedValue + "' and  created_by='" + Session["Username"].ToString() + "'");
        }
    }

    protected void Button3_Click(object sender, EventArgs e)
    {
        if (Session["type"].ToString() == "Administrator")
        {
            if (ddldealer.SelectedValue != "All")
            {
                cls.gridbind(GridView1, "select distinct challan_no,date,dealer_name,created_by,dealer_area,status,type from tbl_challan_details_master where dealer_id='" + ddldealer.SelectedValue + "' and date between '" + DateTime.ParseExact(txtfrom.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "' and '" + DateTime.ParseExact(txtto.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "'");
            }
            else
            {
                cls.gridbind(GridView1, "select distinct challan_no,date,dealer_name,created_by,dealer_area,status,type from tbl_challan_details_master where date between '" + DateTime.ParseExact(txtfrom.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "' and '" + DateTime.ParseExact(txtto.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "'");
            }
        }
        else
        {
            if (ddldealer.SelectedValue != "All")
            {
                cls.gridbind(GridView1, "select distinct challan_no,date,dealer_name,created_by,dealer_area,status,type from tbl_challan_details_master where dealer_id='" + ddldealer.SelectedValue + "' and date between '" + DateTime.ParseExact(txtfrom.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "' and '" + DateTime.ParseExact(txtto.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "'and  created_by='" + Session["Username"].ToString() + "'");
            }
            else
            {
                cls.gridbind(GridView1, "select distinct challan_no,date,dealer_name,created_by,dealer_area,status,type from tbl_challan_details_master where date between '" + DateTime.ParseExact(txtfrom.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "' and '" + DateTime.ParseExact(txtto.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "'and  created_by='" + Session["Username"].ToString() + "'");
            }
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "del")
        {
            cmd = con.CreateCommand();
            SqlCommand cmd1 = con.CreateCommand();
            con.Open();
            cmd.CommandText = " delete  tbl_challan_details_master  where challan_no=" + e.CommandArgument.ToString() + " ";
            cmd.ExecuteNonQuery();
            con.Close();
            bind();
        }
    }
}