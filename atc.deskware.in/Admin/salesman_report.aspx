<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/site.master" AutoEventWireup="true" CodeFile="salesman_report.aspx.cs" Inherits="Admin_salesman_report" EnableEventValidation="false" %>

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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row gutter">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            <br />
              <asp:Button ID="Button2" runat="server" Text="Export to Excel" class="btn btn-default" OnClick="Button2_Click" />
            <br />
            <br />
        </div>
       </div>
    <div class="row gutter">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="panel panel-blue"><div class="panel-heading">
                    <h4>Salesmen Pricing List</h4>

                                              </div>
                    <div class="panel-body">
                        <div class="table-responsive">
             
              
					<asp:GridView ID="GridView1" runat="server" class="table table-striped table-bordered no-margin" AutoGenerateColumns="False"  >
                                    <Columns>
                                      <asp:TemplateField HeaderText="Sr No.">
                            <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                                        <asp:BoundField DataField="Name"  HeaderText="Name" DataFormatString="{0:n2}" />
                                               <asp:BoundField DataField="12x18Allient"  HeaderText="12x18Allient" DataFormatString="{0:n2}" />
                                               <asp:BoundField DataField="12x18Murano"  HeaderText="12x18Murano" DataFormatString="{0:n2}" />
                                               <asp:BoundField DataField="12x18Specto"  HeaderText="12x18Specto" DataFormatString="{0:n2}" />
                                                 <asp:TemplateField HeaderText="12x18Pioneer">
                                           
                                            <ItemTemplate>
                                                <asp:Label ID="Label100" runat="server" Text='<%# Bind("12x18Pioneer", "{0:n2}") %>'></asp:Label>
                                            </ItemTemplate>
                                             <FooterTemplate>
                                              <asp:Label ID="Label200" runat="server" Text="Label"></asp:Label>
                                          </FooterTemplate>
                                        </asp:TemplateField>
                                               <asp:TemplateField HeaderText="12x18TILEX">
                                           
                                            <ItemTemplate>
                                                <asp:Label ID="Label101" runat="server" Text='<%# Bind("12x18TILEX", "{0:n2}") %>'></asp:Label>
                                            </ItemTemplate>
                                             <FooterTemplate>
                                              <asp:Label ID="Label201" runat="server" Text="Label"></asp:Label>
                                          </FooterTemplate>
                                        </asp:TemplateField>
                                               <asp:BoundField DataField="12x24Arido"  HeaderText="12x24Arido" DataFormatString="{0:n2}" />
                                               <asp:BoundField DataField="12x24Capsun"  HeaderText="12x24Capsun" DataFormatString="{0:n2}" />
                                               <asp:BoundField DataField="12x24Murano"  HeaderText="12x24Murano" DataFormatString="{0:n2}" />
                                               <asp:BoundField DataField="12x24Pioneer"  HeaderText="12x24Pioneer" DataFormatString="{0:n2}" />
                                               <asp:BoundField DataField="12x24Savitra"  HeaderText="12x24Savitra" DataFormatString="{0:n2}" />
                                               <asp:BoundField DataField="2x2Livanto"  HeaderText="2x2Livanto" DataFormatString="{0:n2}" />
                                               <asp:BoundField DataField="2x2Senso"  HeaderText="2x2Senso" DataFormatString="{0:n2}" />
                                               <asp:BoundField DataField="2x2Veeta"  HeaderText="2x2Veeta" DataFormatString="{0:n2}" />
                                           <asp:TemplateField HeaderText="2x2veeta dark series">
                                        
                                            <ItemTemplate>
                                                <asp:Label ID="Label103" runat="server" Text='<%# Bind("2x2veetadarkseries", "{0:n2}") %>'></asp:Label>
                                            </ItemTemplate>
                                                 <FooterTemplate>
                                              <asp:Label ID="Label203" runat="server" Text="Label"></asp:Label>
                                          </FooterTemplate>
                                        </asp:TemplateField>
                                               <asp:BoundField DataField="2x2Zed"  HeaderText="2x2Zed" DataFormatString="{0:n2}" />
                                             <asp:TemplateField HeaderText="2x4black berry">
                                       
                                            <ItemTemplate>
                                                <asp:Label ID="Label104" runat="server" Text='<%# Bind("2x4blackberry", "{0:n2}") %>'></asp:Label>
                                            </ItemTemplate>
                                                 <FooterTemplate>
                                              <asp:Label ID="Label204" runat="server" Text="Label"></asp:Label>
                                          </FooterTemplate>
                                        </asp:TemplateField>
                                               <asp:BoundField DataField="2x4Veeta"  HeaderText="2x4Veeta" DataFormatString="{0:n2}" />
                                               <asp:BoundField DataField="2x4Zed"  HeaderText="2x4Zed" DataFormatString="{0:n2}" />
                                               <asp:BoundField DataField="32x32Veeta"  HeaderText="32x32Veeta" DataFormatString="{0:n2}" />
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
          </div></div></div>
      </div>
</asp:Content>

