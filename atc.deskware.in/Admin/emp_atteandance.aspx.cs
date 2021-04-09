﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_emp_atteandance : System.Web.UI.Page
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
            cls.gridbind(GridView2, "select id,name from tbl_admin_employee_master order by name asc");
        }
    }
    protected void ChkAllRows(object sender, EventArgs e)
    {

        CheckBox chkall = (CheckBox)GridView2.HeaderRow.FindControl("chkAll");
        for (int i = 0; i < GridView2.Rows.Count; i++)
        {
            CheckBox chkrow = (CheckBox)GridView2.Rows[i].FindControl("chkAll0");
            if (chkall.Checked == true)
            {
                chkrow.Checked = true;
            }
            else
            {
                chkrow.Checked = false;
            }
        }


    }
    double perday = 0;
    protected void Button1_Click(object sender, EventArgs e)
    {
        int count = 0;
        int j;
        for (j = 0; j < GridView2.Rows.Count; j++)
        {
            CheckBox cb = (CheckBox)GridView2.Rows[j].FindControl("chkAll0");
            Label id = (Label)GridView2.Rows[j].FindControl("Label11");
            Label name = (Label)GridView2.Rows[j].FindControl("Label12");
            RadioButtonList RadioButtonList1 = (RadioButtonList)GridView2.Rows[j].FindControl("RadioButtonList1");

            SqlDataAdapter adap = new SqlDataAdapter("select salery from tbl_admin_employee_master where id=" + id.Text + "  ", con);
            DataSet ds = new DataSet();
            adap.Fill(ds);
            {
                DataRow dr = ds.Tables[0].Rows[0];
                TextBox1.Text = dr["salery"].ToString();
            }

            string date = DateTime.ParseExact(txtdate.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);

            int year = System.DateTime.Now.Year;
            int month = System.DateTime.Now.Month;

            double days = DateTime.DaysInMonth(year, month);
            //  bind_salery();

            if (RadioButtonList1.SelectedValue != "P")
            {
                perday = Convert.ToDouble(double.Parse(TextBox1.Text) / days);
            }
            //else
            //{
            //    perday = 0;
            //}

            if (cb.Checked == true)
            {

                //SqlCommand cmd1 = con.CreateCommand();
                //con.Open();
                //cmd1.CommandText = "Select Count(*) from tbl_admin_employee_ledger_master where  cast(date as Date)='" + date + "' and debit!='0.0000' ";

                //int a = int.Parse(cmd1.ExecuteScalar().ToString());
                //con.Close();
                //if (a == 0)
                {
                    count++;
                    cmd = con.CreateCommand();
                    con.Open();
                    cmd.CommandText = "insert into tbl_admin_employee_ledger_master values('" + name.Text + "','" + id.Text + "','','" + perday + "','" + date + "','')";
                    cmd.ExecuteNonQuery();
                    con.Close();

                }
                if (count > 0)
                {
                    ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Submitted Sucessfully');window.location='emp_atteandance.aspx';", true);
                }

            }
        }
    }
}