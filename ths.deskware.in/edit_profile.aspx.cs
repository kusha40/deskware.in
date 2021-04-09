using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class edit_profile : System.Web.UI.Page
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
        else
        {
            if (!IsPostBack)
            {
                img.Src = Session["pic"].ToString();
                login_type();
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile)
        {
            string folder = Server.MapPath("");
            var newPath1 = DateTime.Now.ToString("yyyymmhhddMMss") + FileUpload1.PostedFile.FileName;
            FileUpload1.SaveAs(folder + "\\user_img\\" + newPath1);
            string path = "user_img/" + newPath1;
            Label1.Text = path;
            cmd = con.CreateCommand();
            con.Open();
            cmd.CommandText = " update user_master set name='" + txtname.Text.Trim() + "',contact_no='" + txtmob.Text.Trim() + "',email_id='" + txtemailid.Text.Trim() + "',designation='" + txtdesig.Text.Trim() + "',pic='" + Label1.Text.Trim() + "' where user_id='" + Session["Username"].ToString() + "'  ";
            cmd.ExecuteNonQuery();
            con.Close();

            div1.Visible = true;
            spn1.InnerText = "Profile Updated Successfully";
        }
        else
        {
            cmd = con.CreateCommand();
            con.Open();
            cmd.CommandText = " update user_master set name='" + txtname.Text.Trim() + "',contact_no='" + txtmob.Text.Trim() + "',email_id='" + txtemailid.Text.Trim() + "',designation='" + txtdesig.Text.Trim() + "',pic='" + Label1.Text.Trim() + "', location='"+txtbaselocation.Text.Trim()+"' where user_id='" + Session["Username"].ToString() + "'  ";
            cmd.ExecuteNonQuery();
            con.Close();

            div1.Visible = true;
            spn1.InnerText = "Profile Updated Successfully";
        }
    }

    public void login_type()
    {
        string command = "";
        command = "select * from user_master where user_id='" + Session["Username"].ToString() + "' ";
        SqlDataAdapter adap = new SqlDataAdapter(command, con);
        DataSet ds = new DataSet();
        adap.Fill(ds);
        if (ds.Tables[0].Rows.Count != 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];
            txtuid.Text = dr["user_id"].ToString();
            txtname.Text = dr["name"].ToString();
            txtmob.Text = dr["contact_no"].ToString();
            txtemailid.Text = dr["email_id"].ToString();
            txtpwd.Text = dr["password"].ToString();
            txtdesig.Text = dr["designation"].ToString();
            Label1.Text = dr["pic"].ToString();
                            txtbaselocation.Text = dr["location"].ToString();
          
        }
    }
}