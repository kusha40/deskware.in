<%@ Page Language="C#" AutoEventWireup="true" CodeFile="print_all.aspx.cs" Inherits="Admin_print_all" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">
        .tbl {
            font-family: Tahoma;
            font-size: 12px;
            padding: 5px;
            border: 1px solid black;
        }
    </style>

    <script type="text/javascript">
        function Button1_onclick() {
            window.print();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <p>
                <input id="Button1" type="button" value="Print" onclick="return Button1_onclick()" /></p>

            <asp:DataList ID="DataList1" runat="server" RepeatColumns="1" OnItemDataBound="DataList1_ItemDataBound">



                <ItemTemplate>
                    <div>


                        <p style="page-break-after: always" />
                        <table cellpadding="4" cellspacing="4" class="tbl" valign="top">
                            <tr align="center">
                                <td colspan="2"><b>T.H.</b><br />Volume Sale Report
                 
                 
                                </td>

                            </tr>
                            <tr>
                                <td><b>Date Duration :</b>
                                    <asp:Literal ID="Literal1" runat="server" ></asp:Literal>
                                     <asp:Literal ID="Literal4" runat="server" Text='<%#Eval("dealer_id")%>' Visible="false" ></asp:Literal>
                                </td>
                                <td align="right">&nbsp;</td>

                            </tr>
                            <tr>
                                <td colspan="2"><b>Dealer Name : </b>
                                    <asp:Literal ID="Literal2" runat="server" Text='<%#Eval("dealer_name")%>'></asp:Literal></td>
                            </tr>
                            <tr>
                                <td colspan="2"><b>Total Amount : </b>
                                    <asp:Literal ID="Literal3" runat="server" ></asp:Literal></td>
                            </tr>
                            <tr>
                                <td colspan="2">&nbsp;</td>
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
                                            <asp:TemplateField HeaderText="Size">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("size") %>'></asp:Label>
                                                </ItemTemplate>
                                            </asp:TemplateField>

                                            <asp:TemplateField HeaderText="Qty.">
                                                <ItemTemplate>
                                                    <asp:Label ID="Label31" runat="server" Text='<%# Bind("qty") %>'></asp:Label>
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

                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>

                        <%--</page>--%>
                        <%--  <br class="break"> --%>
                    </div>
                    </div>
                </ItemTemplate>

            </asp:DataList>

        </div>
    </form>
</body>
</html>

