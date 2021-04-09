<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ledger_challan_print_view.aspx.cs" Inherits="ledger_challan_print_view" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">

        .tbl
        {
            font-family:Tahoma;
            font-size:12px;
            padding:5px;
            border:1px solid black;
        }


    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table cellpadding="4" cellspacing="4" width="300px" class="tbl">
              <tr align="center">
                <td colspan="2"><b>Royal Shades</b><br />
                    Estimate</td>
            </tr>
            <tr>
                <td><b>Date :</b> <asp:Literal ID="Literal1" runat="server"></asp:Literal></td>
                <td align="right"><b>Challan No. </b>: <asp:Literal ID="Literal2" runat="server"></asp:Literal>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2"><b>Dealer Name : </b><asp:Literal ID="Literal3" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td colspan="2"><b>Area/Address : </b><asp:Literal ID="Literal4" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td colspan="2"><b>Remarks:</b> <asp:Literal ID="Literal10" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td colspan="2">
					                             
                  
                                		                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Font-Size="12px">
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderText="SNo.">
                                                                                <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
                                <br />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                                 <asp:TemplateField HeaderText="Qty.">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="Label31" runat="server" Text='<%# Bind("qty") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Unit">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("unit") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Size">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("size") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="C.Name">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("c_name") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                              <asp:TemplateField HeaderText="P.Code">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("p_code") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Rate">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("mrp", "{0:n2}") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Amount">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("amount", "{0:n2}") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            
                                                                        </Columns>
                                                                        <EmptyDataTemplate>
                                                                            <table>
                                                                                <tr>
                                                                                    <td>There are no records available. </td>
                                                                                </tr>
                                                                            </table>
                                                                        </EmptyDataTemplate>
                                                                        <PagerSettings Position="TopAndBottom" />
                                                                        <PagerStyle CssClass="GridPager" HorizontalAlign="Left" />
                                                                    </asp:GridView>
                                                                                                                </td>
            </tr>
            <tr align="right">
                <td colspan="2"><b>Total Amount&nbsp;&nbsp; &nbsp;:&nbsp;</b><asp:Literal ID="Literal5" runat="server"></asp:Literal>&nbsp;</td>
            </tr>
            <tr align="right">
                <td colspan="2"><b>Freight Charges&nbsp; &nbsp;:&nbsp; </b><asp:Literal ID="Literal6" runat="server"></asp:Literal>&nbsp;</td>
            </tr>
            <tr align="right">
                <td colspan="2"><b>Net Amount&nbsp;&nbsp; :&nbsp; </b><asp:Literal ID="Literal7" runat="server"></asp:Literal>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2"><b>Amount in words : </b><asp:Literal ID="Literal8" runat="server"></asp:Literal></td>
            </tr>
            <tr>
                <td colspan="2" align="right"><asp:Literal ID="Literal9" runat="server"></asp:Literal>&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
