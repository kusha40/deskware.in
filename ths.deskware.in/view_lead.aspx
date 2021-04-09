<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="view_lead.aspx.cs" Inherits="view_lead" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row gutter">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            
            <div class="panel">
                <div class="panel-heading">
                    <h4>&nbsp;Leads </h4>

                </div>
                <div class="panel-body">
                
                       <br />
     <div class="row gutter">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="panel panel-blue"><div class="panel-heading">
                    <h4>Lead Details</h4>

                                              </div>
                    <div class="panel-body">
                             
                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" class="table table-striped table-bordered no-margin" runat="server" AutoGenerateColumns="False"  OnRowCommand="GridView1_RowCommand" >
                                 <Columns>
                                              <asp:TemplateField HeaderText="Follow Up">
                                <ItemTemplate>
                                    <table class="table-bordered" cellpading="4" cellspacing="4">
                                        <tr>
                                            <td> <asp:LinkButton ID="LinkButton51" runat="server" ForeColor="Red" CausesValidation ="false" 
                                        CommandArgument='<%# Eval("lead_id")%>' 
                                        CommandName="follow">Follow Up</asp:LinkButton></td>
                                            <td>   <asp:LinkButton ID="LinkButton6" runat="server" ForeColor="Red" CausesValidation ="false" 
                                        CommandArgument='<%# Eval("lead_id")%>' 
                                        CommandName="view">View History</asp:LinkButton></td>
                                        </tr>
                                                                      </table>
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
                                      <asp:BoundField DataField="date" HeaderText="Date" DataFormatString="{0:dd-MMM-yyyy hh:mm tt}" />
                                      <asp:BoundField DataField="lead_id" HeaderText="Lead ID" />
                                        <asp:BoundField DataField="ctype" HeaderText="Type" />
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

