<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/site.master" AutoEventWireup="true" CodeFile="companyledger.aspx.cs" Inherits="Admin_companyledger" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
               <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".date").datepicker({
                changeMonth: true,
                changeYear: true
            });
            $(".date").datepicker('setDate', new Date());
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row gutter">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            
            <div class="panel">
                <div class="panel-heading">
                    <h4>Filter</h4>

                </div>
                <div class="panel-body">
                
                        <div class="form-group">
                            <div class="row gutter">
                                 <div class="col-md-3">
                                    <label class="control-label">From Date</label>
                                    <asp:TextBox ID="txtfdate" runat="server" class="form-control date" ></asp:TextBox>
                                </div>
                                  <div class="col-md-3">
                                    <label class="control-label">To Date</label>
                                    <asp:TextBox ID="txttdate" runat="server" class="form-control date" ></asp:TextBox>
                                </div>
                                </div></div></div></div>
            <asp:Button ID="Button1" runat="server" Text="View" class="btn btn-info" OnClick="Button1_Click" />
              <asp:Button ID="Button2" runat="server" Text="Export to Excel" class="btn btn-default" OnClick="Button2_Click" />
            <br />
            <br />
        </div>
       </div>
    <div class="row gutter">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="panel panel-blue"><div class="panel-heading">
                    <h4>All Company Ledger</h4>

                                              </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                        <h5 id="h3" runat="server">  Total Debit:<asp:Label ID="Label3" runat="server" Text="Label" Font-Bold="True" ForeColor="Red"></asp:Label>&nbsp;|| Total Credit:<asp:Label ID="Label4" runat="server" Text="Label" Font-Bold="True" ForeColor="Red"></asp:Label>&nbsp;|| Available Balance:<asp:Label ID="Label5" runat="server" Text="Label" Font-Bold="True" ForeColor="Red"></asp:Label></h5>
             
              
					<asp:GridView ID="GridView1" runat="server" class="table table-striped table-bordered no-margin" AutoGenerateColumns="False"  >
                                    <Columns>
                                      <asp:TemplateField HeaderText="Sr No.">
                            <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                                         <%--<asp:TemplateField HeaderText="ID" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                                        <asp:BoundField DataField="date" HeaderText="Date" DataFormatString="{0:dd-MMM-yyyy}" />
                                   <%--     <asp:TemplateField HeaderText="Challan No.">
                                           
                                            <ItemTemplate>
                                                   <a href="print_challan.aspx?id=<%# Eval("challan_no") %>" target="_blank" >
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("challan_no") %>'></asp:Label>
                                                       </a>
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                        <asp:TemplateField HeaderText="Company Name">
                                                                                       <ItemTemplate>
                         <%--                                                                  <a href="view_dealer_ledger_pop_up.aspx?id=<%# Eval("c_name") %>" target="_blank" >--%>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("c_name") %>'></asp:Label>
                                                    <%--   </a>--%>
                                              
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Total Debit">
                                            <ItemTemplate>
                                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("debit", "{0:n2}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Total Credit">
                                            <ItemTemplate>
                                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("credit", "{0:n2}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                               <asp:TemplateField HeaderText="Total Balance">
                                            <ItemTemplate>
                                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("bal", "{0:n2}") %>'></asp:Label>
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

