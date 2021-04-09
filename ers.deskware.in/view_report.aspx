<%@ Page Language="C#" AutoEventWireup="true" CodeFile="view_report.aspx.cs" Inherits="view_report" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <link href="css/bootstrap.min.css" media="screen" rel="stylesheet"/>
    <link href="css/main.css" rel="stylesheet" media="screen"/>
    <link href="fonts/icomoon/icomoon.css" rel="stylesheet"/>
    <link href="css/c3/c3.css" rel="stylesheet" />
    <link href="css/circliful/circliful.css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div class="row gutter">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="panel panel-blue"><div class="panel-heading">
                      <h4 id="h4" runat="server"></h4>
                                              </div>
                    <div class="panel-body">
                    
                        <div class="table-responsive col-lg-12">
                               <asp:Button ID="btnsubmit2" runat="server" Text="Export to Excel" class="btn btn-success" OnClick="btnsubmit2_Click"  />
                            <br />
                               <br />
                            <asp:GridView ID="GridView1" runat="server" class="table table-striped table-bordered no-margin"  AutoGenerateColumns="False"   >
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
                                        
                                        <asp:BoundField DataField="report" HeaderText="Report Summary" />
                                        <asp:BoundField DataField="date" DataFormatString="{0:dd-MMM-yy}" HeaderText="Date" />
                                        <asp:BoundField DataField="date" DataFormatString="{0:hh:mm:ss tt}" HeaderText="Time" />
                                        <asp:BoundField DataField="created_by" HeaderText="Created by" />
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
    </div>
    </form>
</body>
</html>
