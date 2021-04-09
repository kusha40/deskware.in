<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/site.master" AutoEventWireup="true" CodeFile="sale_report_weekly.aspx.cs" Inherits="Admin_sale_report_weekly" EnableEventValidation="false" %>

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
           // $(".date").datepicker('setDate', new Date());
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
     <div class="row gutter">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="panel panel-blue"><div class="panel-heading">
                    <h4>Dealer Sale Report Weekly</h4>

                                              </div>
                    <div class="panel-body">
                        <div class="form-group">
                            <div class="row gutter">
                                 <div class="col-md-2">
                                    <label class="control-label">From Date</label>
                                    <asp:TextBox ID="txtfdate" runat="server" class="form-control date" ></asp:TextBox>
                                </div>
                                <div class="col-md-1">
                                     <br />
                                       <asp:Button ID="Button1" runat="server" Text="View" class="btn btn-info" OnClick="Button1_Click"  />
                                </div>
                                     <div class="col-md-1">
                                     <br />
                                       <asp:Button ID="Button3" runat="server" Text="Reset" class="btn btn-danger" OnClick="Button3_Click"  />
                                </div>
                                 <div class="col-md-1">
                                     <br />
                                       <asp:Button ID="Button2" runat="server" Text="Export to Excel" class="btn btn-warning" OnClick="Button2_Click"  />
                                </div>
                                </div></div>
                        <div class="table-responsive">
             
              <h3 id="h1" runat="server"></h3>
					<asp:GridView ID="GridView1" runat="server" class="table table-striped table-bordered no-margin" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound"  >
                        <Columns>
                                      <asp:TemplateField HeaderText="Sr No.">
                                          
                            <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
                                <br />
                            </ItemTemplate>
                                        
                        </asp:TemplateField>
                            <asp:BoundField DataField="DealerName"  HeaderText="DealerName"  />
                                      <asp:TemplateField HeaderText="Week 1">
                                          <ItemTemplate>
                                              <asp:Label ID="Label2" runat="server" Text='<%# Bind("[Week 1]", "{0:n2}") %>'></asp:Label>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Week 2">
                                          <ItemTemplate>
                                              <asp:Label ID="Label3" runat="server" Text='<%# Bind("[Week 2]", "{0:n2}") %>'></asp:Label>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Week 3">
                                          <ItemTemplate>
                                              <asp:Label ID="Label4" runat="server" Text='<%# Bind("[Week 3]", "{0:n2}") %>'></asp:Label>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Week 4">
                                          <ItemTemplate>
                                              <asp:Label ID="Label5" runat="server" Text='<%# Bind("[Week 4]", "{0:n2}") %>'></asp:Label>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Week 5">
                                          <ItemTemplate>
                                              <asp:Label ID="Label6" runat="server" Text='<%# Bind("[Week 5]", "{0:n2}") %>'></asp:Label>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Total">
                                          <ItemTemplate>
                                              <asp:Label ID="Label1" runat="server"></asp:Label>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                             
                            </Columns>
                        </asp:GridView></div></div></div></div>
         </div>
</asp:Content>

