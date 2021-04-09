using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Add_followup2 : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
    SqlCommand cmd;
    Class1 cls = new Class1(); SqlDataAdapter adap;
    DataSet ds; string user_type, name = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] == null && Session["type"] == null)
        {
            Response.Redirect("~/login.aspx");
        }
        if (Request.QueryString["id"] == null)
        {
            Response.Redirect("~/login.aspx");
        }
        else
        {
            user_type = Session["type"].ToString();
            name = Session["username"].ToString();
            if (!IsPostBack)
            {
               // bind_temp_contact_details();
                Label4.Text = Request.QueryString["id"].ToString();
                view_details();
                User_details();
               // cls.bind_ddl(DropDownList5, "select * from customer_type_master order by customer_type asc", "customer_type", "customer_type");
                //DropDownList5.Items.Insert(0,"Close");
                //DropDownList5.Items.Insert(1, "Client");
               // cls.bind_chklist(CheckBoxList1, " select * from user_master  order  by  name asc", "name", "user_id");
               // cls.gridbind(GridView2, "select * from add_more_master where c_id='" + Label4.Text + "' ");

                cls.bind_ddl(ddlemailid, "select distinct user_id from user_master order by user_id asc", "user_id", "user_id");
                //ddlemailid.Items.Insert(0, "-select-");

            }
           // TextBox1.Text = System.DateTime.Now.ToString("MM/dd/yyyy");
        }
    }
    string email_id = "";
    public void view_details()
    {
        try
        {
            adap = new SqlDataAdapter("select * from tbl_medors_lead_master where lead_id='" + Label4.Text + "' ", con);
            ds = new DataSet();
            adap.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dr = ds.Tables[0].Rows[0];
                Label4.Text = dr["lead_id"].ToString();
                Label5.Text = dr["title"].ToString() + " " + dr["fname"].ToString() + " " + dr["lname"].ToString();
                Label6.Text = dr["mob"].ToString();
                Label10.Text = dr["product"].ToString();
                Label12.Text = dr["phone"].ToString();
                Label3.Text = dr["email_id"].ToString();
                Label7.Text = dr["address"].ToString();
            }
        }
        catch (Exception er)
        {
        }
    }

    string Username, Mob_no,user_mob,c2 = "";
    public void User_details()
    {
        try
        {
            adap = new SqlDataAdapter("select * from user_master where user_id='" + Session["Username"].ToString() + "' ", con);
            ds = new DataSet();
            adap.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dr = ds.Tables[0].Rows[0];
                Username = dr["name"].ToString();
                Mob_no = dr["contact_no"].ToString();
            }
        }
        catch (Exception er)
        {
        }
    }
    protected void btnaddfollowup_Click(object sender, EventArgs e)
    {
        try
        {
            if (RadioButtonList1.SelectedValue == "1")
            {
                status();
                cmd = con.CreateCommand();
                con.Open();
                cmd.CommandText = "insert into tbl_medors_followup_master values('" + Label4.Text.Trim() + "','" + Label5.Text.Trim() + "','" + DateTime.ParseExact(txtfollowupdate.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "','" + txtremark.Text.Trim() + "','" + Session["Username"].ToString() + "',getdate(),'0')";
                cmd.ExecuteNonQuery();
                con.Close();
                ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Follow Up Added Sucessfully');", true);
                Update_pending_followup();
                txtremark.Text = "";
            }
            if (RadioButtonList1.SelectedValue == "2")
            {
                cmd = con.CreateCommand();
                con.Open();
                cmmd = " update tbl_medors_lead_master set ctype='Rejected' where lead_id ='" + Label4.Text + "'  ";
                cmd.CommandText = cmmd;
                cmd.ExecuteNonQuery();
                con.Close();
            
                followup_status();
                SqlCommand  cmd1 = con.CreateCommand();
                con.Open();
                cmd1.CommandText = "insert into tbl_medors_followup_master values('" + Label4.Text.Trim() + "','" + Label5.Text.Trim() + "',getdate(),'" + txtremark.Text.Trim() + "','" + Session["Username"].ToString() + "',getdate(),'1')";
                cmd1.ExecuteNonQuery();
                con.Close();

                ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Rejected Sucessfully');", true);
            }
            
            if (RadioButtonList1.SelectedValue == "3")
            {
                converted();
                SqlCommand cmd1 = con.CreateCommand();
                con.Open();
                cmd1.CommandText = "insert into tbl_medors_followup_master values('" + Label4.Text.Trim() + "','" + Label5.Text.Trim() + "',getdate(),'" + txtremark.Text.Trim() + "','" + Session["Username"].ToString() + "',getdate(),'1')";
                cmd1.ExecuteNonQuery();
                con.Close();
            }
            if (RadioButtonList1.SelectedValue == "4")
            {
                cmd = con.CreateCommand();
                con.Open();
                cmd.CommandText = " DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:30:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101) insert into tbl_meeting_details values('" + Label4.Text.Trim() + "','" + Label5.Text.Trim() + "','" + Label6.Text.Trim() + "','" + Label10.Text.Trim() + "','" + DateTime.ParseExact(TextBox1.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture) + "','" + txtremark.Text.Trim() + "','" + Session["Username"].ToString() + "','"+ddlemailid.SelectedValue+"',getdate(),'0','')";
                cmd.ExecuteNonQuery();
                con.Close();
                ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Meeting Scheduled Sucessfully');", true);
                txtremark.Text = "";
            }
            if (RadioButtonList1.SelectedValue == "5")
            {
              followup_status();

                DateTime tomorrow = DateTime.Now.AddDays(1);
                DateTime followup;
                string day = tomorrow.ToString("dddd");

                if (day == "Sunday")
                {
                    followup = DateTime.Now.AddDays(2);
                }
                else
                {
                    followup = DateTime.Now.AddDays(1);
                }

                SqlCommand cmd1 = con.CreateCommand();
                con.Open();
                cmd1.CommandText = "insert into tbl_medors_followup_master values('" + Label4.Text.Trim() + "','" + Label5.Text.Trim() + "','" + followup + "','" + txtremark.Text.Trim() + "','" + Session["Username"].ToString() + "',getdate(),'0')";
                cmd1.ExecuteNonQuery();
                con.Close();

                ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Updated Sucessfully');", true);
            }
                    }
        catch (Exception er)
        {
        }
    }
   

    public void  Update_pending_followup()
    {
        cmd = con.CreateCommand();
        con.Open();
        cmd.CommandText = " DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:30:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101) update  tbl_medors_followup_master set status=1  where lead_id='" + Label4.Text + "' and   datediff(day,date,@date_new)>=0  and status='0' and  id not in(select top 1 id from  tbl_medors_followup_master where lead_id='" + Label4.Text + "'  order by id desc)";
        cmd.ExecuteNonQuery();
        con.Close();
    }
    
    //public void sendmail()
    //{
    //    if (Label12.Text != "")
    //    {
    //        User_details();
    //        string msg = "";
    //        MailMessage message = new MailMessage();
    //        message.To.Add(Label12.Text);
    //        message.Subject = "Greetings from Vgcsoft Technologies";
    //        msg = " <table cellpadding='5' cellspacing='0' style='border:solid #DDDDDD 1.0pt;width: 100.0%;'><tr > <td style='width: 100.0%; border: none; border-bottom: solid #76c04E 2.25pt; padding: 3.75pt 7.5pt 3.75pt 7.5pt; height: 45.0pt;' width='100%'><img src='http://www.vgconline.com/images/logo.png' border='0' lt='Ecoste'width='200' height='40' /></td>  </tr>  <tr>  <td>  <p>    <span style='font-size: 10.0pt; font-family: Tahoma'>Dear " + Label5.Text + ",<br /> <br /> <strong><span style='font-family:Tahoma; color: #2e3192;'>Greetings from Vgcsoft Technologies!!!</span></strong><br /> <br /> It is a pleasure interacting with you. We would like to thank you for the valuable     time provided to Vgcsoft technologies . We offers <b>Customer Relationship Management Software (CRM), School Management Software (SMS), Lab Management System,Conference Management System,Domain & Web Hosting and Customized web & windows Applications</b>. To know more about Products, please log on to <a ref='www.theiconicwebsolutions.com.in'>www.vgcsoft.com</a> For further assistance, please call us at our <b>Helpline number 09818833306.</b>. <br /> <br /> </span>  <p  style='line-height: 13.5pt;'><span style='font-size: 10.0pt; font-family: Tahoma'>Warm Regards,<span style='font-size: 10.0pt; font-family:Tahoma'><br /> Team       Vgcsoft Technologies</span></p> </p></td></tr><tr> <td><table style='width: 100.0%; border:solid #DDDDDD 1.0pt;width: 100.0%; '> <tr>   <td colspan='2' style='width: 100.0%; border: none; padding: 5.25pt 3.75pt 5.25pt 3.75pt; border: none;background: #EEEEEE; border: none; border-bottom: solid #D1D1D1 1.0pt;width:100%'>  <strong><span style='font-size: 10.0pt; font-family: Tahoma; color: #2e3192;'>Happy to Help</span></strong></td> </tr> <tr> <td style='width: 50.0%; border: none; border-right: solid #D1D1D1 1.0pt; padding: 3.75pt 3.75pt 3.75pt 3.75pt;' width='50%'><p style='line-height: 13.5pt;'><strong><span style='font-size: 10.0pt; font-family: Tahoma'>Email:</span></strong><span style='font-size: 10.0pt; font-family:Tahoma'><br /> <strong><a href='mailto:sales@vgcsoft.com' target='_blank'><span style='color: #444444;'>sales@vgcsoft.com</span></a></strong></span></p>     </td><td style='width: 50.0%; padding: 3.75pt 3.75pt 3.75pt 3.75pt;' width='50%'><p class='MsoNormal' style='line-height: 13.5pt;'><strong><span style='font-size: 10.0pt; font-family:Tahoma'>Contact No.:</span></strong><span style='font-size: 10.0pt; font-family:Tahoma'><br /> <span style='color: #444444;'><b>09818833306</b></span></span></p></td>           </tr>       </table>     </td></tr></table>";
    //        //msg = " <table cellpadding='5' cellspacing='0' style='border:solid #DDDDDD 1.0pt;width: 100.0%;'><tr > <td style='width: 100.0%; border: none; border-bottom: solid #76c04E 2.25pt; padding: 3.75pt 7.5pt 3.75pt 7.5pt; height: 45.0pt;' width='100%'><img src='http://www.vgconline.com/images/logo.png' border='0' alt='Ecoste' width='200' height='40' /></td>  </tr>  <tr>  <td>  <p>    <span style='font-size: 10.0pt; font-family: Tahoma'>Dear " + Label5.Text + ",<br /> <br /> <strong><span style='font-family:Tahoma; color: #2e3192;'>Greetings     from Ecoste!!!</span></strong><br /> <br /> It was a pleasure meeting you. We would like to thank you for the valuable     time provided to Ecoste Team . We are in <b>Manufacturing of the Wood Polymer composite Boards, Grills, Deco Panels, Doors and Profib Door frames</b>. To know more about Product range, please log on to <a href='www.ecoste.in'>www.ecoste.in</a> or Download our <b>Android Play Store</b> by typing Ecoste. For further assistance, please call us at our <b>Helpline number 09555-075-075. Press 1 for Sales and 2 for any Technical Support</b>. <br /> <br /> </span>  <p  style='line-height: 13.5pt;'><span style='font-size: 10.0pt; font-family: Tahoma'>Warm Regards,<span style='font-size: 10.0pt; font-family:Tahoma'><br /> Team Ecoste</span></p> </p></td></tr><tr> <td><table style='width: 100.0%; border:solid #DDDDDD 1.0pt;width: 100.0%; '> <tr>   <td colspan='2' style='width: 100.0%; border: none; padding: 5.25pt 3.75pt 5.25pt 3.75pt; border: none;background: #EEEEEE; border: none; border-bottom: solid #D1D1D1 1.0pt;width:100%'>  <strong><span style='font-size: 10.0pt; font-family: Tahoma; color: #2e3192;'>Happy to Help</span></strong></td> </tr> <tr> <td style='width: 50.0%; border: none; border-right: solid #D1D1D1 1.0pt; padding: 3.75pt 3.75pt 3.75pt 3.75pt;' width='50%'><p style='line-height: 13.5pt;'><strong><span style='font-size: 10.0pt; font-family: Tahoma'>Email:</span></strong><span style='font-size: 10.0pt; font-family:Tahoma'><br /> <strong><a href='mailto:support@ecoste.in' target='_blank'><span style='color: #444444;'>support@ecoste.in</span></a></strong></span></p>     <p style='line-height: 13.5pt;'><span style='font-size: 10.0pt; font-family:Tahoma'><strong><a href='mailto:info@ecoste.in' target='_blank'><span style='color: #444444;'>info@ecoste.in</span></a></strong></span></p></td><td style='width: 50.0%; padding: 3.75pt 3.75pt 3.75pt 3.75pt;' width='50%'><p class='MsoNormal' style='line-height: 13.5pt;'><strong><span style='font-size: 10.0pt; font-family:Tahoma'>Toll Free:</span></strong><span style='font-size: 10.0pt; font-family:Tahoma'><br /> <span style='color: #444444;'><b>09555-075-075</b></span></span></p></td>           </tr>       </table>     </td></tr></table>";
    //        message.Body = msg;
    //        message.IsBodyHtml = true;
    //        message.From = new MailAddress("sales@vgcsoft.com");
    //        SmtpClient emailClient = new SmtpClient("103.26.99.167");
    //        System.Net.NetworkCredential SMTPUserInfo = new System.Net.NetworkCredential("sales@vgcsoft.com", "imvirgo@4u");
    //        emailClient.UseDefaultCredentials = true;
    //        emailClient.Credentials = SMTPUserInfo;
    //        emailClient.Send(message);
    //    }
    //}
    public void status()
    {
        cmd = con.CreateCommand();
        con.Open();
        cmd.CommandText = "update tbl_medors_followup_master set status=1 where id=(select max(id) from tbl_medors_followup_master where lead_id='" + Label4.Text + "'  ) and nfd<=getdate()";
        cmd.ExecuteNonQuery();
        con.Close();
    }
    //public void assign_status_update()
    //{
    //    cmd = con.CreateCommand();
    //    con.Open();
    //    cmd.CommandText = "update enquiry_master set assigned_status=2 where customer_id='" + Label4.Text + "'";
    //    cmd.ExecuteNonQuery();
    //    con.Close();
    //}
    string remarks = "";
   
    protected void btnviewhistory_Click(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedValue != "4")
        {
            cls.gridbind(GridView1, "select * from tbl_medors_followup_master where lead_id='" + Label4.Text + "'  order by ID asc");
        }
        else
        {
            cls.gridbind(GridView4, "select * from tbl_meeting_details where assign_to='" + ddlemailid.SelectedValue + "' order by md desc ");
        }
    }
    //protected void btnupdate_Click(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        cmd = con.CreateCommand();
    //        con.Open();
    //        cmd.CommandText = "usp_follow_up_mstr";
    //        cmd.CommandType = CommandType.StoredProcedure;
    //        cmd.Parameters.Add(new SqlParameter(@"id", Label9.Text));
    //        cmd.Parameters.Add(new SqlParameter(@"customer_id", Label4.Text));
    //        cmd.Parameters.Add(new SqlParameter(@"remarks", Label11.Text + "</br>" + txtremark.Text.Trim() + ":" + System.DateTime.Now.ToString("dd-MMM-yy hh:mm:ss tt")));
    //        cmd.Parameters.Add(new SqlParameter(@"next_followup_date", DateTime.ParseExact(txtfollowupdate.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture)));
    //        cmd.Parameters.Add(new SqlParameter(@"time", DropDownList2.SelectedValue + ":" + DropDownList3.SelectedValue + ":" + DropDownList4.SelectedValue));
    //        cmd.Parameters.Add(new SqlParameter(@"created_by", Session["Username"].ToString()));
    //        cmd.Parameters.Add(new SqlParameter(@"action_taken", ""));
    //        cmd.Parameters.Add(new SqlParameter(@"action", "U"));
    //        int row = cmd.ExecuteNonQuery();
    //        if (row == 1)
    //        {
    //            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Follow Up Updated Sucessfully');", true);
    //        }
    //        bind();

    //    }
    //    catch (Exception ex)
    //    {
    //    }
    //}
    //public void bind()
    //{
    //    cls.gridbind(GridView1, "select * from tbl_medors_followup_master where customer_id='" + Label4.Text + "'   order by ID asc");
    //}
    //protected void btndelete_Click(object sender, EventArgs e)
    //{
    //    try
    //    {
    //        cmd = con.CreateCommand();
    //        con.Open();
    //        cmd.CommandText = "usp_follow_up_mstr";
    //        cmd.CommandType = CommandType.StoredProcedure;
    //        cmd.Parameters.Add(new SqlParameter(@"id", Label9.Text));
    //        cmd.Parameters.Add(new SqlParameter(@"customer_id", Label4.Text));
    //        cmd.Parameters.Add(new SqlParameter(@"remarks", txtremark.Text.Trim()));
    //        cmd.Parameters.Add(new SqlParameter(@"next_followup_date", DateTime.ParseExact(txtfollowupdate.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture)));
    //        cmd.Parameters.Add(new SqlParameter(@"time", DropDownList2.SelectedValue + ":" + DropDownList3.SelectedValue + ":" + DropDownList4.SelectedValue));
    //        cmd.Parameters.Add(new SqlParameter(@"created_by", Session["Username"].ToString()));
    //        cmd.Parameters.Add(new SqlParameter(@"action_taken", ""));
    //        cmd.Parameters.Add(new SqlParameter(@"action", "D"));
    //        int row = cmd.ExecuteNonQuery();
    //        if (row == 1)
    //        {
    //            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Follow Up Deleted Sucessfully');", true);
    //        }
    //        bind();

    //    }
    //    catch (Exception ex)
    //    {
    //    }
    //}
    SqlCommand cmd1; string cmmd;
    //protected void btnconvert_Click(object sender, EventArgs e)
    //{
    //    //if (TextBox1.Text != "")
    //    {
    //        cmd = con.CreateCommand();
    //        con.Open();
    //        //if (DropDownList5.SelectedValue == "Close")
    //        //{
    //        //    cmmd = " update enquiry_master set customer_type='PClose' where customer_id ='" + Label4.Text + "' ";
    //        //}
    //        //else
    //        {
    //            cmmd = " update enquiry_master set customer_type='" + DropDownList5.SelectedValue + "' where customer_id ='" + Label4.Text + "'  ";
    //        }
    //        cmd.CommandText = cmmd;

    //        //cmd1 = con.CreateCommand();
    //        //cmd1.CommandText = "follow_up_mstr";
    //        //cmd1.CommandType = CommandType.StoredProcedure;
    //        //cmd1.Parameters.Add(new SqlParameter(@"customer_id", Label4.Text));
    //        //cmd1.Parameters.Add(new SqlParameter(@"customer_name", Label5.Text));
    //        //cmd1.Parameters.Add(new SqlParameter(@"remarks", txtremark.Text.Trim()));
    //        //cmd1.Parameters.Add(new SqlParameter(@"next_followup_date", ""));
    //        //cmd1.Parameters.Add(new SqlParameter(@"time", ""));
    //        //cmd1.Parameters.Add(new SqlParameter(@"created_by", Session["Username"].ToString()));
    //        //cmd1.Parameters.Add(new SqlParameter(@"date", DateTime.ParseExact(TextBox1.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture)));
    //        //cmd1.Parameters.Add(new SqlParameter(@"action_taken", ""));
    //        //cmd1.Parameters.Add(new SqlParameter(@"operation", Session["operation"].ToString()));
    //        //cmd1.Parameters.Add(new SqlParameter(@"action", "I"));
    //        cmd.ExecuteNonQuery();
    //        //cmd1.ExecuteNonQuery();
    //        con.Close();
    //        followup_status1();
    //        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Converted Sucessfully');", true);
    //    }
    //    //else
    //    //{
    //    //    ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Please select Date');", true);
    //    //}
    //}
    //public void followup_status1()
    //{
    //    if (DropDownList5.SelectedValue == "Client")
    //    {
    //        cmd = con.CreateCommand();
    //        con.Open();
    //        cmd.CommandText = " update tbl_medors_followup_master set status='1' where customer_id='" + Label4.Text + "'  ";
    //        cmd.ExecuteNonQuery();
    //        con.Close();
    //    }
    //}
    public void followup_status()
    {
        cmd = con.CreateCommand();
        con.Open();
        cmd.CommandText = " update tbl_medors_followup_master set status='1' where lead_id='" + Label4.Text + "'  ";
        cmd.ExecuteNonQuery();
        con.Close();
    }
    //protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    //{
    //    if (DropDownList1.SelectedValue == "NAT")
    //    {
    //        DropDownList1.Items.Clear();
    //        DropDownList1.Items.Insert(0, "Sample Courier");
    //        DropDownList1.Items.Insert(1, "Mail To Be Sent");
    //        DropDownList1.Items.Insert(2, "Fix Up Meeting");
    //        DropDownList1.Items.Insert(2, "Meeting Update");
    //    }
    //    if (DropDownList1.SelectedValue == "IP")
    //    {
    //        DropDownList1.Items.Clear();
    //        DropDownList1.Items.Insert(0, "Call Not Picked");
    //        DropDownList1.Items.Insert(1, "User Busy");
    //        DropDownList1.Items.Insert(2, "Not Interested");
    //        DropDownList1.Items.Insert(2, "Do Not Distrub");
    //    }

    //}
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            string decodedText = HttpUtility.HtmlDecode(e.Row.Cells[1].Text);
            e.Row.Cells[1].Text = decodedText;
        }
    }
    protected void btnconvert0_Click(object sender, EventArgs e)
    {
        cmd = con.CreateCommand();
        con.Open();
        cmmd = " update enquiry_master set customer_type='Rejected' where customer_id ='" + Label4.Text + "'  ";
        cmd.CommandText = cmmd;
        cmd.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Converted Sucessfully');", true);
        followup_status();
    }
    protected void btnconvert1_Click(object sender, EventArgs e)
    {
        div5.Visible = true;
        //cmd = con.CreateCommand();
        //con.Open();
        //cmmd = " update enquiry_master set customer_type='Converted' where customer_id ='" + Label4.Text + "'  ";
        //cmd.CommandText = cmmd;
        //cmd.ExecuteNonQuery();
        //con.Close();
        //ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Converted Sucessfully');", true);
        //followup_status();
       // sms();

    }
    public void converted()
    {
        cmd = con.CreateCommand();
        SqlCommand cmd1 = con.CreateCommand();
        con.Open();
        cmmd = " update tbl_medors_lead_master set ctype='Converted' where lead_id ='" + Label4.Text + "'  ";
        string cmmd1 = " update tbl_meeting_details set type='Converted',md=getdate() where lead_id ='" + Label4.Text + "'  ";
        cmd.CommandText = cmmd;
        cmd1.CommandText = cmmd1;
        cmd.ExecuteNonQuery();
        cmd1.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Converted Sucessfully');", true);
        followup_status();
    }

    string s_mob, s_name = "";
    public void sms()
    {

        SqlDataAdapter adap = new SqlDataAdapter("select * from user_master where user_id='" + Session["Username"].ToString() + "' ", con);
        DataSet ds = new DataSet();
        adap.Fill(ds);
        if (ds.Tables[0].Rows.Count != 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];
            s_mob = dr["name"].ToString();
            s_name = dr["contact_no"].ToString();
        }

        string senderusername = "t1vgconline";
        string senderpassword = "88358094";
        string sendermsg = "Thank you for placing order to Genuine CRM, we assure you a serve the best.Stay in touch (" + s_name + "," + s_mob + ",For support: 8527394300)";
        string senderid = "GENCRM";

        string sURL;
        StreamReader objReader;

        sURL = "http://nimbusit.co.in/api/swsend.asp?username=" + senderusername + "&password=" + senderpassword + "&sender=" + senderid + "&sendto=" + Label6.Text.Trim() + "&message=" + sendermsg + "";

        WebRequest wrGETURL;
        wrGETURL = WebRequest.Create(sURL);
        try
        {
            Stream objStream;
            objStream = wrGETURL.GetResponse().GetResponseStream();
            objReader = new StreamReader(objStream);
            objReader.Close();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }

    }
    public void sms1()
    {

        SqlDataAdapter adap = new SqlDataAdapter("select * from user_master where user_id='" + Session["Username"].ToString() + "' ", con);
        DataSet ds = new DataSet();
        adap.Fill(ds);
        if (ds.Tables[0].Rows.Count != 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];
            s_mob = dr["name"].ToString();
            s_name = dr["contact_no"].ToString();
        }

        string senderusername = "t1vgconline";
        string senderpassword = "88358094";
        string sendermsg = "Namaskar " + Label5.Text + " !, We tried reaching you regarding CRM/ERP Software from Genuine CRM but couldn't connect, Please call (" + s_name + "," + s_mob + ")";
        string senderid = "GENCRM";

        string sURL;
        StreamReader objReader;

        sURL = "http://nimbusit.co.in/api/swsend.asp?username=" + senderusername + "&password=" + senderpassword + "&sender=" + senderid + "&sendto=" + Label6.Text.Trim() + "&message=" + sendermsg + "";

        WebRequest wrGETURL;
        wrGETURL = WebRequest.Create(sURL);
        try
        {
            Stream objStream;
            objStream = wrGETURL.GetResponse().GetResponseStream();
            objReader = new StreamReader(objStream);
            objReader.Close();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }

    }
    public void sms2()
    {

        SqlDataAdapter adap = new SqlDataAdapter("select * from user_master where user_id='" + Session["Username"].ToString() + "' ", con);
        DataSet ds = new DataSet();
        adap.Fill(ds);
        if (ds.Tables[0].Rows.Count != 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];
            s_mob = dr["name"].ToString();
            s_name = dr["contact_no"].ToString();
        }

        string senderusername = "t1vgconline";
        string senderpassword = "88358094";
        string sendermsg = txtremark.Text.Trim();
        string senderid = "GENCRM";

        string sURL;
        StreamReader objReader;

        sURL = "http://nimbusit.co.in/api/swsend.asp?username=" + senderusername + "&password=" + senderpassword + "&sender=" + senderid + "&sendto=" + Label6.Text.Trim() + "&message=" + sendermsg + "";

        WebRequest wrGETURL;
        wrGETURL = WebRequest.Create(sURL);
        try
        {
            Stream objStream;
            objStream = wrGETURL.GetResponse().GetResponseStream();
            objReader = new StreamReader(objStream);
            objReader.Close();
        }
        catch (Exception ex)
        {
            ex.ToString();
        }

    }

    protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "delete11")
        {
            if (GridView3.Rows.Count > 0)
            {
                DataTable dt = (DataTable)ViewState["contact_details"];
                GridViewRow row = (GridViewRow)(((Control)e.CommandSource).NamingContainer);
                DataTable dtCurrentTable = new DataTable();
                int RowIndex = row.RowIndex;
                dtCurrentTable = dt;
                dtCurrentTable.Rows.RemoveAt(row.RowIndex);
                GridView3.DataSource = dt;
                GridView3.DataBind();
                Label14.Text = this.GridView3.Rows.Count.ToString();
            }
        }
    }
    public void bind_temp_contact_details()
    {
        DataTable dt = new DataTable();
        dt.Columns.AddRange(
              new DataColumn[2] 
            { 
                                new DataColumn("amount", typeof(string)),

                new DataColumn("remdate", typeof(string))
            }

          );
        ViewState["contact_details"] = dt;
        GridView3.DataSource = (DataTable)ViewState["contact_details"];
        GridView3.DataBind();
    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        int a = int.Parse(Label14.Text);
        if (a < 3)
        {

            DataTable dt = (DataTable)ViewState["contact_details"];
            dt.Rows.Add(txtintamnt.Text.Trim(), txtremdate.Text.Trim());
            ViewState["contact_details"] = dt;
            GridView3.DataSource = (DataTable)ViewState["contact_details"];
            GridView3.DataBind();
            txtintamnt.Text = txtremdate.Text = string.Empty;
            Label14.Text = this.GridView3.Rows.Count.ToString();
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Limit Exceed');", true);
        }
    }
    protected void TextBox2_TextChanged(object sender, EventArgs e)
    {
        double c = double.Parse(txttotlbooked.Text) - double.Parse(txtadvance.Text);
        txtpending.Text = c.ToString("n2");

    }
    //protected void Button1_Click(object sender, EventArgs e)
    //{
    //    if (Label14.Text == "0")
    //    {
    //        cmd = con.CreateCommand();
    //        con.Open();
    //        string traveldate = DateTime.ParseExact(Label13.Text.Trim(), "dd-MMM-yy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
    //        string remdate = DateTime.ParseExact(txtremdate.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
    //        cmd.CommandText = " DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:40:00';declare @date DATETIME;set @date=(SELECT (@d + CAST(@t AS datetime)))  insert into tbl_booking_summery values('" + Label4.Text + "','" + Label5.Text + "','" + Label6.Text + "','" + traveldate + "','" + Label10.Text + "','" + DropDownList1.SelectedValue + "','" + txttotlbooked.Text + "','" + txtadvance.Text + "','" + txtpending.Text + "','','','" + Session["Username"].ToString() + "',@date,'')";
    //        cmd.ExecuteNonQuery();
    //        con.Close();
    //        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Submit Sucessfully');", true);
    //    }
    //    else
    //    {
    //        int j;
    //        for (j = 0; j < GridView3.Rows.Count; j++)
    //        {
    //            Label intallmnt_amount = (Label)GridView3.Rows[j].FindControl("lbladdress");
    //            Label rem_date = (Label)GridView3.Rows[j].FindControl("lblpincode");

    //            cmd = con.CreateCommand();
    //            con.Open();
    //            string traveldate = DateTime.ParseExact(Label13.Text.Trim(), "dd-MMM-yy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
    //            string remdate = DateTime.ParseExact(rem_date.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
    //            cmd.CommandText = " DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:40:00';declare @date DATETIME;set @date=(SELECT (@d + CAST(@t AS datetime)))  insert into tbl_booking_summery values('" + Label4.Text + "','" + Label5.Text + "','" + Label6.Text + "','" + traveldate + "','" + Label10.Text + "','" + DropDownList1.SelectedValue + "','" + txttotlbooked.Text + "','" + txtadvance.Text + "','" + txtpending.Text + "','" + txtintamnt.Text + "','" + remdate + "','" + Session["Username"].ToString() + "',@date,'Unpaid')";
    //            cmd.ExecuteNonQuery();
    //            con.Close();
    //            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Submit Sucessfully');", true);
    //        }
    //    }
    //    converted();
       
    //}
    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtremark.Enabled = true;
        txtremark.Text = "";
        if (RadioButtonList1.SelectedValue == "1")
        {
            div5.Visible = false;
            divf.Visible = true;
            divfooter.Visible = true;
            div2.Visible = false;
            div3.Visible = false;
            div4.Visible = false;
           
        }
        if (RadioButtonList1.SelectedValue == "2" )
        {
            div5.Visible = false;
            divf.Visible = false;
          
            divre.Visible = true;
            divfooter.Visible = true;
            div2.Visible = false;
            div3.Visible = false;
            div4.Visible = false;
        }
        if (RadioButtonList1.SelectedValue == "5")
        {
            div5.Visible = false;
            divf.Visible = false;

            divre.Visible = true;
            divfooter.Visible = true;
            div2.Visible = false;
            div3.Visible = false;
            div4.Visible = false;

            txtremark.Text = "Phone Not Picked";
            txtremark.Enabled = false;
        }
        if (RadioButtonList1.SelectedValue == "3")
        {
            divfooter.Visible = true;
            div5.Visible = false;
            divf.Visible = false;
            div2.Visible = false;
            div3.Visible = false;
            div4.Visible = false;
          
        }
        if (RadioButtonList1.SelectedValue == "4")
        {
            divfooter.Visible = true;
            div5.Visible = false;
            divf.Visible = false;
            div2.Visible = true;
            div3.Visible = true;
            div4.Visible = true;
        }
        

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
        cls.gridbind(GridView2, "select * from tbl_meeting_details where assign_to='" + ddlemailid.SelectedValue + "' order by md desc ");

    }
    protected void GridView4_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView4.Rows[e.RowIndex];
        con.Open();
        SqlCommand cmd = new SqlCommand("delete FROM tbl_meeting_details where id='" + Convert.ToInt32(GridView4.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Deleted Sucessfully');", true);
        cls.gridbind(GridView4, "select * from tbl_meeting_details where assign_to='" + ddlemailid.SelectedValue + "' order by md desc ");

    }
    protected void Button5_Click(object sender, EventArgs e)
    {

        SqlCommand cmd = new SqlCommand("update tbl_medors_lead_master set mob='" + Label6.Text.Trim() + "',phone='" + Label12.Text.Trim() + "',email_id='" + Label3.Text.Trim() + "',address='" + Label7.Text.Trim() + "' where lead_id='" + Label4.Text + "'", con);
        con.Open();
        cmd.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Updated Sucessfully');", true);
    }
}