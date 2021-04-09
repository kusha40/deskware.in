using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class generate_quotation : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
    SqlCommand cmd;
    Class1 cls = new Class1();
    SqlDataAdapter adap; DataSet ds;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] == null && Session["type"] == null)
        {
            Response.Redirect("~/login.aspx");
        }
        if (!IsPostBack)
        {
            cls.bind_ddl(DropDownList1, " select distinct pname,pcode from tbl_arkaya_product_master order by pname asc", "pname", "pcode");
            SqlDataAdapter adap = new SqlDataAdapter("select * from tbl_medors_lead_master where lead_id='" + Request.QueryString["id"].ToString() + "' ", con);
            DataSet ds = new DataSet();
            adap.Fill(ds);
            if (ds.Tables[0].Rows.Count != 0)
            {
                DataRow dr = ds.Tables[0].Rows[0];
                txtcno.Text = dr["lead_id"].ToString();
                txttitle.Text = dr["title"].ToString() + " " + dr["fname"].ToString() + " " + dr["lname"].ToString();
                txtaddress.Text = dr["address"].ToString();
                txttown.Text = dr["city"].ToString();
                txtpostcode.Text = dr["postcode"].ToString();
                txtemail.Text = dr["email_id"].ToString();
                txtmobile.Text = dr["mob"].ToString();
                DropDownList1.SelectedItem.Text = dr["product"].ToString();
            }

            bind_payment_terms();
            bind__terms();
            po_no();
        }

    }

    public void bind_payment_terms()
    {
        SqlDataAdapter adap = new SqlDataAdapter("select * from tbl_payment_terms_master where pcode='" + DropDownList1.SelectedValue + "' ", con);
        DataSet ds = new DataSet();
        adap.Fill(ds);
        if (ds.Tables[0].Rows.Count != 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];
            Label1.Text = double.Parse(dr["p1"].ToString()).ToString("n2");
            Label2.Text = double.Parse(dr["p2"].ToString()).ToString("n2");
            Label3.Text = double.Parse(dr["p3"].ToString()).ToString("n2");
            Label4.Text = double.Parse(dr["p4"].ToString()).ToString("n2");
        }
        else
        {
            Label1.Text = Label2.Text = Label3.Text = Label4.Text = "0";
        }
    }
    public void bind__terms()
    {
        SqlDataAdapter adap = new SqlDataAdapter("select terms from tbl_arkaya_terms_condition where pname='" + DropDownList1.SelectedItem.Text + "' and type='Quotation' ", con);
        DataSet ds = new DataSet();
        adap.Fill(ds);
        if (ds.Tables[0].Rows.Count != 0)
        {
            DataRow dr = ds.Tables[0].Rows[0];
            TextBox17.Text = dr["terms"].ToString();
        }
        else
        {
            TextBox17.Text = "";
        }
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        bind_payment_terms();
        bind__terms();
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
        double price = double.Parse(TextBox1.Text);
        double qty = double.Parse(TextBox2.Text);
        double discount = double.Parse(TextBox3.Text);
        double tax = double.Parse(TextBox5.Text);

        double total_amount = price * qty;






        double get_discount_amount = total_amount * discount / 100;
        TextBox15.Text = get_discount_amount.ToString("n2");
        TextBox4.Text = total_amount.ToString("n2");
        TextBox4.Text = (total_amount - get_discount_amount).ToString("n2");
        double get_grand_total = total_amount - get_discount_amount;
        TextBox11.Text = get_grand_total.ToString("n2");

        double subsidy = double.Parse(TextBox19.Text);

        double tax_amount = double.Parse(TextBox4.Text) * tax / 100;
        TextBox10.Text = tax_amount.ToString("n2");
        TextBox11.Text = (total_amount - get_discount_amount + tax_amount - subsidy).ToString("n2");

        double round = Convert.ToDouble(Math.Round(double.Parse(TextBox11.Text), 0));
        TextBox11.Text = round.ToString();

        int r2 = Convert.ToInt32(TextBox11.Text);
        TextBox12.Text = "Indian Rupees " + words(r2) + "  Only";

        TextBox11.Text = round.ToString("n2");

        double grand = double.Parse(TextBox11.Text);
        if (Label1.Text == string.Empty)
        {
            Label1.Text = "0";
        }
        if (Label2.Text == string.Empty)
        {
            Label2.Text = "0";
        }
        if (Label3.Text == string.Empty)
        {
            Label3.Text = "0";
        }
        if (Label4.Text == string.Empty)
        {
            Label4.Text = "0";
        }
        double p1 = double.Parse(Label1.Text);
        TextBox6.Text = (grand * p1 / 100).ToString("n2");
        double p2 = double.Parse(Label2.Text);
        TextBox7.Text = (grand * p2 / 100).ToString("n2");
        double p3 = double.Parse(Label3.Text);
        TextBox8.Text = (grand * p3 / 100).ToString("n2");
        double p4 = double.Parse(Label4.Text);
        TextBox9.Text = (grand * p4 / 100).ToString("n2");

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
    protected void TextBox13_TextChanged(object sender, EventArgs e)
    {
        if (TextBox13.Text != string.Empty)
        {
            double a = double.Parse(TextBox11.Text);
            double b = double.Parse(TextBox13.Text);
            double c = a - b;
            TextBox14.Text = c.ToString("n2");
        }
    }
    public void po_no()
    {

        cmd = con.CreateCommand();
        con.Open();
        cmd.CommandText = "  SELECT  RIGHT('0000'+ isnull(CONVERT(VARCHAR,max(cast(order_no as bigint))+1),0),4) as id FROM tbl_quotation_details";
        TextBox16.Text = cmd.ExecuteScalar().ToString();
        con.Close();
        if (TextBox16.Text == "0000")
        {
            TextBox16.Text = "0001";
        }

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        po_no();
        cmd = con.CreateCommand();
        con.Open();
        cmd.CommandText = "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '12:30:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101) insert into tbl_quotation_details values('" + TextBox16.Text + "',@date_new,'" + txtcno.Text + "','" + txttitle.Text + "','" + txtaddress.Text + "','" + txttown.Text + "','" + txtpostcode.Text + "','" + txtemail.Text + "','" + txtmobile.Text + "','" + DropDownList1.SelectedValue + "','" + DropDownList1.SelectedItem.Text + "','" + TextBox1.Text + "','" + TextBox2.Text + "','" + TextBox3.Text + "','" + TextBox4.Text + "','" + TextBox15.Text + "','" + TextBox5.Text + "','" + TextBox10.Text + "','" + TextBox11.Text + "','" + TextBox12.Text + "','" + Label1.Text + "','" + TextBox6.Text + "','" + Label2.Text + "','" + TextBox7.Text + "','" + Label3.Text + "','" + TextBox8.Text + "','" + Label4.Text + "','" + TextBox9.Text + "','" + TextBox13.Text + "','" + TextBox14.Text + "','" + Session["Username"].ToString() + "','" + TextBox17.Text + "','" + TextBox18.Text + "','" + TextBox19.Text + "')";
        cmd.ExecuteNonQuery();
        con.Close();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Quotation Saved Sucessfully');", true);
        Response.Redirect("quotation_pdf.aspx?id=" + TextBox16.Text + "");
    }
}