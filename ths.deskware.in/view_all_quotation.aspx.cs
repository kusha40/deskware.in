using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class view_all_quotation : System.Web.UI.Page
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
            if (Session["type"].ToString() == "Administrator")
            {
                cls.gridbind(GridView1, "Select * from tbl_quotation_history  order by date desc");
            }
            else
            {
                cls.gridbind(GridView1, "Select * from tbl_quotation_history where  created_by in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "')   order by date desc");
            }
        }

    }
    [WebMethod(EnableSession = true)]
    public static List<string> GetAutoCompleteData1(string username, string flag)
    {
        string st = flag;
        string commnd = "";
        string type = (string)HttpContext.Current.Session["type"];
        string name = (string)HttpContext.Current.Session["Username"];
        List<string> result = new List<string>();
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
        if (type == "User")
        {
            commnd = "select distinct (lead_id+' ~ '+name+' ~ '+mobno+' ~ '+product) as Test from [tbl_medors_lead_master] where  (lead_id+' ~ '+name+' ~ '+mobno+' ~ '+product ) like '%'+@SearchText+'%'  and (assign_to in (select uid from tbl_team where aid='" + name + "'))    ";
        }
        //else if (type == "Manager")
        //{
        //    commnd = "select (customer_id+' ~ '+customer_name+' ~ '+mob_no+' ~ '+email_id+' ~ '+requirement+' ~ '+state+' ~ '+created_by+' ~ '+district) as Test from [enquiry_master] where  (customer_id+' ~ '+customer_name+' ~ '+mob_no+' ~ '+email_id+' ~ '+requirement+' ~ '+state+' ~ '+created_by+' ~ '+district) like '%'+@SearchText+'%' and (manager='" + name + "' or created_by='" + name + "' or assigned_by='" + name + "')   ";
        //}
        else if (type == "Administrator")
        {
            commnd = "select distinct (lead_id+' ~ '+name+' ~ '+mobno+' ~ '+product) as Test from [tbl_medors_lead_master] where  (lead_id+' ~ '+name+' ~ '+mobno+' ~ '+product) like '%'+@SearchText+'%'   ";
        }
        using (SqlCommand cmd = new SqlCommand(commnd, con))
        {
            con.Open();
            cmd.Parameters.AddWithValue("@SearchText", username);
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                result.Add(dr["Test"].ToString());
            }
            if (result.Count > 0)
            {
                return result;
            }
            else
            {
                result.Add("No Record Found");
                return result;
            }
        }

    }
    protected void btnview2_Click(object sender, EventArgs e)
    {
        try
        {
            string[] arr_search = new string[4];
            arr_search = txtMenuTitle.Text.Split('~');
            SqlDataAdapter adap = new SqlDataAdapter("select * from tbl_medors_lead_master where lead_id='" + arr_search[0].Trim() + "' ", con);
            DataSet ds = new DataSet();
            adap.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                cls.gridbind(GridView1, "Select * from tbl_quotation_history where lead_id='" + arr_search[0].Trim() + "'  order by date desc");

            }
        }

        catch (Exception er)
        {
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        if (Session["type"].ToString() == "Administrator")
        {
            cls.gridbind(GridView1, "Select * from tbl_quotation_history  order by date desc");
        }
        else
        {
            cls.gridbind(GridView1, "Select * from tbl_quotation_history where  created_by in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "')   order by date desc");
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        GridView1.AllowPaging = false;
        if (Session["type"].ToString() == "Administrator")
        {
            cls.gridbind(GridView1, "Select * from tbl_quotation_history  order by date desc");
        }
        else
        {
            cls.gridbind(GridView1, "Select * from tbl_quotation_history where  created_by in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "')   order by date desc");
        }
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
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        con.Open();
        SqlCommand cmd = new SqlCommand("delete FROM tbl_quotation_history where id='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Deleted Sucessfully');", true);
        if (Session["type"].ToString() == "Administrator")
        {
            cls.gridbind(GridView1, "Select * from tbl_quotation_history  order by date desc");
        }
        else
        {
            cls.gridbind(GridView1, "Select * from tbl_quotation_history where  created_by in (select uid from tbl_team where aid='" + Session["Username"].ToString() + "')   order by date desc");
        }
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "email")
        {

            GridViewRow row = (GridViewRow)(((ImageButton)e.CommandSource).NamingContainer);
            Label path = (Label)row.FindControl("Label1");
            Label name = (Label)row.FindControl("Label2");
            Label email = (Label)row.FindControl("Label3");

            path1 = path.Text;
            name1 = name.Text;
            email1 = email.Text;

            sendmail();
        }


    }
    string s_smtp, s_email, s_pwd, user_email_id, path1, name1, email1 = "";
    public void smtp()
    {
        string query2 = "select * from tbl_smtp_master ";
        SqlCommand cmd2 = new SqlCommand(query2, con);
        SqlDataAdapter adap2 = new SqlDataAdapter(cmd2);
        DataTable dt2 = new DataTable();
        adap2.Fill(dt2);
        if (dt2.Rows.Count != 0)
        {
            DataRow dr2 = dt2.Rows[0];
            s_smtp = dr2["smtp"].ToString();
            s_email = dr2["email"].ToString();
            s_pwd = dr2["pwd"].ToString();
        }
    }
    public void User_email()
    {
        string query3 = "select email_id from user_master where  user_id='" + Session["Username"].ToString() + "' ";
        SqlCommand cmd3 = new SqlCommand(query3, con);
        SqlDataAdapter adap3 = new SqlDataAdapter(cmd3);
        DataTable dt3 = new DataTable();
        adap3.Fill(dt3);
        if (dt3.Rows.Count != 0)
        {
            DataRow dr3 = dt3.Rows[0];
            user_email_id = dr3["email_id"].ToString();
        }
    }
    public void sendmail()
    {
        User_email();
        smtp();
        string msg = "";
        MailMessage message = new MailMessage();
        message.To.Add(email1);
        message.CC.Add(user_email_id);
        message.Subject = "Medors Quotation";
        msg = "<table cellpadding='5' cellspacing='0' style='border:solid #DDDDDD 1.0pt;width: 100.0%;'><tr > <td style='width: 100.0%; border: none; border-bottom: solid #76c04E 2.25pt; padding: 3.75pt 7.5pt 3.75pt 7.5pt; height: 45.0pt;' width='100%'><img src='http://medors.in/logo.png' border='0' alt='VH' width='100' height='40' /></td> </tr>  <tr>  <td>  <p>    <span style='font-size: 10.0pt; font-family: Tahoma'>Dear " + name1 + ",<br /> <br /> Thanks for your Order!!!<br />As per your Interest, we now attach the Quotation,</span> <p style='font-size: 10.0pt; font-family: Tahoma'><b>Download links:</b></p><p style='font-size: 10.0pt; font-family: Tahoma'>1. <a href='http://medors.in/c/cat.pdf' target='_blank'>Catalogue</a></p>  <p style='font-size: 10.0pt; font-family: Tahoma'>2. <a href='http://medors.in/c/on.pdf' target='_blank'>On Grid Rooftop</a></p> <p style='font-size: 10.0pt; font-family: Tahoma'>3. <a href='http://medors.in/c/aswh.pdf' target='_blank'>Adv.SWH</a></p><p style='font-size: 10.0pt; font-family: Tahoma'>4. <a href='http://wh.medors.in' target='_blank'>Differentiate in between Advance Solar Water Heater &amp; Solar Water Heater</a></p> <p style='font-size: 10.0pt; font-family: Tahoma'>5. <a href='http://hp.medors.in' target='_blank'>Differentiate in between Heat Pump &amp; Advance Solar Water Heater</a></p><p style='font-size: 10.0pt; font-family: Tahoma'><b>Presentation links:</b></p><p style='font-size: 10.0pt; font-family: Tahoma'>1. <a href='http://www.slideshare.net/medors/advance-solar-water-heater-63761901' target='_blank'>Presentation 1</a></p><p style='font-size: 10.0pt; font-family: Tahoma'>2. <a href='http://www.slideshare.net/medors/grid-connected-solar-rooftop/4' target='_blank'>Presentation 2</a></p><p style='font-size: 10.0pt; font-family: Tahoma'><b>Standard Trade Terms &amp; Conditions</b></p>          <p style='font-size: 10.0pt; font-family: Tahoma'><a href='http://medors.in/sts.pdf' target='_blank'>Terms &amp; Conditions</a></p> <p style='font-size: 10.0pt; font-family: Tahoma'>For any further query, please contact us on <b>1800 120 2347</b></p><p  style='line-height: 13.5pt;'><span style='font-size: 10.0pt; font-family: Tahoma'>With Our Best,<span style='font-size: 10.0pt; font-family:Tahoma'><br /> Team Medors</span></p> </p></td></tr></table>";
        message.Body = msg;
        message.IsBodyHtml = true;
        message.From = new MailAddress(s_email);
        message.Attachments.Add(new Attachment(Request.PhysicalApplicationPath + path1));
        SmtpClient emailClient = new SmtpClient(s_smtp);
        emailClient.Port = 587;
        System.Net.NetworkCredential SMTPUserInfo = new System.Net.NetworkCredential(s_email, s_pwd);
        emailClient.EnableSsl = true;
        emailClient.UseDefaultCredentials = true;
        emailClient.Credentials = SMTPUserInfo;
        emailClient.Send(message);
        Response.Write("<script language=javascript>alert('Mail Sent Sucessfully');</script>");

    }
}