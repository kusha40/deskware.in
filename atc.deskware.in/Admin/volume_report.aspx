<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/site.master" AutoEventWireup="true" CodeFile="volume_report.aspx.cs" Inherits="Admin_volume_report" EnableEventValidation="false" %>

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
             <div class="panel-body">
                
                        <div class="form-group">
                            <div class="row gutter">
                                 <div class="col-md-2">
                                    <label class="control-label">From Date</label>
                                    <asp:TextBox ID="txtfdate" runat="server" class="form-control date" ></asp:TextBox>
                                </div>
                                  <div class="col-md-2">
                                    <label class="control-label">To Date</label>
                                    <asp:TextBox ID="txttdate" runat="server" class="form-control date" ></asp:TextBox>
                                </div>
                                <div class="col-md-2">
                                    <label class="control-label">Size</label>
                                    <asp:DropDownList ID="ddlsize" runat="server" class="form-control chzn-select">
                                         <asp:ListItem>All</asp:ListItem>
                                      <asp:ListItem>1x1</asp:ListItem>
<asp:ListItem>10x13</asp:ListItem>
<asp:ListItem>10x15</asp:ListItem>
<asp:ListItem>10x24</asp:ListItem>
<asp:ListItem>8x24</asp:ListItem>
										<asp:ListItem>8x12</asp:ListItem>			

                                                    <asp:ListItem>12x18</asp:ListItem>

                                                    <asp:ListItem>12x24</asp:ListItem>
