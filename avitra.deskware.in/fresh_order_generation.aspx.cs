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

public partial class fresh_order_generation : System.Web.UI.Page
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
            cls.bind_ddl(ddlpcode, "select p_code from tbl_product_master", "p_code", "p_code");
            cls.bind_ddl(ddlcompname, "Select name from tbl_company_master order by name asc", "name", "name");
            if (ddlsize.SelectedValue == "12x24")
            {
                Label6.Text = "PCS";
            }
            else
            {
                Label6.Text = "Box";
            }

            bind_temp();

            // cls.bind_ddl(ddlcompname, "Select distinct c_name from tbl_product_master where size='" + ddlsize.SelectedValue + "' order by c_name asc", "c_name", "c_name");
            //  cls.bind_ddl(ddlpcode, "select distinct p_code from tbl_product_master where size='" + ddlsize.SelectedValue + "' and c_name='" + ddlcompname.SelectedValue + "'", "p_code", "p_code");

            //   cls.gridbind(GridView2, "select distinct size,c_name,unit,P_type,p_code from  tbl_product_master order by size asc");

        }
    }
    string cmnd = "";

    string p_size, pro_code, p_unit, pro_grade, pro_cname, pro_qty = "";
    protected void btnsubmit_Click(object sender, EventArgs e)
    {

        //double labour_qty = Convert.ToDouble(txtqty.Text);

        ////daily labour pricing//
        //if (ddlsize.SelectedValue == "12x18")
        //{
        //    cmnd = "select rate from tbl_trolla_labour_charges where size='12x18'";
        //    // labour_price = 1;
        //}
        //if (ddlsize.SelectedValue == "12x24")
        //{
        //    cmnd = "select rate from tbl_trolla_labour_charges where size='12x24'";
        //    // labour_price = 1;
        //}
        //if (ddlsize.SelectedValue == "2x2")
        //{
        //    cmnd = "select rate from tbl_trolla_labour_charges where size='2x2'";
        //    // labour_price = 1;
        //}
        //if (ddlsize.SelectedValue == "2x4")
        //{
        //    cmnd = "select rate from tbl_trolla_labour_charges where size='2x4'";
        //    // labour_price = 1;
        //}
        //if (ddlsize.SelectedValue == "32x32")
        //{
        //    cmnd = "select rate from tbl_trolla_labour_charges where size='32x32'";
        //    // labour_price = 1;
        //}

        //SqlCommand cmd9 = con.CreateCommand();
        //con.Open();
        //cmd9.CommandText = cmnd;
        //labour_price = double.Parse(cmd9.ExecuteScalar().ToString());
        //con.Close();

        //double labour_totl_price = labour_price * labour_qty;

        //po_no();
        //string date = DateTime.ParseExact(txtdate.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
        //cmd = con.CreateCommand();
        //SqlCommand cmd2 = con.CreateCommand();
        //con.Open();
        //cmd.CommandText = " insert into tbl_fresh_order_stock_master values('" + ddlsize.SelectedValue + "','" + ddlcompname.SelectedValue + "','" + ddlprotype.SelectedValue + "','" + txtqty.Text.Trim() + "','" + ddlpcode.SelectedValue + "','" + date + "','" + txtremarks.Text.Trim() + "','" + Label6.Text + "','" + Label7.Text + "')";
        //cmd2.CommandText = " insert into tbl_trolla_labour_ledger_master values('Trolla Labour','" + labour_totl_price + "','','" + date + "','" + Label7.Text.Trim() + "','')";
        //cmd2.ExecuteNonQuery();
        //cmd.ExecuteNonQuery();
        //con.Close();
        //stock_updation();
        //ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Created Sucessfully');", true);
        //txtqty.Text = txtremarks.Text = "";
        int count = 0;
        int j;
        po_no();
        for (j = 0; j < GridView2.Rows.Count; j++)
        {
            Label size = (Label)GridView2.Rows[j].FindControl("lblsize");
            Label c_name = (Label)GridView2.Rows[j].FindControl("lblc_name");
            Label p_type = (Label)GridView2.Rows[j].FindControl("lblp_type");
            Label unit = (Label)GridView2.Rows[j].FindControl("lblunit");
            Label p_code = (Label)GridView2.Rows[j].FindControl("lblp_code");
            Label qty = (Label)GridView2.Rows[j].FindControl("lbl_qty");

            p_size = size.Text;
            pro_cname = c_name.Text;
            pro_grade = p_type.Text;
            p_unit = unit.Text;
            pro_code = p_code.Text;
            pro_qty = qty.Text;

            //   if (cb.Checked == true)
            {
                count++;
                double labour_qty = Convert.ToDouble(pro_qty);

                //daily labour pricing//
                if (size.Text == "12x18")
                {
                    cmnd = "select rate from tbl_trolla_labour_charges where size='12x18'";
                    // labour_price = 1;
                }
                if (size.Text == "12x24")
                {
                    cmnd = "select rate from tbl_trolla_labour_charges where size='12x24'";
                    // labour_price = 1;
                }
                if (size.Text == "2x2")
                {
                    cmnd = "select rate from tbl_trolla_labour_charges where size='2x2'";
                    // labour_price = 1;
                }
                if (size.Text == "2x4")
                {
                    cmnd = "select rate from tbl_trolla_labour_charges where size='2x4'";
                    // labour_price = 1;
                }
                if (size.Text == "32x32")
                {
                    cmnd = "select rate from tbl_trolla_labour_charges where size='32x32'";
                    // labour_price = 1;
                }

                SqlCommand cmd9 = con.CreateCommand();
                con.Open();
                cmd9.CommandText = cmnd;
                labour_price = double.Parse(cmd9.ExecuteScalar().ToString());
                con.Close();

                double labour_totl_price = labour_price * labour_qty;


                string date = DateTime.ParseExact(txtdate.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
                cmd = con.CreateCommand();
                SqlCommand cmd2 = con.CreateCommand();
                con.Open();
                cmd.CommandText = " insert into tbl_fresh_order_stock_master values('" + p_size + "','" + pro_cname + "','" + pro_grade
                    + "','" + pro_qty + "','" + pro_code + "','" + date + "','','" + Label6.Text + "','" + Label7.Text + "')";
            
                cmd.ExecuteNonQuery();
                con.Close();
                stock_updation();
            }
        }
        if (count > 0)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Submitted Sucessfully');window.location='fresh_order_generation.aspx';", true);
        }

    }

    public void stock_updation()
    {
        SqlDataAdapter adap1 = new SqlDataAdapter("select  qty from tbl_fresh_order_stock_qty_master where size='" + p_size + "' and c_name='" + pro_cname + "' and p_code='" + pro_code + "'", con);
        DataSet ds1 = new DataSet();
        adap1.Fill(ds1);
        if (ds1.Tables[0].Rows.Count != 0)
        {
            DataRow dr1 = ds1.Tables[0].Rows[0];
            Label8.Text = dr1["qty"].ToString();
        }
        else
        {
            Label8.Text = "0";
        }

        //  Label8.Text = Convert.ToDouble(double.Parse(Label8.Text) + double.Parse(txtqty.Text.Trim())).ToString();
        Label8.Text = Convert.ToDouble(double.Parse(Label8.Text) + double.Parse(pro_qty)).ToString();
        SqlCommand cmd3 = con.CreateCommand();
        con.Open();
        cmd3.CommandText = " select count(id) from tbl_fresh_order_stock_qty_master where  size= '" + p_size + "' and c_name='" + pro_cname + "' and p_code='" + pro_code + "' and p_grade='" + pro_grade + "'";
        int a = int.Parse(cmd3.ExecuteScalar().ToString());
        if (a == 0)
        {
            SqlCommand cmd4 = con.CreateCommand();
            cmd4.CommandText = "insert into tbl_fresh_order_stock_qty_master values ('" + p_size + "','" + pro_cname + "','" + pro_code + "','" + Label8.Text + "','" + pro_grade + "','" + Label6.Text + "')";
            cmd4.ExecuteNonQuery();
        }
        else
        {
            SqlCommand cmd5 = con.CreateCommand();
            cmd5.CommandText = "update tbl_fresh_order_stock_qty_master  set qty= '" + Label8.Text + "' where  size= '" + p_size + "' and c_name='" + pro_cname + "' and p_code='" + pro_code + "' and p_grade='" + pro_grade + "'";
            cmd5.ExecuteNonQuery();
        }
        con.Close();


    }
    public void stock_updation1()
    {
        SqlDataAdapter adap1 = new SqlDataAdapter("select  qty from tbl_fresh_order_stock_qty_master where size='" + p_size + "' and c_name='" + pro_cname + "' and p_code='" + pro_code + "'", con);
        DataSet ds1 = new DataSet();
        adap1.Fill(ds1);
        if (ds1.Tables[0].Rows.Count != 0)
        {
            DataRow dr1 = ds1.Tables[0].Rows[0];
            Label8.Text = dr1["qty"].ToString();
        }
        else
        {
            Label8.Text = "0";
        }

        //  Label8.Text = Convert.ToDouble(double.Parse(Label8.Text) + double.Parse(txtqty.Text.Trim())).ToString();
        Label8.Text = Convert.ToDouble(double.Parse(Label8.Text) - double.Parse(pro_qty)).ToString();
        SqlCommand cmd3 = con.CreateCommand();
        con.Open();
        cmd3.CommandText = " select count(id) from tbl_fresh_order_stock_qty_master where  size= '" + p_size + "' and c_name='" + pro_cname + "' and p_code='" + pro_code + "' and p_grade='" + pro_grade + "'";
        int a = int.Parse(cmd3.ExecuteScalar().ToString());
        if (a == 0)
        {
            SqlCommand cmd4 = con.CreateCommand();
            cmd4.CommandText = "insert into tbl_fresh_order_stock_qty_master values ('" + p_size + "','" + pro_cname + "','" + pro_code + "','" + Label8.Text + "','" + pro_grade + "','" + Label6.Text + "')";
            cmd4.ExecuteNonQuery();
        }
        else
        {
            SqlCommand cmd5 = con.CreateCommand();
            cmd5.CommandText = "update tbl_fresh_order_stock_qty_master  set qty= '" + Label8.Text + "' where  size= '" + p_size + "' and c_name='" + pro_cname + "' and p_code='" + pro_code + "' and p_grade='" + pro_grade + "'";
            cmd5.ExecuteNonQuery();
        }
        con.Close();


    }

    protected void btnview_Click(object sender, EventArgs e)
    {
        GridView1.Columns[6].Visible = false;
        bind();

    }
    public void po_no()
    {

        cmd = con.CreateCommand();
        con.Open();
        cmd.CommandText = "  SELECT  RIGHT('0000'+ isnull(CONVERT(VARCHAR,max(cast(stock_id as bigint))+1),0),4) as id FROM tbl_fresh_order_stock_master";
        Label7.Text = cmd.ExecuteScalar().ToString();
        con.Close();
        if (Label7.Text == "0000")
        {
            Label7.Text = "0001";
        }
    }
    double labour_price, del_p_qty = 0;
    string del_p_code = "";
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        GridViewRow row = (GridViewRow)GridView1.Rows[e.RowIndex];
        Label lbldeleteid = (Label)row.FindControl("Label1");
        Label pp_CODE = (Label)row.FindControl("Label200");
        Label ppp_qty = (Label)row.FindControl("Label201");
        del_p_code = pp_CODE.Text;
        del_p_qty = Convert.ToDouble(ppp_qty.Text);
        con.Open();
        SqlCommand cmd = new SqlCommand("delete FROM tbl_fresh_order_stock_master where stock_id='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
        SqlCommand cmd2 = new SqlCommand("delete FROM tbl_trolla_labour_ledger_master where stock_id='" + Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value.ToString()) + "'", con);
        cmd.ExecuteNonQuery();
        cmd2.ExecuteNonQuery();
        cmd.ExecuteNonQuery();
        con.Close();
        stock_updation_reverse();
        ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Deleted Sucessfully');", true);
        bind();
    }
    public void stock_updation_reverse()
    {
        SqlDataAdapter adap1 = new SqlDataAdapter("select  qty from tbl_fresh_order_stock_qty_master where p_code='" + del_p_code + "'", con);
        DataSet ds1 = new DataSet();
        adap1.Fill(ds1);
        if (ds1.Tables[0].Rows.Count != 0)
        {
            DataRow dr1 = ds1.Tables[0].Rows[0];
            Label8.Text = dr1["qty"].ToString();
        }
        else
        {
            Label8.Text = "0";
        }

        //  Label8.Text = Convert.ToDouble(double.Parse(Label8.Text) + double.Parse(txtqty.Text.Trim())).ToString();
        Label8.Text = Convert.ToDouble(double.Parse(Label8.Text) - del_p_qty).ToString();
        SqlCommand cmd3 = con.CreateCommand();
        con.Open();
        cmd3.CommandText = " select count(id) from tbl_fresh_order_stock_qty_master where   p_code='" + del_p_code + "' ";
        int a = int.Parse(cmd3.ExecuteScalar().ToString());
        if (a == 0)
        {
            SqlCommand cmd4 = con.CreateCommand();
            cmd4.CommandText = "insert into tbl_fresh_order_stock_qty_master values ('" + p_size + "','" + pro_cname + "','" + pro_code + "','" + Label8.Text + "','" + pro_grade + "','" + Label6.Text + "')";
            cmd4.ExecuteNonQuery();
        }
        else
        {
            SqlCommand cmd5 = con.CreateCommand();
            cmd5.CommandText = "update tbl_fresh_order_stock_qty_master  set qty= '" + Label8.Text + "' where   p_code='" + del_p_code + "' ";
            cmd5.ExecuteNonQuery();
        }
        con.Close();


    }
    public void bind()
    {
        ////cls.gridbind(GridView1, "select max(size),max(c_name),max(p_type),sum(qty),max(unit) from tbl_fresh_order_stock_master where stock_id not in (select stock_id from tbl_company_ledger_master)  and size='" + ddlsize.SelectedValue + "' and c_name='" + ddlcompname.SelectedValue + "' and p_type='" + ddlprotype.SelectedValue + "'   order by date desc");
        cls.gridbind(GridView1, "select * from tbl_fresh_order_stock_qty_master order by c_name asc");
        int i; double totl = 0;
        for (i = 0; i < GridView1.Rows.Count; i++)
        {
            Label debit = GridView1.Rows[i].FindControl("Label201") as Label;
            totl += double.Parse(debit.Text);
        }
        Label4.Text = totl.ToString("n2");

    }

    protected void ddlsize_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (ddlsize.SelectedValue == "12x24")
        {
            Label6.Text = "PCS";


        }
        else
        {
            Label6.Text = "Box";
        }
        cls.bind_ddl(ddlcompname, "Select distinct c_name from tbl_product_master where size='" + ddlsize.SelectedValue + "' order by c_name asc", "c_name", "c_name");
        cls.bind_ddl(ddlpcode, "select distinct p_code from tbl_product_master where size='" + ddlsize.SelectedValue + "' and c_name='" + ddlcompname.SelectedValue + "'", "p_code", "p_code");
    }
    protected void ddlcompname_SelectedIndexChanged(object sender, EventArgs e)
    {
        cls.bind_ddl(ddlpcode, "select distinct p_code from tbl_product_master where size='" + ddlsize.SelectedValue + "' and c_name='" + ddlcompname.SelectedValue + "'", "p_code", "p_code");
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
    protected void Button1_Click(object sender, EventArgs e)
    {
        DataTable dt = (DataTable)ViewState["stock"];
        dt.Rows.Add(ddlsize.SelectedValue, ddlcompname.SelectedValue, ddlprotype.SelectedValue, ddlpcode.SelectedValue, txtqty.Text, Label6.Text);
        ViewState["stock"] = dt;
        GridView2.DataSource = (DataTable)ViewState["stock"];
        GridView2.DataBind();
        txtqty.Text = string.Empty;
    }
    public void bind_temp()
    {
        DataTable dt = new DataTable();
        dt.Columns.AddRange(
              new DataColumn[6] 
            { 
                                new DataColumn("size", typeof(string)),

                new DataColumn("c_name", typeof(string)),
                    new DataColumn("p_type", typeof(string)),
                            new DataColumn("p_code", typeof(string)),
                             new DataColumn("qty", typeof(string)),
                               new DataColumn("unit", typeof(string))
                              
            }

          );
        ViewState["stock"] = dt;
        GridView2.DataSource = (DataTable)ViewState["stock"];
        GridView2.DataBind();
    }
    private static DataTable dt1 = new DataTable();
    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "delete1")
        {
            if (GridView2.Rows.Count > 0)
            {
                DataTable dt = (DataTable)ViewState["stock"];
                GridViewRow row = (GridViewRow)(((Control)e.CommandSource).NamingContainer);
                DataTable dtCurrentTable = new DataTable();
                int RowIndex = row.RowIndex;
                dtCurrentTable = dt;
                dtCurrentTable.Rows.RemoveAt(row.RowIndex);
                GridView2.DataSource = dt;
                GridView2.DataBind();
            }
        }
    }

    protected void btn2_Click(object sender, EventArgs e)
    {
        GridView1.Columns[6].Visible = true;
        cls.gridbind(GridView1, "DECLARE @d DATETIME, @t TIME;set @d = getdate();SET @t = '00:00:00';declare @date DATETIME;declare @date_new datetime;set @date=(SELECT (@d + CAST(@t AS datetime)))set @date_new=CONVERT(nvarchar(30), @date, 101) select max(date)as date, max(size)as size,max(c_name)as c_name,max(p_type)as p_type,sum(qty)as qty,max(unit)as unit,max(stock_id)as stock_id from tbl_fresh_order_stock_master where stock_id not in (select stock_id from tbl_company_ledger_master) and   date=@date_new group by stock_id");
        int i; double totl = 0;
        for (i = 0; i < GridView1.Rows.Count; i++)
        {
            Label debit = GridView1.Rows[i].FindControl("Label201") as Label;
            totl += double.Parse(debit.Text);
        }
        Label4.Text = totl.ToString("n2");
    }

    protected void btnsubmit0_Click(object sender, EventArgs e)
    {
        int count = 0;
        int j;
        po_no();
        for (j = 0; j < GridView2.Rows.Count; j++)
        {
            Label size = (Label)GridView2.Rows[j].FindControl("lblsize");
            Label c_name = (Label)GridView2.Rows[j].FindControl("lblc_name");
            Label p_type = (Label)GridView2.Rows[j].FindControl("lblp_type");
            Label unit = (Label)GridView2.Rows[j].FindControl("lblunit");
            Label p_code = (Label)GridView2.Rows[j].FindControl("lblp_code");
            Label qty = (Label)GridView2.Rows[j].FindControl("lbl_qty");

            p_size = size.Text;
            pro_cname = c_name.Text;
            pro_grade = p_type.Text;
            p_unit = unit.Text;
            pro_code = p_code.Text;
            pro_qty = qty.Text;

            //   if (cb.Checked == true)
            {
                count++;
                double labour_qty = Convert.ToDouble(pro_qty);

                //daily labour pricing//
                if (size.Text == "12x18")
                {
                    cmnd = "select rate from tbl_trolla_labour_charges where size='12x18'";
                    // labour_price = 1;
                }
                if (size.Text == "12x24")
                {
                    cmnd = "select rate from tbl_trolla_labour_charges where size='12x24'";
                    // labour_price = 1;
                }
                if (size.Text == "2x2")
                {
                    cmnd = "select rate from tbl_trolla_labour_charges where size='2x2'";
                    // labour_price = 1;
                }
                if (size.Text == "2x4")
                {
                    cmnd = "select rate from tbl_trolla_labour_charges where size='2x4'";
                    // labour_price = 1;
                }
                if (size.Text == "32x32")
                {
                    cmnd = "select rate from tbl_trolla_labour_charges where size='32x32'";
                    // labour_price = 1;
                }

                SqlCommand cmd9 = con.CreateCommand();
                con.Open();
                cmd9.CommandText = cmnd;
                labour_price = double.Parse(cmd9.ExecuteScalar().ToString());
                con.Close();

                double labour_totl_price = labour_price * labour_qty;


                string date = DateTime.ParseExact(txtdate.Text.Trim(), "MM/dd/yyyy", CultureInfo.InvariantCulture).ToString("MM/dd/yyyy", CultureInfo.InvariantCulture);
                cmd = con.CreateCommand();
                SqlCommand cmd2 = con.CreateCommand();
                con.Open();
                cmd.CommandText = " insert into tbl_fresh_order_stock_master values('" + p_size + "','" + pro_cname + "','" + pro_grade
                    + "','" + pro_qty + "','" + pro_code + "','" + date + "','','" + Label6.Text + "','" + Label7.Text + "')";

                cmd.ExecuteNonQuery();
                con.Close();
                stock_updation1();
            }
        }
        if (count > 0)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "AlertBox", "alert('Submitted Sucessfully');window.location='fresh_order_generation.aspx';", true);
        }
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Response.Clear();
        Response.AddHeader("content-disposition", "attachment;filename=Order_sheet.xls");
        Response.Charset = "";
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.ContentType = "application/vnd.xls";
        System.IO.StringWriter stringWrite = new System.IO.StringWriter();
        System.Web.UI.HtmlTextWriter htmlWrite = new HtmlTextWriter(stringWrite);
        GridView1.RenderControl(htmlWrite);
        Response.Write(stringWrite.ToString());
        Response.End();
    }
    public override void VerifyRenderingInServerForm(Control control)
    { }
    }
