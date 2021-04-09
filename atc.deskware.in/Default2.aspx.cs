using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Default2 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.GetCustomers();
        }
    }

    protected void Print(object sender, EventArgs e)
    {
        dlCustomers.RepeatColumns = 1;
        this.ClientScript.RegisterStartupScript(this.GetType(), "Print", "Print()", true);
    }

    private void GetCustomers()
    {
        string constring = ConfigurationManager.ConnectionStrings["connect"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constring))
        {
            using (SqlCommand cmd = new SqlCommand("SELECT TOP 15  * from tbl_challan_details_master", con))
            {
                cmd.CommandType = CommandType.Text;
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);
                dlCustomers.DataSource = dt;
                dlCustomers.DataBind();
            }
        }
    }
}