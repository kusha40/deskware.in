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

public partial class Admin_capitel_ledger : System.Web.UI.Page
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
            cls.gridbind(GridView1, "select * from [tbl_capital_master]  order by id asc,date asc ");

            if (Session["type"].ToString() != "Administrator")
            {
                GridView1.Columns[0].Visible = false;
                TextBox1.Visible = Button4.Visible = false;
            }
        }

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "del")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "", "window.open('../delete_ledger_entry.aspx?id=" + e.CommandArgument.ToString() + "&typ=capital','Graph','height=724px,width=900px,scrollbars=1' );", true);
        }
    }
    double bal1 = 0.00;
    protected void Button1_Click(object sender, EventArgs e)
    {
        string from_date = DateTime.ParseExact(txtfdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
        string to_date = DateTime.ParseExact(txttdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);

       
        cls.gridbind(GridView1, "select * from [tbl_capital_master] where date between '" + from_date + "' and '" + to_date + "'  order by id asc,date asc ");

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

    protected void Button4_Click(object sender, EventArgs e)
    {
        SqlDataAdapter adap = new SqlDataAdapter("select password from user_master where password='" + TextBox1.Text.Trim() + "'  and user_id='admin'", con);
        DataSet ds = new DataSet();
        adap.Fill(ds);
        if (ds.Tables[0].Rows.Count != 0)
        {
            int count = 0;
            int j;
            for (j = 0; j < GridView1.Rows.Count; j++)
            {
                CheckBox cb = (CheckBox)GridView1.Rows[j].FindControl("chkAll0");
                Label id = (Label)GridView1.Rows[j].FindControl("Label1");
                if (cb.Checked == true)
                {
                    count++;
                    cmd = con.CreateCommand();
                    con.Open();
                    cmd.CommandText = "Delete tbl_capital_master    where id='" + id.Text + "' ";
                    cmd.ExecuteNonQuery();
                    con.Close();

                }
            }
            if (count > 0)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Deleted Sucessfully');window.location='capitel_ledger.aspx';", true);
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Check Item in the List');", true);
            }
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Password Invalid');", true);
        }

    }
}