using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_role : System.Web.UI.Page
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
            cls.bind_ddl(ddlSelectUser, "select user_id,name from user_master order by name asc", "name", "user_id");
            ddlSelectUser.Items.Insert(0, "Select");

            _bindcheckBox();
        }

    }
    private void _bindcheckBox()
    {
        cls.bind_chklist(checkSelectMenu, "SELECT ID,SubMenu FROM tbl_submenu where SubMenu!=''", "SubMenu", "ID");
        
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        for (int items = 0; items < checkSelectMenu.Items.Count; items++)
        {
            checkSelectMenu.ClearSelection();
        }

        cmd = con.CreateCommand();
        con.Open();
        cmd.CommandText = "select ([Dashboard]+','+      [Leads]+','+      [CreateNewLead]+','+      [TotalLead]+','+      [TodayFollowup]+','+      [PendingFollowup]+','+      [FutureFollowup]+','+     [Meetings]+','+      [TotalMeetings]+','+      [TodayMeetings]+','+      [PendingMeetings]+','+      [FutureMeetings]+','+      [KnowldgeBase]+','+      [Download]+','+      [Masters]+','+      [CreateUserAccount]+','+      [CreateLeadType]+','+      [CreateLeadSource]+','+      [CreateProduct]+','+      [UploadDocument]+','+      [ProductTerms]+','+      [CreateTeam]+','+      [MyTeam]+','+      [SMTP]+','+      [PaymentTerms]+','+      [CreateUserRole]+','+      [Order_]+','+      [GenerateOrder]+','+      [ViewAllOrder]+','+      [Quotation]+','+      [GenerateQuotation]+','+      [ViewAllQuotation]+','+      [Reports]+','+      [LeadWorkReport]+','+      [MeetingWorkReport]+','+      [AssignLeads]+','+      [Feedback]+','+      [AddFeedback]+','+      [FeedbackReport]) as list from tbl_user_role where uid='" + ddlSelectUser.SelectedValue + "'";
        string selectedColors = cmd.ExecuteScalar().ToString();
        con.Close();
        //  string selectedColors = "1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,";
        foreach (ListItem item in checkSelectMenu.Items)
        {
            if (selectedColors.Contains(item.Value))
            {
                item.Selected = true;
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        CheckDashboard();
    }
    void SetBlank(ref string data)
    {
        if (data == "")
        {
            //data = "0";
        }
    }
    void CheckDashboard()
    {

        string strDashboard = "", strLeads = "", strCreateNewLead = "", strTotalLead = "", strTodayFollowup = "", strPendingFollowup = "", strFutureFollowup = "", strMeetings = "", strTotalMeetings = "", strTodayMeetings = "", strPendingMeetings = "", strFutureMeetings = "", strKnowldgeBase = "", strDownload = "", strMasters = "", strCreateUserAccount = "", strCreateLeadType = "", strCreateLeadSource = "", strCreateProduct = "", strUploadDocument = "", strProductTerms = "", strCreateTeam = "", strMyTeam = "", strSMTP = "", strPaymentTerms = "", strCreateUserRole = "", strOrder_ = "", strGenerateOrder = "", strViewAllOrder = "", strQuotation = "", strGenerateQuotation = "", strViewAllQuotation = "", strReports = "", strLeadWorkReport = "", strMeetingWorkReport = "", strAssignLeads = "", strFeedback = "", strAddFeedback = "", strFeedbackReport = "";
        foreach (ListItem item in checkSelectMenu.Items)
        {
            if (item.Selected == true)
            {
                if (item.Value == "1")
                {
                    strDashboard = item.Value;
                }
                else if (item.Value == "2")
                {
                    strLeads = item.Value;
                }
                else if (item.Value == "3")
                {
                    strCreateNewLead = item.Value;
                }
                else if (item.Value == "4")
                {
                    strTotalLead = item.Value;
                }
                else if (item.Value == "5")
                {
                    strTodayFollowup = item.Value;
                }
                else if (item.Value == "6")
                {
                    strPendingFollowup = item.Value;
                }
                else if (item.Value == "7")
                {
                    strFutureFollowup = item.Value;
                }
                else if (item.Value == "8")
                {
                    strMeetings = item.Value;
                }
                else if (item.Value == "9")
                {
                    strTotalMeetings = item.Value;
                }
                else if (item.Value == "10")
                {
                    strTodayMeetings = item.Value;
                }
                else if (item.Value == "11")
                {
                    strPendingMeetings = item.Value;
                }
                else if (item.Value == "12")
                {
                    strFutureMeetings = item.Value;
                }
                else if (item.Value == "13")
                {
                    strKnowldgeBase = item.Value;
                }
                else if (item.Value == "14")
                {
                    strDownload = item.Value;
                }
                else if (item.Value == "15")
                {
                    strMasters = item.Value;
                }
                else if (item.Value == "16")
                {
                    strCreateUserAccount = item.Value;
                }
                else if (item.Value == "17")
                {
                    strCreateLeadType = item.Value;
                }
                else if (item.Value == "18")
                {
                    strCreateLeadSource = item.Value;
                }
                else if (item.Value == "19")
                {
                    strCreateProduct = item.Value;
                }
                else if (item.Value == "20")
                {
                    strUploadDocument = item.Value;
                }
                else if (item.Value == "21")
                {
                    strProductTerms = item.Value;
                }
                else if (item.Value == "22")
                {
                    strCreateTeam = item.Value;
                }
                else if (item.Value == "23")
                {
                    strMyTeam = item.Value;
                }
                else if (item.Value == "24")
                {
                    strSMTP = item.Value;
                }
                else if (item.Value == "25")
                {
                    strPaymentTerms = item.Value;
                }
                else if (item.Value == "26")
                {
                    strCreateUserRole = item.Value;
                }
                else if (item.Value == "27")
                {
                    strOrder_ = item.Value;
                }
                else if (item.Value == "28")
                {
                    strGenerateOrder = item.Value;
                }
                else if (item.Value == "29")
                {
                    strViewAllOrder = item.Value;
                }
                else if (item.Value == "30")
                {
                    strQuotation = item.Value;
                }
                else if (item.Value == "31")
                {
                    strGenerateQuotation = item.Value;
                }
                else if (item.Value == "32")
                {
                    strViewAllQuotation = item.Value;
                }
                else if (item.Value == "33")
                {
                    strReports = item.Value;
                }
                else if (item.Value == "34")
                {
                    strLeadWorkReport = item.Value;
                }
                else if (item.Value == "35")
                {
                    strMeetingWorkReport = item.Value;
                }
                else if (item.Value == "36")
                {
                    strAssignLeads = item.Value;
                }
                else if (item.Value == "37")
                {
                    strFeedback = item.Value;
                }
                else if (item.Value == "38")
                {
                    strAddFeedback = item.Value;
                }
                else if (item.Value == "39")
                {
                    strFeedbackReport = item.Value;
                }

                
            }
        }

        SetBlank(ref strDashboard); SetBlank(ref strLeads); SetBlank(ref strCreateNewLead); SetBlank(ref strTotalLead); SetBlank(ref strTodayFollowup); SetBlank(ref strPendingFollowup);
        SetBlank(ref strFutureFollowup); SetBlank(ref strMeetings); SetBlank(ref strTotalMeetings); SetBlank(ref strTodayMeetings); SetBlank(ref strPendingMeetings);
        SetBlank(ref strFutureMeetings); SetBlank(ref strKnowldgeBase); SetBlank(ref strDownload);
        SetBlank(ref strMasters); SetBlank(ref strCreateUserAccount); SetBlank(ref strCreateLeadType); SetBlank(ref strCreateLeadSource); SetBlank(ref strCreateProduct); SetBlank(ref strUploadDocument); SetBlank(ref strProductTerms); SetBlank(ref strCreateTeam);
        SetBlank(ref strMyTeam); SetBlank(ref strSMTP); SetBlank(ref strPaymentTerms); SetBlank(ref strCreateUserRole);

        SetBlank(ref strOrder_); SetBlank(ref strGenerateOrder); SetBlank(ref strViewAllOrder); SetBlank(ref strQuotation);
        SetBlank(ref strGenerateQuotation); SetBlank(ref strViewAllQuotation); SetBlank(ref strReports); SetBlank(ref strLeadWorkReport);
        SetBlank(ref strMeetingWorkReport); SetBlank(ref strAssignLeads);
        SetBlank(ref strFeedback); SetBlank(ref strAddFeedback); SetBlank(ref strFeedbackReport); 

        con.Open();
        SqlCommand cmd = new SqlCommand("Select * from tbl_user_role where uid='" + ddlSelectUser.SelectedValue + "'", con);
        SqlDataReader dr = cmd.ExecuteReader();
        //conn.Close();
        if (dr.HasRows)
        {
            dr.Close();
            // Update command
            if (con.State == ConnectionState.Closed)
            {
                //conn.Open();
            }
            SqlCommand cmdMenu = new SqlCommand("update tbl_user_role set Dashboard=@Dashboard,Leads=@Leads,CreateNewLead=@CreateNewLead,TotalLead=@TotalLead,TodayFollowup=@TodayFollowup,PendingFollowup=@PendingFollowup,FutureFollowup=@FutureFollowup,Meetings=@Meetings,TotalMeetings=@TotalMeetings,TodayMeetings=@TodayMeetings,PendingMeetings=@PendingMeetings,FutureMeetings=@FutureMeetings,KnowldgeBase=@KnowldgeBase,Download=@Download,Masters=@Masters,CreateUserAccount=@CreateUserAccount,CreateLeadType=@CreateLeadType,CreateLeadSource=@CreateLeadSource,CreateProduct=@CreateProduct,UploadDocument=@UploadDocument,ProductTerms=@ProductTerms,CreateTeam=@CreateTeam,MyTeam=@MyTeam, SMTP=@SMTP,PaymentTerms=@PaymentTerms,CreateUserRole=@CreateUserRole,Order_=@Order_,GenerateOrder=@GenerateOrder,ViewAllOrder=@ViewAllOrder,Quotation=@Quotation,GenerateQuotation=@GenerateQuotation,ViewAllQuotation=@ViewAllQuotation,Reports=@Reports,LeadWorkReport=@LeadWorkReport,MeetingWorkReport=@MeetingWorkReport,AssignLeads=@AssignLeads ,Feedback=@Feedback,AddFeedback=@AddFeedback,FeedbackReport=@FeedbackReport where uid=@uid ", con);
            cmdMenu.Parameters.AddWithValue("@uid", ddlSelectUser.SelectedValue);
            cmdMenu.Parameters.AddWithValue("@Dashboard", strDashboard.ToString());
            cmdMenu.Parameters.AddWithValue("@Leads", strLeads.ToString());
            cmdMenu.Parameters.AddWithValue("@CreateNewLead", strCreateNewLead.ToString());
            cmdMenu.Parameters.AddWithValue("@TotalLead", strTotalLead.ToString());
            cmdMenu.Parameters.AddWithValue("@TodayFollowup", strTodayFollowup.ToString());
            cmdMenu.Parameters.AddWithValue("@PendingFollowup", strPendingFollowup.ToString());
            cmdMenu.Parameters.AddWithValue("@FutureFollowup", strFutureFollowup.ToString());
            cmdMenu.Parameters.AddWithValue("@Meetings", strMeetings.ToString());
            cmdMenu.Parameters.AddWithValue("@TotalMeetings", strTotalMeetings.ToString());
            cmdMenu.Parameters.AddWithValue("@TodayMeetings", strTodayMeetings.ToString());
            cmdMenu.Parameters.AddWithValue("@PendingMeetings", strPendingMeetings.ToString());
            cmdMenu.Parameters.AddWithValue("@FutureMeetings", strFutureMeetings.ToString());
            cmdMenu.Parameters.AddWithValue("@KnowldgeBase", strKnowldgeBase.ToString());
            cmdMenu.Parameters.AddWithValue("@Download", strDownload.ToString());
            cmdMenu.Parameters.AddWithValue("@Masters", strMasters.ToString());
            cmdMenu.Parameters.AddWithValue("@CreateUserAccount", strCreateUserAccount.ToString());
            cmdMenu.Parameters.AddWithValue("@CreateLeadType", strCreateLeadType.ToString());
            cmdMenu.Parameters.AddWithValue("@CreateLeadSource", strCreateLeadSource.ToString());
            cmdMenu.Parameters.AddWithValue("@CreateProduct", strCreateProduct.ToString());
            cmdMenu.Parameters.AddWithValue("@UploadDocument", strUploadDocument.ToString());
            cmdMenu.Parameters.AddWithValue("@ProductTerms", strProductTerms.ToString());
            cmdMenu.Parameters.AddWithValue("@CreateTeam", strCreateTeam.ToString());
            cmdMenu.Parameters.AddWithValue("@MyTeam", strMyTeam.ToString());
            cmdMenu.Parameters.AddWithValue("@SMTP", strSMTP.ToString());
            cmdMenu.Parameters.AddWithValue("@PaymentTerms", strPaymentTerms.ToString());
            cmdMenu.Parameters.AddWithValue("@CreateUserRole", strCreateUserRole.ToString());

            cmdMenu.Parameters.AddWithValue("@Order_", strOrder_.ToString());
            cmdMenu.Parameters.AddWithValue("@GenerateOrder", strGenerateOrder.ToString());
            cmdMenu.Parameters.AddWithValue("@ViewAllOrder", strViewAllOrder.ToString());
            cmdMenu.Parameters.AddWithValue("@Quotation", strQuotation.ToString());
            cmdMenu.Parameters.AddWithValue("@GenerateQuotation", strGenerateQuotation.ToString());
            cmdMenu.Parameters.AddWithValue("@ViewAllQuotation", strViewAllQuotation.ToString());
            cmdMenu.Parameters.AddWithValue("@Reports", strReports.ToString());
            cmdMenu.Parameters.AddWithValue("@LeadWorkReport", strLeadWorkReport.ToString());
            cmdMenu.Parameters.AddWithValue("@MeetingWorkReport", strMeetingWorkReport.ToString());
            cmdMenu.Parameters.AddWithValue("@AssignLeads", strAssignLeads.ToString());

            cmdMenu.Parameters.AddWithValue("@Feedback", strFeedback.ToString());
            cmdMenu.Parameters.AddWithValue("@AddFeedback", strAddFeedback.ToString());
            cmdMenu.Parameters.AddWithValue("@FeedbackReport", strFeedbackReport.ToString());

            cmdMenu.ExecuteNonQuery();
            cmdMenu.Dispose();
            con.Close();

            checkSelectMenu.Items.Clear();
            _bindcheckBox();
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Role Updated Successfully');", true);
        }
        else
        {
            dr.Close();
            //use insert command
            if (con.State == ConnectionState.Closed)
            {
                //conn.Open();
            }
            SqlCommand cmdMenu = new SqlCommand("Insert into tbl_user_role values (@uid,@Dashboard,@Leads,@CreateNewLead,@TotalLead,@TodayFollowup,@PendingFollowup,@FutureFollowup,@Meetings,@TotalMeetings,@TodayMeetings,@PendingMeetings,@FutureMeetings,@KnowldgeBase,@Download,@Masters,@CreateUserAccount,@CreateLeadType,@CreateLeadSource,@CreateProduct,@UploadDocument,@ProductTerms,@CreateTeam,@MyTeam,@SMTP,@PaymentTerms,@CreateUserRole,@Order_,@GenerateOrder,@ViewAllOrder,@Quotation,@GenerateQuotation,@ViewAllQuotation,@Reports,@LeadWorkReport,@MeetingWorkReport,@AssignLeads,@Feedback,@AddFeedback,@FeedbackReport)", con);
            cmdMenu.Parameters.AddWithValue("@uid", ddlSelectUser.SelectedValue);
            cmdMenu.Parameters.AddWithValue("@Dashboard", strDashboard.ToString());
            cmdMenu.Parameters.AddWithValue("@Leads", strLeads.ToString());
            cmdMenu.Parameters.AddWithValue("@CreateNewLead", strCreateNewLead.ToString());
            cmdMenu.Parameters.AddWithValue("@TotalLead", strTotalLead.ToString());
            cmdMenu.Parameters.AddWithValue("@TodayFollowup", strTodayFollowup.ToString());
            cmdMenu.Parameters.AddWithValue("@PendingFollowup", strPendingFollowup.ToString());
            cmdMenu.Parameters.AddWithValue("@FutureFollowup", strFutureFollowup.ToString());
            cmdMenu.Parameters.AddWithValue("@Meetings", strMeetings.ToString());
            cmdMenu.Parameters.AddWithValue("@TotalMeetings", strTotalMeetings.ToString());
            cmdMenu.Parameters.AddWithValue("@TodayMeetings", strTodayMeetings.ToString());
            cmdMenu.Parameters.AddWithValue("@PendingMeetings", strPendingMeetings.ToString());
            cmdMenu.Parameters.AddWithValue("@FutureMeetings", strFutureMeetings.ToString());
            cmdMenu.Parameters.AddWithValue("@KnowldgeBase", strKnowldgeBase.ToString());
            cmdMenu.Parameters.AddWithValue("@Download", strDownload.ToString());
            cmdMenu.Parameters.AddWithValue("@Masters", strMasters.ToString());
            cmdMenu.Parameters.AddWithValue("@CreateUserAccount", strCreateUserAccount.ToString());
            cmdMenu.Parameters.AddWithValue("@CreateLeadType", strCreateLeadType.ToString());
            cmdMenu.Parameters.AddWithValue("@CreateLeadSource", strCreateLeadSource.ToString());
            cmdMenu.Parameters.AddWithValue("@CreateProduct", strCreateProduct.ToString());
            cmdMenu.Parameters.AddWithValue("@UploadDocument", strUploadDocument.ToString());
            cmdMenu.Parameters.AddWithValue("@ProductTerms", strProductTerms.ToString());
            cmdMenu.Parameters.AddWithValue("@CreateTeam", strCreateTeam.ToString());
            cmdMenu.Parameters.AddWithValue("@MyTeam", strMyTeam.ToString());
            cmdMenu.Parameters.AddWithValue("@SMTP", strSMTP.ToString());
            cmdMenu.Parameters.AddWithValue("@PaymentTerms", strPaymentTerms.ToString());
            cmdMenu.Parameters.AddWithValue("@CreateUserRole", strCreateUserRole.ToString());
            cmdMenu.Parameters.AddWithValue("@Order_", strOrder_.ToString());
            cmdMenu.Parameters.AddWithValue("@GenerateOrder", strGenerateOrder.ToString());
            cmdMenu.Parameters.AddWithValue("@ViewAllOrder", strViewAllOrder.ToString());
            cmdMenu.Parameters.AddWithValue("@Quotation", strQuotation.ToString());
            cmdMenu.Parameters.AddWithValue("@GenerateQuotation", strGenerateQuotation.ToString());
            cmdMenu.Parameters.AddWithValue("@ViewAllQuotation", strViewAllQuotation.ToString());
            cmdMenu.Parameters.AddWithValue("@Reports", strReports.ToString());
            cmdMenu.Parameters.AddWithValue("@LeadWorkReport", strLeadWorkReport.ToString());
            cmdMenu.Parameters.AddWithValue("@MeetingWorkReport", strMeetingWorkReport.ToString());
            cmdMenu.Parameters.AddWithValue("@AssignLeads", strAssignLeads.ToString());
            cmdMenu.Parameters.AddWithValue("@Feedback", strFeedback.ToString());
            cmdMenu.Parameters.AddWithValue("@AddFeedback", strAddFeedback.ToString());
            cmdMenu.Parameters.AddWithValue("@FeedbackReport", strFeedbackReport.ToString());
            cmdMenu.ExecuteNonQuery();
            cmdMenu.Dispose();
            con.Close();

            checkSelectMenu.Items.Clear();
            _bindcheckBox();
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Role Assigned Successfully');", true);
        }


    }
}