<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="change_password.aspx.cs" Inherits="change_password" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Change Password </h1>
    <table cellspacing=1 cellpadding=5>
<tr>
<td class="listtitle" colspan=2>Enter Details</td></tr>

<input type=hidden name=referer value="/CMD&#95LOGIN">

    <tr>
    <td class="list" >Current Password :</td><td class=list>
    <asp:TextBox ID="txtcurrenetpwd" runat="server" class="inset input " Width="200px" TextMode="Password"></asp:TextBox>
    
    
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtcurrenetpwd" ErrorMessage="*"></asp:RequiredFieldValidator>
    
    
<tr><td class="list" >New Password :</td><td class=list>
  <asp:TextBox ID="txtnewpwd" runat="server" class="inset input" Width="200px" TextMode="Password"></asp:TextBox>

    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtnewpwd" ErrorMessage="*"></asp:RequiredFieldValidator>

</tr>
    
    
<tr><td class="list" >Confirm Password :</td><td class=list>
  <asp:TextBox ID="txtconfirmpwd" runat="server" class="inset input" Width="200px" TextMode="Password" ></asp:TextBox>

    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtconfirmpwd" ErrorMessage="*"></asp:RequiredFieldValidator>
    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="txtnewpwd" ControlToValidate="txtconfirmpwd" ErrorMessage="Not Match"></asp:CompareValidator>

</tr>
    
    
<tr><td class="listtitle" align=right colspan=2>
  
    <asp:Button ID="btnsave" runat="server" Text="Update" OnClick="btnsave_Click" ></asp:Button>
    </td></tr>

</table>
</asp:Content>

