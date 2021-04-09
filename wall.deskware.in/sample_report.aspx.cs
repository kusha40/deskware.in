using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sample_report : System.Web.UI.Page
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
            div1.Visible = false;
            cls.bind_ddl(ddldealer, "Select name,id from tbl_dealer_Master order by name asc", "name", "id");

            string com = "select distinct p_code from tbl_product_master where size='" + ddlcompname.SelectedValue + "'";
            SqlDataAdapter adpt = new SqlDataAdapter(com, con);
            DataTable dt = new DataTable();
            adpt.Fill(dt);
            DropDownList1.DataSource = dt;
            DropDownList1.DataBind();
            DropDownList1.DataTextField = "p_code";
            DropDownList1.DataValueField = "p_code";
            DropDownList1.DataBind();

          //  cls.bind_listbox(DropDownList1, "select distinct p_code from tbl_product_master where size='"+ddlcompname.SelectedValue+"'", "p_code", "p_code");
        }

    }
    protected void btnview3_Click(object sender, EventArgs e)
    {
        div1.Visible = false;
        string from_date = DateTime.ParseExact(TextBox1.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
        string to_date = DateTime.ParseExact(TextBox2.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
        //cls.gridbind(GridView1, "select * from tbl_sample_entry where dealer_id='" + ddldealer.SelectedValue + "' and date between '" + from_date + "' and '" + to_date + "' order by date asc ");
        cls.gridbind(GridView1, "select max(size)as size,max(cname)as cname,max(pcode)as pcode,max(qty)as qty,max(sentqty)as sentqty,max(sts)as sts,max(sts2)as sts2,max(date)as date,max(dealer_name)as dealer_name,max(created_by)as created_by from tbl_sample_entry where dealer_id='" + ddldealer.SelectedValue + "' and date between '" + from_date + "' and '" + to_date + "'  group by date order by cname,pcode,date asc");
    }
    protected void GridView1_PreRender(object sender, EventArgs e)
    {
        foreach (GridViewRow r in GridView1.Rows)
        {
            Label lname = r.FindControl("Label4") as Label;
            Label lname1 = r.FindControl("Label41") as Label;
            Label cname = r.FindControl("Label2") as Label;
            Label TextBox1 = r.FindControl("Label6") as Label;
            Label TextBox11 = r.FindControl("Label5") as Label;
            CheckBox chkAll0 = r.FindControl("chkAll0") as CheckBox;
            CheckBox chkAll01 = r.FindControl("chkAll01") as CheckBox;
            //if (TextBox1.Text == "1")
            //{
            //    chkAll0.Visible = true;
            //    chkAll01.Visible = false;

            //}
            //if (TextBox1.Text == "2")
            //{
            //    chkAll0.Visible = true;
            //    chkAll01.Visible = true;
            //}
            //if (TextBox1.Text == "0" || TextBox1.Text == string.Empty)
            //{
            //    chkAll0.Visible = false;
            //    chkAll01.Visible = false;
            //}
            if (lname.Text == "ok")
            {
                if (TextBox1.Text == "1" || TextBox1.Text == "2")
                {
                    r.Cells[6].BackColor = ColorTranslator.FromHtml("#FFFF00");
                }
            }
            if (lname.Text == "")
            {
                if (TextBox1.Text == "1" || TextBox1.Text == "2")
                {
                    r.Cells[6].BackColor = ColorTranslator.FromHtml("#FF0000");
                }
            }
            if (lname1.Text == "ok")
            {
                if (TextBox1.Text == "2")
                {
                    r.Cells[7].BackColor = ColorTranslator.FromHtml("#FFFF00");
                }
            }
            if (lname1.Text == "")
            {
                if (TextBox1.Text == "2")
                {
                    r.Cells[7].BackColor = ColorTranslator.FromHtml("#FF0000");
                }
            }
            if (cname.Text == "Allient")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#357EC7");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "Arido")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#368BC1");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "black berry")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#488AC7");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "Capsun")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#3090C7");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "DELTON")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#659EC7");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "exclusive")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#87AFC7");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "HIGH GLOSSY")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#95B9C7");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "Livanto")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#728FCE");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "Murano")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#2B65EC");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "Pioneer")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#306EFF");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "PREM")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#157DEC");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "Savitra")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#1589FF");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "Senso")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#6495ED");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "Specto")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#6698FF");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "TILEX")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#38ACEC");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "Veeta")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#56A5EC");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "veeta D.C")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#5CB3FF");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "veeta dark series")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#3BB9FF");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "VERITAAS   (32*32)")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#79BAEC");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "Zed")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#82CAFA");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
        }
    }
    protected void btnview4_Click(object sender, EventArgs e)
    {
        div1.Visible = true;
        GridView1.Columns[11].Visible = false;
        string from_date = DateTime.ParseExact(TextBox1.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
        string to_date = DateTime.ParseExact(TextBox2.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
      cls.gridbind(GridView1, "select * from tbl_sample_entry_sent where  date between '" + from_date + "' and '" + to_date + "' order by cname,pcode,date asc ");
        ////dealer_id='" + ddldealer.SelectedValue + "' and
        //cls.gridbind(GridView1, "select max(size)as size,max(cname)as cname,max(pcode)as pcode,max(qty)as qty,max(sentqty)as sentqty,max(sts)as sts,max(sts2)as sts2,max(date)as date,max(dealer_name)as dealer_name,max(created_by)as created_by from tbl_sample_entry_sent where  date between '" + from_date + "' and '" + to_date + "'  group by date order by cname,pcode,date asc");
        cls.gridbind(GridView2, "select * from tbl_sample_entry_sent where   date between '" + from_date + "' and '" + to_date + "' and (sts='ok') and (sts2='ok' or sentqty='1') order by cname,pcode,date asc");

       cls.gridbind(GridView3, "select * from tbl_sample_entry_sent where   date between '" + from_date + "' and '" + to_date + "' and (sts!='ok') and (sts2!='ok' ) order by cname,pcode,date asc");
    }
    protected void btnview5_Click(object sender, EventArgs e)
    {
        div1.Visible = true;
        GridView1.Columns[11].Visible = false;
        cls.gridbind(GridView1, "select max(size)as size,max(cname)as cname,max(pcode)as pcode,max(qty)as qty,max(sentqty)as sentqty,max(sts)as sts,max(sts2)as sts2,max(date)as date,max(dealer_name)as dealer_name,max(created_by)as created_by from tbl_sample_entry where  dealer_id='" + ddldealer.SelectedValue + "' group by pcode order by cname,pcode,date asc");


        cls.gridbind(GridView2, "select max(size)as size,max(cname)as cname,max(pcode)as pcode,max(qty)as qty,max(sentqty)as sentqty,max(sts)as sts,max(sts2)as sts2,max(date)as date,max(dealer_name)as dealer_name,max(created_by)as created_by from tbl_sample_entry where  dealer_id='" + ddldealer.SelectedValue + "' and (sts='ok') and (sts2='ok' or sentqty='1') group by pcode order by cname,pcode,date asc");

        cls.gridbind(GridView3, "select max(size)as size,max(cname)as cname,max(pcode)as pcode,max(qty)as qty,max(sentqty)as sentqty,max(sts)as sts,max(sts2)as sts2,max(date)as date,max(dealer_name)as dealer_name,max(created_by)as created_by from tbl_sample_entry where  dealer_id='" + ddldealer.SelectedValue + "' and (sts!='ok') and (sts2!='ok') group by pcode order by cname,pcode,date asc");
    }
    public override void VerifyRenderingInServerForm(Control control)
    { }
    protected void ddlcompname_SelectedIndexChanged(object sender, EventArgs e)
    {
        //cls.bind_listbox(DropDownList1, "select distinct p_code from tbl_product_master where size='" + ddlcompname.SelectedValue + "'", "p_code", "p_code");
        string com = "select distinct p_code from tbl_product_master where size='" + ddlcompname.SelectedValue + "'";
        SqlDataAdapter adpt = new SqlDataAdapter(com, con);
        DataTable dt = new DataTable();
        adpt.Fill(dt);
        DropDownList1.DataSource = dt;
        DropDownList1.DataBind();
        DropDownList1.DataTextField = "p_code";
        DropDownList1.DataValueField = "p_code";
        DropDownList1.DataBind();
    }
    protected void btnview6_Click(object sender, EventArgs e)
    {
        div1.Visible = true;
        GridView1.Columns[11].Visible = false;
        var sb = new StringBuilder();
        foreach (ListItem item in DropDownList1.Items)
        {
            if (item.Selected)
            {
                sb.Append("'" + item.Value + "',");
            }
        }

        string b = sb.ToString().TrimEnd(',');
        cls.gridbind(GridView1, "select max(size)as size,max(cname)as cname,max(pcode)as pcode,max(qty)as qty,max(sentqty)as sentqty,max(sts)as sts,max(sts2)as sts2,max(date)as date,max(dealer_name)as dealer_name,max(created_by)as created_by from tbl_sample_entry where  pcode in ("+b+") group by pcode order by cname,pcode,date asc");


        cls.gridbind(GridView2, "select max(size)as size,max(cname)as cname,max(pcode)as pcode,max(qty)as qty,max(sentqty)as sentqty,max(sts)as sts,max(sts2)as sts2,max(date)as date,max(dealer_name)as dealer_name,max(created_by)as created_by from tbl_sample_entry where  pcode in (" + b + ") and (sts='ok') and (sts2='ok' or sentqty='1') group by pcode order by cname,pcode,date asc");

        cls.gridbind(GridView3, "select max(size)as size,max(cname)as cname,max(pcode)as pcode,max(qty)as qty,max(sentqty)as sentqty,max(sts)as sts,max(sts2)as sts2,max(date)as date,max(dealer_name)as dealer_name,max(created_by)as created_by from tbl_sample_entry where  pcode in (" + b + ") and (sts!='ok') and (sts2!='ok') group by pcode order by cname,pcode,date asc");
    }
    protected void GridView2_PreRender(object sender, EventArgs e)
    {
        foreach (GridViewRow r in GridView2.Rows)
        {
            Label lname = r.FindControl("Label41") as Label;
            Label lname1 = r.FindControl("Label411") as Label;
            Label cname = r.FindControl("Label21") as Label;
            Label TextBox1 = r.FindControl("Label61") as Label;
            Label TextBox11 = r.FindControl("Label51") as Label;
            CheckBox chkAll0 = r.FindControl("chkAll01") as CheckBox;
            CheckBox chkAll01 = r.FindControl("chkAll011") as CheckBox;
            //if (TextBox1.Text == "1")
            //{
            //    chkAll0.Visible = true;
            //    chkAll01.Visible = false;

            //}
            //if (TextBox1.Text == "2")
            //{
            //    chkAll0.Visible = true;
            //    chkAll01.Visible = true;
            //}
            //if (TextBox1.Text == "0" || TextBox1.Text == string.Empty)
            //{
            //    chkAll0.Visible = false;
            //    chkAll01.Visible = false;
            //}
            if (lname.Text == "ok")
            {
                if (TextBox1.Text == "1" || TextBox1.Text == "2")
                {
                    r.Cells[6].BackColor = ColorTranslator.FromHtml("#FFFF00");
                }
            }
            if (lname.Text == "")
            {
                if (TextBox1.Text == "1" || TextBox1.Text == "2")
                {
                    r.Cells[6].BackColor = ColorTranslator.FromHtml("#FF0000");
                }
            }
            if (lname1.Text == "ok")
            {
                if (TextBox1.Text == "2")
                {
                    r.Cells[7].BackColor = ColorTranslator.FromHtml("#FFFF00");
                }
            }
            if (lname1.Text == "")
            {
                if (TextBox1.Text == "2")
                {
                    r.Cells[7].BackColor = ColorTranslator.FromHtml("#FF0000");
                }
            }
            if (cname.Text == "Allient")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#357EC7");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "Arido")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#368BC1");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "black berry")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#488AC7");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "Capsun")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#3090C7");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "DELTON")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#659EC7");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "exclusive")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#87AFC7");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "HIGH GLOSSY")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#95B9C7");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "Livanto")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#728FCE");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "Murano")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#2B65EC");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "Pioneer")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#306EFF");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "PREM")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#157DEC");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "Savitra")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#1589FF");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "Senso")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#6495ED");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "Specto")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#6698FF");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "TILEX")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#38ACEC");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "Veeta")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#56A5EC");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "veeta D.C")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#5CB3FF");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "veeta dark series")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#3BB9FF");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "VERITAAS   (32*32)")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#79BAEC");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "Zed")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#82CAFA");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
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
        GridView2.RenderControl(htmlWrite);
        Response.Write(stringWrite.ToString());
        Response.End();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.AddHeader("content-disposition", "attachment;filename=Report.xls");
        Response.Charset = "";
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = "application/vnd.xls";
        System.IO.StringWriter stringWrite = new System.IO.StringWriter();
        System.Web.UI.HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);
        GridView3.RenderControl(htmlWrite);
        Response.Write(stringWrite.ToString());
        Response.End();
    }
    protected void GridView3_PreRender(object sender, EventArgs e)
    {
        foreach (GridViewRow r in GridView3.Rows)
        {
            Label lname = r.FindControl("Label411") as Label;
            Label lname1 = r.FindControl("Label4111") as Label;
            Label cname = r.FindControl("Label211") as Label;
            Label TextBox1 = r.FindControl("Label611") as Label;
            Label TextBox11 = r.FindControl("Label511") as Label;
            CheckBox chkAll0 = r.FindControl("chkAll011") as CheckBox;
            CheckBox chkAll01 = r.FindControl("chkAll0111") as CheckBox;
            //if (TextBox1.Text == "1")
            //{
            //    chkAll0.Visible = true;
            //    chkAll01.Visible = false;

            //}
            //if (TextBox1.Text == "2")
            //{
            //    chkAll0.Visible = true;
            //    chkAll01.Visible = true;
            //}
            //if (TextBox1.Text == "0" || TextBox1.Text == string.Empty)
            //{
            //    chkAll0.Visible = false;
            //    chkAll01.Visible = false;
            //}
            if (lname.Text == "ok")
            {
                if (TextBox1.Text == "1" || TextBox1.Text == "2")
                {
                    r.Cells[6].BackColor = ColorTranslator.FromHtml("#FFFF00");
                }
            }
            if (lname.Text == "")
            {
                if (TextBox1.Text == "1" || TextBox1.Text == "2")
                {
                    r.Cells[6].BackColor = ColorTranslator.FromHtml("#FF0000");
                }
            }
            if (lname1.Text == "ok")
            {
                if (TextBox1.Text == "2")
                {
                    r.Cells[7].BackColor = ColorTranslator.FromHtml("#FFFF00");
                }
            }
            if (lname1.Text == "")
            {
                if (TextBox1.Text == "2")
                {
                    r.Cells[7].BackColor = ColorTranslator.FromHtml("#FF0000");
                }
            }
            if (cname.Text == "Allient")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#357EC7");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "Arido")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#368BC1");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "black berry")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#488AC7");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "Capsun")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#3090C7");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "DELTON")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#659EC7");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "exclusive")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#87AFC7");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "HIGH GLOSSY")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#95B9C7");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "Livanto")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#728FCE");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "Murano")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#2B65EC");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "Pioneer")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#306EFF");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "PREM")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#157DEC");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "Savitra")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#1589FF");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "Senso")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#6495ED");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "Specto")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#6698FF");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "TILEX")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#38ACEC");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "Veeta")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#56A5EC");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "veeta D.C")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#5CB3FF");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "veeta dark series")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#3BB9FF");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "VERITAAS   (32*32)")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#79BAEC");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "Zed")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#82CAFA");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
        }
    }
}