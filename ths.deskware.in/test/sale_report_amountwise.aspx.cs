using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sale_report_amountwise : System.Web.UI.Page
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
            if (Session["Username"].ToString() == "Satish" || Session["Username"].ToString() == "SATISH" || Session["Username"].ToString() == "satish" || Session["Username"].ToString() == "Ravi" || Session["Username"].ToString() == "RAVI" || Session["Username"].ToString() == "ravi")
            {
                cls.bind_ddl(ddldealer, "Select distinct dealer_name,dealer_id from tbl_dealer_ledger_master order by dealer_name asc", "dealer_name", "dealer_id");
                ddldealer.Items.Insert(0, "All");
                h3.Visible = false;
            }
            else
            {
                cls.bind_ddl(ddldealer, "Select distinct dealer_name,dealer_id from tbl_dealer_ledger_master order by dealer_name asc", "dealer_name", "dealer_id");
                ddldealer.Items.Insert(0, "All");
            }

            cls.bind_ddl(ddlarea, "select distinct area from tbl_dealer_Master order by area asc", "area", "area");
            ddlarea.Items.Insert(0,"Select");
        }

    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (Session["Username"].ToString() == "Satish" || Session["Username"].ToString() == "SATISH" || Session["Username"].ToString() == "satish" || Session["Username"].ToString() == "Ravi" || Session["Username"].ToString() == "RAVI" || Session["Username"].ToString() == "ravi")
        {
            h3.Visible = false;
        }
        else
        {
            h3.Visible = true;
        }
        cls.gridbind(GridView1, "select sum(distinct netamount) as netamount,max(distinct dealer_name)as dealer_name ,max(distinct dealer_id)as dealer_id  from tbl_challan_details_master where dealer_id='" + ddldealer.SelectedValue + "' and  date between '" + DateTime.ParseExact(txtfrom.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "' and '" + DateTime.ParseExact(txtto.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "' and type='FI' and status!='Cancel' group by dealer_id order by netamount desc  ");

        int i; double totl = 0;
        for (i = 0; i < GridView1.Rows.Count; i++)
        {
            Label debit = GridView1.Rows[i].FindControl("Label3") as Label;
            totl += double.Parse(debit.Text);
        }
        Label5.Text = totl.ToString("n2");
    }

    protected void btnsubmit1_Click(object sender, EventArgs e)
    {
        if (Session["Username"].ToString() == "Satish" || Session["Username"].ToString() == "SATISH" || Session["Username"].ToString() == "satish" || Session["Username"].ToString() == "Ravi" || Session["Username"].ToString() == "RAVI" || Session["Username"].ToString() == "ravi")
        {
            h3.Visible = false;
        }
        else
        {
            h3.Visible = true;
        }
        cls.gridbind(GridView1, "select sum(distinct netamount) as netamount,max(distinct dealer_name)as dealer_name ,max( distinct dealer_id)as dealer_id  from tbl_challan_details_master where type='FI' and status!='Cancel' group by dealer_id order by netamount desc  ");

        int i; double totl = 0;
        for (i = 0; i < GridView1.Rows.Count; i++)
        {
            Label debit = GridView1.Rows[i].FindControl("Label3") as Label;
            totl += double.Parse(debit.Text);
        }
        Label5.Text = totl.ToString("n2");
    }
    protected void btnsubmit0_Click(object sender, EventArgs e)
    {
        if (Session["Username"].ToString() == "Satish" || Session["Username"].ToString() == "SATISH" || Session["Username"].ToString() == "satish" || Session["Username"].ToString() == "Ravi" || Session["Username"].ToString() == "RAVI" || Session["Username"].ToString() == "ravi")
        {
            h3.Visible = false;
        }
        else
        {
            h3.Visible = true;
        }
        cls.gridbind(GridView1, "select sum( distinct netamount) as netamount,max(distinct dealer_name)as dealer_name ,max( distinct dealer_id)as dealer_id  from tbl_challan_details_master where dealer_id='" + ddldealer.SelectedValue + "' and cast(Date as date) = '" + DateTime.ParseExact(txtpdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "' and type='FI' and status!='Cancel' group by dealer_id order by netamount desc  ");

        int i; double totl = 0;
        for (i = 0; i < GridView1.Rows.Count; i++)
        {
            Label debit = GridView1.Rows[i].FindControl("Label3") as Label;
            totl += double.Parse(debit.Text);
        }
        Label5.Text = totl.ToString("n2");
    }
    protected void btnsubmit2_Click(object sender, EventArgs e)
    {
        h3.Visible = true;
        cls.gridbind(GridView1, "select sum( distinct netamount) as netamount,max(distinct dealer_name)as dealer_name ,max( distinct dealer_id)as dealer_id  from tbl_challan_details_master where  cast(Date as date) = '" + DateTime.ParseExact(txtpdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "' and type='FI' and status!='Cancel' group by dealer_id order by netamount desc  ");

        int i; double totl = 0;
        for (i = 0; i < GridView1.Rows.Count; i++)
        {
            Label debit = GridView1.Rows[i].FindControl("Label3") as Label;
            totl += double.Parse(debit.Text);
        }
        Label5.Text = totl.ToString("n2");
    }
    protected void btnview3_Click(object sender, EventArgs e)
    {
        if (ddldealer.SelectedValue != "All")
        {
            if (txtpdate.Text != string.Empty)
            {
                if (Session["Username"].ToString() == "Satish" || Session["Username"].ToString() == "SATISH" || Session["Username"].ToString() == "satish" || Session["Username"].ToString() == "Ravi" || Session["Username"].ToString() == "RAVI" || Session["Username"].ToString() == "ravi")
                {
                    h3.Visible = false;
                }
                else
                {
                    h3.Visible = true;
                }
                cls.gridbind(GridView1, "select sum( distinct netamount) as netamount,max(distinct dealer_name)as dealer_name ,max( distinct dealer_id)as dealer_id  from tbl_challan_details_master where dealer_id='" + ddldealer.SelectedValue + "' and cast(Date as date) = '" + DateTime.ParseExact(txtpdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "' and type='FI' and status!='Cancel' group by dealer_id order by netamount desc  ");
                int i; double totl = 0;
                for (i = 0; i < GridView1.Rows.Count; i++)
                {
                    Label debit = GridView1.Rows[i].FindControl("Label3") as Label;
                    totl += double.Parse(debit.Text);
                }
                Label5.Text = totl.ToString("n2");
            }
            if (txtfrom.Text != string.Empty && txtto.Text != string.Empty)
            {
                if (Session["Username"].ToString() == "Satish" || Session["Username"].ToString() == "SATISH" || Session["Username"].ToString() == "satish" || Session["Username"].ToString() == "Ravi" || Session["Username"].ToString() == "RAVI" || Session["Username"].ToString() == "ravi")
                {
                    h3.Visible = false;
                }
                else
                {
                    h3.Visible = true;
                }
                cls.gridbind(GridView1, "select sum(distinct netamount) as netamount,max(distinct dealer_name)as dealer_name ,max(distinct dealer_id)as dealer_id  from tbl_challan_details_master where dealer_id='" + ddldealer.SelectedValue + "' and  date between '" + DateTime.ParseExact(txtfrom.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "' and '" + DateTime.ParseExact(txtto.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "' and type='FI' and status!='Cancel' group by dealer_id order by netamount desc  ");
                int i; double totl = 0;
                for (i = 0; i < GridView1.Rows.Count; i++)
                {
                    Label debit = GridView1.Rows[i].FindControl("Label3") as Label;
                    totl += double.Parse(debit.Text);
                }
                Label5.Text = totl.ToString("n2");
            }
        }
        else
        {
            if (txtpdate.Text != string.Empty)
            {
                if (Session["Username"].ToString() == "Satish" || Session["Username"].ToString() == "SATISH" || Session["Username"].ToString() == "satish" || Session["Username"].ToString() == "Ravi" || Session["Username"].ToString() == "RAVI" || Session["Username"].ToString() == "ravi")
                {
                    h3.Visible = false;
                }
                else
                {
                    h3.Visible = true;
                }
                cls.gridbind(GridView1, "select sum( distinct netamount) as netamount,max(distinct dealer_name)as dealer_name ,max( distinct dealer_id)as dealer_id  from tbl_challan_details_master where  cast(Date as date) = '" + DateTime.ParseExact(txtpdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "' and type='FI' and status!='Cancel' group by dealer_id order by netamount desc  ");
                int i; double totl = 0;
                for (i = 0; i < GridView1.Rows.Count; i++)
                {
                    Label debit = GridView1.Rows[i].FindControl("Label3") as Label;
                    totl += double.Parse(debit.Text);
                }
                Label5.Text = totl.ToString("n2");
            }
            if (txtfrom.Text != string.Empty && txtto.Text != string.Empty)
            {
                if (Session["Username"].ToString() == "Satish" || Session["Username"].ToString() == "SATISH" || Session["Username"].ToString() == "satish" || Session["Username"].ToString() == "Ravi" || Session["Username"].ToString() == "RAVI" || Session["Username"].ToString() == "ravi")
                {
                    h3.Visible = false;
                }
                else
                {
                    h3.Visible = true;
                }
                cls.gridbind(GridView1, "select sum(distinct netamount) as netamount,max(distinct dealer_name)as dealer_name ,max(distinct dealer_id)as dealer_id  from tbl_challan_details_master where  date between '" + DateTime.ParseExact(txtfrom.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "' and '" + DateTime.ParseExact(txtto.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "' and type='FI' and status!='Cancel' group by dealer_id order by netamount desc  ");
                int i; double totl = 0;
                for (i = 0; i < GridView1.Rows.Count; i++)
                {
                    Label debit = GridView1.Rows[i].FindControl("Label3") as Label;
                    totl += double.Parse(debit.Text);
                }
                Label5.Text = totl.ToString("n2");
            }
        }
    }
    protected void btnview4_Click(object sender, EventArgs e)
    {
        if (ddldealer.SelectedValue != "All")
        {
            if (txtpdate.Text != string.Empty)
            {
                if (Session["Username"].ToString() == "Satish" || Session["Username"].ToString() == "SATISH" || Session["Username"].ToString() == "satish" || Session["Username"].ToString() == "Ravi" || Session["Username"].ToString() == "RAVI" || Session["Username"].ToString() == "ravi")
                {
                    h3.Visible = false;
                }
                else
                {
                    h3.Visible = true;
                }
                cls.gridbind(GridView1, "select sum( distinct netamount) as netamount,max(distinct dealer_name)as dealer_name ,max( distinct dealer_id)as dealer_id  from tbl_challan_details_master where dealer_id='" + ddldealer.SelectedValue + "' and cast(Date as date) = '" + DateTime.ParseExact(txtpdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "' and type='RI'  group by dealer_id order by netamount desc  ");
                int i; double totl = 0;
                for (i = 0; i < GridView1.Rows.Count; i++)
                {
                    Label debit = GridView1.Rows[i].FindControl("Label3") as Label;
                    totl += double.Parse(debit.Text);
                }
                Label5.Text = totl.ToString("n2");
            }
            if (txtfrom.Text != string.Empty && txtto.Text != string.Empty)
            {
                if (Session["Username"].ToString() == "Satish" || Session["Username"].ToString() == "SATISH" || Session["Username"].ToString() == "satish" || Session["Username"].ToString() == "Ravi" || Session["Username"].ToString() == "RAVI" || Session["Username"].ToString() == "ravi")
                {
                    h3.Visible = false;
                }
                else
                {
                    h3.Visible = true;
                }
                cls.gridbind(GridView1, "select sum(distinct netamount) as netamount,max(distinct dealer_name)as dealer_name ,max(distinct dealer_id)as dealer_id  from tbl_challan_details_master where dealer_id='" + ddldealer.SelectedValue + "' and  date between '" + DateTime.ParseExact(txtfrom.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "' and '" + DateTime.ParseExact(txtto.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "' and type='RI' group by dealer_id order by netamount desc  ");
                int i; double totl = 0;
                for (i = 0; i < GridView1.Rows.Count; i++)
                {
                    Label debit = GridView1.Rows[i].FindControl("Label3") as Label;
                    totl += double.Parse(debit.Text);
                }
                Label5.Text = totl.ToString("n2");
            }
        }
        else
        {
            if (txtpdate.Text != string.Empty)
            {
                if (Session["Username"].ToString() == "Satish" || Session["Username"].ToString() == "SATISH" || Session["Username"].ToString() == "satish" || Session["Username"].ToString() == "Ravi" || Session["Username"].ToString() == "RAVI" || Session["Username"].ToString() == "ravi")
                {
                    h3.Visible = false;
                }
                else
                {
                    h3.Visible = true;
                }
                cls.gridbind(GridView1, "select sum( distinct netamount) as netamount,max(distinct dealer_name)as dealer_name ,max( distinct dealer_id)as dealer_id  from tbl_challan_details_master where  cast(Date as date) = '" + DateTime.ParseExact(txtpdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "' and type='RI' group by dealer_id order by netamount desc  ");
                int i; double totl = 0;
                for (i = 0; i < GridView1.Rows.Count; i++)
                {
                    Label debit = GridView1.Rows[i].FindControl("Label3") as Label;
                    totl += double.Parse(debit.Text);
                }
                Label5.Text = totl.ToString("n2");
            }
            if (txtfrom.Text != string.Empty && txtto.Text != string.Empty)
            {
                if (Session["Username"].ToString() == "Satish" || Session["Username"].ToString() == "SATISH" || Session["Username"].ToString() == "satish" || Session["Username"].ToString() == "Ravi" || Session["Username"].ToString() == "RAVI" || Session["Username"].ToString() == "ravi")
                {
                    h3.Visible = false;
                }
                else
                {
                    h3.Visible = true;
                }
                cls.gridbind(GridView1, "select sum(distinct netamount) as netamount,max(distinct dealer_name)as dealer_name ,max(distinct dealer_id)as dealer_id  from tbl_challan_details_master where  date between '" + DateTime.ParseExact(txtfrom.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "' and '" + DateTime.ParseExact(txtto.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "' and type='RI' group by dealer_id order by netamount desc  ");
                int i; double totl = 0;
                for (i = 0; i < GridView1.Rows.Count; i++)
                {
                    Label debit = GridView1.Rows[i].FindControl("Label3") as Label;
                    totl += double.Parse(debit.Text);
                }
                Label5.Text = totl.ToString("n2");
            }
        }
    }
    protected void btnsubmit3_Click(object sender, EventArgs e)
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
        cls.gridbind(GridView1, "  select sum( distinct netamount) as netamount,max(distinct dealer_name)as dealer_name ,max( distinct dealer_id)as dealer_id  from tbl_challan_details_master where date between '" + DateTime.ParseExact(txtfrom.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "' and '" + DateTime.ParseExact(txtto.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "' and    type='FI' and status!='Cancel' and  dealer_name in (select name from tbl_dealer_Master where area='" + ddlarea.SelectedValue + "' ) group by dealer_id order by netamount desc");
      
    }
}