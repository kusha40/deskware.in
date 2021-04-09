<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="lead_work_report.aspx.cs" Inherits="lead_work_report" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 
          <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
  <%--  <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>--%>
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
    <div class="row gutter" id="div1" runat="server">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            
            <div class="panel">
                <div class="panel-heading">
                    <h4>Filter/Search</h4>

                </div>
                <div class="panel-body">
                        <div class="form-group">
                            <div class="row gutter">
                                <div class="col-md-2">
                                    <label class="control-label">From Date</label>
                                     <asp:TextBox ID="txtfrom" runat="server" class="form-control date" placeholder="From Date"></asp:TextBox>
                                </div>
                                <div class="col-md-2">
                                    <label class="control-label">To Date</label>
                                      <asp:TextBox ID="txtto" runat="server" class="form-control date" placeholder="To Date"></asp:TextBox>
                                </div>
                                                                   <div class="col-md-3">
                                    <label class="control-label">Select User</label>
                                      <asp:DropDownList ID="ddlname" runat="server" class="form-control chzn-select" ></asp:DropDownList>
                                    <script src="js/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript"> $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
                                </div>
                                                              <div class="col-md-2">
                                    <label class="control-label">Lead Status</label>
                                      <asp:DropDownList ID="DropDownList1" runat="server" class="form-control " >
                                          <asp:ListItem>On going</asp:ListItem>
                                       <asp:ListItem>Rejected</asp:ListItem>
                                       <asp:ListItem>Converted</asp:ListItem>
                                      </asp:DropDownList>
                                    
                                </div>
                                                           <div class="col-md-2">
                                    <label class="control-label">.</label>
                                      <asp:DropDownList ID="DropDownList2" runat="server" class="form-control " >
                                          <asp:ListItem>Phone Not Picked</asp:ListItem>
                                      </asp:DropDownList>
                                    
                                </div>
                                <div class="col-md-1">
                                    <label class="control-label">.</label><br />
                                      <asp:Button ID="Button4" runat="server" Text="View" class="btn btn-info" OnClick="Button1_Click" />
                                </div>
                                </div>

                        </div>

                        
                    
                                     </div>

            </div>

            

             <asp:Button ID="Button2" runat="server" Text="Reset" class="btn btn-default" OnClick="Button2_Click" /> 

             <asp:Button ID="Button3" runat="server" Text="Export to Excel" class="btn btn-danger" OnClick="Button3_Click" />

        </div>

        </div>
    <br />
      <div class="row gutter">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="panel panel-blue"><div class="panel-heading">
                    <h4>Lead Work Report</h4>

                                              </div>
                    <div class="panel-body">
                        <div class="row gutter">
                         <div class="col-lg-4">
                                   
                              <ul class="right-stats" id="Ul1">
                                  <li id="li2" ><a href="javascript:void(0)" class="btn btn-default">Total Followups : <span id="Span1" runat="server">0</span></a></li>
                                 
                              </ul>
                                </div>
                            </div>
    <div class="table-responsive">
                           
                            <asp:GridView ID="GridView1" class="table table-striped table-bordered no-margin" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="15" OnRowDataBound="GridView1_RowDataBound" >
                                 <Columns>
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
                                      <asp:TemplateField HeaderText="Lead ID">
                                          <ItemTemplate>
                                              <asp:Label ID="Label4" runat="server" Text='<%# Bind("lead_id") %>'></asp:Label>
                                          </ItemTemplate>
                                     </asp:TemplateField>
                                     <asp:BoundField DataField="fname" HeaderText="Name" />
                                     <asp:TemplateField HeaderText="Lead Type">
                                         <ItemTemplate>
                                             <asp:Label ID="Label2" runat="server"></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Lead Status">
                                         <ItemTemplate>
                                             <asp:Label ID="Label3" runat="server"></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                      <asp:BoundField DataField="nfd" HeaderText="Next Followup Date" DataFormatString="{0:dd-MMM-yyyy}" />
                                        <asp:BoundField DataField="remarks" HeaderText="Remarks" />
                                        <asp:BoundField DataField="created_by" HeaderText="Created_by" />
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
</asp:Content>

