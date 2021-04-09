<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="verification.aspx.cs" Inherits="verification" %>

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
     <style type="text/css">
           .chkbox1 label
    {
    margin-right: 5px;
    background-color: #2EBDE7;
    color: white;
    padding: 5px;
    width: 100px;
    border-radius: 3px;
        border:1px solid #929292;
   } 
    </style>
    <link href="css/chosen.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="row gutter">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            
            <div class="panel">
                <div class="panel-heading">
                    <h4>Daily Report verification</h4>

                </div>
                <div class="panel-body">
                       <div class="form-group">
                            <div class="row gutter">
                                   <div class="form-group col-lg-4">
                                            <label>Search User</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Select User" ControlToValidate="DropDownList1" InitialValue="Select" ForeColor="Red"></asp:RequiredFieldValidator>
                                            <asp:DropDownList ID="DropDownList1" runat="server" class="form-control chzn-select" AppendDataBoundItems="true"  ></asp:DropDownList>
                            <script src="js/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript"> $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
                                       </div>
                                  <div class="form-group col-lg-2">
                                      <label>.</label><br />
                                        <asp:Button ID="Button1" runat="server" Text="View Report" class="btn btn-sm btn-info " CausesValidation="False" OnClick="Button1_Click" />
                           </div>
                                 <div class="form-group col-lg-2">
                                      <label>Date</label>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Enter Date" ControlToValidate="TextBox1"  ForeColor="Red"></asp:RequiredFieldValidator>
                           <asp:TextBox ID="TextBox1" runat="server" class="form-control date" placeholder="Enter Date" ></asp:TextBox>
                           </div>
                                   <div class="form-group col-lg-4">
                                      <label>Verify Status</label>
                                       <asp:RadioButtonList ID="RadioButtonList1" runat="server" class="chkbox1" RepeatColumns="2">
                                           <asp:ListItem Selected="True">Ok</asp:ListItem>
                                           <asp:ListItem>Not OK</asp:ListItem>
                                       </asp:RadioButtonList>
                           </div>
                       <div class="form-group col-lg-12">
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Remarks" ControlToValidate="txtreport"  ForeColor="Red"></asp:RequiredFieldValidator>
                           <asp:TextBox ID="txtreport" runat="server" class="form-control" placeholder="Enter Remarks" TextMode="MultiLine"></asp:TextBox>
                           </div>


                            </div></div></div>
         <div class="panel-footer">
                                <asp:Button ID="btnsubmit" runat="server" Text="Submit" class="btn btn-sm btn-info " OnClick="btnsubmit_Click" />
	<asp:Button ID="btnview" runat="server" Text="View All" class="btn btn-sm btn-danger" OnClick="btnview_Click" CausesValidation="False" />
                          

                                </div></div></div></div>
    <div class="row gutter">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="panel panel-blue"><div class="panel-heading">
                      <h4>View Verification Report</h4>
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
                                         <asp:BoundField DataField="user_name" HeaderText="User" />
                                        <asp:BoundField DataField="status" HeaderText="Status" />
                                        <asp:BoundField DataField="remarks" HeaderText="Remarks" />
                                        <asp:BoundField DataField="date" DataFormatString="{0:dd-MMM-yy}" HeaderText="Date" />
                                        <asp:BoundField DataField="created_by" HeaderText="Created by" />
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


