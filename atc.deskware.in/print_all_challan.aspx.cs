using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class print_all_challan : System.Web.UI.Page
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
            cls.bind_ddl(ddldealer, "Select distinct dealer_name,dealer_id from tbl_dealer_ledger_master order by dealer_name asc", "dealer_name", "dealer_id");

            ddldealer.Items.Insert(0,"All");

        }

    }
    protected void btnview_Click(object sender, EventArgs e)
    {
        ClientScript.RegisterStartupScript(this.Page.GetType(), "", "window.open('view_all_print.aspx?id=" + ddldealer.SelectedValue + "&typ=today','Graph','height=724px,width=900px,scrollbars=1' );", true);
    }
    protected void btnview0_Click(object sender, EventArgs e)
    {
        ClientScript.RegisterStartupScript(this.Page.GetType(), "", "window.open('view_all_print.aspx?id=" + ddldealer.SelectedValue + "&typ=todayall','Graph','height=724px,width=900px,scrollbars=1' );", true);
    }
    protected void btnview1_Click(object sender, EventArgs e)
    {
        string date = DateTime.ParseExact(TextBox1.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
        ClientScript.RegisterStartupScript(this.Page.GetType(), "", "window.open('view_all_print.aspx?id=" + ddldealer.SelectedValue + "&typ=particulardatedealer&pdate=" + date + "','Graph','height=724px,width=900px,scrollbars=1' );", true);
    }
    protected void btnview2_Click(object sender, EventArgs e)
    {
        string from = DateTime.ParseExact(txtfrom.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
        string to = DateTime.ParseExact(txtto.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
        ClientScript.RegisterStartupScript(this.Page.GetType(), "", "window.open('view_all_print.aspx?id=" + ddldealer.SelectedValue + "&typ=datebetweendealer&from=" + from + "&to=" + to + "','Graph','height=724px,width=900px,scrollbars=1' );", true);
    }
    protected void btnview3_Click(object sender, EventArgs e)
    {
        if (ddldealer.SelectedValue != "All")
        {
            if (TextBox1.Text != string.Empty)
            {
                string date = DateTime.ParseExact(TextBox1.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
                ClientScript.RegisterStartupScript(this.Page.GetType(), "", "window.open('view_all_print.aspx?id=" + ddldealer.SelectedValue + "&typ=particulardatedealer&pdate=" + date + "','Graph','height=724px,width=900px,scrollbars=1' );", true);
            }
            if (txtfrom.Text != string.Empty && txtto.Text != string.Empty)
            {
                string from = DateTime.ParseExact(txtfrom.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
                string to = DateTime.ParseExact(txtto.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
                ClientScript.RegisterStartupScript(this.Page.GetType(), "", "window.open('view_all_print.aspx?id=" + ddldealer.SelectedValue + "&typ=datebetweendealer&from=" + from + "&to=" + to + "','Graph','height=724px,width=900px,scrollbars=1' );", true);
            }
        }
        else
        {
            if (TextBox1.Text != string.Empty)
            {
                string date = DateTime.ParseExact(TextBox1.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
                ClientScript.RegisterStartupScript(this.Page.GetType(), "", "window.open('view_all_print.aspx?id=" + ddldealer.SelectedValue + "&typ=particulardatealldealer&pdate=" + date + "','Graph','height=724px,width=900px,scrollbars=1' );", true);
            }
            if (txtfrom.Text != string.Empty && txtto.Text != string.Empty)
            {
                string from = DateTime.ParseExact(txtfrom.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
                string to = DateTime.ParseExact(txtto.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
                ClientScript.RegisterStartupScript(this.Page.GetType(), "", "window.open('view_all_print.aspx?id=" + ddldealer.SelectedValue + "&typ=datebetweenalldealer&from=" + from + "&to=" + to + "','Graph','height=724px,width=900px,scrollbars=1' );", true);
            }
        }
    }
}