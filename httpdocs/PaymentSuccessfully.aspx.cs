using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PaymentSuccessfully : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["status"] == "sucess")
            {
                Response.Write("Your Transaction is done Sucessufully");
            }
            if (Request.QueryString["status"] == "failure")
            {
                Response.Write("Your Transaction is  Failre");
            }
            
            
        }
    }
}