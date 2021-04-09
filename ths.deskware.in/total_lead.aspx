<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="total_lead.aspx.cs" Inherits="total_lead" EnableEventValidation="false" %>

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
                         url: "total_lead.aspx/GetAutoCompleteData1",
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
                    <h4>Total Leads </h4>

                </div>
                <div class="panel-body">
                
                        <div class="form-group">
                             <asp:Button ID="Button8"  runat="server" Text="ON GOING" class="btn btn-sm btn-default" OnClick="Button8_Click"   />
                            <asp:Button ID="Button9"  runat="server" Text="REJECTED" class="btn btn-sm btn-default" OnClick="Button9_Click" />
                            <asp:Button ID="Button10"  runat="server" Text="CONVERTED" class="btn btn-sm btn-default" OnClick="Button10_Click"   />
                              <asp:Button ID="Button2"  Visible="false" runat="server" Text="Duplicate Leads" class="btn btn-sm btn-danger" OnClick="Button2_Click"   />
                            </div>
                       <br />
     <div class="row gutter">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="panel panel-blue"><div class="panel-heading">
                    <h4>Lead Details</h4>

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
             <asp:Button ID="Button3" runat="server" Text="Export Excel" class="btn btn-danger" OnClick="Button3_Click" />
       </div>
                                   <div class="col-md-2">
                                    <label class="control-label">Lead Type </label>
                                       <asp:DropDownList ID="DropDownList1" class="form-control" runat="server"></asp:DropDownList>
                                </div>
                                    <div class="col-md-1">
                                    <label class="control-label">. </label><br />
                                        <asp:Button ID="Button1"  runat="server" Text="View" class="btn btn-sm btn-default"  CausesValidation="False" OnClick="Button1_Click"  />
                                </div></div></div>
                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" class="table table-striped table-bordered no-margin" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="15" OnRowCommand="GridView1_RowCommand" >
                                 <Columns>
                                     <asp:TemplateField >
                            <ItemTemplate>
                                <div style="width:auto; overflow: hidden; white-space: nowrap; text-overflow: ellipsis">
                           <asp:ImageButton ID="LinkButton51" runat="server"  CausesValidation ="false" 
                                        CommandArgument='<%# Eval("lead_id")%>' 
                                        CommandName="follow" ImageUrl="~/img/follow.png" ToolTip="Add Followup" Height="30px"></asp:ImageButton>
                                    <asp:ImageButton ID="LinkButton6" runat="server" CausesValidation ="false" 
                                        CommandArgument='<%# Eval("lead_id")%>' 
                                        CommandName="view" ImageUrl="~/img/view.png" ToolTip="view history" Height="30px"></asp:ImageButton>
                                                  <asp:ImageButton ID="LinkButton5" runat="server" CausesValidation ="false" 
                                        CommandArgument='<%# Eval("lead_id")%>' 
                                        CommandName="edit5"  ImageUrl="~/img/edit.png" ToolTip="edit" OnClientClick="return confirm('Do you want to edit ?')" Height="30px"></asp:ImageButton>
                                                  <asp:ImageButton ID="LinkButton1" runat="server" CausesValidation ="false" 
                                        CommandArgument='<%# Eval("lead_id")%>' 
                                        CommandName="del" ImageUrl="~/img/delete.png" ToolTip="delete" OnClientClick="return confirm('Are you sure to delete?')" Height="30px" ></asp:ImageButton>
                                    <asp:ImageButton ID="LinkButton11" runat="server" CausesValidation ="false" 
                                        CommandArgument='<%# Eval("lead_id")%>' 
                                        CommandName="meeting" ImageUrl="~/img/meeting.png" ToolTip="view meeting" Height="30px" OnClientClick="return confirm('Are you sure to Show Meeting?')" ></asp:ImageButton>
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
                                      <asp:BoundField DataField="date" HeaderText="Date" DataFormatString="{0:dd-MMM-yyyy}" />
                                      <asp:BoundField DataField="lead_id" HeaderText="Lead ID" />
                                     <asp:BoundField DataField="ltype" HeaderText="Type" />
                                        <asp:BoundField DataField="ctype" HeaderText="Status" />
                                        <asp:BoundField DataField="dsource" HeaderText="Source" />
                                         <asp:TemplateField HeaderText="Name">
                                             <ItemTemplate>
                                                 <asp:Label ID="Label2" runat="server" Text='<%# Eval("title")+" "+Eval("lname")+" "+Eval("fname") %>'></asp:Label>
                                             </ItemTemplate>
                                     </asp:TemplateField>
                                     <asp:BoundField DataField="address" HeaderText="Address" />
                                     <asp:BoundField DataField="city" HeaderText="Town/City" />
                                      <asp:BoundField DataField="postcode" HeaderText="Postcode" Visible="False" />
                                      <asp:BoundField DataField="mob" HeaderText="Mobile No." />
                                      <asp:BoundField DataField="email_id" HeaderText="Email ID" />
                                           <asp:BoundField DataField="created_by" HeaderText="Created By" />
                                          <asp:BoundField DataField="assigned_to" HeaderText="Assigned To" />
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

