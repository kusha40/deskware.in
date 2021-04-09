<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/site.master" AutoEventWireup="true" CodeFile="capitel_ledger.aspx.cs" Inherits="Admin_capitel_ledger" EnableEventValidation="false" %>

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
                    <h4>Capital&nbsp; Ledger</h4>

                                              </div>
                    <div class="panel-body">
                        <div class="table-responsive">
             
              
					        <asp:Button ID="Button4" runat="server" class="btn btn-sm btn-danger" Text="Delete" OnClick="Button4_Click" />
                            <asp:TextBox ID="TextBox1" runat="server" placeholder="Admin Password" TextMode="Password"></asp:TextBox>
                            <br />
                            <br />
					<asp:GridView ID="GridView1" runat="server" class="table table-striped table-bordered no-margin" AutoGenerateColumns="False" DataKeyNames="id" OnRowCommand="GridView1_RowCommand"  >
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
                                        <asp:BoundField DataField="totalvalue" DataFormatString="{0:n2}" HeaderText="Total Capital Value" />
                                         <asp:BoundField DataField="stock" DataFormatString="{0:n2}" HeaderText="Stock Value" />
                                         <asp:BoundField DataField="dealer" DataFormatString="{0:n2}" HeaderText="Dealer" />
                                         <asp:BoundField DataField="salesman" DataFormatString="{0:n2}" HeaderText="Salesmen" />
                                          <asp:BoundField DataField="employee" DataFormatString="{0:n2}" HeaderText="Employee" />
                                        <asp:BoundField DataField="company" DataFormatString="{0:n2}" HeaderText="Company" />
                                        <asp:BoundField DataField="thw" DataFormatString="{0:n2}" HeaderText="Tilehub" />
                                        <asp:BoundField DataField="agw" DataFormatString="{0:n2}" HeaderText="Admin cash" />
                                        <asp:BoundField DataField="obc" DataFormatString="{0:n2}" HeaderText="OBC" />
                                               <asp:BoundField DataField="hdfc" DataFormatString="{0:n2}" HeaderText="Hdfc" />
                                               <asp:BoundField DataField="currnt" DataFormatString="{0:n2}" HeaderText="Current" />
                                             <asp:BoundField DataField="assets" DataFormatString="{0:n2}" HeaderText="Assets" />
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



