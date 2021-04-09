<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="add_todo.aspx.cs" Inherits="add_todo" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
         <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <%--<script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>--%>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".date").datepicker({
                //changeMonth: true,
                //changeYear: true
                minDate: 0
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
                    <h4>Add To do</h4>

                </div>
                <div class="panel-body">
                       <div class="form-group">
                            <div class="row gutter">
                                  <div class="form-group col-lg-3">
                                            <label>To do Type</label>
                                      <asp:RadioButtonList ID="RadioButtonList1" runat="server" class="form-control" RepeatColumns="2" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                                          <asp:ListItem Selected="True" Value="1">Self</asp:ListItem>
                                          <asp:ListItem Value="2">Assign</asp:ListItem>
                                            </asp:RadioButtonList>
                                      </div>
                                   <div class="form-group col-lg-4" id="div1" runat="server" visible="false">
                                            <label>To do Assign</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Select User" ControlToValidate="DropDownList1" InitialValue="" ForeColor="Red"></asp:RequiredFieldValidator>
                                            <asp:DropDownList ID="DropDownList1" runat="server" class="form-control chzn-select" AppendDataBoundItems="true"  ></asp:DropDownList>
                            <script src="js/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript"> $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
                                       </div>
                       <div class="form-group col-lg-12">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Remarks" ControlToValidate="txtreport"  ForeColor="Red"></asp:RequiredFieldValidator>
                           <asp:TextBox ID="txtreport" runat="server" class="form-control" placeholder="Enter Task" TextMode="MultiLine"></asp:TextBox>
                           </div>
                                <div class="form-group col-lg-1">
          <label>Order</label>
                                     <asp:DropDownList ID="DropDownList5" class="form-control" runat="server">
                                          <asp:ListItem>1</asp:ListItem>
                                            <asp:ListItem>2</asp:ListItem>
                                            <asp:ListItem>3</asp:ListItem>
                                            <asp:ListItem>4</asp:ListItem>
                                          <asp:ListItem>5</asp:ListItem>
                                         </asp:DropDownList>
                           </div>
                                <div class="form-group col-lg-2">
                                     <label>Date</label>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Select Date" ControlToValidate="TextBox1"  ForeColor="Red"></asp:RequiredFieldValidator>
                           <asp:TextBox ID="TextBox1" runat="server" class="form-control date"  ></asp:TextBox>
                           </div>
                                  <div class="form-group col-lg-1">
                                     <label>Time (HH)</label>
                                      <asp:DropDownList ID="DropDownList2" class="form-control" runat="server">
                                          <asp:ListItem>09</asp:ListItem>
                                            <asp:ListItem>10</asp:ListItem>
                                            <asp:ListItem>11</asp:ListItem>
                                            <asp:ListItem>12</asp:ListItem>
                                            <asp:ListItem>01</asp:ListItem>
                                            <asp:ListItem>02</asp:ListItem>
                                            <asp:ListItem>03</asp:ListItem>
                                            <asp:ListItem>04</asp:ListItem>
                                            <asp:ListItem>05</asp:ListItem>
                                            <asp:ListItem>06</asp:ListItem>
                                            <asp:ListItem>07</asp:ListItem>
                                            <asp:ListItem>08</asp:ListItem>
                                            <asp:ListItem>09</asp:ListItem>
                                      </asp:DropDownList>
                           </div>
                                    <div class="form-group col-lg-1">
                                     <label>Time (MM)</label>
                                      <asp:DropDownList ID="DropDownList3" class="form-control" runat="server">
                                          <asp:ListItem>00</asp:ListItem>
                                            <asp:ListItem>15</asp:ListItem>
                                            <asp:ListItem>30</asp:ListItem>
                                            <asp:ListItem>45</asp:ListItem>
                                     </asp:DropDownList>
                           </div>
                                   <div class="form-group col-lg-1">
                                     <label>.</label>
                                      <asp:DropDownList ID="DropDownList4" class="form-control" runat="server">
                                          <asp:ListItem>AM</asp:ListItem>
                                            <asp:ListItem>PM</asp:ListItem>
                                     </asp:DropDownList>
                           </div>


                            </div></div></div>
         <div class="panel-footer">
                                <asp:Button ID="btnsubmit" runat="server" Text="Submit" class="btn btn-sm btn-info " OnClick="btnsubmit_Click" />
	<asp:Button ID="btnview" runat="server" Text="View All" class="btn btn-sm btn-danger" OnClick="btnview_Click" CausesValidation="False" />
                          

                                </div></div></div></div>
    <div class="row gutter">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="panel panel-blue"><div class="panel-heading">
                      <h4>View To do</h4>
                                              </div>
                    <div class="panel-body">
                    
                        <div class="table-responsive col-lg-12">
                               
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
                                        <asp:BoundField DataField="reply" HeaderText="Reply" />
                                         <asp:TemplateField HeaderText="Status">
                                             <ItemTemplate>
                                                 <asp:Label ID="Label2" runat="server" Text='<%# Bind("status") %>'></asp:Label>
                                             </ItemTemplate>
                                        </asp:TemplateField>
                                           <asp:BoundField DataField="approval" HeaderText="Approval" />
                                        <asp:CommandField ShowDeleteButton="True" >
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

