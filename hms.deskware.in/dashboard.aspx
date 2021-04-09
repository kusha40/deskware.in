<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="dashboard.aspx.cs" Inherits="dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div>
  <table style="padding:15px;border:1px solid #000">
      <tr>
          <td>
              <div style="padding:15px;border:1px solid #000"  >
<span class="count_top" style="color:GrayText;font-weight:bold;Font-Size:Large;">

Total No. School's
</span>
<div id="totl" runat="server" style="font-weight:bold; Font-Size:X-Large;" ></div>
</div>
          </td>
          <td >
              <div style="padding:15px;border:1px solid #000">
<span class="count_top" style="color:GrayText;font-weight:bold;Font-Size:Large;">

Total No. Student's
</span>
<div id="totlstudent" runat="server" style="font-weight:bold;Font-Size:X-Large;" ></div>
</div>
          </td>
      </tr>
  </table>
      

            
  </div>

</asp:Content>

