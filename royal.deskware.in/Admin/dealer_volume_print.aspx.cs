using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_dealer_volume_print : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        ClientScript.RegisterStartupScript(this.Page.GetType(), "", "window.open('print_all.aspx?df=" + txtfdate.Text.Trim() + "&dt=" + txttdate.Text.Trim() + "','Graph','height=724px,width=900px,scrollbars=1' );", true);
    }
}