using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class employee_expense_report : System.Web.UI.Page
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
            cls.gridbind(GridView1, "select * from  tbl_meeting_expense where created_by ='" + Session["Username"].ToString() + "' order by date desc");
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        cls.gridbind(GridView1, "select * from  tbl_meeting_expense where created_by ='" + Session["Username"].ToString() + "'order by date desc");
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Reset Sucessfully');window.location='employee_expense_report.aspx';", true);
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

        qry = "select * from tbl_meeting_expense where created_by ='" + Session["Username"].ToString() + "' and ";
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
}