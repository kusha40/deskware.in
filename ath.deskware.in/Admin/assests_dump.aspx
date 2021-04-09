<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/site.master" AutoEventWireup="true" CodeFile="assests_dump.aspx.cs" Inherits="Admin_assests_dump" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link href="../Content/chosen.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
 <div class="row gutter">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="panel panel-blue"><div class="panel-heading">
                    <h4>Assests Dump Ledger</h4>

                                              </div>
                    <div class="panel-body">
                        <div class="row gutter">
                                          <div class="col-md-3">
					                               Chosse Company
                   <asp:DropDownList ID="DropDownList1" runat="server" class="form-control chzn-select" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                       <asp:ListItem Value="AM">A Mark</asp:ListItem>
                       <asp:ListItem Value="AV">A Vitra</asp:ListItem>
                       <asp:ListItem Value="RO">Royal</asp:ListItem>
                       <asp:ListItem Value="WA">Wall Studio</asp:ListItem>
                       <asp:ListItem Value="TH">Tile HUB</asp:ListItem>
                       <asp:ListItem>ATH</asp:ListItem>
                                                    </asp:DropDownList>
    <script src="js/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript"> $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
				</div>
                                </div>
                         <asp:Button ID="Button2" runat="server" Text="Export to Excel" class="btn btn-default" OnClick="Button2_Click" />
                        <div class="table-responsive">
                            <br />
             
              
					<asp:GridView ID="GridView1" runat="server" class="table table-striped table-bordered no-margin" AutoGenerateColumns="False" DataKeyNames="id"   >
                                    <Columns>
                                             <%--<asp:TemplateField HeaderText="">
                            <HeaderTemplate>
                                <asp:CheckBox ID="chkAll" runat="server" AutoPostBack="true" OnCheckedChanged="ChkAllRows" Text="" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkAll0" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>--%>
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
                                        <asp:BoundField DataField="description" HeaderText="Particular" />
                                        <asp:TemplateField HeaderText="Debit">
                                            <ItemTemplate>
                                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("debit", "{0:n2}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="remarks" HeaderText="Remarks" />
                                       <%-- <asp:TemplateField HeaderText="Delete">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton5" runat="server" CausesValidation ="false" ForeColor="Blue" 
                                        CommandArgument='<%# Eval("id")%>' 
                                        CommandName="del">Delete</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
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

