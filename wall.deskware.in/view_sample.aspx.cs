using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class view_sample : System.Web.UI.Page
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
            cls.gridbind(GridView1, "select * from tbl_sample_entry where dealer_name='" + Request.QueryString["did"].ToString() + "' and date ='" + Request.QueryString["dt"].ToString() + "'  order by date asc ");
        }

    }
    protected void btnsubmit2_Click(object sender, EventArgs e)
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
}