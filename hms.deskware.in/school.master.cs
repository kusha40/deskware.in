using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class school : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["uid"] == null && Session["school_name"] == null)
        {
            Response.Redirect("~/schoollogin.aspx");
        }
        else
        {
            Label1.Text = Session["uid"].ToString();
            Label2.Text = Session["school_name"].ToString();
        }
    }
    protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
    {
        try
        {
            Session.Abandon();
            FormsAuthentication.SignOut();
            Response.Cache.SetCacheability(HttpCacheability.NoCache);
            Response.Buffer = true;
            Response.ExpiresAbsolute = DateTime.Now.AddDays(-1d);
            Response.Expires = -1000;
            Response.CacheControl = "no-cache";
            Response.Redirect("schoollogin.aspx", true);
        }
        catch (Exception er)
        {
            string test = er.Message.Replace("'", " ");
            Response.Write("<script>alert('" + test + "')</script>");
        }
    }
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("school_change_pwd.aspx");
    }
}
