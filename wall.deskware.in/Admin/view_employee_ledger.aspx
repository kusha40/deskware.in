<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/site.master" AutoEventWireup="true" CodeFile="view_employee_ledger.aspx.cs" Inherits="Admin_view_employee_ledger" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="row gutter">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="panel panel-blue"><div class="panel-heading">
                    <h4>Employee Ledger :</h4>

                                              </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                        <h5 id="h3" runat="server">  Total Debit:<asp:Label ID="Label3" runat="server" Text="0" Font-Bold="True" ForeColor="Red"></asp:Label>&nbsp;|| Total Credit:<asp:Label ID="Label4" runat="server" Text="0" Font-Bold="True" ForeColor="Red"></asp:Label>&nbsp;|| Available Balance:<asp:Label ID="Label5" runat="server" Text="0" Font-Bold="True" ForeColor="Red"></asp:Label></h5>
             
              
					        <asp:Button ID="Button2" runat="server" class="btn btn-sm btn-danger" OnClick="Button2_Click" Text="Delete"  />
             
              
					        <asp:Button ID="Button3" runat="server" class="btn btn-sm btn-default"  Text="Refresh" OnClick="Button3_Click"  />
                            <asp:TextBox ID="TextBox1" runat="server" placeholder="Admin Password" TextMode="Password"></asp:TextBox>
                            <br />
                            <br />
             
              
					<asp:GridView ID="GridView1" runat="server" class="table table-striped table-bordered no-margin" AutoGenerateColumns="False" DataKeyNames="id" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound"  >
                                    <Columns>
                                          <asp:TemplateField HeaderText="">
                            <HeaderTemplate>
                                <asp:CheckBox ID="chkAll" runat="server" AutoPostBack="true" OnCheckedChanged="ChkAllRows" Text="" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkAll0" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Sr No.">
                            <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="ID" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                        <asp:BoundField DataField="date" HeaderText="Date" DataFormatString="{0:dd-MMM-yyyy}" />
                                        <asp:BoundField DataField="dealer_name" HeaderText="Employee Name" />
                                        <asp:TemplateField HeaderText="Debit">
                                            <ItemTemplate>
                                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("debit", "{0:n2}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Credit">
                                            <ItemTemplate>
                                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("credit", "{0:n2}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Balance">
                                            <ItemTemplate>
                                                <asp:Label ID="lblbal" runat="server" Text="0.00"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                           <asp:BoundField DataField="remarks" HeaderText="Remarks" />
                                        <asp:TemplateField HeaderText="Delete">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton5" runat="server" CausesValidation ="false" ForeColor="Blue" 
                                        CommandArgument='<%# Eval("id")%>' 
                                        CommandName="del">Delete</asp:LinkButton>
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
                                     <PagerStyle HorizontalAlign = "Left" CssClass = "GridPager" />
                    </asp:GridView>	
               
			 </div>
          </div></div></div>
      </div>
</asp:Content>

