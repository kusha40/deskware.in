<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="edit_todo.aspx.cs" Inherits="edit_todo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
         <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <%--<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>--%>
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
                <div class="panel panel-blue"><div class="panel-heading">
                      <h4>Edit To Do </h4>
                                              </div>
                    <div class="panel-body">
                    
                        <div class="table-responsive col-lg-12">
                                  <asp:Button ID="btnsubmit" runat="server" Text="Daily To Do" class="btn btn-sm btn-info " OnClick="btnsubmit_Click"   />
                            <asp:Button ID="Button1" runat="server" Text="Future Have To Do" class="btn btn-sm btn-info " OnClick="Button1_Click"   />
                            <asp:Button ID="Button2" runat="server" Text="Future May To Do" class="btn btn-sm btn-info " OnClick="Button2_Click"   />
                        <br />      <br />
                            <asp:GridView ID="GridView1" runat="server" class="table table-striped table-bordered no-margin"  AutoGenerateColumns="False"  OnRowDeleting="GridView1_RowDeleting"  DataKeyNames="id"  >
                                    <Columns>
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
                                         <asp:BoundField DataField="type" HeaderText="Type" />
                                        <asp:BoundField DataField="task" HeaderText="Task" />
                                        <asp:BoundField DataField="date" DataFormatString="{0:dd-MMM-yy}" HeaderText="Date" />
                                        <asp:BoundField DataField="time"  HeaderText="Time" />
                                           <asp:BoundField DataField="assign_to" HeaderText="Assign To" />
                                        <asp:BoundField DataField="created_by" HeaderText="Created by" />
                                         <asp:BoundField DataField="status" HeaderText="Status" />
                                           <asp:TemplateField HeaderText="Sequence">
                                               <ItemTemplate>
                                                   <asp:Label ID="Label2" runat="server" Text='<%# Bind("order_by") %>' ForeColor="Blue" Font-Bold="true"></asp:Label>
                                                   <asp:DropDownList ID="DropDownList1" runat="server">
                                                       <asp:ListItem>1</asp:ListItem>
                                                       <asp:ListItem>2</asp:ListItem>
                                                       <asp:ListItem>3</asp:ListItem>
                                                       <asp:ListItem>4</asp:ListItem>
                                                       <asp:ListItem>5</asp:ListItem>
                                                   </asp:DropDownList>
                                               </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:CommandField ShowDeleteButton="True" DeleteText="Update" >
                                        <ItemStyle ForeColor="Red" />
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
                            </div></div></div></div></div>
</asp:Content>