<asp:ListItem>16x16</asp:ListItem>
                                                    <asp:ListItem>2x2</asp:ListItem>
                                                    <asp:ListItem>2x4</asp:ListItem>
                                                    <asp:ListItem>32x32</asp:ListItem>
                                                    </asp:DropDownList>
                                                 <%--<script src="js/jquery.min.js" type="text/javascript"></script>--%>
    <script src="js/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript"> $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label">Company</label>
                                    <asp:DropDownList ID="ddlcom" runat="server" class="form-control chzn-select">
                                                    </asp:DropDownList>
                                                 <%--<script src="js/jquery.min.js" type="text/javascript"></script>--%>
    <script src="js/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript"> $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
                                </div>
                                   <div class="col-md-3">
                                    <label class="control-label">Dealer</label>
                                     <asp:DropDownList ID="ddldealer" runat="server" class="form-control chzn-select">
                                                    </asp:DropDownList>
                                                 <%--<script src="js/jquery.min.js" type="text/javascript"></script>--%>
    <script src="js/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript"> $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
                                </div>
                                </div>
                           
                        </div>
                      <div class="form-group">
                            <div class="row gutter">
                                 <div class="col-md-4">
                                    <label class="control-label">Areawise</label>
                                  <asp:DropDownList ID="ddlarea" runat="server" class="form-control chzn-select" AutoPostBack="True" OnSelectedIndexChanged="ddlarea_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                              
					   <%--<script src="js/jquery.min.js" type="text/javascript"></script>--%>
    <script src="js/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript"> $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
                                </div>
                                </div>
                          </div>

                   <asp:Button ID="Button1" runat="server" Text="View" class="btn btn-info" OnClick="Button1_Click" />
                  <asp:Button ID="Button2" runat="server" Text="Export to Excel" class="btn btn-default" OnClick="Button2_Click" />
             </div>
              
        
        </div>
       </div>
    <div class="row gutter">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="panel panel-blue"><div class="panel-heading">
                    <h4>Dealer Volumewise List</h4>

                                              </div>
                    <div class="panel-body">
                        <div class="table-responsive">
             
              
					<asp:GridView ID="GridView1" runat="server" class="table table-striped table-bordered no-margin" AutoGenerateColumns="False" ShowFooter="True" OnRowDataBound="GridView1_RowDataBound"  >
                                    <Columns>
                                      <asp:TemplateField HeaderText="Sr No.">
                                          
                            <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
                                <br />
                            </ItemTemplate>
                                        
                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Name">
                                            <ItemTemplate>
                                                <asp:Label ID="Label161" runat="server" Text='<%# Bind("Name", "{0:n2}") %>'></asp:Label>
                                            </ItemTemplate>
                                               <FooterTemplate>
                                              <asp:Label ID="lbltotl" runat="server" Text="Total"></asp:Label>
                                          </FooterTemplate>
                                        </asp:TemplateField>
                                               <asp:TemplateField HeaderText="12x18Allient">
                                             
                                                   <ItemTemplate>
                                                       <asp:Label ID="Label1" runat="server" Text='<%# Bind("12x18Allient", "{0:n2}") %>'></asp:Label>
                                                         
                                                   </ItemTemplate>
                                                       <FooterTemplate>
                                              <asp:Label ID="Label16" runat="server" Text="Label"></asp:Label>
                                          </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="12x18Murano">
                                       
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("12x18Murano", "{0:n2}") %>'></asp:Label>
                                            </ItemTemplate>
                                             <FooterTemplate>
                                              <asp:Label ID="Label17" runat="server" Text="Label"></asp:Label>
                                          </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="12x18Specto">
                                           
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("12x18Specto", "{0:n2}") %>'></asp:Label>
                                            </ItemTemplate>
                                             <FooterTemplate>
                                              <asp:Label ID="Label18" runat="server" Text="Label"></asp:Label>
                                          </FooterTemplate>
                                        </asp:TemplateField>
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
                                        <asp:TemplateField HeaderText="12x24Arido">
                                       
                                            <ItemTemplate>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("12x24Arido", "{0:n2}") %>'></asp:Label>
                                            </ItemTemplate>
                                             <FooterTemplate>
                                              <asp:Label ID="Label19" runat="server" Text="Label"></asp:Label>
                                          </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="12x24Capsun">
                                          
                                            <ItemTemplate>
                                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("12x24Capsun", "{0:n2}") %>'></asp:Label>
                                            </ItemTemplate>
                                             <FooterTemplate>
                                              <asp:Label ID="Label20" runat="server" Text="Label"></asp:Label>
                                          </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="12x24Murano">
                                       
                                            <ItemTemplate>
                                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("12x24Murano", "{0:n2}") %>'></asp:Label>
                                            </ItemTemplate>
                                                 <FooterTemplate>
                                              <asp:Label ID="Label21" runat="server" Text="Label"></asp:Label>
                                          </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="12x24Pioneer">
                                         
                                            <ItemTemplate>
                                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("12x24Pioneer", "{0:n2}") %>'></asp:Label>
                                            </ItemTemplate>
                                                 <FooterTemplate>
                                              <asp:Label ID="Label22" runat="server" Text="Label"></asp:Label>
                                          </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="12x24Savitra">
                                           
                                            <ItemTemplate>
                                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("12x24Savitra", "{0:n2}") %>'></asp:Label>
                                            </ItemTemplate>
                                                 <FooterTemplate>
                                              <asp:Label ID="Label23" runat="server" Text="Label"></asp:Label>
                                          </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="2x2Livanto">
                                      
                                            <ItemTemplate>
                                                <asp:Label ID="Label9" runat="server" Text='<%# Bind("2x2Livanto", "{0:n2}") %>'></asp:Label>
                                            </ItemTemplate>
                                                 <FooterTemplate>
                                              <asp:Label ID="Label24" runat="server" Text="Label"></asp:Label>
                                          </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="2x2Senso">
                                         
                                            <ItemTemplate>
                                                <asp:Label ID="Label10" runat="server" Text='<%# Bind("2x2Senso", "{0:n2}") %>'></asp:Label>
                                            </ItemTemplate>
                                                 <FooterTemplate>
                                              <asp:Label ID="Label25" runat="server" Text="Label"></asp:Label>
                                          </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="2x2Veeta">
                                        
                                            <ItemTemplate>
                                                <asp:Label ID="Label11" runat="server" Text='<%# Bind("2x2Veeta", "{0:n2}") %>'></asp:Label>
                                            </ItemTemplate>
                                                 <FooterTemplate>
                                              <asp:Label ID="Label26" runat="server" Text="Label"></asp:Label>
                                          </FooterTemplate>
                                        </asp:TemplateField>
                                              <asp:TemplateField HeaderText="2x2veeta dark series">
                                        
                                            <ItemTemplate>
                                                <asp:Label ID="Label103" runat="server" Text='<%# Bind("2x2veetadarkseries", "{0:n2}") %>'></asp:Label>
                                            </ItemTemplate>
                                                 <FooterTemplate>
                                              <asp:Label ID="Label203" runat="server" Text="Label"></asp:Label>
                                          </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="2x2Zed">
                                        
                                            <ItemTemplate>
                                                <asp:Label ID="Label12" runat="server" Text='<%# Bind("2x2Zed", "{0:n2}") %>'></asp:Label>
                                            </ItemTemplate>
                                                 <FooterTemplate>
                                              <asp:Label ID="Label27" runat="server" Text="Label"></asp:Label>
                                          </FooterTemplate>
                                        </asp:TemplateField>
                                           <asp:TemplateField HeaderText="2x4black berry">
                                       
                                            <ItemTemplate>
                                                <asp:Label ID="Label104" runat="server" Text='<%# Bind("2x4blackberry", "{0:n2}") %>'></asp:Label>
                                            </ItemTemplate>
                                                 <FooterTemplate>
                                              <asp:Label ID="Label204" runat="server" Text="Label"></asp:Label>
                                          </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="2x4Veeta">
                                       
                                            <ItemTemplate>
                                                <asp:Label ID="Label13" runat="server" Text='<%# Bind("2x4Veeta", "{0:n2}") %>'></asp:Label>
                                            </ItemTemplate>
                                                 <FooterTemplate>
                                              <asp:Label ID="Label28" runat="server" Text="Label"></asp:Label>
                                          </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="2x4Zed">
                                           
                                            <ItemTemplate>
                                                <asp:Label ID="Label14" runat="server" Text='<%# Bind("2x4Zed", "{0:n2}") %>'></asp:Label>
                                            </ItemTemplate>
                                                 <FooterTemplate>
                                              <asp:Label ID="Label29" runat="server" Text="Label"></asp:Label>
                                          </FooterTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="32x32Veeta">
                                                                                     <ItemTemplate>
                                                <asp:Label ID="Label15" runat="server" Text='<%# Bind("32x32Veeta", "{0:n2}") %>'></asp:Label>
                                            </ItemTemplate>
                                                 <FooterTemplate>
                                              <asp:Label ID="Label30" runat="server" Text="Label"></asp:Label>
                                          </FooterTemplate>
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
          </div></div></div>
      </div>
</asp:Content>




