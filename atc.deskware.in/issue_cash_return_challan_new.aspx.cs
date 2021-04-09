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

public partial class issue_cash_return_challan_new : System.Web.UI.Page
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

            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Do you want to work on Return Challan');", true);


           // cls.bind_ddl(ddlvendor, "Select name,id from tbl_dealer_Master order by name asc", "name", "id");
            //cls.bind_ddl(ddlcompname, "Select name from tbl_company_master order by name asc", "name", "name");
            cls.bind_ddl(ddlpcode, "select p_code from tbl_product_master", "p_code", "p_code");
            ddlpcode.Items.Insert(0, "Select");

           ddlvendor.Items.Add(new ListItem("Cash", "53"));
            cls.bind_ddl(ddldrivername, "Select name,id from tbl_driver_master order by name asc", "name", "id");

            bind_dealer();
            if (Session["Username"].ToString() == "Amit")
            {
                ddlsize.SelectedValue = "12x24";
            }
            if (ddlsize.SelectedValue == "12x24")
            {
                Label32.Text = "PCS";
            }
            else
            {
                Label32.Text = "Box";
            }
           // cls.bind_ddl(ddlcompname, "Select distinct c_name from tbl_product_master where size='" + ddlsize.SelectedValue + "' order by c_name asc", "c_name", "c_name");
           // cls.bind_ddl(ddlpcode, "select distinct  p_code from tbl_product_master where size='" + ddlsize.SelectedValue + "' and c_name='" + ddlcompname.SelectedValue + "'", "p_code", "p_code");
            cls.bind_ddl(ddlcompname, "Select distinct c_name from tbl_product_master  order by c_name asc", "c_name", "c_name");
            po_no();

            bind_temp();

            if (Session["type"].ToString() == "Administrator")
            {
                btnsubmit1.Visible = true;
            }
            else
            {
                btnsubmit1.Visible = true;
            }
        }
    }
    int count = 0;
    public void po_no()
    {

        cmd = con.CreateCommand();
        con.Open();
        cmd.CommandText = "  SELECT  RIGHT('00000'+ isnull(CONVERT(VARCHAR,max(cast(challan_no as bigint))+1),0),5) as id FROM tbl_challan_details_master";
        txtchallanno.Text = cmd.ExecuteScalar().ToString();
        con.Close();
        if (txtchallanno.Text == "00000")
        {
            txtchallanno.Text = "00001";
        }
    }
    double labour_price = 0;
    string ddlsize1, ddlcompname1, ddlpcode1, ddlprotype1, qty2 = "";
    protected void btnsubmit_Click(object sender, EventArgs e)
    {
        try
        {
            int j;
            po_no();
            for (j = 0; j < GridView1.Rows.Count; j++)
            {
                Label qty = (Label)GridView1.Rows[j].FindControl("Label2");
                Label unit = (Label)GridView1.Rows[j].FindControl("Label4");
                Label size = (Label)GridView1.Rows[j].FindControl("Label40");
                Label c_name = (Label)GridView1.Rows[j].FindControl("Label41");
                Label p_code = (Label)GridView1.Rows[j].FindControl("Label31");
                Label rate = (Label)GridView1.Rows[j].FindControl("Label5");
                Label amount = (Label)GridView1.Rows[j].FindControl("Label1");
                Label p_grade = (Label)GridView1.Rows[j].FindControl("Label39");
                count++;

                ddlsize1 = size.Text;
                ddlcompname1 = c_name.Text;
                ddlpcode1 = p_code.Text;
                ddlprotype1 = p_grade.Text;
                qty2 = qty.Text;

                bind_stock();

                //double labour_qty = Convert.ToDouble(qty.Text.ToString());
                ////daily labour pricing//
                //if (size.Text == "12x18")
                //{
                //    cmnd = "select rate from tbl_daily_labour_charges where size='12x18'";
                //    // labour_price = 1;
                //}
                //if (size.Text == "12x24")
                //{
                //    cmnd = "select rate from tbl_daily_labour_charges where size='12x24'";
                //    // labour_price = 1;
                //}
                //if (size.Text == "2x2")
                //{
                //    cmnd = "select rate from tbl_daily_labour_charges where size='2x2'";
                //    // labour_price = 1;
                //}
                //if (size.Text == "2x4")
                //{
                //    cmnd = "select rate from tbl_daily_labour_charges where size='2x4'";
                //    // labour_price = 1;
                //}
                //if (size.Text == "32x32")
                //{
                //    cmnd = "select rate from tbl_daily_labour_charges where size='32x32'";
                //    // labour_price = 1;
                //}

                //SqlCommand cmd9 = con.CreateCommand();
                //con.Open();
                //cmd9.CommandText = cmnd;
                //labour_price = double.Parse(cmd9.ExecuteScalar().ToString());
                //con.Close();

                //double labour_totl_price = labour_price * labour_qty;


                string date = DateTime.ParseExact(txtdate.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
                cmd = con.CreateCommand();

                con.Open();
                cmd.CommandText = "insert into tbl_challan_details_master values('" + txtchallanno.Text.Trim() + "','" + date + "','" + txtvname.Text.Trim() + "','" + ddlvendor.SelectedValue + "','" + txtarea.Text.Trim() + "','" + qty.Text + "','" + unit.Text + "','" + size.Text + "','" + c_name.Text + "','" + p_code.Text + "','" + rate.Text + "','" + amount.Text + "','" + txttotlamt.Text.Trim() + "','" + txtfraight.Text.Trim() + "','" + txtnetamount.Text.Trim() + "','" + txtinwords.Text.Trim() + "','" + Session["Username"].ToString() + "','" + p_grade.Text + "','','RI')";
                cmd.ExecuteNonQuery();


                //SqlCommand cmd1 = con.CreateCommand();
                //cmd1.CommandText = " insert into tbl_daily_labour_ledger_master values('Daily Labour','" + labour_totl_price + "','','" + date + "','" + txtchallanno.Text.Trim() + "','')";


                //cmd1.ExecuteNonQuery();

                con.Close();



            }

            if (count > 0)
            {
                add_dealer_ledger();
                //if (txtfraight.Text != "0")
                //{
                //    add_driver_ledger();
                //}
                Session["cno"] = txtchallanno.Text;
                ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Created Sucessfully');window.location='issue_cash_return_challan_new.aspx';", true);

            }
        }
        catch (Exception er)
        {
        }
        finally
        {

        }


    }
    private static DataTable dt1 = new DataTable();

    public void bind_mrp()
    {
        adap = new SqlDataAdapter("select top 1 price from tbl_dealer_product_pricing where dealer_id=" + ddlvendor.SelectedValue + " and name='" + ddlvendor.SelectedItem.Text + "' and size='" + ddlsize.SelectedValue + "' and c_name='" + ddlcompname.SelectedValue + "' order by id desc ", con);
        ds = new DataSet();
        adap.Fill(ds);
        {
            DataRow dr = ds.Tables[0].Rows[0];
            txtmrp.Text = dr["price"].ToString();
        }
        con.Close();
    }
    public void bind_stock()
    {
        SqlDataAdapter adap1 = new SqlDataAdapter("select isnull(sum(qty),0) as qty from tbl_stock_qty_master where size='" + ddlsize1 + "' and c_name='" + ddlcompname1 + "' and p_code='" + ddlpcode1 + "' and p_grade='" + ddlprotype1 + "'", con);
        DataSet ds1 = new DataSet();
        adap1.Fill(ds1);
        {
            DataRow dr1 = ds1.Tables[0].Rows[0];
            Label3.Text = dr1["qty"].ToString();

            Label3.Text = Convert.ToDouble(double.Parse(Label3.Text.Trim()) + double.Parse(qty2)).ToString();

            SqlCommand cmd5 = con.CreateCommand();
            con.Open();
            //cmd5.CommandText = " update tbl_stock_qty_master set  qty='" + Label3.Text + "' where   size= '" + ddlsize.SelectedValue + "' and c_name='" + ddlcompname.SelectedValue + "' and p_code='" + ddlpcode.SelectedValue + "' and p_grade='" + ddlprotype.SelectedValue + "'";

            cmd5.CommandText = " update tbl_stock_qty_master set  qty='" + Label3.Text + "' where   size= '" + ddlsize1 + "' and c_name='" + ddlcompname1 + "' and p_code='" + ddlpcode1 + "' and p_grade='" + ddlprotype1 + "'";

            cmd5.ExecuteNonQuery();
            con.Close();

        }
    }
    public void bind_temp()
    {
        DataTable dt = new DataTable();
        dt.Columns.AddRange(
              new DataColumn[8] 
            { 
                                new DataColumn("qty", typeof(string)),

                new DataColumn("unit", typeof(string)),
                    new DataColumn("size", typeof(string)),
                            new DataColumn("c_name", typeof(string)),
                             new DataColumn("p_code", typeof(string)),
                               new DataColumn("p_grade", typeof(string)),
                                new DataColumn("rate", typeof(string)),
                                   new DataColumn("amount", typeof(string))
            }

          );
        ViewState["challan"] = dt;
        GridView1.DataSource = (DataTable)ViewState["challan"];
        GridView1.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //bind_stock();

        //DataTable dt = new DataTable();
        //dt.Columns.AddRange(
        //    new DataColumn[8] 
        //    { 
        //                        new DataColumn("qty", typeof(string)),

        //        new DataColumn("unit", typeof(string)),
        //            new DataColumn("size", typeof(string)),
        //                    new DataColumn("c_name", typeof(string)),
        //                     new DataColumn("p_code", typeof(string)),
        //                       new DataColumn("p_grade", typeof(string)),
        //                        new DataColumn("rate", typeof(string)),
        //                           new DataColumn("amount", typeof(string))
        //    }

        //);
       // bind_mrp();
        double amount = (double.Parse(txtrate.Text.Trim()) * (double.Parse(txtqty.Text.Trim())));

        DataTable dt = (DataTable)ViewState["challan"];
        dt.Rows.Add(txtqty.Text.Trim(), Label32.Text, ddlsize.SelectedValue, ddlcompname.SelectedValue, ddlpcode.SelectedValue, ddlprotype.SelectedValue, txtrate.Text.Trim(), amount);
        ViewState["challan"] = dt;
        GridView1.DataSource = (DataTable)ViewState["challan"];
        GridView1.DataBind();
        txtqty.Text = string.Empty;

        int i; double totl = 0;
        for (i = 0; i < GridView1.Rows.Count; i++)
        {
            Label bal1 = GridView1.Rows[i].FindControl("Label1") as Label;
            totl += double.Parse(bal1.Text);
        }
        txttotlamt.Text = totl.ToString();

        double nettotl = (double.Parse(txttotlamt.Text.Trim()) + (double.Parse(txtfraight.Text.Trim())));

        txtnetamount.Text = nettotl.ToString();

        double round = Convert.ToDouble(Math.Round(double.Parse(txtnetamount.Text), 0));
        txtnetamount.Text = round.ToString();
        int r2 = Convert.ToInt32(txtnetamount.Text);
        txtinwords.Text = "Indian Rupees " + words(r2) + "  Only";
    }
    string cmnd = "";
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
    public void update_stock()
    {
        Label qty = (Label)GridView1.FindControl("Label2");
        Label size = (Label)GridView1.FindControl("Label3");
        Label c_name = (Label)GridView1.FindControl("Label32");
        Label p_code = (Label)GridView1.FindControl("Label31");
        Label p_grade = (Label)GridView1.FindControl("Label39");

        SqlDataAdapter adap1 = new SqlDataAdapter("select sum(qty) as qty from tbl_stock_qty_master where size='" + ddlsize.SelectedValue + "' and c_name='" + ddlcompname.SelectedValue + "' and p_code='" + ddlpcode.SelectedValue + "' and p_grade='" + ddlprotype.SelectedValue + "'", con);
        DataSet ds1 = new DataSet();
        adap1.Fill(ds1);
        {
            DataRow dr1 = ds1.Tables[0].Rows[0];
            Label3.Text = dr1["qty"].ToString();

            Label3.Text = Convert.ToDouble(double.Parse(Label3.Text.Trim()) - double.Parse(txtqty.Text.Trim())).ToString();

            SqlCommand cmd5 = con.CreateCommand();
            con.Open();
            cmd5.CommandText = " update tbl_stock_qty_master set  qty='" + Label3.Text + "' where   size= '" + ddlsize.SelectedValue + "' and c_name='" + ddlcompname.SelectedValue + "' and p_code='" + ddlpcode.SelectedValue + "' and p_grade='" + ddlprotype.SelectedValue + "'";
            cmd5.ExecuteNonQuery();
            con.Close();
        }

    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "delete1")
        {
            if (GridView1.Rows.Count > 0)
            {
                DataTable dt = (DataTable)ViewState["challan"];
                GridViewRow row = (GridViewRow)(((Control)e.CommandSource).NamingContainer);
                DataTable dtCurrentTable = new DataTable();
                int RowIndex = row.RowIndex;
                dtCurrentTable = dt;



                string qty1 = dt.Rows[RowIndex]["qty"].ToString();
                string size1 = dt.Rows[RowIndex]["size"].ToString();
                string c_name1 = dt.Rows[RowIndex]["c_name"].ToString();
                string p_code1 = dt.Rows[RowIndex]["p_code"].ToString();
                string p_grade1 = dt.Rows[RowIndex]["p_grade"].ToString();

                SqlDataAdapter adap1 = new SqlDataAdapter("select isnull(sum(qty),0) as qty from tbl_stock_qty_master where size='" + size1 + "' and c_name='" + c_name1 + "' and p_code='" + p_code1 + "' and p_grade='" + p_grade1 + "'", con);
                DataSet ds1 = new DataSet();
                adap1.Fill(ds1);
                {
                    DataRow dr1 = ds1.Tables[0].Rows[0];
                    Label3.Text = dr1["qty"].ToString();

                    //Label3.Text = Convert.ToDouble(double.Parse(Label3.Text.Trim()) - double.Parse(qty1)).ToString();

                    //SqlCommand cmd5 = con.CreateCommand();
                    //con.Open();
                    //cmd5.CommandText = " update tbl_stock_qty_master set  qty='" + Label3.Text + "' where   size= '" + size1 + "' and c_name='" + c_name1 + "' and p_code='" + p_code1 + "' and p_grade='" + p_grade1 + "'";
                    //cmd5.ExecuteNonQuery();
                    //con.Close();
                }


                dtCurrentTable.Rows.RemoveAt(row.RowIndex);
                GridView1.DataSource = dt;
                GridView1.DataBind();


                int i; double totl = 0;
                for (i = 0; i < GridView1.Rows.Count; i++)
                {
                    Label bal1 = GridView1.Rows[i].FindControl("Label1") as Label;
                    totl += double.Parse(bal1.Text);
                }
                txttotlamt.Text = totl.ToString();

                double nettotl = (double.Parse(txttotlamt.Text.Trim()) + (double.Parse(txtfraight.Text.Trim())));

                txtnetamount.Text = nettotl.ToString();

                double round = Convert.ToDouble(Math.Round(double.Parse(txtnetamount.Text), 0));
                txtnetamount.Text = round.ToString();
                int r2 = Convert.ToInt32(txtnetamount.Text);
                txtinwords.Text = "Indian Rupees " + words(r2) + "  Only";
                //  update_stock();
            }
        }
    }
    protected void txtfraight_TextChanged(object sender, EventArgs e)
    {

        if (txtfraight.Text == "0")
        {
            Div1.Visible = Div2.Visible = false;

        }
        else
        {
            Div1.Visible = Div2.Visible = true;
        }
        double nettotl = (double.Parse(txttotlamt.Text.Trim()) + (double.Parse(txtfraight.Text.Trim())));

        txtnetamount.Text = nettotl.ToString();
        double round = Convert.ToDouble(Math.Round(double.Parse(txtnetamount.Text), 0));
        txtnetamount.Text = round.ToString();
        int r2 = Convert.ToInt32(txtnetamount.Text);
        txtinwords.Text = "Indian Rupees " + words(r2) + "  Only";
    }
    SqlDataAdapter adap; DataSet ds;
    protected void ddlvendor_SelectedIndexChanged(object sender, EventArgs e)
    {
        bind_dealer();
    }

    public void add_driver_ledger()
    {
        string date = DateTime.ParseExact(txtdate.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
        cmd = con.CreateCommand();
        con.Open();
        cmd.CommandText = " insert into tbl_driver_ledger_master values('" + ddldrivername.SelectedItem.Text + "','" + ddldrivername.SelectedValue + "','" + txtfraight.Text.Trim() + "','','" + txtaddress.Text.Trim() + "','" + date + "','" + txtchallanno.Text.Trim() + "')";
        cmd.ExecuteNonQuery();
        con.Close();

    }

    public void bind_dealer()
    {
        adap = new SqlDataAdapter("select * from tbl_dealer_Master where id='" + ddlvendor.SelectedValue + "'", con);
        ds = new DataSet();
        adap.Fill(ds);
        {
            DataRow dr = ds.Tables[0].Rows[0];
            txtvname.Text = dr["name"].ToString();
            txtarea.Text = dr["area"].ToString();
        }
    }

    public void add_dealer_ledger()
    {
        string date = DateTime.ParseExact(txtdate.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
        cmd = con.CreateCommand();
        con.Open();
        cmd.CommandText = "insert into tbl_cash_ledger_master values('" + ddlvendor.SelectedItem.Text + "','" + ddlvendor.SelectedValue + "','" + txtnetamount.Text.Trim() + "','','" + date + "','" + txtchallanno.Text.Trim() + "','" + txtarea.Text.Trim() + "')";
        cmd.ExecuteNonQuery();
        con.Close();
    }

    protected void btnsubmit0_Click(object sender, EventArgs e)
    {
        ClientScript.RegisterStartupScript(this.Page.GetType(), "", "window.open('retrun_p1.aspx?id=" + Session["cno"].ToString() + "&val=" + Session["Username"].ToString() + "','Graph','height=724px,width=900px,scrollbars=1' );", true);
    }
    protected void ddlsize_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlsize.SelectedValue == "12x24")
        {
            Label32.Text = "PCS";
        }
        else
        {
            Label32.Text = "Box";
        }
        cls.bind_ddl(ddlcompname, "Select  distinct c_name from tbl_product_master where size='" + ddlsize.SelectedValue + "' order by c_name asc", "c_name", "c_name");
        cls.bind_ddl(ddlpcode, "select distinct  p_code from tbl_product_master where size='" + ddlsize.SelectedValue + "' and c_name='" + ddlcompname.SelectedValue + "'", "p_code", "p_code");
    }
    protected void btnsubmit1_Click(object sender, EventArgs e)
    {
        ClientScript.RegisterStartupScript(this.Page.GetType(), "", "window.open('retrun_p2.aspx?id=" + Session["cno"].ToString() + "&val=" + Session["Username"].ToString() + "','Graph','height=724px,width=900px,scrollbars=1' );", true);
    }

    protected void ddlcompname_SelectedIndexChanged(object sender, EventArgs e)
    {
        cls.bind_ddl(ddlpcode, "select distinct  p_code from tbl_product_master where size='" + ddlsize.SelectedValue + "' and c_name='" + ddlcompname.SelectedValue + "'", "p_code", "p_code");
    }
    protected void ddlpcode_SelectedIndexChanged(object sender, EventArgs e)
    {
        adap = new SqlDataAdapter("select distinct  size,c_name from tbl_product_master where p_code='" + ddlpcode.SelectedValue + "'", con);
        ds = new DataSet();
        adap.Fill(ds);
        {
            DataRow dr = ds.Tables[0].Rows[0];
            ddlsize.SelectedValue = dr["size"].ToString();
            ddlcompname.SelectedValue = dr["c_name"].ToString();


            SqlDataAdapter adap1 = new SqlDataAdapter("select isnull(sum(qty),0) as qty from tbl_stock_qty_master where size='" + ddlsize.SelectedValue + "' and c_name='" + ddlcompname.SelectedValue + "' and p_code='" + ddlpcode.SelectedValue + "' and p_grade='" + ddlprotype.SelectedValue + "'", con);
            DataSet ds1 = new DataSet();
            adap1.Fill(ds1);
            {
                DataRow dr1 = ds1.Tables[0].Rows[0];
                Label3.Text = dr1["qty"].ToString();
            }

        }
    }
}