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
        //if (Session["Username"] == null && Session["type"] == null)
        //{
        //    Response.Redirect("~/login.aspx");
        //}
        //else
        {
            //usrname.InnerText = Session["Username"].ToString() + " || " + Session["name"].ToString();
            //desig.InnerText =  Session["designation"].ToString()+" || "+Session["type"].ToString();
            //img.Src = Session["pic"].ToString();

            if (Session["Username"].ToString() == "satish-pat")
            {
                a14.Visible = a9.Visible = Li18.Visible = false;
            }
            if (Session["Username"].ToString() == "amit-pat")
            {

                CreateNewInstitue.Visible = Li11.Visible = Li16.Visible = Li6 .Visible=Li7.Visible =Li8.Visible =Li12.Visible =Li17.Visible =Li19.Visible =Li21.Visible =Li24.Visible=  true;

                cash.Visible = update_sis.Visible = Li5.Visible = Li13.Visible = Li18.Visible = Li22.Visible = Li9.Visible = Li10.Visible = Li4.Visible = Li23.Visible = Li14.Visible = Li20.Visible =Li1.Visible= false;
                    
            }
            if (Session["Username"].ToString() == "abc")
            {
                Dashboard.Visible = CreateNewInstitue.Visible = Li6.Visible = Li1.Visible = Li15.Visible = Li29.Visible = false;
            }

            string thisURL = this.Page.GetType().Name.ToString();
            switch (thisURL)
            {

                case "admin_cash_in_aspx":
                    CreateNewInstitue.Attributes.Add("class", "active");
                     break;
                case "admin_cash_out_aspx":
                    CreateNewInstitue.Attributes.Add("class", "active");
                    break;
                case "admin_cheque_out_aspx":
                        CreateNewInstitue.Attributes.Add("class", "active");
                    break;

                case "admin_avg_stock_pricing_aspx":
                        CreateNewInstitue.Attributes.Add("class", "active");
                    break;

                case "admin_assests_aspx":
                        CreateNewInstitue.Attributes.Add("class", "active");
                    break;


                case "admin_issue_salesman_challan_aspx":
                        CreateNewInstitue.Attributes.Add("class", "active");
                    break;
                case "admin_issue_emp_challan_aspx":
                    CreateNewInstitue.Attributes.Add("class", "active");
                    break;


                case "admin_current_ledger_aspx":
                    Li6.Attributes.Add("class", "active");
                    break;
                case "admin_obc_ledger_aspx":
                    Li6.Attributes.Add("class", "active");
                    break;
                case "admin_hdfc_ledger_aspx":
                    Li6.Attributes.Add("class", "active");
                    break;
                case "admin_cash_ledger_aspx":
                    Li6.Attributes.Add("class", "active");
                    break;
                case "admin_employee_ledger_aspx":
                    Li6.Attributes.Add("class", "active");
                    break;
                case "admin_companyledger_aspx":
                    Li6.Attributes.Add("class", "active");
                    break;
                case "admin_assetsledger_aspx":
                    Li6.Attributes.Add("class", "active");
                    break;
                       case "admin_capitel_ledger_aspx":
                    Li6.Attributes.Add("class", "active");
                    break;
                       case "admin_dealer_report_aspx":
                    Li6.Attributes.Add("class", "active");
                    break;

                       case "admin_salesman_report_aspx":
                    Li6.Attributes.Add("class", "active");
                    break;

                       case "admin_volume_report_aspx":
                    Li6.Attributes.Add("class", "active");
                    break;
                       case "admin_all_emp_bal_aspx":
                    Li6.Attributes.Add("class", "active");
                    break;

                    
                    
                    
                    

                case "admin_create_employee_aspx":
                    Li1.Attributes.Add("class", "active");
                    break;
                case "admin_emp_atteandance_aspx":
                    Li1.Attributes.Add("class", "active");
                    break;

                case "admin_capital_entry_aspx":
                    Li15.Attributes.Add("class", "active");
                    break;
                   
            
             
               
            }
        }
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

