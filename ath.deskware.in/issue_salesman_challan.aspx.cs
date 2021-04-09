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

public partial class issue_salesman_challan : System.Web.UI.Page
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
            cls.bind_ddl(ddldriver, "Select name,id from tbl_salesman_master order by name asc", "name", "id");
            bind_temp();
        }
    }
    public void bind_temp()
    {
        DataTable dt = new DataTable();
        dt.Columns.AddRange(
              new DataColumn[5] 
            { new DataColumn("id", typeof(string)),
                                new DataColumn("name", typeof(string)),

                new DataColumn("amount", typeof(string)),
                    new DataColumn("type", typeof(string)),
                            new DataColumn("remarks", typeof(string)),
                              
            }

          );
        ViewState["stock1"] = dt;
        GridView2.DataSource = (DataTable)ViewState["stock1"];
        GridView2.DataBind();
    }
    string commnd = "";
    protected void Button1_Click(object sender, EventArgs e)
    {
        int count = 0;
        int j;
        for (j = 0; j < GridView2.Rows.Count; j++)
        {
            Label lblid = (Label)GridView2.Rows[j].FindControl("lblid");
            Label lblname = (Label)GridView2.Rows[j].FindControl("lblname");
            Label lblamount = (Label)GridView2.Rows[j].FindControl("lblamount");
            Label lbltype = (Label)GridView2.Rows[j].FindControl("lbltype");
            Label lblremarks = (Label)GridView2.Rows[j].FindControl("lblremarks");

            count++;

            if (lbltype.Text == "C")
            {
                commnd = " insert into tbl_salesman_ledger_master values ('" + lblname.Text + "','" + lblid.Text + "','','" + lblamount.Text.Trim() + "','" + lblremarks.Text.Trim() + "','" + DateTime.ParseExact(txtdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "','" + cls.rand("") + "')";
            }
            if (lbltype.Text == "D")
            {
                commnd = " insert into tbl_salesman_ledger_master values ('" + lblname.Text + "','" + lblid.Text + "','" + lblamount.Text.Trim() + "','','" + lblremarks.Text.Trim() + "','" + DateTime.ParseExact(txtdate.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "','" + cls.rand("") + "')";
            }
            SqlCommand cmd2 = con.CreateCommand();
            con.Open();
            cmd2.CommandText = commnd;
            cmd2.ExecuteNonQuery();
            con.Close();

        }
        if (count > 0)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Submitted Sucessfully');window.location='issue_salesman_challan.aspx';", true);
        }
    }
    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "delete1")
        {
            if (GridView2.Rows.Count > 0)
            {
                DataTable dt = (DataTable)ViewState["stock1"];
                GridViewRow row = (GridViewRow)(((Control)e.CommandSource).NamingContainer);
                DataTable dtCurrentTable = new DataTable();
                int RowIndex = row.RowIndex;
                dtCurrentTable = dt;
                dtCurrentTable.Rows.RemoveAt(row.RowIndex);
                GridView2.DataSource = dt;
                GridView2.DataBind();
            }
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        DataTable dt = (DataTable)ViewState["stock1"];
        dt.Rows.Add(ddldriver.SelectedValue, ddldriver.SelectedItem.Text, txtamount.Text.Trim(), RadioButtonList1.SelectedValue, txtreamrks.Text.Trim());
        ViewState["stock1"] = dt;
        GridView2.DataSource = (DataTable)ViewState["stock1"];
        GridView2.DataBind();
        txtamount.Text = txtreamrks.Text = string.Empty;
    }
}