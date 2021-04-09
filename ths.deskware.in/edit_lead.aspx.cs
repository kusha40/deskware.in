using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class edit_lead : System.Web.UI.Page
{
      SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
    SqlCommand cmd;
    Class1 cls = new Class1();

    SqlDataAdapter adap;DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] == null && Session["type"] == null)
        {
            Response.Redirect("~/login.aspx");
        }
        if (!IsPostBack)
        {
            cls.bind_ddl(DropDownList1, " select distinct pname from tbl_arkaya_product_master order by pname asc", "pname", "pname");

            cls.bind_ddl(DropDownList3, " select distinct source from tbl_lead_source_master order by source asc", "source", "source");
            cls.bind_ddl(DropDownList4, " select distinct type from tbl_lead_type_master order by type asc", "type", "type");

            SqlDataAdapter adap = new SqlDataAdapter("select * from tbl_medors_lead_master where lead_id='" + Request.QueryString["id"].ToString() + "' ", con);
            DataSet ds = new DataSet();
            adap.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dr = ds.Tables[0].Rows[0];
                txtcno.Text = dr["lead_id"].ToString();
                txttitle.Text = dr["title"].ToString();
                txtfname.Text = dr["fname"].ToString();
                txtlname.Text = dr["lname"].ToString();
                txtaddress.Text = dr["address"].ToString();
                txttown.Text = dr["city"].ToString();
                txtpostcode.Text = dr["postcode"].ToString();
                txtemail.Text = dr["email_id"].ToString();
                txtphone.Text = dr["phone"].ToString();
                txtmobile.Text = dr["mob"].ToString();
                txtwork.Text = dr["worka"].ToString();
                DropDownList1.SelectedValue = dr["product"].ToString();
                DropDownList2.SelectedValue = dr["ctype"].ToString();
                DropDownList3.SelectedValue = dr["dsource"].ToString();
                DropDownList4.SelectedValue = dr["ltype"].ToString();

            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        cmd = con.CreateCommand();
        con.Open();
        cmd.CommandText = "update  tbl_medors_lead_master set  title ='" + txttitle.Text.Trim() + "',fname='" + txtfname.Text.Trim() + "',lname='" + txtlname.Text.Trim() + "',address='" + txtaddress.Text.Trim() + "',city='" + txttown.Text.Trim() + "',postcode='" + txtpostcode.Text.Trim() + "',email_id='" + txtemail.Text.Trim() + "',phone='" + txtphone.Text.Trim() + "',mob='" + txtmobile.Text.Trim() + "',worka='" + txtwork.Text.Trim() + "',product='" + DropDownList1.SelectedValue + "',ctype='" + DropDownList2.SelectedValue + "',dsource='" + DropDownList3.SelectedValue + "' where lead_id='" + txtcno.Text.Trim() + "'";
        cmd.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Update Sucessfully');window.location='total_lead.aspx';", true);
    }
}