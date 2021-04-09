using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class create_doctor : System.Web.UI.Page
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
            cls.bind_ddl(ddlschoolname, "select * from tbl_school_master", "name", "name");
        }

    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        try
        {
            cmd = con.CreateCommand();
            con.Open();
            cmd.CommandText = "SP_doctor_mstr";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter(@"school_name", ddlschoolname.SelectedValue));
            cmd.Parameters.Add(new SqlParameter(@"type", rbldoctortype.SelectedValue));
            cmd.Parameters.Add(new SqlParameter(@"doctor_name", txtdoctorname.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter(@"reg_no", txtregno.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter(@"address", txtaddress.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter(@"mob_no", txtmobno.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter(@"email_id", txtemailid.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter(@"remarks", txtremarks.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter(@"created_by", Session["Username"].ToString()));
            cmd.Parameters.Add(new SqlParameter(@"action", "I"));
            SqlParameter parm = new SqlParameter("@return_value", SqlDbType.NVarChar);
            parm.Direction = ParameterDirection.ReturnValue;
            cmd.Parameters.Add(parm);
            cmd.ExecuteNonQuery();
            con.Close();
            string actn = Convert.ToString(parm.Value);
            if (actn == "1")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Created Sucessfully');window.location='create_doctor.aspx';", true);
            }
            else if (actn == "2")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Deatils Already Exists');", true);
            }
        }
        catch (Exception ex)
        {
        }
    }
    [WebMethod]

    public static List<string> GetAutoCompleteData1(string username, string flag)
    {
        string st = flag;
        string commnd = "";
        List<string> result = new List<string>();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
        commnd = "select distinct (convert(nvarchar(max),id)+'~'+doctor_name) as Test from [tbl_doctor_master] where  (doctor_name) like '%'+@SearchText+'%'  ";
        using (SqlCommand cmd = new SqlCommand(commnd, con))
        {
            con.Open();
            cmd.Parameters.AddWithValue("@SearchText", username);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                result.Add(dr["Test"].ToString());
            }
            if (result.Count > 0)
            {
                return result;
            }
            else
            {
                result.Add("No Record Found !........");
                return result;
            }
        }

    }
    protected void btnviewall_Click(object sender, EventArgs e)
    {
        cls.gridbind(GridView1, "select * from tbl_doctor_master order by doctor_name asc");
    }
    protected void btnsearch_Click(object sender, EventArgs e)
    {
        try
        {
            GridView1.AllowPaging = false;
            string[] arr_search = new string[2];
            arr_search = txtMenuTitle.Text.Split('~');
            SqlDataAdapter adap = new SqlDataAdapter("select * from tbl_doctor_master where id='" + arr_search[0].Trim() + "'", con);
            DataSet ds = new DataSet();
            adap.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                cls.gridbind(GridView1, "select * from tbl_doctor_master where  id='" + arr_search[0].Trim() + "' order by doctor_name asc");
            }
        }

        catch (Exception er)
        {
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        cls.gridbind(GridView1, "select * from tbl_doctor_master order by doctor_name asc");
    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        //cls.gridbind(GridView1, "select * from tbl_doctor_master order by doctor_name asc");
    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lbldeleteid = (Label)row.FindControl("lblid");
        con.Open();
        SqlCommand cmd = new SqlCommand("delete FROM tbl_doctor_master where id='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Deleted Sucessfully');", true);
        cls.gridbind(GridView1, "select * from tbl_doctor_master order by doctor_name asc");
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
     //   cls.gridbind(GridView1, "select * from tbl_doctor_master order by doctor_name asc");
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lblID = (Label)row.FindControl("lblid");

        TextBox txttype = (TextBox)row.FindControl("txttype");
        TextBox txtdoctorname = (TextBox)row.FindControl("txtdoctorname");
        TextBox txtregno = (TextBox)row.FindControl("txtregno");
        TextBox txtaddress = (TextBox)row.FindControl("txtaddress");
        TextBox txtmobileno = (TextBox)row.FindControl("txtmobileno");
        TextBox txtemailid = (TextBox)row.FindControl("txtemailid");
        TextBox txtremarks = (TextBox)row.FindControl("txtremarks");

        GridView1.EditIndex = -1;
        con.Open();
        SqlCommand cmd = new SqlCommand("update tbl_doctor_master set type='" + txttype.Text.Trim() + "',doctor_name='" + txtdoctorname.Text.Trim() + "',reg_no='" + txtregno.Text.Trim() + "',address='" + txtaddress.Text.Trim() + "',mob_no='" + txtmobileno.Text.Trim() + "',email_id='" + txtemailid.Text.Trim() + "',remarks='" + txtremarks.Text.Trim() + "'where id='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Updated Sucessfully');", true);
        cls.gridbind(GridView1, "select * from tbl_doctor_master order by doctor_name asc");
    }
}