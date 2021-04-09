using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ReporsMaster : System.Web.UI.Page
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
            cls.bind_ddl(ddlschoolname, "select * from tbl_school_master", "name", "name");
            cls.bind_ddl(ddlsession, "select * from tble_session_master order by id desc", "session", "session");

            cls.bind_ddl(ddlClass, "Select (class_name+'-'+section) as class_name  from tbl_class_master where school_name='" + ddlschoolname.SelectedValue + "'", "class_name", "class_name");

            ViewState["SchoolName"] = ddlschoolname.SelectedItem.Text;
            ViewState["Class"] = ddlClass.SelectedItem.Text;
            ViewState["session"] = ddlsession.SelectedItem.Text;
            ltrSchool.Text = ViewState["SchoolName"].ToString();
            ltrClass.Text = ViewState["Class"].ToString();
            ltrsession.Text = ViewState["session"].ToString();
            TextBox3.Text = ViewState["Class"].ToString();

            unique_id();
            bind_doctor();
           
        }
    }
    protected void ddlschoolname_SelectedIndexChanged(object sender, EventArgs e)
    {
        cls.bind_ddl(ddlClass, "Select (class_name+'-'+section) as class_name  from tbl_class_master where school_name='" + ddlschoolname.SelectedValue + "'", "class_name", "class_name");
       
        ViewState["SchoolName"] = ddlschoolname.SelectedItem.Text;
        ViewState["Class"] = ddlClass.SelectedItem.Text;
        ViewState["session"] = ddlsession.SelectedItem.Text;
        ltrSchool.Text = ViewState["SchoolName"].ToString();
        ltrClass.Text = ViewState["Class"].ToString();
        ltrsession.Text = ViewState["session"].ToString();
        TextBox3.Text = ViewState["Class"].ToString();

        unique_id();
        bind_doctor();
    }
    protected void btnOK_Click(object sender, EventArgs e)
    {
        //div1.Visible = true;
        //div2.Visible = false;
        //ViewState["SchoolName"] = ddlschoolname.SelectedItem.Text;
        //ViewState["Class"] = ddlClass.SelectedItem.Text;
        //ViewState["session"] = ddlsession.SelectedItem.Text;
        //ltrSchool.Text = ViewState["SchoolName"].ToString();
        //ltrClass.Text = ViewState["Class"].ToString();
        //ltrsession.Text = ViewState["session"].ToString();
        //TextBox3.Text = ViewState["Class"].ToString();
        //unique_id();
        //bind_doctor();
    }
    public void bind_doctor()
    {
        string command, command1, command2 = "";
        command = "select * from tbl_doctor_master where school_name='" + ddlschoolname.SelectedValue + "' AND type ='P'";
        command1 = "select * from tbl_doctor_master where school_name='" + ddlschoolname.SelectedValue + "' AND type ='D'";
        command2 = "select * from tbl_doctor_master where school_name='" + ddlschoolname.SelectedValue + "' AND type ='E'";
        SqlDataAdapter adap = new SqlDataAdapter(command, con);
        SqlDataAdapter adap1 = new SqlDataAdapter(command1, con);
        SqlDataAdapter adap2 = new SqlDataAdapter(command2, con);
        DataSet ds = new DataSet();
        DataSet ds1 = new DataSet();
        DataSet ds2 = new DataSet();
        adap.Fill(ds);
        adap1.Fill(ds1);
        adap2.Fill(ds2);
        if (ds.Tables[0].Rows.Count != 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];
            TextBox15.Text = dr["doctor_name"].ToString() + " || " + dr["reg_no"].ToString();
        }
        if (ds1.Tables[0].Rows.Count != 0)
        {
            DataRow dr1 = ds1.Tables[0].Rows[0];
            TextBox26.Text = dr1["doctor_name"].ToString() + " || " + dr1["reg_no"].ToString();
        }
        if (ds2.Tables[0].Rows.Count != 0)
        {
            DataRow dr2 = ds2.Tables[0].Rows[0];
            TextBox27.Text = dr2["doctor_name"].ToString() + " || " + dr2["reg_no"].ToString();
        }
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        try
        {
            if (TextBox30.Text!="")
            {
            unique_id();
            cmd = con.CreateCommand();
            con.Open();
            cmd.CommandText = "SP_report_mstr";
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter(@"SchooName", ltrSchool.Text));
            cmd.Parameters.Add(new SqlParameter(@"CLASS", ltrClass.Text));
            cmd.Parameters.Add(new SqlParameter(@"UNQUEID",TextBox4 .Text.Trim()));
            cmd.Parameters.Add(new SqlParameter(@"NAME", TextBox1.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter(@"FATHERNAME", TextBox2.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter(@"DOB", DateTime.ParseExact(TextBox20.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture)));
            cmd.Parameters.Add(new SqlParameter(@"AGE", TextBox21.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter(@"SEX", DropDownList3.SelectedValue));
            cmd.Parameters.Add(new SqlParameter(@"BLOODGROUP",TextBox23.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter(@"HEIGHT", TextBox5.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter(@"WEIGTH", TextBox6.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter(@"BMI", TextBox7.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter(@"OBESITYKEVEL", TextBox8.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter(@"IDELHEIGHTFORTHISAGESHOULDBE", TextBox9.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter(@"DEVIATIONFROMTHEIDEALHEIGHTIS", TextBox10.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter(@"DISTANTVISIONrt", DropDownList1.SelectedValue));
            cmd.Parameters.Add(new SqlParameter(@"DISTANTVISIONlt", DropDownList2.SelectedValue));
            cmd.Parameters.Add(new SqlParameter(@"NEARVISIONrt", TextBox13.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter(@"NEARVISIONlt", TextBox14.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter(@"EXAMDATE", DateTime.ParseExact(TextBox30.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture)));
            cmd.Parameters.Add(new SqlParameter(@"session", ltrsession.Text));
            cmd.Parameters.Add(new SqlParameter(@"eyesightother", TextBox32.Text.Trim()));
            List<String> YrStrList = new List<string>();
            foreach (ListItem item in CheckBoxList4.Items)
            {
                if (item.Selected)
                {
                    YrStrList.Add(item.Value);
                }
                else
                {
                }
            }
            String YrStr = String.Join(",", YrStrList.ToArray());
            cmd.Parameters.Add(new SqlParameter(@"EYEWITHOUTSPECTSChk", YrStr));

            List<String> YrStrList2 = new List<string>();
            foreach (ListItem item in CheckBoxList1.Items)
            {
                if (item.Selected)
                {
                    YrStrList2.Add(item.Value);
                }
                else
                {
                }
            }
            String YrStr2 = String.Join(",", YrStrList2.ToArray());
            cmd.Parameters.Add(new SqlParameter(@"DENTALCHECKUPchk", YrStr2));
            cmd.Parameters.Add(new SqlParameter(@"DENTALCHECKUPchkOther", TextBox28.Text.Trim()));

              List<String> YrStrList3 = new List<string>();
            foreach (ListItem item in CheckBoxList2.Items)
            {
                if (item.Selected)
                {
                    YrStrList3.Add(item.Value);
                }
                else
                {
                }
            }
            String YrStr3 = String.Join(",", YrStrList3.ToArray());
            cmd.Parameters.Add(new SqlParameter(@"PERSONALHYGIENEIMMUNISATIONckh", YrStr3));

           cmd.Parameters.Add(new SqlParameter(@"PERSONALHYGIENEIMMUNISATIONckhOther", TextBox31.Text.Trim()));

           List<String> YrStrList4 = new List<string>();
           foreach (ListItem item in CheckBoxList5.Items)
           {
               if (item.Selected)
               {
                   YrStrList4.Add(item.Value);
               }
               else
               {
               }
           }
           String YrStr4 = String.Join(",", YrStrList4.ToArray());
           cmd.Parameters.Add(new SqlParameter(@"OBSSERVATIONANDIMPORTANTFINDINGSchk", YrStr4));
            cmd.Parameters.Add(new SqlParameter(@"OBSSERVATIONANDIMPORTANTFINDINGSchkOther", TextBox17.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter(@"RemakrsText1", TextBox18.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter(@"RemakrsText2", TextBox16.Text.Trim()));

            
            cmd.Parameters.Add(new SqlParameter(@"RemakrsText3", TextBox19.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter(@"RemakrsOthers", TextBox29.Text.Trim()));

            List<String> YrStrList5 = new List<string>();
            foreach (ListItem item in CheckBoxList3.Items)
            {
                if (item.Selected)
                {
                    YrStrList5.Add(item.Value);
                }
                else
                {
                }
            }
            String YrStr5 = String.Join(",", YrStrList5.ToArray());

               cmd.Parameters.Add(new SqlParameter(@"REFERREDTOchk", YrStr5));
            cmd.Parameters.Add(new SqlParameter(@"PHYSICIAN", TextBox15.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter(@"DENTIST", TextBox26.Text.Trim()));
            cmd.Parameters.Add(new SqlParameter(@"EYESIGHTCHECKUPBY", TextBox27.Text.Trim()));



            cmd.Parameters.Add(new SqlParameter(@"CreatedBy", Session["Username"].ToString()));
            cmd.Parameters.Add(new SqlParameter(@"action", "I"));
            SqlParameter parm = new SqlParameter("@return_value", SqlDbType.NVarChar);
            parm.Direction = ParameterDirection.ReturnValue;
            cmd.Parameters.Add(parm);
            cmd.ExecuteNonQuery();
            con.Close();
            string actn = Convert.ToString(parm.Value);
            if (actn == "1")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Created Sucessfully');", true);
                Response.Redirect("new_print.aspx?id=" + TextBox4.Text + "&school_name=" + ltrSchool.Text+"&type=S&session="+ltrsession.Text+"");
                unique_id();
            }
            else if (actn == "2")
            {
                ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Deatils Already Exists');", true);
            }
        }
          else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Please Enter Exam Date');", true);
            }  
        }
        catch (Exception ex)
        {
        }
    }


    protected void TextBox20_TextChanged(object sender, EventArgs e)
    {

        try
        {

            string date1 = DateTime.ParseExact(TextBox20.Text, "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("dd/MM/yyyy", CultureInfo.InvariantCulture);
            var date = DateTime.ParseExact(date1, "dd/MM/yyyy", System.Globalization.CultureInfo.InvariantCulture);
            var age = (DateTime.Today.Year - date.Year);
            //Console.WriteLine(age);
            TextBox21.Text = age.ToString();



            //string dtVal = TextBox20.Text.Trim();
            //DateTime Dob = Convert.ToDateTime(dtVal);
            //TextBox21.Text = CalculateAge(Dob);
        }
        catch { }
    }



    private string CalculateAge(DateTime Dob)
    {
        DateTime Now = DateTime.Now;
        int Years = new DateTime(DateTime.Now.Subtract(Dob).Ticks).Year - 1;
        DateTime PastYearDate = Dob.AddYears(Years);
        int Months = 0;
        for (int i = 1; i <= 12; i++)
        {
            if (PastYearDate.AddMonths(i) == Now)
            {
                Months = i;
                break;
            }
            else if (PastYearDate.AddMonths(i) >= Now)
            {
                Months = i - 1;
                break;
            }
        }
        int Days = Now.Subtract(PastYearDate.AddMonths(Months)).Days;
        int Hours = Now.Subtract(PastYearDate).Hours;
        int Minutes = Now.Subtract(PastYearDate).Minutes;
        int Seconds = Now.Subtract(PastYearDate).Seconds;
        //return String.Format("Age: {0} Year(s) {1} Month(s) {2} Day(s) {3} Hour(s) {4} Second(s)",
        //                    Years, Months, Days, Hours, Seconds);
        return String.Format("{0}",
                        Years, Months, Days, Hours, Seconds);
    }
    protected void TextBox5_TextChanged(object sender, EventArgs e)
    {
        //if (TextBox22.Text == "")
        //{
        //    ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Please Enter Sex');", true);
        //    TextBox5.Text = "";
        //}
        //else
        {
            string command = "";
            command = "select * from tbl_height_master where age='" + TextBox21.Text.Trim() + "' AND sex ='" + DropDownList3.SelectedValue + "'";
            SqlDataAdapter adap = new SqlDataAdapter(command, con);
            DataSet ds = new DataSet();
            adap.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dr = ds.Tables[0].Rows[0];
                TextBox9.Text = dr["height"].ToString();

                double a = double.Parse(TextBox9.Text);
                double b = double.Parse(TextBox5.Text);
                double d = b - a;
                TextBox10.Text = d.ToString("n2");
            }
        }
    }
    protected void TextBox6_TextChanged(object sender, EventArgs e)
    {
        double a = double.Parse(TextBox6.Text);
        double b = double.Parse(TextBox5.Text);
        double d = (a / (b * b)) * 10000;
        TextBox7.Text = d.ToString("n2");

        string command = "";
        command = "select * from tbl_bmi_master where age='" + TextBox21.Text.Trim() + "' AND sex ='" + DropDownList3.SelectedValue + "'";
            SqlDataAdapter adap = new SqlDataAdapter(command, con);
            DataSet ds = new DataSet();
            adap.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dr = ds.Tables[0].Rows[0];
                double FROM = double.Parse(dr["range_from"].ToString());
                double TO = double.Parse(dr["range_TO"].ToString());
                double X = double.Parse(TextBox7.Text.ToString());

                if (X >= FROM && X <= TO)
                {
                    TextBox8.Text = "Normal";
                }
                if (X <= FROM)
                {
                    TextBox8.Text = "Under Weight";
                }
                if (X >= TO)
                {
                    TextBox8.Text = "Over Weight";
                }

            }

    }
    protected void Button4_Click(object sender, EventArgs e)
    {
        TextBox1.Text = TextBox2.Text  = TextBox20.Text = TextBox21.Text = TextBox23.Text = TextBox5.Text = TextBox6.Text = TextBox7.Text = TextBox8.Text = TextBox9.Text = TextBox10.Text = TextBox32.Text = TextBox28.Text = TextBox31.Text = TextBox17.Text = TextBox29.Text = "";

        foreach (Control c in Controls)
        {
            if (c is CheckBox)
            {
                ((CheckBox)c).Checked = false;
            }
        }
     

        CheckBoxList4.SelectedValue = "NAD";
        CheckBoxList1.SelectedValue = "GOOD ORAL HYGIENE";
        CheckBoxList5.SelectedValue = "CHILD IS NORMAL AND HEALTHY";
        CheckBoxList3.SelectedValue = "NILL";
        foreach (ListItem item in CheckBoxList2.Items)
        {
            if (item.Value == "BCG SEEN" || item.Value == "HYGIENE GOOD")
            {
                item.Selected = true;
            }
            else
            {
                item.Selected = false;
            }
        }
        DropDownList1.SelectedValue = DropDownList2.SelectedValue = "6/6";
        TextBox13.Text = TextBox14.Text = "N6";
        TextBox18.Text = "AVOID JUNK FOOD";
        TextBox16.Text = "EAT GREEN LEAFY VEGETABLES AND FRUITS";
        TextBox19.Text = "GO FOR MORNING WALK DAILY";

        unique_id();

    }
    public void unique_id()
    {
        cmd = con.CreateCommand();
        con.Open();
        cmd.CommandText = "  SELECT  RIGHT('0000'+ isnull(CONVERT(VARCHAR,max(cast(UNQUEID as bigint))+1),0),4) as id FROM tbl_reportMaster where SchooName='" + ltrSchool.Text+ "' and session='"+ltrsession.Text+"'";
        TextBox4.Text = cmd.ExecuteScalar().ToString();
        con.Close();
        if (TextBox4.Text == "0000")
        {
            TextBox4.Text = "0001";
        }
    }

    protected void ddlClass_SelectedIndexChanged(object sender, EventArgs e)
    {
        ltrClass.Text = ddlClass.SelectedValue;
        TextBox3.Text = ddlClass.SelectedValue;
    }
}