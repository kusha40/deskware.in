<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/site.master" AutoEventWireup="true" CodeFile="sale_report_monthly.aspx.cs" Inherits="Admin_sale_report_monthly" EnableEventValidation="false" %>

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
                    <h4>Dealer Sale Report Monthly</h4>

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
                            <asp:BoundField DataField="dealer_name"  HeaderText="Dealer Name"  />
                                       <asp:TemplateField HeaderText="Jan">
                                          <ItemTemplate>
                                              <asp:Label ID="Label2" runat="server" Text='<%# Bind("[Jan]", "{0:n2}") %>'></asp:Label>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Feb">
                                          <ItemTemplate>
                                              <asp:Label ID="Label3" runat="server" Text='<%# Bind("[Feb]", "{0:n2}") %>'></asp:Label>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Mar">
                                          <ItemTemplate>
                                              <asp:Label ID="Label4" runat="server" Text='<%# Bind("[Mar]", "{0:n2}") %>'></asp:Label>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Apr">
                                          <ItemTemplate>
                                              <asp:Label ID="Label5" runat="server" Text='<%# Bind("[Apr]", "{0:n2}") %>'></asp:Label>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                      <asp:TemplateField HeaderText="May">
                                          <ItemTemplate>
                                              <asp:Label ID="Label6" runat="server" Text='<%# Bind("[May]", "{0:n2}") %>'></asp:Label>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                            <asp:TemplateField HeaderText="Jun">
                                          <ItemTemplate>
                                              <asp:Label ID="Label7" runat="server" Text='<%# Bind("[Jun]", "{0:n2}") %>'></asp:Label>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                            <asp:TemplateField HeaderText="Jul">
                                          <ItemTemplate>
                                              <asp:Label ID="Label8" runat="server" Text='<%# Bind("[Jul]", "{0:n2}") %>'></asp:Label>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Aug">
                                          <ItemTemplate>
                                              <asp:Label ID="Label9" runat="server" Text='<%# Bind("[Aug]", "{0:n2}") %>'></asp:Label>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Sep">
                                          <ItemTemplate>
                                              <asp:Label ID="Label10" runat="server" Text='<%# Bind("[Sep]", "{0:n2}") %>'></asp:Label>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Oct">
                                          <ItemTemplate>
                                              <asp:Label ID="Label11" runat="server" Text='<%# Bind("[Oct]", "{0:n2}") %>'></asp:Label>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Nov">
                                          <ItemTemplate>
                                              <asp:Label ID="Label12" runat="server" Text='<%# Bind("[Nov]", "{0:n2}") %>'></asp:Label>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                 <asp:TemplateField HeaderText="Dec">
                                          <ItemTemplate>
                                              <asp:Label ID="Label13" runat="server" Text='<%# Bind("[Dec]", "{0:n2}") %>'></asp:Label>
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

