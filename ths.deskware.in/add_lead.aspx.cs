using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class add_lead : System.Web.UI.Page
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
            po_no();
            cls.bind_ddl(DropDownList1, " select distinct pname from tbl_arkaya_product_master order by pname asc", "pname", "pname");
            cls.bind_ddl(DropDownList3, " select distinct source from tbl_lead_source_master order by source asc", "source", "source");
            cls.bind_ddl(DropDownList4, " select distinct type from tbl_lead_type_master order by type asc", "type", "type");
        }

    }
    public void po_no()
    {
        cmd = con.CreateCommand();
        con.Open();
        cmd.CommandText = "  SELECT  RIGHT('0000'+ isnull(CONVERT(VARCHAR,max(cast(lead_id as bigint))+1),0),4) as id FROM tbl_medors_lead_master ";
        txtcno.Text = cmd.ExecuteScalar().ToString();
        con.Close();
        if (txtcno.Text == "0000")
        {
            txtcno.Text = "0001";
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlCommand cmd1 = con.CreateCommand();
        con.Open();
        cmd1.CommandText = "select count(mob) from tbl_medors_lead_master where mob='" + txtmobile.Text.Trim() + "'";
        int a = int.Parse(cmd1.ExecuteScalar().ToString());
        con.Close();
        if (a >= 1)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Mobile No. Already Exists');;", true);
        }
        else
        {
            po_no();
            cmd = con.CreateCommand();
            con.Open();
            cmd.CommandText = "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:30:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101) insert into tbl_medors_lead_master values('" + txtcno.Text.Trim() + "','" + txttitle.Text.Trim() + "','" + txtfname.Text.Trim() + "','" + txtlname.Text.Trim() + "','" + txtaddress.Text.Trim() + "','" + txttown.Text.Trim() + "','" + txtpostcode.Text.Trim() + "','" + txtemail.Text.Trim() + "','" + txtphone.Text.Trim() + "','" + txtmobile.Text.Trim() + "','" + txtwork.Text.Trim() + "','" + DropDownList1.SelectedValue + "',@date_new,'" + Session["Username"].ToString() + "','" + Session["Username"].ToString() + "','" + DropDownList2.SelectedValue + "','" + DropDownList3.SelectedValue + "','" + DropDownList4.SelectedValue + "')";
            cmd.ExecuteNonQuery();
            con.Close();
            followup();
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Saved Sucessfully');window.location='add_lead.aspx';", true);
        }
    }
    public void followup()
    {
        cmd = con.CreateCommand();
        con.Open();
        cmd.CommandText = "insert into tbl_medors_followup_master values('" + txtcno.Text.Trim() + "','" + txttitle.Text.Trim() +" "+ txtfname.Text.Trim() + "','','" + txtremarks.Text.Trim() + "','" + Session["Username"].ToString() + "',getdate(),'1')";
        cmd.ExecuteNonQuery();
        con.Close();
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Reset Sucessfully');window.location='add_lead.aspx';", true);
    }
}