using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_dealer_report : System.Web.UI.Page
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
            cls.gridbind(GridView1, "select * from ( select  (size+replace(c_name, ' ', ''))as size  ,(name)as Name , price from tbl_dealer_product_pricing )as source Pivot (  max([price]) for size  in([12x18Allient],[12x18exclusive],[12x18Murano],[12x18Pioneer],[12x18Specto],[12x18TILEX],[12x24Allient],[12x24Arido],[12x24Capsun],[12x24exclusive],[12x24Murano],[12x24Pioneer],[12x24Savitra],[2x2exclusive],[2x2Livanto],[2x2PREM],[2x2Senso],[2x2Veeta],[2x2veetadarkseries],[2x2Zed],[2x4blackberry],[2x4exclusive],[2x4HIGHGLOSSY],[2x4PREM],[2x4Veeta],[2x4Zed],[32x32PREM],[32x32Veeta]))as pvt");
        }

    }
    protected void Button2_Click(object sender, EventArgs e)
    {

        Response.Clear();
        Response.AddHeader("content-disposition", "attachment;filename=Report.xls");
        Response.Charset = "";
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = "application/vnd.xls";
        System.IO.StringWriter stringWrite = new System.IO.StringWriter();
        System.Web.UI.HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);
        GridView1.RenderControl(htmlWrite);
        Response.Write(stringWrite.ToString());
        Response.End();
    }
    public override void VerifyRenderingInServerForm(Control control)
    { }
}