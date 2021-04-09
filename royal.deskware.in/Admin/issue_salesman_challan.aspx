<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/site.master" AutoEventWireup="true" CodeFile="issue_salesman_challan.aspx.cs" Inherits="Admin_issue_salesman_challan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
                   <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".date").datepicker({
                changeMonth: true,
                changeYear: true
            });
            $(".date").datepicker('setDate', new Date());
        });
    </script>
     <link href="../Content/chosen.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row gutter">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            
            <div class="panel">
                <div class="panel-heading">
                    <h4>Issue Salesman Challan</h4>

                </div>
                <div class="panel-body">
                <div class="form-group">
                            <div class="row gutter">
                                 
                                 <div class="col-md-2">
                                    <label class="control-label">Date</label>
                                    <asp:TextBox ID="txtdate" runat="server" class="form-control date" ></asp:TextBox>
                                </div>
                                </div>
                    </div>
                        <div class="form-group">
                            <div class="row gutter">
                                
                                <div class="col-md-3">
                                    <label class="control-label">Name</label>
                                        <asp:DropDownList ID="ddldriver" runat="server" class="form-control chzn-select">
                                                    </asp:DropDownList>
    <script src="../js/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript"> $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
                                </div>
                                 <div class="col-md-2">
                                    <label class="control-label">Amount</label>
                                    <asp:TextBox ID="txtamount" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                   <div class="col-md-2">
                                    <label class="control-label"> Credit/Debit</label>
                                       <asp:RadioButtonList ID="RadioButtonList1" runat="server" class="form-control" RepeatColumns="2" RepeatDirection="Horizontal">
                                           <asp:ListItem Selected="True" Value="C">Credit</asp:ListItem>
                                           <asp:ListItem Value="D">Debit</asp:ListItem>
                                       </asp:RadioButtonList>
                                </div>
                                 <div class="col-md-4">
                                    <label class="control-label">Remarks</label>
                                    <asp:TextBox ID="txtreamrks" runat="server" class="form-control" TextMode="MultiLine" Height="30px"></asp:TextBox>
                                </div>
                                 <div class="form-group col-lg-1 " >
                                     <br />
                             <asp:Button ID="Button2" runat="server" Text="Add" class="btn btn-success btn-sm " OnClick="Button2_Click"   />
                         </div>
                               
                                </div></div>
                             <div class="form-group">
                            <div class="row gutter">
                                 
                                
                                </div>
                            <asp:GridView ID="GridView2" runat="server" class="table table-striped table-bordered no-margin" AutoGenerateColumns="False" OnRowCommand="GridView2_RowCommand"  >
                                    <Columns>
                                      <asp:TemplateField HeaderText="Sr No.">
                            <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                                          <asp:TemplateField HeaderText="id">
                                            <ItemTemplate>
                                                <asp:Label ID="lblid" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblname" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Amount">
                                            <ItemTemplate>
                                                <asp:Label ID="lblamount" runat="server" Text='<%# Bind("amount") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Type">
                                            <ItemTemplate>
                                                <asp:Label ID="lbltype" runat="server" Text='<%# Bind("type") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Remarks">
                                                 <ItemTemplate>
                                                     <asp:Label ID="lblremarks" runat="server" Text='<%# Bind("remarks") %>'></asp:Label>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                          <asp:TemplateField ShowHeader="False">
                                                                                <ItemTemplate>
                                                                                    <asp:LinkButton ID="lnkadd" runat="server" CausesValidation="False" CommandArgument='<%# Eval("id")%>' ForeColor="Red" CommandName="delete1" Text="Remove"></asp:LinkButton>
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
                </div></div>
            <asp:Button ID="Button1" runat="server" Text="Submit" class="btn btn-info" OnClick="Button1_Click" />
        </div>
       </div>
</asp:Content>


