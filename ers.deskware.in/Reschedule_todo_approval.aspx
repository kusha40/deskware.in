<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Reschedule_todo_approval.aspx.cs" Inherits="Reschedule_todo_approval" EnableEventValidation="false" %>

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
        <div class="form-group col-lg-4">
                                            <label>Search User</label>
                                            <asp:DropDownList ID="DropDownList1" runat="server" class="form-control chzn-select" AppendDataBoundItems="true" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" ></asp:DropDownList>
                            <script src="js/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript"> $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
                                       </div>
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="panel panel-blue"><div class="panel-heading">
                      <h4>Reschedule To do Approval</h4>
                                              </div>
                    <div class="panel-body">
                    
                        <div class="table-responsive col-lg-12">
                                <asp:Button ID="btnsubmit2" runat="server" Text="Export to Excel" class="btn btn-success" OnClick="btnsubmit2_Click"  />
                            <br />
                               <br /> 
                            <asp:GridView ID="GridView1" runat="server" class="table table-striped table-bordered no-margin"  AutoGenerateColumns="False"   OnRowDeleting="GridView1_RowDeleting"  DataKeyNames="id"   >
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
                                         <asp:TemplateField HeaderText="Status">
                                             <ItemTemplate>
                                                 <asp:Label ID="Label2" runat="server" Text='<%# Bind("schedule_sts") %>'></asp:Label>
                                             </ItemTemplate>
                                        </asp:TemplateField>
                                           <asp:BoundField DataField="req" HeaderText="Request" />
                                         <asp:BoundField DataField="order_by" HeaderText="Order" />
                                        <asp:CommandField ShowDeleteButton="True" DeleteText="Approved"  >
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


