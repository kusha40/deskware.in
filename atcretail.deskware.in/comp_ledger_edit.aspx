<%@ Page Language="C#" AutoEventWireup="true" CodeFile="comp_ledger_edit.aspx.cs" Inherits="comp_ledger_edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="Content/custom.css" rel="stylesheet" />
    </head>
<body>
    <form id="form1" runat="server">
    <div>
        <table width="750px">
            <tr>
                <td colspan="2">
                   <h5 id="h5" runat="server"></h5></td>
            </tr>

            <tr>
                <td colspan="2">
<asp:GridView ID="GridView1" runat="server" CssClass="Grid" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" DataKeyNames="id">
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderText="Sr No.">
                                                                                <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
                                <br />
                                                                                    <asp:Label ID="lblid" Visible="false" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                                 <asp:TemplateField HeaderText="Company Name">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblcname" runat="server" Text='<%# Bind("c_name") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Size">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblsize" runat="server" Text='<%# Bind("size") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                                 <asp:TemplateField HeaderText="Product Code">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="Label31" runat="server" Text='<%# Bind("p_code") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Qty">
                                                                                    <EditItemTemplate>
                                                <asp:TextBox ID="txtqty" runat="server" Text='<%# Bind("qty") %>' AutoPostBack="true" OnTextChanged="txtqty_TextChanged"></asp:TextBox>
                                            </EditItemTemplate>
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblqty" runat="server" Text='<%# Bind("qty") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Unit">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("unit") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                                  <asp:TemplateField HeaderText="Product Grade" Visible="False">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="Label39" runat="server" Text='<%# Bind("p_grade") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Rate">
                                                                                                       <EditItemTemplate>
                                                <asp:TextBox ID="txtmrp" runat="server"  AutoPostBack="true" OnTextChanged="txtmrp_TextChanged"></asp:TextBox>
                                            </EditItemTemplate>
                                                                                <ItemTemplate>

                                                                                    <asp:Label ID="Label5" runat="server" ></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Amount">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="Label1" runat="server" ></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                              <asp:TemplateField HeaderText="Amount" Visible="false">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="lblcompid" runat="server" ></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            
                                                                            <asp:TemplateField ShowHeader="False" Visible="False">
                                                                                <ItemTemplate>
                                                                                    <asp:LinkButton ID="lnkadd" runat="server" CausesValidation="False" CommandArgument='<%# Eval("id")%>' CommandName="delete1" Text="Remove"></asp:LinkButton>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                               <asp:CommandField ShowEditButton="True" Visible="False"  />
                                        <asp:CommandField ShowDeleteButton="True" Visible="False" />
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

            <tr>
                <td colspan="2" align="right">

                                		&nbsp;</td>
            </tr>

            <tr>
                <td>

                    &nbsp;</td>
                <td>

                    &nbsp;</td>
            </tr>

        </table>
    
    </div>
    </form>
</body>
</html>
