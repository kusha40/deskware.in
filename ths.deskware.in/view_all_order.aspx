<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="view_all_order.aspx.cs" Inherits="view_all_order" EnableEventValidation="false" %>

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
                         url: "view_all_order.aspx/GetAutoCompleteData1",
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
                    <h4 id="h4" runat="server">Order  Details</h4>

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
                        <div class="form-group">
                            <div class="row gutter">
    <asp:GridView ID="GridView1" class="table table-striped table-bordered no-margin" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="15" DataKeyNames="id" OnRowDeleting="GridView1_RowDeleting" OnRowCommand="GridView1_RowCommand"   >
                                 <Columns>
                                      <asp:TemplateField >
                            <ItemTemplate>
                                <div style="width:auto; overflow: hidden; white-space: nowrap; text-overflow: ellipsis">
                             <asp:ImageButton ID="LinkButton51" runat="server"  CausesValidation ="false" 
                                        CommandArgument='<%# Eval("lead_id")%>' 
                                        CommandName="email" ImageUrl="~/img/send.png" ToolTip="Send Email" Height="30px" OnClientClick="return confirm('Do you want to Send Order ?')"></asp:ImageButton>
                                    </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Sr No.">
                            <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                                     <asp:BoundField DataField="date" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Date" />
                                      <asp:TemplateField HeaderText="Order No.">
                                         <ItemTemplate>
                                             <a href="<%# Eval("path") %>" target="_blank" style="color:red"><%# Eval("order_no") %></a>
                                             <asp:Label ID="Label1" runat="server" Text='<%# Eval("path") %>' Visible="false"></asp:Label>
                                             <asp:Label ID="Label2" runat="server" Text='<%# Eval("name") %>' Visible="false"></asp:Label>
                                             <asp:Label ID="Label3" runat="server" Text='<%# Eval("email") %>' Visible="false"></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                     <asp:BoundField DataField="lead_id" HeaderText="Lead ID" />
                                     <asp:BoundField DataField="name" HeaderText="Name" />
                                     <asp:BoundField DataField="mob" HeaderText="Mob.No." />
                                     <asp:BoundField DataField="email" HeaderText="Email ID" />
                                     <asp:BoundField DataField="product" HeaderText="Product" />
                                     <asp:BoundField DataField="gtotal" HeaderText="Grand Total" DataFormatString="{0:n2}" />
                                     <asp:BoundField DataField="advance" HeaderText="Advance" DataFormatString="{0:n2}" />
                                     <asp:BoundField DataField="balance" HeaderText="Balance" DataFormatString="{0:n2}" />
                                     <asp:BoundField DataField="created_by" HeaderText="Created By" />
                                     <asp:CommandField ShowDeleteButton="True" >
                                        <ControlStyle ForeColor="Red" />
                                        </asp:CommandField>
                                    
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
                                </div></div></div></div></div></div>
</asp:Content>

