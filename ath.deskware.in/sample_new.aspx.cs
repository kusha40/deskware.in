using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class sample_new : System.Web.UI.Page
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
            //cls.bind_ddl(ddlcompname, "Select distinct c_name from tbl_product_master order by c_name asc", "c_name", "c_name");
            cls.bind_ddl(ddldealer, "Select name,id from tbl_dealer_Master order by name asc", "name", "id");
        }
    }
    protected void btnview_Click(object sender, EventArgs e)
    {
        cls.gridbind(GridView1, "select * from tbl_product_master where  size='" + ddlcompname.SelectedValue + "' order by c_name,p_code asc");
    }
    protected void ChkAllRows(object sender, EventArgs e)
    {

        CheckBox chkall = (CheckBox)GridView1.HeaderRow.FindControl("chkAll");
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            CheckBox chkrow = (CheckBox)GridView1.Rows[i].FindControl("chkAll0");
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
    protected void ChkAllRows2(object sender, EventArgs e)
    {

        CheckBox chkall = (CheckBox)GridView1.HeaderRow.FindControl("chkAll2");
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            CheckBox chkrow = (CheckBox)GridView1.Rows[i].FindControl("chkAll02");
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
    protected void GridView1_PreRender(object sender, EventArgs e)
    {
        foreach (GridViewRow r in GridView1.Rows)
        {
            Label lname = r.FindControl("Label4") as Label;
            Label lname1 = r.FindControl("Label41") as Label;
            Label cname = r.FindControl("Label2") as Label;
            TextBox TextBox1 = r.FindControl("TextBox1") as TextBox;
            CheckBox chkAll0 = r.FindControl("chkAll0") as CheckBox;
            CheckBox chkAll01 = r.FindControl("chkAll01") as CheckBox;

            if (TextBox1.Text == "1")
            {
                chkAll0.Visible = true;
                chkAll01.Visible = false;

            }
            if (TextBox1.Text == "2")
            {
                chkAll0.Visible = true;
                chkAll01.Visible = true;
            }
            if (TextBox1.Text == "0" || TextBox1.Text == string.Empty)
            {
                chkAll0.Visible = false;
                chkAll01.Visible = false;
            }
            if (lname.Text == "ok")
            {
                if (TextBox1.Text == "1" || TextBox1.Text == "2")
                {
                    r.Cells[6].BackColor = ColorTranslator.FromHtml("#FFFF00");
                }
            }
            if (lname.Text == "")
            {
                if (TextBox1.Text == "1" || TextBox1.Text == "2")
                {
                    r.Cells[6].BackColor = ColorTranslator.FromHtml("#FF0000");
                }
            }
            if (lname1.Text == "ok")
            {
                if (TextBox1.Text == "2")
                {
                    r.Cells[7].BackColor = ColorTranslator.FromHtml("#FFFF00");
                }
            }
            if (lname1.Text == "")
            {
                if (TextBox1.Text == "2")
                {
                    r.Cells[7].BackColor = ColorTranslator.FromHtml("#FF0000");
                }
            }
            if (cname.Text == "Allient")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#357EC7");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "Arido")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#368BC1");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "black berry")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#488AC7");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "Capsun")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#3090C7");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "DELTON")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#659EC7");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "exclusive")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#87AFC7");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "HIGH GLOSSY")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#95B9C7");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "Livanto")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#728FCE");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "Murano")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#2B65EC");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "Pioneer")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#306EFF");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "PREM")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#157DEC");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "Savitra")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#1589FF");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "Senso")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#6495ED");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "Specto")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#6698FF");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "TILEX")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#38ACEC");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "Veeta")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#56A5EC");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "veeta D.C")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#5CB3FF");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "veeta dark series")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#3BB9FF");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "VERITAAS   (32*32)")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#79BAEC");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
            if (cname.Text == "Zed")
            {
                r.Cells[2].BackColor = ColorTranslator.FromHtml("#82CAFA");
                r.Cells[2].ForeColor = ColorTranslator.FromHtml("#FFF");
            }
        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label size = e.Row.FindControl("Label1") as Label;
            Label cname = e.Row.FindControl("Label2") as Label;
            Label pcode = e.Row.FindControl("Label3") as Label;

            Label lname = e.Row.FindControl("Label4") as Label;
            Label lname1 = e.Row.FindControl("Label41") as Label;

            CheckBox chkrow = e.Row.FindControl("chkAll0") as CheckBox;
            CheckBox chkrow1 = e.Row.FindControl("chkAll01") as CheckBox;
            TextBox TextBox1 = e.Row.FindControl("TextBox1") as TextBox;

            SqlDataAdapter adap11 = new SqlDataAdapter("select top 1  sts,id,qty,sts2 from tbl_sample_entry where dealer_id='" + ddldealer.SelectedValue + "' and size='"+size.Text+"' and pcode='"+pcode.Text+"' and cname='"+cname.Text+"' order by id desc", con);
            DataSet ds11 = new DataSet();
            adap11.Fill(ds11);
            if (ds11.Tables[0].Rows.Count != 0)
            {
                DataRow dr11 = ds11.Tables[0].Rows[0];
                lname.Text = dr11["sts"].ToString();
                lname1.Text = dr11["sts2"].ToString();
                if (lname.Text == "ok")
                {
                    chkrow.Checked = true;
                }
                else
                {
                    chkrow.Checked = false;
                }
                if (lname1.Text == "ok")
                {
                    chkrow1.Checked = true;
                }
                else
                {
                    chkrow1.Checked = false;
                }
            }
            else
            {
                lname.Text = "";
                lname1.Text = "";
                chkrow.Checked = false;
                chkrow1.Checked = false;
            }
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        int count = 0;
        int j;
        for (j = 0; j < GridView1.Rows.Count; j++)
        {
            
            CheckBox cb2 = (CheckBox)GridView1.Rows[j].FindControl("chkAll02");
            CheckBox cb = (CheckBox)GridView1.Rows[j].FindControl("chkAll0");
            CheckBox cb1 = (CheckBox)GridView1.Rows[j].FindControl("chkAll01");
            Label size = (Label)GridView1.Rows[j].FindControl("Label1");
            Label cname = (Label)GridView1.Rows[j].FindControl("Label2");
            Label pcode = (Label)GridView1.Rows[j].FindControl("Label3");

            Label lsts = (Label)GridView1.Rows[j].FindControl("Label4");
            Label lsts1 = (Label)GridView1.Rows[j].FindControl("Label41");
            TextBox TextBox1 = (TextBox)GridView1.Rows[j].FindControl("TextBox1");
            int sent_qty = 0;
            //if (cb2.Checked == true)
            {
               

                if (cb.Checked == false)
                {
                    lsts.Text = "";
                }
                if (cb.Checked == true)
                {
                    lsts.Text = "ok";
                }
                if (cb1.Checked == false)
                {
                    lsts1.Text = "";
                }
                if (cb1.Checked == true)
                {
                    lsts1.Text = "ok";
                }

                //if (cb.Checked == true)
                //{
                //    sent_qty = 1;
                //}
                if (cb1.Checked == true && cb.Checked == true)
                {
                    sent_qty = 2;
                   
                }
                else  if (cb1.Checked == false && cb.Checked == true)
                {
                    sent_qty = 1;
                    
                }
                else if (cb1.Checked == true && cb.Checked == false)
                {
                    sent_qty = 1;
                  
                }

                string date = DateTime.ParseExact(txtdate.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
                count++;
                cmd = con.CreateCommand();
                con.Open();
                cmd.CommandText = "insert into tbl_sample_entry values('" + size.Text + "','" + cname.Text + "','" + pcode.Text + "','" + lsts.Text + "','" + date + "','" + Session["Username"].ToString() + "','" + ddldealer.SelectedValue + "','" + ddldealer.SelectedItem.Text + "','" + TextBox1.Text.Trim() + "','" + lsts1.Text + "','"+sent_qty+"') ";
                cmd.ExecuteNonQuery();
                con.Close();

            }
            if (cb2.Checked == true)
            {
                string date = DateTime.ParseExact(txtdate.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
                count++;
                cmd = con.CreateCommand();
                con.Open();
                cmd.CommandText = "insert into tbl_sample_entry_sent values('" + size.Text + "','" + cname.Text + "','" + pcode.Text + "','" + lsts.Text + "','" + date + "','" + Session["Username"].ToString() + "','" + ddldealer.SelectedValue + "','" + ddldealer.SelectedItem.Text + "','" + TextBox1.Text.Trim() + "','" + lsts1.Text + "','" + sent_qty + "') ";
                cmd.ExecuteNonQuery();
                con.Close();
            }
        }
        if (count > 0)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Updated Sucessfully');window.location='sample_new.aspx';", true);
        }
        //else
        //{
        //    ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Please Dispatch Check  in the List');", true);
        //}
    }
}