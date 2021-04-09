<%@ Page Language="C#" AutoEventWireup="true" CodeFile="chk_challan.aspx.cs" Inherits="chk_challan" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="Content/custom.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            height: 25px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table width="750px">
            <tr>
                <td colspan="3">
                   <h5 id="h5" runat="server"></h5></td>
            </tr>

            <tr>
                <td colspan="3">
<asp:GridView ID="GridView1" runat="server" CssClass="Grid" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" DataKeyNames="id">
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderText="">
                            <HeaderTemplate>
                                <asp:CheckBox ID="chkAll" runat="server" AutoPostBack="true" Visible="false" OnCheckedChanged="ChkAllRows" Text="" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkAll0" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
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
                                                <asp:TextBox ID="txtmrp" runat="server" Text='<%# Bind("mrp", "{0:n2}") %>' AutoPostBack="true" OnTextChanged="txtmrp_TextChanged"></asp:TextBox>
                                            </EditItemTemplate>
                                                                                <ItemTemplate>

                                                                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("mrp", "{0:n2}") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Amount">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("amount", "{0:n2}") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            
                                                                            <asp:TemplateField ShowHeader="False" Visible="False">
                                                                                <ItemTemplate>
                                                                                    <asp:LinkButton ID="lnkadd" runat="server" CausesValidation="False" CommandArgument='<%# Eval("id")%>' CommandName="delete1" Text="Remove"></asp:LinkButton>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                               <asp:CommandField ShowEditButton="True"  />
                                        <asp:CommandField ShowDeleteButton="True" />
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
                <td colspan="3" align="right">

                                		<asp:Button ID="btnsubmit" runat="server" Text="Submit" class="btn btn-success btn-sm " OnClick="btnsubmit_Click"  />
                                            </td>
            </tr>

            <tr>
                <td>

                    &nbsp;</td>
                <td>

					                             &nbsp;</td>
                <td>

			
                    <asp:TextBox ID="txtpwd" runat="server" TextMode="Password" placeholder="Password"></asp:TextBox>
					
				                            </td>
            </tr>

            <tr>
                <td>

                    &nbsp;</td>
                <td>

					                             &nbsp;</td>
                <td>

			
                    &nbsp;</td>
            </tr>

            <tr>
                <td>

                    &nbsp;</td>
                <td>

					                             Total Amount </td>
                <td>

			
                    <asp:TextBox ID="txttotlamt" runat="server" class="form-control input-sm" ReadOnly="True">0</asp:TextBox>
					
				                            </td>
            </tr>

            <tr>
                <td>

                    &nbsp;</td>
                <td>

                                                 Freight </td>
                <td>

                    <asp:TextBox ID="txtfraight" runat="server" class="form-control input-sm" >0</asp:TextBox>
					
                                		<asp:Button ID="btnsubmit3" runat="server" Text="Update" class="btn btn-success btn-sm " OnClick="btnsubmit3_Click"  />
					
				                            </td>
            </tr>

            <tr>
                <td>

                    &nbsp;</td>
                <td>

					                             Labour </td>
                <td>

                    <asp:TextBox ID="txtlabour" runat="server" class="form-control input-sm" >0</asp:TextBox>
					
                                		<asp:Button ID="btnsubmit4" runat="server" Text="Update" class="btn btn-success btn-sm " OnClick="btnsubmit4_Click"  />
					
				                            </td>
            </tr>

            <tr>
                <td>

                    &nbsp;</td>
                <td>

					                             Net Amount&nbsp; </td>
                <td>

                    <asp:TextBox ID="txtnetamount" runat="server" class="form-control input-sm" ReadOnly="True">0</asp:TextBox>
					
				                            </td>
            </tr>

            <tr>
                <td>

                    &nbsp;</td>
                <td>

					                             Paid </td>
                <td>

                    <asp:TextBox ID="txtpaid" runat="server" class="form-control input-sm" ReadOnly="True" >0</asp:TextBox>
					
				                            </td>
            </tr>

            <tr>
                <td class="auto-style1">

                    </td>
                <td class="auto-style1">

					                             Balance </td>
                <td class="auto-style1">

                    <asp:TextBox ID="txtbalance" runat="server" class="form-control input-sm" ReadOnly="True">0</asp:TextBox>
					
				                            </td>
            </tr>

            <tr>
                <td>

                    &nbsp;</td>
                <td>

					                             &nbsp;</td>
                <td>

                    &nbsp;</td>
            </tr>

            <tr>
                <td>

                    &nbsp;</td>
                <td>

					                             Balance Discount</td>
                <td>

                    <asp:TextBox ID="txtdisc" runat="server" class="form-control input-sm">0</asp:TextBox>
					
                                		<asp:Button ID="btnsubmit2" runat="server" Text="Update" class="btn btn-success btn-sm " OnClick="btnsubmit2_Click"  />
                                            </td>
            </tr>

            <tr>
                <td>

                    &nbsp;</td>
                <td>

					                             Paid further</td>
                <td>

                    <asp:TextBox ID="txtpaidfur" runat="server" class="form-control input-sm" >0</asp:TextBox>
					
                                		<asp:Button ID="btnsubmit1" runat="server" Text="Update" class="btn btn-success btn-sm " OnClick="btnsubmit1_Click"  />
                                            </td>
            </tr>

            <tr>
                <td>

                    &nbsp;</td>
                <td>

					                             Balance Given</td>
                <td>

                    <asp:TextBox ID="txtbalgivn" runat="server" class="form-control input-sm" >0</asp:TextBox>
					
                                		<asp:Button ID="btnsubmit0" runat="server" Text="Update" class="btn btn-success btn-sm " OnClick="btnsubmit0_Click"  />
                                            </td>
            </tr>

            <tr>
                <td>

                    &nbsp;</td>
                <td colspan="2">

                    &nbsp;</td>
            </tr>

        </table>
    
    </div>
    </form>
</body>
</html>
