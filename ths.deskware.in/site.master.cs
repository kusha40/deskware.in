using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class site : System.Web.UI.MasterPage
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
        else
        {
            usrname.InnerText = Session["Username"].ToString();
            desig.InnerText =  Session["designation"].ToString();
            img.Src = Session["pic"].ToString();
            if (Session["type"].ToString() == "Administrator" || Session["type"].ToString() == "Accounts")
            {
              //  Li1.Visible = true;
            }
            loginRole();


            string thisURL = this.Page.GetType().Name.ToString();
            switch (thisURL)
            {
                //case "dashboard_aspx":
                //    Dashboard.Attributes.Add("class", "active");
                //    break;
                //case "add_new_sale_aspx":
                //    CreateNewInstitue.Attributes.Add("class", "active");
                //     break;
                //case "update_sale_aspx":
                //    CreateNewInstitue.Attributes.Add("class", "active");
                //    break;
                //case "edit_sale_aspx":
                //    CreateNewInstitue.Attributes.Add("class", "active");
                //    break;
               

               
                //case "create_account_aspx":
                //    li1.Attributes.Add("class", "active");
                //    break;
                //case "knowledge_base_aspx":
                //    knowledge_base.Attributes.Add("class", "active");
                //    break;
              
                //case "upload_document_aspx":
                //    li1.Attributes.Add("class", "active");
                //    break;

                //case "create_product_aspx":
                //    li1.Attributes.Add("class", "active");
                //    break;
                //case "create_promocode_aspx":
                //    li1.Attributes.Add("class", "active");
                //    break;
                //case "terms_condition_aspx":
                //    li1.Attributes.Add("class", "active");
                //    break;



                //case "sale_report_aspx":
                //    report_mis.Attributes.Add("class", "active");
                //    break;
              
            }

           


        }
    }
    void loginRole()
    {
        if (con.State == ConnectionState.Closed)
        {
            con.Open();
        }
        SqlCommand cmd = new SqlCommand("SELECT * FROM tbl_user_role where uid='" + Session["Username"].ToString() + "'", con);
        SqlDataReader rdr = cmd.ExecuteReader();
        while (rdr.Read())
        {
            //Dashboard
            if (rdr["Dashboard"].ToString() == "1")
            {
                lblm1.Visible = true;
            }
            else
            {
                lblm1.Visible = false;
            }
            //Marketing
            if (rdr["Leads"].ToString() == "2")
            {
                lblm2.Visible = true;
            }
            else
            {
                lblm2.Visible = false;
            }
            //Enquiryform
            if (rdr["CreateNewLead"].ToString() == "3")
            {
                lblm3.Visible = true;
            }
            else
            {
                lblm3.Visible = false;
            }
            //TotalCustomer
            if (rdr["TotalLead"].ToString() == "4")
            {
                lblm4.Visible = true;
            }
            else
            {
                lblm4.Visible = false;
            }
            //SearchCustomer
            if (rdr["TodayFollowup"].ToString() == "5")
            {
                lblm5.Visible = true;
            }
            else
            {
                lblm5.Visible = false;
            }
            //AssignCustomerLeads
            if (rdr["PendingFollowup"].ToString() == "6")
            {
                lblm6.Visible = true;
            }
            else
            {
                lblm6.Visible = false;
            }
            //Masters
            if (rdr["FutureFollowup"].ToString() == "7")
            {
                lblm7.Visible = true;
            }
            else
            {
                lblm7.Visible = false;
            }

            if (rdr["Meetings"].ToString() == "8")
            {
                lblm8.Visible = true;
            }
            else
            {
                lblm8.Visible = false;
            }

            if (rdr["TotalMeetings"].ToString() == "9")
            {
                lblm9.Visible = true;
            }
            else
            {
                lblm9.Visible = false;
            }

            if (rdr["TodayMeetings"].ToString() == "10")
            {

                lblm10.Visible = true;
            }
            else
            {
                lblm10.Visible = false;
            }

            if (rdr["PendingMeetings"].ToString() == "11")
            {

                lblm11.Visible = true;
            }
            else
            {
                lblm11.Visible = false;
            }
            if (rdr["FutureMeetings"].ToString() == "12")
            {
                lblm12.Visible = true;
            }
            else
            {
                lblm12.Visible = false;
            }

            if (rdr["KnowldgeBase"].ToString() == "13")
            {
                lblm13.Visible = true;
            }
            else
            {
                lblm13.Visible = false;
            }
            //Lead garph
            if (rdr["Download"].ToString() == "14")
            {
                lblm14.Visible = true;
            }
            else
            {
                lblm14.Visible = false;
            }
            //Analytical garph
            if (rdr["Masters"].ToString() == "15")
            {
                lblm15.Visible = true;
            }
            else
            {
                lblm15.Visible = false;
            }
            if (rdr["CreateUserAccount"].ToString() == "16")
            {
                lblm16.Visible = true;
            }
            else
            {
                lblm16.Visible = false;
            }
            if (rdr["CreateLeadType"].ToString() == "17")
            {
                lblm17.Visible = true;
            }
            else
            {
                lblm17.Visible = false;
            }
            if (rdr["CreateLeadSource"].ToString() == "18")
            {
                lblm18.Visible = true;
            }
            else
            {
                lblm18.Visible = false;
            }
            if (rdr["CreateProduct"].ToString() == "19")
            {
                lblm19.Visible = true;
            }
            else
            {
                lblm19.Visible = false;
            }
            if (rdr["UploadDocument"].ToString() == "20")
            {
                lblm20.Visible = true;
            }
            else
            {
                lblm20.Visible = false;
            }
            if (rdr["ProductTerms"].ToString() == "21")
            {
                lblm21.Visible = true;
            }
            else
            {
                lblm21.Visible = false;
            }
            if (rdr["CreateTeam"].ToString() == "22")
            {
                lblm22.Visible = true;
            }
            else
            {
                lblm22.Visible = false;
            }
            if (rdr["MyTeam"].ToString() == "23")
            {
                lblm23.Visible = true;
            }
            else
            {
                lblm23.Visible = false;
            }
            if (rdr["SMTP"].ToString() == "24")
            {
                lblm24.Visible = true;
            }
            else
            {
                lblm24.Visible = false;
            }
            if (rdr["PaymentTerms"].ToString() == "25")
            {
                lblm25.Visible = true;
            }
            else
            {
                lblm25.Visible = false;
            }

            if (rdr["CreateUserRole"].ToString() == "26")
            {
                lblm26.Visible = true;
            }
            else
            {
                lblm26.Visible = false;
            }

            if (rdr["Order_"].ToString() == "27")
            {
              //  lblm27.Visible = true;
            }
            else
            {
               // lblm27.Visible = false;
            }
            if (rdr["GenerateOrder"].ToString() == "28")
            {
                lblm28.Visible = true;
            }
            else
            {
                lblm28.Visible = false;
            }
            if (rdr["ViewAllOrder"].ToString() == "29")
            {
                lblm29.Visible = true;
            }
            else
            {
                lblm29.Visible = false;
            }
            if (rdr["Quotation"].ToString() == "30")
            {
               // lblm30.Visible = true;
            }
            else
            {
               // lblm30.Visible = false;
            }
            if (rdr["GenerateQuotation"].ToString() == "31")
            {
                lblm31.Visible = true;
            }
            else
            {
                lblm31.Visible = false;
            }
            if (rdr["ViewAllQuotation"].ToString() == "32")
            {
                lblm32.Visible = true;
            }
            else
            {
                lblm32.Visible = false;
            }
            if (rdr["Reports"].ToString() == "33")
            {
               // lblm33.Visible = true;
            }
            else
            {
               // lblm33.Visible = false;
            }
            if (rdr["LeadWorkReport"].ToString() == "34")
            {
                lblm34.Visible = true;
            }
            else
            {
                lblm34.Visible = false;
            }
            if (rdr["MeetingWorkReport"].ToString() == "35")
            {
                lblm35.Visible = true;
            }
            else
            {
                lblm35.Visible = false;
            }
            if (rdr["AssignLeads"].ToString() == "36")
            {
                lblm36.Visible = true;
            }
            else
            {
                lblm36.Visible = false;
            }
            if (rdr["Feedback"].ToString() == "37")
            {
               // lblm37.Visible = true;
            }
            else
            {
               // lblm37.Visible = false;
            }
            if (rdr["AddFeedback"].ToString() == "38")
            {
                lblm38.Visible = true;
            }
            else
            {
                lblm38.Visible = false;
            }
            if (rdr["FeedbackReport"].ToString() == "39")
            {
                lblm39.Visible = true;
            }
            else
            {
                lblm39.Visible = false;
            }
            
        }
        rdr.Close();
        con.Close();
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
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
            Response.Redirect("login.aspx", true);
        }
        catch (Exception er)
        {
            string test = er.Message.Replace("'", " ");
            Response.Write("<script>alert('" + test + "')</script>");
        }
    }
    }

