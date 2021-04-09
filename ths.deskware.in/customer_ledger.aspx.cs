using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class customer_ledger : System.Web.UI.Page
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
            cls.bind_ddl(DropDownList1, "select lead_id,(fname+' '+lname+' - '+mob)as fname from tbl_medors_lead_master order by fname asc", "fname", "lead_id");
            DropDownList1.Items.Insert(0, "Select");
        }

    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        if (Session["type"].ToString() == "Administrator")
        {
            GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
            con.Open();
            SqlCommand cmd = new SqlCommand("delete FROM tbl_customer_ledger where id='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
            cmd.ExecuteNonQuery();
            con.Close();
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Deleted Sucessfully');", true);
            cls.gridbind(GridView1, "select * from tbl_customer_ledger where dealer_id='" + DropDownList1.SelectedValue + "' order by date asc");
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('You are not authorized for remove section');", true);
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        cls.gridbind(GridView1, "select * from tbl_customer_ledger where dealer_id='" + DropDownList1.SelectedValue + "' order by date asc");
    }

    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label debit = e.Row.FindControl("Label6") as Label;
            Label credit = e.Row.FindControl("Label7") as Label;
            Label bal = e.Row.FindControl("lblbal") as Label;
            Int32 index = GridView1.Rows.Count - 1;
            if (index >= 0)
            {
                if (index == 0)
                {
                    Label L1 = GridView1.Rows[index].FindControl("Label6") as Label;
                    bal.Text = L1.Text;
                    double c = double.Parse(bal.Text) + double.Parse(debit.Text) - double.Parse(credit.Text);
                    bal.Text = c.ToString("n2");
                }
                else
                {
                    Label L = GridView1.Rows[index].FindControl("lblbal") as Label;
                    bal.Text = L.Text;
                    double c = double.Parse(bal.Text) + double.Parse(debit.Text) - double.Parse(credit.Text);
                    bal.Text = c.ToString("n2");
                }

            }
        }
    }
}