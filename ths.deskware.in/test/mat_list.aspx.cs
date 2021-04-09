using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class mat_list : System.Web.UI.Page
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
            cls.gridbind(GridView1, "select max(date)as date,max(dealer_id)as dealer_id,max(dealer_name)as dealer_name,max(challan_no)as challan_no,max(id)as id from tbl_challan_details_master where balance='0' and mchk='0' and dealer_name!='Cash' group by challan_no ");
        }

    }
}