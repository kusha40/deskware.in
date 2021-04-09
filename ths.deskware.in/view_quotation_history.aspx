<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="view_quotation_history.aspx.cs" Inherits="view_quotation_history" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row gutter">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            
            <div class="panel">
                <div class="panel-heading">
                    <h4 id="h4" runat="server">Quotation  Details</h4>

                </div>
                <div class="panel-body">
                        <div class="form-group">
                            <div class="row gutter">
    <asp:GridView ID="GridView1" class="table table-striped table-bordered no-margin" runat="server" AutoGenerateColumns="False"   >
                                 <Columns>
                                 <asp:TemplateField HeaderText="Sr No.">
                            <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                                     <asp:BoundField DataField="date" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Date" />
                                      <asp:TemplateField HeaderText="Quotation No.">
                                         <ItemTemplate>
                                             <a href="<%# Eval("path") %>" target="_blank" style="color:red"><%# Eval("order_no") %></a>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                     <asp:BoundField DataField="lead_id" HeaderText="Lead ID" />
                                     <asp:BoundField DataField="name" HeaderText="Name" />
                                     <asp:BoundField DataField="mob" HeaderText="Mob.No." />
                                     <asp:BoundField DataField="email" HeaderText="Email ID" />
                                     <asp:BoundField DataField="product" HeaderText="Product" />
                                   <asp:BoundField DataField="gtotal" HeaderText="Grand Total" DataFormatString="{0:n2}" />
                                     <asp:BoundField DataField="advance" HeaderText="Advance" DataFormatString="{0:n2}" Visible="false"/>
                                     <asp:BoundField DataField="balance" HeaderText="Balance" DataFormatString="{0:n2}" Visible="false"/>
                                     <asp:BoundField DataField="created_by" HeaderText="Created By" />
                                    
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

