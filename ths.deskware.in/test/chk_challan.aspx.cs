using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class chk_challan : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
    SqlCommand cmd;
    Class1 cls = new Class1();
    string sesion;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] == null && Session["type"] == null)
        {
            Response.Redirect("~/login.aspx");
        }
        if (Request.QueryString["cno"] == null)
        {
            Response.Redirect("dashboard.aspx");
        }
        if (!IsPostBack)
        {
            h5.InnerHtml = Request.QueryString["dname"].ToString();
            cls.gridbind(GridView1, "Select * from tbl_challan_details_master where challan_no='" + Request.QueryString["cno"] .ToString()+ "'");
            bind_mrp();
        }

    }
    public void bind_mrp()
    {
        SqlDataAdapter adap = new SqlDataAdapter("Select * from tbl_challan_details_master where challan_no='" + Request.QueryString["cno"].ToString() + "'", con);
        DataSet ds = new DataSet();
        adap.Fill(ds);
        if (ds.Tables[0].Rows.Count != 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];
            txttotlamt.Text = double.Parse(dr["totlamount"].ToString()).ToString("n2");
            txtfraight.Text = double.Parse(dr["fraight"].ToString()).ToString("n2");
            txtlabour.Text = double.Parse(dr["labour"].ToString()).ToString("n2");
            txtnetamount.Text = double.Parse(dr["netamount"].ToString()).ToString("n2");
            txtpaid.Text = double.Parse(dr["paid"].ToString()).ToString("n2");
            txtbalance.Text = double.Parse(dr["balance"].ToString()).ToString("n2");
        }
        else
        {
            txttotlamt.Text = txtfraight.Text = txtlabour.Text = txtnetamount.Text = txtpaid.Text = txtbalance.Text = "0";
        }

        
    }

    string cname1, size1 = "";
    double cmprice = 0;
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        int count = 0;
        int j;
        for (j = 0; j < GridView1.Rows.Count; j++)
        {
            CheckBox cb = (CheckBox)GridView1.Rows[j].FindControl("chkAll0");
            Label lblid = (Label)GridView1.Rows[j].FindControl("lblid");

            Label lblcname = (Label)GridView1.Rows[j].FindControl("lblcname");
            Label lblsize = (Label)GridView1.Rows[j].FindControl("lblsize");
            Label lblqty = (Label)GridView1.Rows[j].FindControl("lblqty");

            cname1=lblcname.Text;
            size1 = lblsize.Text;
            comp_price();

            double comp_debit = cmprice * double.Parse(lblqty.Text.ToString());

            if (cb.Checked == true)
            {
                if (cb.Enabled == true)
                {
                    count++;
                    cmd = con.CreateCommand();
                    SqlCommand cmd1 = con.CreateCommand();
                    con.Open();
                    
                    cmd.CommandText = " update tbl_challan_details_master set mchk='1' where id='" + lblid.Text + "'";
                    cmd.ExecuteNonQuery();

                    cmd1.CommandText = "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:40:00';declare @date DATETIME;set @date=(SELECT (@d + CAST(@t AS datetime)))   insert into tbl_company_ledger_master values('" + cname1 + "','" + comp_debit + "','',@date,'" + Request.QueryString["cno"].ToString() + "','')";
                    cmd1.ExecuteNonQuery();

                    con.Close();
                    count_challan_items();
                    count_checked_items();
                    if (challan_items == checked_item && txtbalance.Text != "0.00" || txtbalance.Text != "0")
                    {
                        string date = System.DateTime.Now.ToString("MM/dd/yyyy");
                        cmd = con.CreateCommand();
                        con.Open();
                        cmd.CommandText = "insert into tbl_dealer_ledger_master values('" + Request.QueryString["dname"].ToString() + "','" + Request.QueryString["did"].ToString() + "','" + txtbalance.Text.Trim() + "','','" + date + "','" + Request.QueryString["cno"].ToString() + "','')";
                        cmd.ExecuteNonQuery();
                        con.Close();
                    }
                }
            }
        }
        if (count > 0)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Submitted Sucessfully');window.location='chk_challan.aspx';", true);
        }
        else
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Check Item in the List');", true);
        }
    }

    int challan_items,checked_item = 0;

    public void count_challan_items()
    {
        SqlDataAdapter adap = new SqlDataAdapter("select count(challan_no)as item from tbl_challan_details_master where challan_no='" + Request.QueryString["cno"].ToString() + "'", con);
        DataSet ds = new DataSet();
        adap.Fill(ds);
        if (ds.Tables[0].Rows.Count != 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];
            challan_items = int.Parse(dr["item"].ToString());
        }
    }
    public void count_checked_items()
    {
        SqlDataAdapter adap = new SqlDataAdapter("select count(challan_no)as item from tbl_challan_details_master where challan_no='" + Request.QueryString["cno"].ToString() + "' and mchk='1'", con);
        DataSet ds = new DataSet();
        adap.Fill(ds);
        if (ds.Tables[0].Rows.Count != 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];
            checked_item = int.Parse(dr["item"].ToString());
        }
    }

    public void comp_price()
    {
        SqlDataAdapter adap = new SqlDataAdapter("select price from tbl_comp_product_pricing where cname='" + cname1 + "' and size='" + size1 + "'", con);
        DataSet ds = new DataSet();
        adap.Fill(ds);
        if (ds.Tables[0].Rows.Count != 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];
            cmprice = double.Parse( dr["price"].ToString());
        }
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
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            Label lblid = e.Row.FindControl("lblid") as Label;
            CheckBox chkrow = e.Row.FindControl("chkAll0") as CheckBox;


            SqlDataAdapter adap = new SqlDataAdapter("select mchk from tbl_challan_details_master where id='" + lblid.Text + "'", con);
            DataSet ds = new DataSet();
            adap.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dr = ds.Tables[0].Rows[0];
                string chk = dr["mchk"].ToString();

                if (chk != "0")
                {
                    chkrow.Checked = true;
                    chkrow.Enabled = false;
                }
                else
                {
                    chkrow.Checked = false;
                }
            }
           
        }
    }
    protected void btnsubmit1_Click(object sender, EventArgs e)
    {
        double a = double.Parse(txtpaid.Text.Trim());
        double b = double.Parse(txtbalance.Text.Trim());
        double fp = double.Parse(txtpaidfur.Text.Trim());

        double netamnt = double.Parse(txtnetamount.Text.Trim());

        double netpaid = fp + a;
        double netbal = netamnt - netpaid;


        cmd = con.CreateCommand();
        con.Open();

        cmd.CommandText = " update tbl_challan_details_master set paid='" + netpaid.ToString() + "',balance='" + netbal.ToString() + "' where challan_no='" + Request.QueryString["cno"].ToString() + "'";
        cmd.ExecuteNonQuery();
        con.Close();
        add_cash_ledger();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Update Sucessfully');", true);
        bind_mrp();



    }
    public void add_cash_ledger()
    {
        string date = System.DateTime.Now.ToString("MM/dd/yyyy");
      
        cmd = con.CreateCommand();
        con.Open();
        cmd.CommandText = "insert into tbl_cash_ledger_master values('" + Request.QueryString["dname"].ToString() + "','" + Request.QueryString["did"].ToString() + "','','" + txtpaidfur.Text.Trim() + "','" + date + "','" + Request.QueryString["cno"].ToString() + "','Cash')";
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public void add_cash_ledger1()
    {
        string date = System.DateTime.Now.ToString("MM/dd/yyyy");

        cmd = con.CreateCommand();
        con.Open();
        cmd.CommandText = "insert into tbl_cash_ledger_master values('" + Request.QueryString["dname"].ToString() + "','" + Request.QueryString["did"].ToString() + "','','" + txtdisc.Text.Trim() + "','" + date + "','" + Request.QueryString["cno"].ToString() + "','Discount')";
        cmd.ExecuteNonQuery();
        con.Close();
    }
    public void add_cash_ledger2()
    {
        string date = System.DateTime.Now.ToString("MM/dd/yyyy");

        cmd = con.CreateCommand();
        con.Open();
        cmd.CommandText = "insert into tbl_cash_ledger_master values('" + Request.QueryString["dname"].ToString() + "','" + Request.QueryString["did"].ToString() + "','" + txtbalgivn.Text.Trim() + "','','" + date + "','" + Request.QueryString["cno"].ToString() + "','Balance Given')";
        cmd.ExecuteNonQuery();
        con.Close();
    }
    protected void btnsubmit2_Click(object sender, EventArgs e)
    {
         if (txtpwd.Text == string.Empty)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Please Enter Password');", true);
        }
        else
        {
            cmd = con.CreateCommand();
            con.Open();
            cmd.CommandText = "select password from user_master where password='" + txtpwd.Text.Trim() + "'  and user_id='admin'  ";
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Close();
        double b = double.Parse(txtbalance.Text.Trim());
        double dis = double.Parse(txtdisc.Text.Trim());
        double netbal = b - dis;


        cmd = con.CreateCommand();
        con.Open();

        cmd.CommandText = " update tbl_challan_details_master set balance='" + netbal.ToString() + "' where challan_no='" + Request.QueryString["cno"].ToString() + "'";
        cmd.ExecuteNonQuery();
        con.Close();
        add_cash_ledger1();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Update Sucessfully');", true);
        bind_mrp();
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Current Password is Wrong');", true);
            }
        }
    }
    protected void btnsubmit0_Click(object sender, EventArgs e)
    {
       
                add_cash_ledger2();
                ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Update Sucessfully');", true);
       
      
    }
    protected void btnsubmit3_Click(object sender, EventArgs e)
    {
        if (txtpwd.Text == string.Empty)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Please Enter Password');", true);
        }
        else
        {
            cmd = con.CreateCommand();
            con.Open();
            cmd.CommandText = "select password from user_master where password='" + txtpwd.Text.Trim() + "'  and user_id='admin'  ";
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Close();
                con.Close();
                double nettotl = (double.Parse(txttotlamt.Text.Trim()) + (double.Parse(txtfraight.Text.Trim())) + (double.Parse(txtlabour.Text.Trim())));

                double paid = double.Parse(txtpaid.Text.Trim());
                double netbal = nettotl - paid;

                double round = Convert.ToDouble(Math.Round(nettotl, 0));
                string nettotl1 = round.ToString();
                int r2 = Convert.ToInt32(nettotl1);
                string wordsamt= "Indian Rupees " + words(r2) + "  Only";

                cmd = con.CreateCommand();
                con.Open();

                cmd.CommandText = " update tbl_challan_details_master set balance='" + netbal.ToString() + "',fraight='" + txtfraight.Text.Trim() + "',netamount='" + nettotl + "',inwords='" + wordsamt + "' where challan_no='" + Request.QueryString["cno"].ToString() + "'";
                cmd.ExecuteNonQuery();
                con.Close();
                ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Update Sucessfully');", true);
                bind_mrp();
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Current Password is Wrong');", true);
            }
        }

    }
    public static string NumberToWords(int number)
    {
        if (number == 0)
            return "zero";

        if (number < 0)
            return "minus " + NumberToWords(Math.Abs(number));

        string words = "";

        if ((number / 1000000) > 0)
        {
            words += NumberToWords(number / 1000000) + " million ";
            number %= 1000000;
        }

        if ((number / 1000) > 0)
        {
            words += NumberToWords(number / 1000) + " thousand ";
            number %= 1000;
        }

        if ((number / 100) > 0)
        {
            words += NumberToWords(number / 100) + " hundred ";
            number %= 100;
        }

        if (number > 0)
        {
            if (words != "")
                words += "and ";

            var unitsMap = new[] { "zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourteen", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen" };
            var tensMap = new[] { "zero", "ten", "twenty", "thirty", "forty", "fifty", "sixty", "seventy", "eighty", "ninety" };

            if (number < 20)
                words += unitsMap[number];
            else
            {
                words += tensMap[number / 10];
                if ((number % 10) > 0)
                    words += "-" + unitsMap[number % 10];
            }
        }

        return words;
    }
    public string words(int numbers)
    {
        int number = numbers;

        if (number == 0) return "Zero";
        if (number == -2147483648) return "Minus Two Hundred and Fourteen Crore Seventy Four Lakh Eighty Three Thousand Six Hundred and Forty Eight";
        int[] num = new int[4];
        int first = 0;
        int u, h, t;
        System.Text.StringBuilder sb = new System.Text.StringBuilder();
        if (number < 0)
        {
            sb.Append("Minus ");
            number = -number;
        }
        string[] words0 = {"" ,"One ", "Two ", "Three ", "Four ",
"Five " ,"Six ", "Seven ", "Eight ", "Nine "};
        string[] words1 = {"Ten ", "Eleven ", "Twelve ", "Thirteen ", "Fourteen ",
"Fifteen ","Sixteen ","Seventeen ","Eighteen ", "Nineteen "};
        string[] words2 = {"Twenty ", "Thirty ", "Forty ", "Fifty ", "Sixty ",
"Seventy ","Eighty ", "Ninety "};
        string[] words3 = { "Thousand ", "Lakh ", "Crore " };
        num[0] = number % 1000; // units
        num[1] = number / 1000;
        num[2] = number / 100000;
        num[1] = num[1] - 100 * num[2]; // thousands
        num[3] = number / 10000000; // crores
        num[2] = num[2] - 100 * num[3]; // lakhs
        for (int i = 3; i > 0; i--)
        {
            if (num[i] != 0)
            {
                first = i;
                break;
            }
        }
        for (int i = first; i >= 0; i--)
        {
            if (num[i] == 0) continue;
            u = num[i] % 10; // ones
            t = num[i] / 10;
            h = num[i] / 100; // hundreds
            t = t - 10 * h; // tens
            if (h > 0) sb.Append(words0[h] + "Hundred ");
            if (u > 0 || t > 0)
            {
                if (h > 0 || i == 0) sb.Append("and ");
                if (t == 0)
                    sb.Append(words0[u]);
                else if (t == 1)
                    sb.Append(words1[u]);
                else
                    sb.Append(words2[t - 2] + words0[u]);
            }
            if (i != 0) sb.Append(words3[i - 1]);
        }
        return sb.ToString().TrimEnd();
    }
    protected void btnsubmit4_Click(object sender, EventArgs e)
    {
        if (txtpwd.Text == string.Empty)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Please Enter Password');", true);
        }
        else
        {
            cmd = con.CreateCommand();
            con.Open();
            cmd.CommandText = "select password from user_master where password='" + txtpwd.Text.Trim() + "'  and user_id='admin'  ";
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                dr.Close();
                con.Close();
                double nettotl = (double.Parse(txttotlamt.Text.Trim()) + (double.Parse(txtfraight.Text.Trim())) + (double.Parse(txtlabour.Text.Trim())));

                double paid = double.Parse(txtpaid.Text.Trim());
                double netbal = nettotl - paid;

                double round = Convert.ToDouble(Math.Round(nettotl, 0));
                string nettotl1 = round.ToString();
                int r2 = Convert.ToInt32(nettotl1);
                string wordsamt = "Indian Rupees " + words(r2) + "  Only";

                cmd = con.CreateCommand();
                con.Open();

                cmd.CommandText = " update tbl_challan_details_master set balance='" + netbal.ToString() + "',labour='" + txtlabour.Text.Trim() + "',netamount='" + nettotl + "',inwords='" + wordsamt + "' where challan_no='" + Request.QueryString["cno"].ToString() + "'";
                cmd.ExecuteNonQuery();
                con.Close();
                ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Update Sucessfully');", true);
                bind_mrp();
            }
            else
            {
                ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Current Password is Wrong');", true);
            }
        }
    }


    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label id = (Label)row.FindControl("lblid");
        con.Open();
        SqlCommand cmd = new SqlCommand("delete FROM tbl_challan_details_master where id='" + id.Text.Trim() + "'", con);
        cmd.ExecuteNonQuery();
        con.Close();
        cls.gridbind(GridView1, "Select * from tbl_challan_details_master where challan_no='" + Request.QueryString["cno"].ToString() + "'");

        int i; double totl = 0;
        for (i = 0; i < GridView1.Rows.Count; i++)
        {
            Label bal1 = GridView1.Rows[i].FindControl("Label1") as Label;
            totl += double.Parse(bal1.Text);
        }
        txttotlamt.Text = totl.ToString();

        double nettotl = (double.Parse(txttotlamt.Text.Trim()) + (double.Parse(txtfraight.Text.Trim())) + (double.Parse(txtlabour.Text.Trim())));

        txtnetamount.Text = nettotl.ToString();

        double round = Convert.ToDouble(Math.Round(double.Parse(txtnetamount.Text), 0));
        txtnetamount.Text = round.ToString();
        int r2 = Convert.ToInt32(txtnetamount.Text);
        string wordamnt = "Indian Rupees " + words(r2) + "  Only";

        double b = double.Parse(txtnetamount.Text.Trim());
        double paid = double.Parse(txtpaid.Text.Trim());
        double netbal = b - paid;


       SqlCommand cmd1 = con.CreateCommand();
        con.Open();

        cmd1.CommandText = " update tbl_challan_details_master set balance='" + netbal.ToString() + "',netamount='" + nettotl + "',inwords='" + wordamnt + "',totlamount='" + txttotlamt.Text + "' where challan_no='" + Request.QueryString["cno"].ToString() + "'";
        cmd1.ExecuteNonQuery();
        con.Close();


        bind_mrp();

        count_challan_items();
        count_checked_items();
        if (challan_items == checked_item && txtbalance.Text != "0.00" || txtbalance.Text != "0")
        {
            string date = System.DateTime.Now.ToString("MM/dd/yyyy");
            cmd = con.CreateCommand();
            con.Open();
            cmd.CommandText = "insert into tbl_dealer_ledger_master values('" + Request.QueryString["dname"].ToString() + "','" + Request.QueryString["did"].ToString() + "','" + txtbalance.Text.Trim() + "','','" + date + "','" + Request.QueryString["cno"].ToString() + "','')";
            cmd.ExecuteNonQuery();
            con.Close();
        }

        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Deleted Sucessfully');", true);
        
    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
        GridView1.EditIndex = e.NewEditIndex;
        cls.gridbind(GridView1, "Select * from tbl_challan_details_master where challan_no='" + Request.QueryString["cno"].ToString() + "'");

    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {
        GridView1.EditIndex = -1;
        cls.gridbind(GridView1, "Select * from tbl_challan_details_master where challan_no='" + Request.QueryString["cno"].ToString() + "'");
    }
    protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label id = (Label)row.FindControl("lblid");
        TextBox lblqty = (TextBox)row.FindControl("txtqty");
        TextBox lblmrp = (TextBox)row.FindControl("txtmrp");
        Label lblamount = (Label)row.FindControl("Label1");

        GridView1.EditIndex = -1;
       

        int i; double totl = 0;
        for (i = 0; i < GridView1.Rows.Count; i++)
        {
            Label bal1 = GridView1.Rows[i].FindControl("Label1") as Label;
            totl += double.Parse(bal1.Text);
        }
        txttotlamt.Text = totl.ToString();

        double nettotl = (double.Parse(txttotlamt.Text.Trim()) + (double.Parse(txtfraight.Text.Trim())) + (double.Parse(txtlabour.Text.Trim())));

        txtnetamount.Text = nettotl.ToString();

        double round = Convert.ToDouble(Math.Round(double.Parse(txtnetamount.Text), 0));
        txtnetamount.Text = round.ToString();
        int r2 = Convert.ToInt32(txtnetamount.Text);
        string wordamnt = "Indian Rupees " + words(r2) + "  Only";

        double b = double.Parse(txtnetamount.Text.Trim());
        double paid = double.Parse(txtpaid.Text.Trim());
        double netbal = b - paid;

        cmd = con.CreateCommand();
        con.Open();

        cmd.CommandText = " update tbl_challan_details_master set qty='" + lblqty.Text + "',mrp='" + lblmrp.Text + "',amount='" + lblamount.Text + "' where id='" + id.Text + "'";
        cmd.ExecuteNonQuery();
        con.Close();

        SqlCommand cmd1 = con.CreateCommand();
        con.Open();

        cmd1.CommandText = " update tbl_challan_details_master set balance='" + netbal.ToString() + "',netamount='" + nettotl + "',inwords='" + wordamnt + "',totlamount='" + txttotlamt.Text + "' where challan_no='" + Request.QueryString["cno"].ToString() + "'";
        cmd1.ExecuteNonQuery();
        con.Close();

        bind_mrp();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Updated Sucessfully');", true);
        cls.gridbind(GridView1, "Select * from tbl_challan_details_master where challan_no='" + Request.QueryString["cno"].ToString() + "'");
    }

    protected void txtqty_TextChanged(object sender, EventArgs e)
    {
        TextBox txt = (TextBox)sender;
        GridViewRow gvRow = (GridViewRow)txt.Parent.Parent;

        Label AMOUNT = (Label)gvRow.FindControl("Label1");
        TextBox txtqty = (TextBox)gvRow.FindControl("txtqty");
        TextBox txtmrp = (TextBox)gvRow.FindControl("txtmrp");

        double a = double.Parse(txtqty.Text.ToString());
        double b = double.Parse(txtmrp.Text.ToString());
        double c = a * b;
        AMOUNT.Text = c.ToString();
    }
    protected void txtmrp_TextChanged(object sender, EventArgs e)
    {
        TextBox txt = (TextBox)sender;
        GridViewRow gvRow = (GridViewRow)txt.Parent.Parent;

        Label AMOUNT = (Label)gvRow.FindControl("Label1");
        TextBox txtqty = (TextBox)gvRow.FindControl("txtqty");
        TextBox txtmrp = (TextBox)gvRow.FindControl("txtmrp");

        double a = double.Parse(txtqty.Text.ToString());
        double b = double.Parse(txtmrp.Text.ToString());
        double c = a * b;
        AMOUNT.Text = c.ToString();
    }
}