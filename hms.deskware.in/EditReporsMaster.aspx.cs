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

public partial class EditReporsMaster : System.Web.UI.Page
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

        }
    }
    protected void btnOK_Click(object sender, EventArgs e)
    {
        string command = "";
        command = "select * from tbl_reportMaster where  UNQUEID ='" + TextBox24.Text + "' and SchooName='"+ddlschoolname.SelectedValue+"' and session='"+ddlsession.SelectedValue+"'";
        SqlDataAdapter adap = new SqlDataAdapter(command, con);
        DataSet ds = new DataSet();
        adap.Fill(ds);
        if (ds.Tables[0].Rows.Count != 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];
            ltrSchool.Text = dr["SchooName"].ToString();
            ltrClass.Text = dr["CLASS"].ToString();
            TextBox1.Text = dr["NAME"].ToString();
            TextBox2.Text = dr["FATHERNAME"].ToString();
            TextBox3.Text = dr["CLASS"].ToString();
            TextBox4.Text = dr["UNQUEID"].ToString();

            TextBox20.Text = Convert.ToDateTime(dr["DOB"]).ToString("MM/dd/yyyy").Replace("-","/");
            TextBox21.Text = dr["AGE"].ToString();
            DropDownList3.SelectedValue = dr["SEX"].ToString();
            TextBox23.Text = dr["BLOODGROUP"].ToString();
            TextBox5.Text = dr["HEIGHT"].ToString();
            TextBox6.Text = dr["WEIGTH"].ToString();
            TextBox7.Text = dr["BMI"].ToString();
            TextBox8.Text = dr["OBESITYKEVEL"].ToString();
            TextBox9.Text = dr["IDELHEIGHTFORTHISAGESHOULDBE"].ToString();
            TextBox10.Text = dr["DEVIATIONFROMTHEIDEALHEIGHTIS"].ToString();
            DropDownList1.SelectedValue = dr["DISTANTVISIONrt"].ToString();
            DropDownList2.SelectedValue = dr["DISTANTVISIONlt"].ToString();
            TextBox13.Text = dr["NEARVISIONrt"].ToString();
            TextBox14.Text = dr["NEARVISIONlt"].ToString();

            TextBox30.Text = Convert.ToDateTime(dr["examdate"]).ToString("MM/dd/yyyy").Replace("-","/");
            ltrsession.Text = dr["session"].ToString();
            TextBox32.Text = dr["eyesightother"].ToString();
            string chklstSalary = dr["EYEWITHOUTSPECTSChk"].ToString();

            foreach (string item in chklstSalary.Split(new char[] { ',' }))
            {
                foreach (ListItem item1 in CheckBoxList4.Items)
                {
                    if (item.Contains(item1.Value))
                    {
                        item1.Selected = true;
                    }
                }
            }


            string chklstSalary2 = dr["DENTALCHECKUPchk"].ToString();

            foreach (string item in chklstSalary2.Split(new char[] { ',' }))
            {
                foreach (ListItem item1 in CheckBoxList1.Items)
                {
                    if (item.Contains(item1.Value))
                    {
                        item1.Selected = true;
                    }
                }
            }

            TextBox28.Text = dr["DENTALCHECKUPchkOther"].ToString();


            string chklstSalary3 = dr["PERSONALHYGIENEIMMUNISATIONckh"].ToString();

            foreach (string item in chklstSalary3.Split(new char[] { ',' }))
            {
                foreach (ListItem item1 in CheckBoxList2.Items)
                {
                    if (item.Contains(item1.Value))
                    {
                        item1.Selected = true;
                    }
                }
            }
            TextBox31.Text = dr["PERSONALHYGIENEIMMUNISATIONckhOther"].ToString();

            string chklstSalary4 = dr["OBSSERVATIONANDIMPORTANTFINDINGSchk"].ToString();

            foreach (string item in chklstSalary4.Split(new char[] { ',' }))
            {
                foreach (ListItem item1 in CheckBoxList5.Items)
                {
                    if (item.Contains(item1.Value))
                    {
                        item1.Selected = true;
                    }
                }
            }
            TextBox17.Text = dr["OBSSERVATIONANDIMPORTANTFINDINGSchkOther"].ToString();
            TextBox18.Text = dr["RemakrsText1"].ToString();
            TextBox16.Text = dr["RemakrsText2"].ToString();
            TextBox19.Text = dr["RemakrsText3"].ToString();
            TextBox29.Text = dr["RemakrsOthers"].ToString();

            string chklstSalary5 = dr["REFERREDTOchk"].ToString();

            foreach (string item in chklstSalary5.Split(new char[] { ',' }))
            {
                foreach (ListItem item1 in CheckBoxList3.Items)
                {
                    if (item.Contains(item1.Value))
                    {
                        item1.Selected = true;
                    }
                }
            }
            //   TextBox1.Text = dr["REFERREDTOchk"].ToString();

            //TextBox15.Text = dr["PHYSICIAN"].ToString();
            //TextBox26.Text = dr["DENTIST"].ToString();
            //TextBox27.Text = dr["EYESIGHTCHECKUPBY"].ToString();
            bind_doctor();
            div1.Visible = true;
            div2.Visible = false;


        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Invalid Unique ID');", true);
        }

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
        List<String> YrStrList = new List<string>();
        foreach (ListItem item  in CheckBoxList4.Items)
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



        List<String> YrStrList2 = new List<string>();
        foreach (ListItem item2 in CheckBoxList1.Items)
        {
            if (item2.Selected)
            {
                YrStrList2.Add(item2.Value);
            }
            else
            {
            }
        }
        String YrStr2 = String.Join(",", YrStrList2.ToArray());



        List<String> YrStrList3 = new List<string>();
        foreach (ListItem item3 in CheckBoxList2.Items)
        {
            if (item3.Selected)
            {
                YrStrList3.Add(item3.Value);
            }
            else
            {
            }
        }
        String YrStr3 = String.Join(",", YrStrList3.ToArray());

        List<String> YrStrList4 = new List<string>();
        foreach (ListItem item4 in CheckBoxList5.Items)
        {
            if (item4.Selected)
            {
                YrStrList4.Add(item4.Value);
            }
            else
            {
            }
        }
        String YrStr4 = String.Join(",", YrStrList4.ToArray());


        List<String> YrStrList5 = new List<string>();
        foreach (ListItem item5 in CheckBoxList3.Items)
        {
            if (item5.Selected)
            {
                YrStrList5.Add(item5.Value);
            }
            else
            {
            }
        }
        String YrStr5 = String.Join(",", YrStrList5.ToArray());
        if (TextBox30.Text != "")
        {
           
            string command2 = "";
            string examdate = DateTime.ParseExact(TextBox30.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            string DOB1 = DateTime.ParseExact(TextBox20.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
            command2 = "Update tbl_reportMaster set NAME = '" + TextBox1.Text + "', FATHERNAME ='" + TextBox2.Text + "' , SchooName ='" + ltrSchool.Text + "', CLASS ='" + TextBox3.Text + "', UNQUEID ='" + TextBox4.Text + "', DOB ='" + DOB1 + "', AGE ='" + TextBox21.Text + "', SEX ='" + DropDownList3.SelectedValue + "', BLOODGROUP ='" + TextBox23.Text + "', HEIGHT ='" + TextBox5.Text + "', WEIGTH ='" + TextBox6.Text + "', BMI ='" + TextBox7.Text + "', OBESITYKEVEL ='" + TextBox8.Text + "', IDELHEIGHTFORTHISAGESHOULDBE ='" + TextBox9.Text + "', DEVIATIONFROMTHEIDEALHEIGHTIS ='" + TextBox10.Text + "', DISTANTVISIONrt ='" + DropDownList1.SelectedValue + "', DISTANTVISIONlt ='" + DropDownList2.SelectedValue + "', NEARVISIONrt ='" + TextBox13.Text + "', NEARVISIONlt ='" + TextBox14.Text + "', EYEWITHOUTSPECTSChk ='" + YrStr + "', DENTALCHECKUPchk ='" + YrStr2 + "', DENTALCHECKUPchkOther ='" + TextBox28.Text + "', PERSONALHYGIENEIMMUNISATIONckh ='" + YrStr3 + "', PERSONALHYGIENEIMMUNISATIONckhOther ='" + TextBox31.Text + "', OBSSERVATIONANDIMPORTANTFINDINGSchk ='" + YrStr4 + "', OBSSERVATIONANDIMPORTANTFINDINGSchkOther ='" + TextBox17.Text + "', RemakrsText1 ='" + TextBox18.Text + "', RemakrsText2 ='" + TextBox16.Text + "', RemakrsText3 ='" + TextBox19.Text + "', RemakrsOthers ='" + TextBox29.Text + "', REFERREDTOchk ='" + YrStr5 + "', PHYSICIAN ='" + TextBox15.Text + "', DENTIST ='" + TextBox26.Text + "', EYESIGHTCHECKUPBY ='" + TextBox27.Text + "',UpdateDate =GETDATE() ,EXAMDATE ='" + examdate + "',eyesightother='" + TextBox32.Text.Trim() + "' WHERE UNQUEID =  '" + TextBox4.Text + "' and session='" + ltrsession.Text + "' and SchooName  ='" + ltrSchool.Text + "' ";
            cmd = con.CreateCommand();
            cmd.CommandText = command2;
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Updated Sucessfully');", true);


            Response.Redirect("new_print.aspx?id=" + TextBox4.Text + "&school_name=" + ltrSchool.Text + "&type=U&session=" + ltrsession.Text + "");
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Please Enter Exam Date');", true);
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
            command = "select * from tbl_height_master where age='" + TextBox21.Text.Trim() + "' AND sex ='" + DropDownList3.SelectedValue+ "'";
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
        Response.Redirect("EditReporsMaster.aspx");

    }

    protected void Button5_Click(object sender, EventArgs e)
    {
        cmd = con.CreateCommand();
        con.Open();
        cmd.CommandText = "delete from tbl_reportMaster where  UNQUEID =  '" + TextBox4.Text + "' and session='" + ltrsession.Text + "' and SchooName  ='" + ltrSchool.Text + "'";
        cmd.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Deleted Sucessfully');", true);

    }
}