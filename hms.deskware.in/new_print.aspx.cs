using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class new_print : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connect"].ToString());
    SqlCommand cmd;
    Class1 cls = new Class1();
    SqlDataAdapter adap; DataTable dt;
    DataSet ds; string path, id, school_name,type,command,session,address1 = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Username"] == null && Session["type"] == null)
        {
            Response.Redirect("~/login.aspx");
        }
        if (!IsPostBack)
        {
            if (Request.QueryString["id"] != null && Request.QueryString["school_name"] != null && Request.QueryString["type"] != null && Request.QueryString["session"] != null)
            {
                id = Request.QueryString["id"].ToString();
                school_name = Request.QueryString["school_name"].ToString();
                  type = Request.QueryString["type"].ToString();
                  session = Request.QueryString["session"].ToString();

                  string query1 = "select * from tbl_school_master where name='" + school_name + "' ";
                  SqlCommand cmd1 = new SqlCommand(query1, con);
                  SqlDataAdapter adap1 = new SqlDataAdapter(cmd1);
                  DataTable dt1 = new DataTable();
                  adap1.Fill(dt1);
                  if (dt1.Rows.Count != 0)
                  {
                      DataRow dr = dt1.Rows[0];
                      address1 = dr["address"].ToString();
                  }




                  string query = "select * from tbl_reportMaster where UNQUEID='" + id + "' and schooname='" + school_name + "' and session='" + session + "' ";
                cmd = new SqlCommand(query, con);
                adap = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                adap.Fill(dt);

                ReportDocument rpt = new ReportDocument();
                rpt.Load(Server.MapPath("print.rpt"));
                rpt.SetDataSource(dt);
                CrystalReportViewer1.ReportSource = rpt;
                CrystalReportViewer1.DataBind();



                rpt.SetParameterValue("address", address1);

                CrystalReportViewer1.RefreshReport();
               // rpt.SetDatabaseLogon("sa", "vgc@r2123", "SQL-SERVER", "justdial");
                string PDFFile = Server.MapPath("PDF/" + school_name + "/" + id + "-" + DateTime.Now.ToString("dd.MM.yy-hh.mm.ss.tt") + ".pdf");
                path = "PDF/" + school_name + "/" + id + "-" + DateTime.Now.ToString("dd.MM.yy-hh.mm.ss.tt") + ".pdf";
                rpt.ExportToDisk(ExportFormatType.PortableDocFormat, PDFFile);
                //con.Close();
                ////save po//
                if (type == "S")
                {
                    command = "insert into tbl_pdf_master  values('" + id + "','" + path + "','" + school_name + "','" + session + "')"; 
                }
                else if (type == "U")
                {
                    command = "update   tbl_pdf_master set  path='" + path + "' where unique_id='" + id + "' and school_name='" + school_name + "' and session='" + session + "' "; 
                }
                cmd = con.CreateCommand();
                con.Open();
                cmd.CommandText = command;
                cmd.ExecuteNonQuery();
                con.Close();

                rpt.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, true, "Print-Report");
                Response.End();
                rpt.Close();
                rpt.Dispose();





            }
        }
    }
    protected void CrystalReportViewer1_Unload(object sender, EventArgs e)
    {
        ReportDocument rpt = new ReportDocument();
        rpt.Close();
        rpt.Dispose();
    }
}