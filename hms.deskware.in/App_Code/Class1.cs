using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Text;
using System.Web.UI;

/// <summary>
/// Summary description for Class1
/// </summary>
public class Class1
{
   SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
    SqlDataAdapter adap;
    SqlCommand cmd;
    DataSet ds;
    public Class1()
    {
        //
        // TODO: Add constructor logic here
        //
    }
    public DataSet getdataset(string query)
    {
        adap = new SqlDataAdapter(query, con);
        ds = new DataSet();
        adap.Fill(ds);
        return ds;
    }
    public int gridbind(GridView gd, string str)
    {
        ds = new DataSet();
        ds = getdataset(str);
        gd.DataSource = ds;
        gd.DataBind();
        return ds.Tables[0].Rows.Count;
    }
    public void bind_ddl(DropDownList ddl, string query, string display, string used)
    {
        // ddl.Items.Add("Select");
        ddl.DataSource = getdataset(query);
        ddl.DataTextField = display;
        ddl.DataValueField = used;
        ddl.DataBind();
       // ddl.Items.Insert(0,"Select");
    }
    public void bind_chklist(CheckBoxList chk, string query, string display, string used)
    {
        // ddl.Items.Add("Select");
        chk.DataSource = getdataset(query);
        chk.DataTextField = display;
        chk.DataValueField = used;
        chk.DataBind();
    }
    public void bind_rdlist(RadioButtonList rdl, string query, string display, string used)
    {
        // ddl.Items.Add("Select");
        rdl.DataSource = getdataset(query);
        rdl.DataTextField = display;
        rdl.DataValueField = used;
        rdl.DataBind();
    }
    private const int MAXNUMBERS = 8;
    public string rand(string text)
    {
        Random r = new Random();
        StringBuilder sb = new StringBuilder();
        int size = MAXNUMBERS;
        
        System.Random rand = new System.Random((int)System.DateTime.Now.Ticks);
        int random = rand.Next(1, 100000000);
        string legalNums =random.ToString();
        for (int i = 0; i < size; i++)
        {
            sb.Append(legalNums.Substring(r.Next(0, legalNums.Length - 1) + 1, 1));
        }
        return sb.ToString();
    }

    public int datalist(DataList dl, string str)
    {
        ds = new DataSet();
        ds = getdataset(str);
        dl.DataSource = ds;
        dl.DataBind();
        return ds.Tables[0].Rows.Count;
    }
  public static void ResetPanel(Panel p)
    {
        foreach (Control c in p.Controls)
        {
            switch (c.ToString())
            {
                case "System.Web.UI.WebControls.TextBox":
                    TextBox txt = c as TextBox;
                    txt.Text = "";
                    break;
                case "System.Web.UI.WebControls.Label":
                    Label lbl = c as Label;
                    lbl.Text = "";
                    break;
            }

        }
    }
}