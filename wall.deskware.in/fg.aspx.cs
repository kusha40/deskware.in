using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class fg : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
    SqlCommand cmd;
    Class1 cls = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text == "11607")
        {
            cls.gridbind(GridView1, "select * from user_master order by name asc");
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Invalid Code');", true);
            TextBox1.Text = string.Empty;
        }
    }
}