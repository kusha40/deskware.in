using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class quotation_pdf : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
    SqlCommand cmd;
    Class1 cls = new Class1();
    SqlDataAdapter adap; DataTable dt;
    DataSet ds;
    string q_no, path = "";
    string order_no, lead_id, name, mob, email, product, gtotal, advance, balance = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null)
            {
                q_no = Request.QueryString["id"].ToString();
                string query6 = "select * from tbl_quotation_details where order_no='" + q_no + "' ";
                SqlCommand cmd6 = new SqlCommand(query6, con);
                SqlDataAdapter adap6 = new SqlDataAdapter(cmd6);
                DataTable dt6 = new DataTable();
                adap6.Fill(dt6);
                ReportDocument rpt = new ReportDocument();
                rpt.Load(Server.MapPath("quotation.rpt"));
                rpt.SetDataSource(dt6);
                CrystalReportViewer1.ReportSource = rpt;
                CrystalReportViewer1.DataBind();
                CrystalReportViewer1.RefreshReport();
                // rpt.SetDatabaseLogon("db_indusuno", "Wqp0h~32", "182.50.133.109", "db_indusuno");
                string PDFFile = Server.MapPath("Quotation/" + q_no + "-" + DateTime.Now.ToString("dd.MM.yy-hh.mm.ss.tt") + ".pdf");
                path = "Quotation/" + q_no + "-" + DateTime.Now.ToString("dd.MM.yy-hh.mm.ss.tt") + ".pdf";
                rpt.ExportToDisk(ExportFormatType.PortableDocFormat, PDFFile);

                //string order_no, lead_id, name, mob, email, product, gtotal, advance, balance = "";
                string query1 = "select * from tbl_quotation_details where order_no='" + q_no + "'";
                SqlCommand cmd1 = new SqlCommand(query1, con);
                SqlDataAdapter adap1 = new SqlDataAdapter(cmd1);
                DataTable dt1 = new DataTable();
                adap1.Fill(dt1);
                if (dt1.Rows.Count != 0)
                {
                    DataRow dr1 = dt1.Rows[0];
                    lead_id = dr1["lead_id"].ToString();
                    name = dr1["name"].ToString();
                    mob = dr1["mob"].ToString();
                    email = dr1["emailid"].ToString();
                    product = dr1["pname"].ToString();
                    gtotal = dr1["grand_total"].ToString();
                    advance = dr1["advance"].ToString();
                    balance = dr1["balance"].ToString();
                }

                //save Quotation//
                SqlCommand cmd5 = con.CreateCommand();
                con.Open();
                cmd5.CommandText = "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:40:00';declare @date DATETIME;set @date=(SELECT (@d + CAST(@t AS datetime))) insert into tbl_quotation_history values('" + q_no + "','" + lead_id + "','" + name + "','" + mob + "','" + email + "','" + product + "','" + gtotal + "','" + advance + "','" + balance + "','" + Session["Username"].ToString() + "',@date,'" + path + "')";
                cmd5.ExecuteNonQuery();
                con.Close();

                sendmail();
                rpt.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "Quotation");
                Response.End();
            }
        }
    }

    string s_smtp, s_email, s_pwd, user_email_id = "";
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
        message.To.Add(email);
        message.CC.Add(user_email_id);
        message.Subject = "Medors Quotation";
        msg = "<table cellpadding='5' cellspacing='0' style='border:solid #DDDDDD 1.0pt;width: 100.0%;'><tr > <td style='width: 100.0%; border: none; border-bottom: solid #76c04E 2.25pt; padding: 3.75pt 7.5pt 3.75pt 7.5pt; height: 45.0pt;' width='100%'><img src='http://medors.in/logo.png' border='0' alt='VH' width='100' height='40' /></td> </tr>  <tr>  <td>  <p>    <span style='font-size: 10.0pt; font-family: Tahoma'>Dear " + name + ",<br /> <br /> Thanks for your Order!!!<br />As per your Interest, we now attach the Quotation,</span> <p style='font-size: 10.0pt; font-family: Tahoma'><b>Download links:</b></p><p style='font-size: 10.0pt; font-family: Tahoma'>1. <a href='http://medors.in/c/cat.pdf' target='_blank'>Catalogue</a></p>  <p style='font-size: 10.0pt; font-family: Tahoma'>2. <a href='http://medors.in/c/on.pdf' target='_blank'>On Grid Rooftop</a></p> <p style='font-size: 10.0pt; font-family: Tahoma'>3. <a href='http://medors.in/c/aswh.pdf' target='_blank'>Adv.SWH</a></p><p style='font-size: 10.0pt; font-family: Tahoma'>4. <a href='http://wh.medors.in' target='_blank'>Differentiate in between Advance Solar Water Heater &amp; Solar Water Heater</a></p> <p style='font-size: 10.0pt; font-family: Tahoma'>5. <a href='http://hp.medors.in' target='_blank'>Differentiate in between Heat Pump &amp; Advance Solar Water Heater</a></p><p style='font-size: 10.0pt; font-family: Tahoma'><b>Presentation links:</b></p><p style='font-size: 10.0pt; font-family: Tahoma'>1. <a href='http://www.slideshare.net/medors/advance-solar-water-heater-63761901' target='_blank'>Presentation 1</a></p><p style='font-size: 10.0pt; font-family: Tahoma'>2. <a href='http://www.slideshare.net/medors/grid-connected-solar-rooftop/4' target='_blank'>Presentation 2</a></p><p style='font-size: 10.0pt; font-family: Tahoma'><b>Standard Trade Terms &amp; Conditions</b></p>          <p style='font-size: 10.0pt; font-family: Tahoma'><a href='http://medors.in/sts.pdf' target='_blank'>Terms &amp; Conditions</a></p> <p style='font-size: 10.0pt; font-family: Tahoma'>For any further query, please contact us on <b>1800 120 2347</b></p><p  style='line-height: 13.5pt;'><span style='font-size: 10.0pt; font-family: Tahoma'>With Our Best,<span style='font-size: 10.0pt; font-family:Tahoma'><br /> Team Medors</span></p> </p></td></tr></table>";
        message.Body = msg;
        message.IsBodyHtml = true;
        message.From = new MailAddress(s_email);
        message.Attachments.Add(new Attachment(Request.PhysicalApplicationPath + path));
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