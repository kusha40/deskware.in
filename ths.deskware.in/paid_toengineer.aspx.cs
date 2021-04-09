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

public partial class paid_toengineer : System.Web.UI.Page
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
            cls.bind_ddl(ddlname, "select user_id,name from user_master where status='Active'   order by name asc", "name", "user_id");
            //    ddlname.Items.Insert(0, new ListItem("Select", ""));
            cls.gridbind(GridView1, "select * from  tbl_meeting_expense order by date desc");
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        cls.gridbind(GridView1, "select * from  tbl_meeting_expense order by date desc");
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
    protected void Button3_Click(object sender, EventArgs e)
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
    protected void Button2_Click(object sender, EventArgs e)
    {
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Reset Sucessfully');window.location='paid_toengineer.aspx';", true);
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        search();
    }

    String _p_name;
    String _fromdate;
    String _todate;
    string mainqry = String.Empty;
    string subqry = String.Empty;
    string qry = String.Empty;
    public void search()
    {
        if (ddlname.SelectedValue != String.Empty)
        {
            _p_name = ddlname.SelectedValue;
            if (subqry == String.Empty)
            {
                subqry = "tbl_meeting_expense.created_by='" + _p_name + "'";
            }

            else
            {
                subqry = subqry + "and tbl_meeting_expense.created_by = '" + _p_name + "'";
            }
        }

        if (txtfrom.Text != String.Empty && txtto.Text != String.Empty)
        {
            _fromdate = DateTime.ParseExact(txtfrom.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            _todate = DateTime.ParseExact(txtto.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            if (subqry == String.Empty)
            {
                subqry = "tbl_meeting_expense.date between '" + _fromdate + "' and '" + _todate + "'";
            }

            else
            {
                subqry = subqry + "and tbl_meeting_expense.date between '" + _fromdate + "' and '" + _todate + "' ";
            }
        }

        qry = "select * from tbl_meeting_expense where ";
        mainqry = qry + subqry + " order by date asc";
        cls.gridbind(GridView1, mainqry);
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "edit12")
        {
            cmd = con.CreateCommand();
            con.Open();
            cmd.CommandText = " delete  tbl_meeting_expense  where id=" + e.CommandArgument.ToString() + " ";
            cmd.ExecuteNonQuery();
            con.Close();
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Removed Sucessfully');window.location='paid_toengineer.aspx';", true);
        }
    }
   
  
 
    protected void Button6_Click(object sender, EventArgs e)
    {
        int count = 0;
        int j;
        for (j = 0; j < GridView1.Rows.Count; j++)
        {
            CheckBox cb = (CheckBox)GridView1.Rows[j].FindControl("chkAll0");
            Label id = (Label)GridView1.Rows[j].FindControl("Label1");
            TextBox paid = (TextBox)GridView1.Rows[j].FindControl("Label5");
            Label amount = (Label)GridView1.Rows[j].FindControl("Label7");
            Label balance = (Label)GridView1.Rows[j].FindControl("Label6");

            Label created_by = (Label)GridView1.Rows[j].FindControl("Label8");
            Label pat = (Label)GridView1.Rows[j].FindControl("Label2");

            double a = double.Parse(amount.Text);
            double b = double.Parse(paid.Text);
            double c = a - b; ;

            if (cb.Checked == true)
            {
                    count++;
                    cmd = con.CreateCommand();
                    con.Open();
                    cmd.CommandText = "update tbl_meeting_expense set paid='" + paid .Text+ "',balance='"+c.ToString()+"' where id='"+id.Text+"'";
                    cmd.ExecuteNonQuery();
                    con.Close();
                    string command = " DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:40:00';declare @date DATETIME;set @date=(SELECT (@d + CAST(@t AS datetime))) insert into tbl_engineer_ledger values('" + created_by.Text + "','" + created_by.Text + "','" + paid.Text + "','','" + pat.Text + "','" + Session["Username"].ToString() + "',@date)";
                    SqlCommand cmd1 = con.CreateCommand();
                    con.Open();
                    cmd1.CommandText = command;
                    cmd1.ExecuteNonQuery();
                    con.Close();
            }
        }
        if (count > 0)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Paid Sucessfully');window.location='paid_toengineer.aspx';", true);
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Select Expense in the below List ');", true);
        }
         
    }
}