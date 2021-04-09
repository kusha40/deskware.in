using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string amount = string.Empty;
        string firstName = string.Empty;
        RemotePost myremotepost = new RemotePost();
        string key = "64isb9R5";
        string salt = "CKm9oPV2Gp";
        amount = TextBox1.Text;
        string productInfo = "test";
        firstName = "abhi";
        string email = "abhinandanjangra@gmail.com";
        string phone = "";
        myremotepost.Url = "https://secure.payu.in/_payment";
        myremotepost.Add("key", "64isb9R5");
        string txnid = Generatetxnid();
        myremotepost.Add("txnid", txnid);
        myremotepost.Add("amount", amount);
        myremotepost.Add("productinfo", productInfo);
        myremotepost.Add("firstname", firstName);
        myremotepost.Add("phone", phone);
        myremotepost.Add("email", email);
        myremotepost.Add("surl", "http://www.deskware.in/PaymentSuccessfully.aspx?status=sucess");//Change the success url here depending upon the port number of your local system.
        myremotepost.Add("furl", "http://www.deskware.in/PaymentSuccessfully.aspx?status=failure");//Change the failure url here depending upon the port number of your local system.
        myremotepost.Add("service_provider", "payu_paisa");
        string hashString = key + "|" + txnid + "|" + amount + "|" + productInfo + "|" + firstName + "|" + email + "|||||||||||" + salt;
        string hash = Generatehash512(hashString);
        myremotepost.Add("hash", hash);
        myremotepost.Post();
    }
    public class RemotePost
    {
        private System.Collections.Specialized.NameValueCollection Inputs = new System.Collections.Specialized.NameValueCollection();
        public string Url = "";
        public string Method = "post";
        public string FormName = "form1";

        public void Add(string name, string value)
        {
            Inputs.Add(name, value);
        }

        public void Post()
        {
            System.Web.HttpContext.Current.Response.Clear();

            System.Web.HttpContext.Current.Response.Write("<html><head>");

            System.Web.HttpContext.Current.Response.Write(string.Format("</head><body onload=\"document.{0}.submit()\">", FormName));
            System.Web.HttpContext.Current.Response.Write(string.Format("<form name=\"{0}\" method=\"{1}\" action=\"{2}\" >", FormName, Method, Url));
            for (int i = 0; i < Inputs.Keys.Count; i++)
            {
                System.Web.HttpContext.Current.Response.Write(string.Format("<input name=\"{0}\" type=\"hidden\" value=\"{1}\">", Inputs.Keys[i], Inputs[Inputs.Keys[i]]));
            }
            System.Web.HttpContext.Current.Response.Write("</form>");
            System.Web.HttpContext.Current.Response.Write("</body></html>");

            System.Web.HttpContext.Current.Response.End();
        }
    }
    public string Generatehash512(string text)
    {

        byte[] message = Encoding.UTF8.GetBytes(text);

        UnicodeEncoding UE = new UnicodeEncoding();
        byte[] hashValue;
        SHA512Managed hashString = new SHA512Managed();
        string hex = "";
        hashValue = hashString.ComputeHash(message);
        foreach (byte x in hashValue)
        {
            hex += String.Format("{0:x2}", x);
        }
        return hex;

    }
    public string Generatetxnid()
    {

        Random rnd = new Random();
        string strHash = Generatehash512(rnd.ToString() + DateTime.Now);
        string txnid1 = strHash.ToString().Substring(0, 20);

        return txnid1;
    }
}