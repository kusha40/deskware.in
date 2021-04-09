<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="total_meetings.aspx.cs" Inherits="total_meetings" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
           <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
     <script type="text/javascript">
         $(document).ready(function () {
             SearchText1();
         });
         function SearchText1() {
             $(".autosuggest1").autocomplete({
                 source: function (request, response) {
                     $.ajax({
                         type: "POST",
                         contentType: "application/json; charset=utf-8",
                         url: "total_meetings.aspx/GetAutoCompleteData1",
                         data: "{'username':'" + request.term + "','flag':'" + $('[name=rdlMinor]:checked').val() + "'}",
                         dataType: "json",
                         success: function (data) {
                             response(data.d);
                         },
                         error: function (result) {
                             alert("Error");
                         }
                     });
                 }
             });
         }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row gutter">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            
            <div class="panel">
                <div class="panel-heading">
                    <h4>Total Meetings </h4>

                </div>
                <div class="panel-body">
                
                        <div class="form-group">
                             <asp:Button ID="Button8"  runat="server" Text="Meeting Done" class="btn btn-sm btn-default" OnClick="Button8_Click"   />
                            <asp:Button ID="Button9"  runat="server" Text="Meeting Not Done" class="btn btn-sm btn-default" OnClick="Button9_Click" />
                            <asp:Button ID="Button1"  runat="server" Text="All" class="btn btn-sm btn-default" OnClick="Button1_Click"  />
                            </div>
                       <br />
     <div class="row gutter">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="panel panel-blue"><div class="panel-heading">
                    <h4>Meeting Details</h4>

                                              </div>
                    <div class="panel-body">
                               <div class="form-group">
                            <div class="row gutter">
                                <div class="col-md-6">
                                    <label class="control-label">Search </label>
                                     <asp:TextBox ID="txtMenuTitle" runat="server" class="form-control autosuggest1" placeholder="Search Customer" ></asp:TextBox>
                                </div>
                                    <div class="col-md-1">
                                    <label class="control-label">. </label><br />
                                        <asp:Button ID="btnview2"  runat="server" Text="Search" class="btn btn-sm btn-success" OnClick="btnview2_Click" CausesValidation="False"  />
 
                                        </div>
                                  <div class="col-md-1">
                                    <label class="control-label">. </label><br />
             <asp:Button ID="Button3" runat="server" Text="Export to Excel" class="btn btn-danger" OnClick="Button3_Click" />
       </div>
                                </div></div>
                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" class="table table-striped table-bordered no-margin" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="15" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound" >
                                 <Columns>
                                    <asp:TemplateField >
                            <ItemTemplate>
                                <div style="width:auto; overflow: hidden; white-space: nowrap; text-overflow: ellipsis">
                             <asp:ImageButton ID="LinkButton51" runat="server"  CausesValidation ="false" 
                                        CommandArgument='<%# Eval("lead_id")%>' 
                                        CommandName="follow" ImageUrl="~/img/follow.png" ToolTip="Add Meeting Followup" Height="30px"></asp:ImageButton>
                                            <asp:ImageButton ID="LinkButton6" runat="server" CausesValidation ="false" 
                                        CommandArgument='<%# Eval("lead_id")%>' 
                                        CommandName="view" ImageUrl="~/img/meeting.png" ToolTip="view Meeting history" Height="30px"></asp:ImageButton>
                                   <%-- <asp:ImageButton ID="ImageButton1" runat="server" CausesValidation ="false" 
                                        CommandArgument='<%# Eval("lead_id")%>' 
                                        CommandName="meeting1" ImageUrl="~/img/order_history.png" ToolTip="view Order" Height="30px" OnClientClick="return confirm('Are you sure to Show Order?')" ></asp:ImageButton>
                                        <asp:ImageButton ID="ImageButton2" runat="server" CausesValidation ="false" 
                                        CommandArgument='<%# Eval("lead_id")%>' 
                                        CommandName="meeting2" ImageUrl="~/img/quotation_history.png" ToolTip="view Quotation" Height="30px" OnClientClick="return confirm('Are you sure to Show Quotation?')" ></asp:ImageButton>--%>
                                    </div>
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
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("lead_id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                      <asp:BoundField DataField="date" HeaderText="Date" DataFormatString="{0:dd-MMM-yyyy }" />
                                      <asp:BoundField DataField="lead_id" HeaderText="Lead ID" />
                                     <asp:BoundField DataField="name" HeaderText="Name" />
                                     <asp:TemplateField HeaderText="Address">
                                         <ItemTemplate>
                                             <asp:Label ID="Label2" runat="server"></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                     <asp:BoundField DataField="mobno" HeaderText="Mobile No" />
                                     <asp:BoundField DataField="product" HeaderText="Product" />
                                          <asp:BoundField DataField="assign_to" HeaderText="Assigned To" />
                                     <asp:BoundField DataField="created_by" HeaderText="Created By" />
                                      <asp:BoundField DataField="md" HeaderText="Meeting Date" DataFormatString="{0:dd-MMM-yyyy}" />
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

                </div></div></div></div>
</asp:Content>


