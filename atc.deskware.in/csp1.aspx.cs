using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class csp1 : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["val1"] == "FI")
        {
            Response.Redirect("Print_challan.aspx?id=" + Request.QueryString["id"] + "&val=" + Request.QueryString["val"] + "");
        }
        if (Request.QueryString["val1"] == "RI")
        {
            Response.Redirect("retrun_p2.aspx?id=" + Request.QueryString["id"] + "&val=" + Request.QueryString["val"] + "");
        }
        if (Request.QueryString["val1"] == "WM")
        {
            Response.Redirect("Print_challan.aspx?id=" + Request.QueryString["id"] + "&val=" + Request.QueryString["val"] + "");
        }
    }
}