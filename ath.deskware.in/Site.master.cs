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

public partial class Site : System.Web.UI.MasterPage
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
    SqlCommand cmd;
    Class1 cls = new Class1();
    string user_type, name = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] == null && Session["type"] == null)
        {
            Response.Redirect("~/login.aspx");
        }
            
        else
        {
            user_type = Session["type"].ToString();
            Label1.Text = Session["Username"].ToString();
            Label2.Text = Session["type"].ToString();
         //   Label5.Text = Session["operation"].ToString();
            //loginRole(); assign_module();
        }
        if (!IsPostBack)
        {
            if (user_type == "Executive")
            {
                a5.Visible = a3.Visible= true;
                a6.Visible = a11.Visible = a14.Visible = a17.Visible = a23.Visible = a34.Visible = a102.Visible = a56.Visible = a49.Visible  = A52.Visible = a59 .Visible= false;

            }
            else
            {
                a3.Visible = a5.Visible = a6.Visible = a11.Visible = a14.Visible = a17.Visible = a23.Visible = a34.Visible = a101.Visible = a102.Visible = a56.Visible = a49.Visible =a201.Visible= true;
            }
            if (Session["Username"].ToString() == "accounts" || Session["Username"].ToString() == "amit001" || Session["Username"].ToString() == "as001" || Session["Username"].ToString() == "mu001")
            {
                a14.Visible = a49 .Visible=a33.Visible= false;
            }
            if (Session["Username"].ToString() == "mu001")
            {
                a14.Visible = true;
            }
            if (Session["Username"].ToString() == "tilehub" || Session["Username"].ToString() == "Tilehub" || Session["Username"].ToString() == "TILEHUB")
            {
                div_menu.Visible = false;
                changepassword.Visible = false;
                //lblDashboard.Visible = A38.Visible = A52.Visible = a1.Visible = a46.Visible = a39.Visible = a102.Visible = a11.Visible = a14.Visible = a56.Visible = a49.Visible = a17.Visible = a23.Visible = changepassword.Visible = false;

                //a101.Visible = A36.Visible = true;
                //a6.Visible = a1.Visible = a11.Visible = a14.Visible = a17.Visible = a23.Visible = a34.Visible = a102.Visible = a56.Visible = a49.Visible = A52.Visible = a59.Visible = false;
                

            }
            if (Session["Username"].ToString() == "Satish" || Session["Username"].ToString() == "SATISH" || Session["Username"].ToString() == "satish" || Session["Username"].ToString() == "Ravi" || Session["Username"].ToString() == "RAVI" || Session["Username"].ToString() == "ravi")
            {
                lblDashboard.Visible = A38.Visible = A52.Visible = a1.Visible = a46.Visible = a39.Visible = a102.Visible = a11.Visible = a14.Visible = a56.Visible   = a23.Visible  = a6.Visible = false;
                a17.Visible = a45.Visible = a49.Visible = a101.Visible = A36.Visible = true;
             
                a18.Visible = a19.Visible = a57.Visible = a48.Visible = a43.Visible = a20.Visible = a21.Visible = a22.Visible = a34.Visible = a64.Visible = a35.Visible = false;

            }
            if (user_type == "Salesman")
            {
                div_menu.Visible = false;
            }

            if (Session["Username"].ToString() == "accounts")
            {
                a67.Visible = a68.Visible =a201.Visible= true;
            }
            if (Session["Username"].ToString() == "amit-pat" || Session["Username"].ToString() == "satish-pat")
            {
                div_menu.Visible = true;
                a3.Visible = a5.Visible = a6.Visible = a11.Visible = a14.Visible = a17.Visible = a23.Visible = a34.Visible = a101.Visible = a102.Visible = a56.Visible = a49.Visible = true;
            }

            if (Session["Username"].ToString() == "amit-pat")
            {
                a44.Visible = a53.Visible = a63.Visible = a65.Visible = a31.Visible = a32.Visible = a33.Visible = a57.Visible = a58.Visible = a12.Visible = false;
                A52.Visible = true;
            }
            if (Session["Username"].ToString() == "satish-pat")
            {
                a44.Visible = a53.Visible = a63.Visible = a65.Visible = a31.Visible = a32.Visible = a33.Visible =  a58.Visible = a12.Visible = false;
                A52.Visible = true;
            }
            if (Session["Username"].ToString() == "xyz")
            {
                a33.Visible=false;
            }
          
        }
    }
    //void assign_module()
    //{
    //    if (con.State == ConnectionState.Closed)
    //    {
    //        con.Open();
    //    }
    //    SqlCommand cmd = new SqlCommand("SELECT * FROM module_assign where user_id='" + Session["Username"].ToString() + "'", con);
    //    SqlDataReader rdr = cmd.ExecuteReader();
    //    while (rdr.Read())
    //    {
    //        //Dashboard
    //        if (rdr["crm"].ToString() == "1")
    //        {

    //            lblcrm.Visible = true;
    //        }
    //        else
    //        {
    //            lblcrm.Visible = false;
    //        }
    //        //Marketing
    //        if (rdr["purchase"].ToString() == "2")
    //        {

    //            lblpurchase.Visible = true;
    //        }
    //        else
    //        {
    //            lblpurchase.Visible = false;
    //        }

    //    }
    //    rdr.Close();
    //    con.Close();
    //}
    protected void lbkLogout_Click(object sender, EventArgs e)
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
    protected void changepassword_Click(object sender, EventArgs e)
    {
        Response.Redirect("change_password.aspx");
    }
    //void loginRole()
    //{
    //    if (con.State == ConnectionState.Closed)
    //    {
    //        con.Open();
    //    }
    //    SqlCommand cmd = new SqlCommand("SELECT * FROM AddSubMenu where user_id='" + Session["Username"].ToString() + "'", con);
    //    SqlDataReader rdr = cmd.ExecuteReader();
    //    while (rdr.Read())
    //    {
    //        //Dashboard
    //        if (rdr["Dashboard"].ToString() == "1")
    //        {
    //            lblDashboard.Visible = true;
    //        }
    //        else
    //        {
    //            lblDashboard.Visible = false;
    //        }
    //        //Marketing
    //        if (rdr["Marketing"].ToString() == "2")
    //        {
    //            lblMarketing.Visible = true;
    //        }
    //        else
    //        {
    //            lblMarketing.Visible = false;
    //        }
    //        //Enquiryform
    //        if (rdr["Enquiryform"].ToString() == "3")
    //        {
    //            lblEnquiryform.Visible = true;
    //        }
    //        else
    //        {
    //            lblEnquiryform.Visible = false;
    //        }
    //        //TotalCustomer
    //        if (rdr["TotalCustomer"].ToString() == "4")
    //        {
    //            lblTotalCustomer.Visible = true;
    //        }
    //        else
    //        {
    //            lblTotalCustomer.Visible = false;
    //        }
    //        //SearchCustomer
    //        if (rdr["SearchCustomer"].ToString() == "5")
    //        {
    //            lblSearchCustomer.Visible = true;
    //        }
    //        else
    //        {
    //            lblSearchCustomer.Visible = false;
    //        }
    //        //AssignCustomerLeads
    //        if (rdr["AssignCustomerLeads"].ToString() == "6")
    //        {
    //            lblAssignCustomerLeads.Visible = true;
    //        }
    //        else
    //        {
    //            lblAssignCustomerLeads.Visible = false;
    //        }
    //        //Masters
    //        if (rdr["Masters"].ToString() == "7")
    //        {
    //            lblMasters.Visible = true;
    //        }
    //        else
    //        {
    //            lblMasters.Visible = false;
    //        }
    //        //CreateUser
    //        if (rdr["CreateUser"].ToString() == "8")
    //        {
    //            lblCreateUser.Visible = true;
    //        }
    //        else
    //        {
    //            lblCreateUser.Visible = false;
    //        }
    //        //CreateCustomerType
    //        if (rdr["CreateCustomerType"].ToString() == "9")
    //        {
    //            lblCreateCustomerType.Visible = true;
    //        }
    //        else
    //        {
    //            lblCreateCustomerType.Visible = false;
    //        }
    //        //CreateSpecialRequest
    //        if (rdr["CreateSpecialRequest"].ToString() == "10")
    //        {
    //            lblCreateSpecialRequest.Visible = true;
    //        }
    //        else
    //        {
    //            lblCreateSpecialRequest.Visible = false;
    //        }
    //        //CreateDataSource
    //        if (rdr["CreateDataSource"].ToString() == "11")
    //        {
    //            lblCreateDataSource.Visible = true;
    //        }
    //        else
    //        {
    //            lblCreateDataSource.Visible = false;
    //        }
    //        //createuserrole
    //        if (rdr["CreateUserRole"].ToString() == "14")
    //        {
    //            lblCreateUserRole.Visible = true;
    //        }
    //        else
    //        {
    //            lblCreateUserRole.Visible = false;
    //        }
    //        //todayfollowup
    //        if (rdr["TodayFollowupReminder"].ToString() == "15")
    //        {

    //            lbltodayfollowup.Visible = true;
    //        }
    //        else
    //        {
    //            lbltodayfollowup.Visible = false;
    //        }
    //        //pendingfollowup
    //        if (rdr["PendingFollowupReminder"].ToString() == "16")
    //        {

    //            lblpendingfollowup.Visible = true;
    //        }
    //        else
    //        {
    //            lblpendingfollowup.Visible = false;
    //        }
    //        //allocatedatatomgr
    //        if (rdr["AllocateDataToManager"].ToString() == "17")
    //        {

    //            lblallocatedatatomgr.Visible = true;
    //        }
    //        else
    //        {
    //            lblallocatedatatomgr.Visible = false;
    //        }
    //        //employeeattendancereport
    //        //if (rdr["EmployeeAttendanceReport"].ToString() == "18")
    //        //{
    //        //    lblemployeeattendancereport.Visible = true;
    //        //}
    //        //else
    //        //{
    //        //    lblemployeeattendancereport.Visible = false;
    //        //}
    //        //employeetaskreport
    //        if (rdr["EmployeeTaskReport"].ToString() == "19")
    //        {
    //            lblemployeetaskreport.Visible = true;
    //        }
    //        else
    //        {
    //            lblemployeetaskreport.Visible = false;
    //        }
    //        //dept mapping
    //        //if (rdr["UserwiseDepartmentMapping"].ToString() == "20")
    //        //{
    //        //    lbluserdeprtmentmapping.Visible = true;
    //        //}
    //        //else
    //        //{
    //        //    lbluserdeprtmentmapping.Visible = false;
    //        //}
    //        //todo List report
    //        if (rdr["ToDoListReport"].ToString() == "21")
    //        {
    //          //  lbl_ToDoListReport.Visible = true;
    //        }
    //        else
    //        {
    //           // lbl_ToDoListReport.Visible = false;
    //        }
    //        //user assign modules
    //        if (rdr["AssignModules"].ToString() == "22")
    //        {
    //            lblassignmodules.Visible = true;
    //        }
    //        else
    //        {
    //            lblassignmodules.Visible = false;
    //        }
    //        //to do garph
    //        //if (rdr["Todolistgraph"].ToString() == "23")
    //        //{
    //        //    lbltodograph.Visible = true;
    //        //}
    //        //else
    //        //{
    //        //    lbltodograph.Visible = false;
    //        //}
    //        //Calling garph
    //        if (rdr["Callinggraph"].ToString() == "24")
    //        {
    //            lblcallinggraph.Visible = true;
    //        }
    //        else
    //        {
    //            lblcallinggraph.Visible = false;
    //        }
    //        //Lead garph
    //        if (rdr["Leadgraph"].ToString() == "25")
    //        {
    //            lblleadgraph.Visible = true;
    //        }
    //        else
    //        {
    //            lblleadgraph.Visible = false;
    //        }
    //        //Analytical garph
    //        if (rdr["AnalyticalGraph"].ToString() == "26")
    //        {
    //            lblgraph.Visible = true;
    //        }
    //        else
    //        {
    //            lblgraph.Visible = false;
    //        }
    //        if (Label2.Text == "Administrator")
    //        {
    //           // A2.Visible = true;
    //           // lblindiamart.Visible = true;
    //        }
            
    //    }
    //    rdr.Close();
    //    con.Close();
    //}
    protected void Button1_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text != "")
        {
            Label4.Text = "";
            cmd = con.CreateCommand();
            SqlCommand cmd1 = con.CreateCommand();
            con.Open();
            cmd.CommandText = " insert into chat_history values('" + Label3.Text + "','" + TextBox1.Text + "',getdate(),'" + Session["Username"].ToString() + "') ";
            cmd1.CommandText = " Update todolist_master set status='" + RadioButtonList1.SelectedValue + "' where t_id='" + Label3.Text + "' ";
            cmd.ExecuteNonQuery();
            cmd1.ExecuteNonQuery();
            con.Close();
            demo.Visible = false;
        }
        else
        {
            Label4.Text = "Enter Reply";
        }
    }

    
}
