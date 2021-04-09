<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="paid_toengineer.aspx.cs" Inherits="paid_toengineer" EnableEventValidation="false"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 
          <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
  <%--  <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>--%>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".date").datepicker({
                changeMonth: true,
                changeYear: true
            });
        });
    </script>
     <link href="css/chosen.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row gutter">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            
            <div class="panel">
                <div class="panel-heading">
                    <h4>Filter/Search</h4>

                </div>
                <div class="panel-body">
                        <div class="form-group">
                            <div class="row gutter">
                                <div class="col-md-3">
                                    <label class="control-label">From Date</label>
                                     <asp:TextBox ID="txtfrom" runat="server" class="form-control date" placeholder="From Date"></asp:TextBox>
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label">To Date</label>
                                      <asp:TextBox ID="txtto" runat="server" class="form-control date" placeholder="To Date"></asp:TextBox>
                                </div>
                                                                   <div class="col-md-4">
                                    <label class="control-label">Select User</label>
                                      <asp:DropDownList ID="ddlname" runat="server" class="form-control chzn-select" ></asp:DropDownList>
                                    <script src="js/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript"> $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
                                </div>
                                <div class="col-md-1">
                                    <label class="control-label">.</label><br />
                                      <asp:Button ID="Button4" runat="server" Text="View" class="btn btn-info" OnClick="Button1_Click" />
                                </div>
                                </div>
                                  <div class="form-group">
                            <div class="row gutter">
                    
                                     </div>

            </div>

                        </div>
                    
                                     </div>

            </div>

            

             <asp:Button ID="Button2" runat="server" Text="Reset" class="btn btn-default" OnClick="Button2_Click" /> 

             <asp:Button ID="Button3" runat="server" Text="Export to Excel" class="btn btn-danger" OnClick="Button3_Click" />

        </div>

        </div>
    <br />
     <div class="row gutter">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="panel"><div class="panel-heading">
      <h4>Expense Report</h4>

                                              </div>
                    <div class="panel-body">
                      <div class="row gutter">
                          <div class="col-md-1">
                                    <label class="control-label">.</label><br />
                               <asp:Button ID="Button6" runat="server"  Text="Approve" class="btn btn-danger" OnClick="Button6_Click"  />
                                </div>
                          </div>
                        <br /><br />
                       
                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" class="table table-striped table-bordered no-margin" runat="server" AutoGenerateColumns="False"  AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="15"  AllowSorting="True" OnRowCommand="GridView1_RowCommand"  >
                                 <Columns>
                                     <asp:TemplateField HeaderText="">
                            <%--<HeaderTemplate>
                                <asp:CheckBox ID="chkAll" runat="server" AutoPostBack="true" OnCheckedChanged="ChkAllRows" Text="" />
                            </HeaderTemplate>--%>
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
                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("created_by") %>' Visible="false"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                       <asp:BoundField DataField="date" HeaderText="Date" DataFormatString="{0:dd-MMM-yyyy}" />
                                      <asp:TemplateField HeaderText="Amount">
                                             <ItemTemplate>
                                                 <asp:Label ID="Label7" runat="server" Text='<%# Bind("expense", "{0:n2}") %>'></asp:Label>
                                             </ItemTemplate>
                                     </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Paid">
                                          <ItemTemplate>
                                              <asp:TextBox ID="Label5" runat="server" Text='<%# Bind("paid", "{0:n2}") %>'></asp:TextBox>
                                          </ItemTemplate>
                                     </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Balance">
                                          <ItemTemplate>
                                              <asp:Label ID="Label6" runat="server" Text='<%# Bind("balance", "{0:n2}") %>'></asp:Label>
                                          </ItemTemplate>
                                     </asp:TemplateField>
                                         <asp:BoundField DataField="remarks" HeaderText="Remarks" />
                                     <asp:TemplateField HeaderText="Particular">
                                         <ItemTemplate>
                                             <asp:Label ID="Label2" runat="server" Text='<%# Bind("particular") %>'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                               
                                      <asp:BoundField DataField="lead_id" HeaderText="lead_id" />
                                     <asp:TemplateField HeaderText="name">
                                         <ItemTemplate>
                                             <asp:Label ID="Label3" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                        <asp:BoundField DataField="created_by" HeaderText="Created By" />
                                        
                                       <asp:TemplateField HeaderText="Bill">
                                           <ItemTemplate>
                                               <a style="color:blue" href='<%# Eval("bill") %>' target="_blank">Bill</a>
                                           </ItemTemplate>
                                     </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Action">
                                           <ItemTemplate>
                                             <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation ="false" 
                                        CommandArgument='<%# Eval("id")%>' 
                                        CommandName="edit12" ForeColor="#0066FF" OnClientClick="return confirm('Are you sure to delete?')">Remove</asp:LinkButton> 
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

                    </div></div></div></div>
</asp:Content>


