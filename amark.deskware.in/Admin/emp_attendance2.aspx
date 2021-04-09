<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/site.master" AutoEventWireup="true" CodeFile="emp_attendance2.aspx.cs" Inherits="Admin_emp_attendance2" %>

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
         <style type="text/css">
            .chkbox1 label
    {
    margin-right: 5px;
    background-color: #2EBDE7;
    color: white;
    padding: 5px;
     width: auto;
    border-radius: 3px;
        border:1px solid #929292;
   } 

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row gutter">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            
            <div class="panel">
                <div class="panel-heading">
                    <h4>Employee Attendance</h4>

                </div>
                <div class="panel-body">
                
                        <div class="form-group">
                            <div class="row gutter">
                                 <div class="col-md-3">
                                    <label class="control-label">Date</label>
                                    <asp:TextBox ID="txtdate" runat="server" class="form-control date" ></asp:TextBox>
                                     <asp:TextBox ID="TextBox1" runat="server" class="form-control"  Visible="false"></asp:TextBox>
                                </div>
                                </div>
                                </div>
                        <div class="form-group">
                            <div class="row gutter">
                                 <div class="col-md-12">
                                     <div class="table-responsive">
                    <asp:GridView ID="GridView2" runat="server" class="table table-striped table-bordered no-margin" AutoGenerateColumns="False"  >
                                    <Columns>
                                             <asp:TemplateField HeaderText="">
                            <HeaderTemplate>
                                <asp:CheckBox ID="chkAll" runat="server" AutoPostBack="true" OnCheckedChanged="ChkAllRows" Text="" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkAll0" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Sr No.">
                            <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Employee Name">
                                            <ItemTemplate>
                                                   <asp:Label ID="Label11" runat="server" Text='<%# Bind("id") %>' Visible="false"></asp:Label>
                                                <asp:Label ID="Label12" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Attendance">
                                            <ItemTemplate>
                                                <asp:RadioButtonList ID="RadioButtonList1" class="chkbox1 " runat="server" RepeatDirection="Horizontal">
                                                                         <asp:ListItem Selected="True">P</asp:ListItem>
                                                                         <%--<asp:ListItem >A</asp:ListItem>--%>
                                                                     </asp:RadioButtonList> 
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
                    </asp:GridView></div>
                                     </div></div></div>

                </div></div>
            <asp:Button ID="Button1" runat="server" Text="Submit" class="btn btn-info" OnClick="Button1_Click"/>
            <br />
            <br />
        </div>
       </div>
</asp:Content>
