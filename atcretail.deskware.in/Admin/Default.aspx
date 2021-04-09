<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br /> <br />
     <asp:Button ID="Button1" runat="server" Text="Delete All Dealer Previous Pricing" class="btn btn-danger" OnClientClick="return confirm('Are you sure to delete?')" OnClick="Button1_Click"  />
              <asp:Button ID="Button2" runat="server" Text="Delete All Salesman Previous Pricing" class="btn btn-danger" OnClientClick="return confirm('Are you sure to delete?')" OnClick="Button2_Click"  />
     
</asp:Content>

