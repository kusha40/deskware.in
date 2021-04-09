<%@ Page Title="" Language="C#" MasterPageFile="~/school.master" AutoEventWireup="true" CodeFile="school_dashboardaspx.aspx.cs" Inherits="school_dashboardaspx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
  <table style="padding:15px;border:1px solid #000">
      <tr>
          <td >
              <div style="padding:15px;border:1px solid #000">
<span class="count_top" style="color:GrayText;font-weight:bold;Font-Size:Large;">

                    <asp:DropDownList ID="ddlsession" class="inset" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlsession_SelectedIndexChanged" >
                    </asp:DropDownList>

                      <br />
                  <br />

Total No. Student's
</span>
<div id="totlstudent" runat="server" style="font-weight:bold;Font-Size:X-Large;" ></div>
</div>
          </td>
      </tr>
  </table>
        </div>
    </asp:Content>

