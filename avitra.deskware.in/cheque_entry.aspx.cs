using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class cheque_entry : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] == null && Session["type"] == null)
        {
            Response.Redirect("~/login.aspx");
        }
    }
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        if (rbntype.SelectedValue == "Dealer")
        {
            Response.Redirect("dealer_check_in.aspx");
        }
        else if (rbntype.SelectedValue != "Dealer")
        {
            ClientScript.RegisterStartupScript(this.Page.GetType(), "", "window.open('add_cash_entry.aspx?type=" + rbntype.SelectedValue + "','Graph','height=724px,width=900px,scrollbars=1' );", true);
        }

    }
}