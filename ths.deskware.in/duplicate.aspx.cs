using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class duplicate : System.Web.UI.Page
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
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        cls.gridbind(GridView1, "SELECT y.id,y.lead_id,y.created_by,y.assigned_to,y.fname FROM tbl_medors_lead_master y INNER JOIN (SELECT lead_id, COUNT(*) AS CountOf FROM tbl_medors_lead_master GROUP BY lead_id HAVING COUNT(*)>1 ) dt ON  y.lead_id=dt.lead_id");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        cls.gridbind(GridView1, "SELECT    y.id,y.mob as lead_id,y.created_by,y.assigned_to,y.fname FROM tbl_medors_lead_master y INNER JOIN (SELECT mob, COUNT(*) AS CountOf  FROM tbl_medors_lead_master where mob !=''  GROUP BY mob HAVING COUNT(*)>1 ) dt ON y.mob=dt.mob ");
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        con.Open();
        SqlCommand cmd = new SqlCommand("delete FROM tbl_medors_lead_master where id='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Deleted Sucessfully');window.location='duplicate.aspx';", true);

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
                cmd.CommandText = "delete FROM tbl_medors_lead_master where id='" + id.Text + "' ";
                cmd.ExecuteNonQuery();
                con.Close();
            }
          
        }
        if (count > 0)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Deleted Sucessfully');window.location='duplicate.aspx';", true);
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Select Leads in the below List ');", true);
        }
    }
}