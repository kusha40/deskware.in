using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Default : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Username"].ToString() == "satish-pat")
            {
                Button1.Visible = Button2.Visible = false;
            }
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
     
            commd = "delete FROM tbl_dealer_product_pricing";
      

        SqlCommand cmd1 = con.CreateCommand();
        con.Open();
        cmd1.CommandText = commd;
        cmd1.ExecuteNonQuery();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Deleted Sucessfully');", true);
        con.Close();

       // ClientScript.RegisterStartupScript(this.Page.GetType(), "", "window.open('../delete_ledger_entry.aspx?id=''&typ=alldealer','Graph','height=724px,width=900px,scrollbars=1' );", true);
    }
    string commd = "";
    protected void Button2_Click(object sender, EventArgs e)
    {
      
      
            commd = "delete FROM tbl_salesman_commission_pricing";
     

        SqlCommand cmd1 = con.CreateCommand();
        con.Open();
        cmd1.CommandText = commd;
        cmd1.ExecuteNonQuery();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Deleted Sucessfully');", true);
        con.Close();
       // ClientScript.RegisterStartupScript(this.Page.GetType(), "", "window.open('delete_ledger_entry.aspx?id=''&typ=allsalesman','Graph','height=724px,width=900px,scrollbars=1' );", true);

    }
}