<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="all_dealer_bal_sheet.aspx.cs" Inherits="all_dealer_bal_sheet" EnableEventValidation="false" %>

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
    <link href="Content/chosen.css" rel="stylesheet" />
     <style>
	a img{border: none;}
		ol li{list-style: decimal outside;}
		div#container{width: 780px;margin: 0 auto;padding: 1em 0;}
		div.side-by-side{width: 100%;margin-bottom: 1em;}
		div.side-by-side > div{float: left;width: 50%;}
		div.side-by-side > div > em{margin-bottom: 10px;display: block;}
		.clearfix:after{content: "\0020";display: block;height: 0;clear: both;overflow: hidden;visibility: hidden;}
		
	</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <div class="form-group col-md-3 ">From
                   <asp:TextBox ID="txtfrom" runat="server" class="form-control input-sm date"></asp:TextBox>
                          </div>
                     <div class="form-group col-md-3 ">To
                     <asp:TextBox ID="txtto" runat="server" class="form-control input-sm date"></asp:TextBox>
                          </div>
                    <div class="form-group col-md-3 ">
                  <asp:Button ID="Button2" runat="server" Text="View" class="btn btn-success btn-sm " OnClick="Button2_Click"   />
                          </div>
                     <div class="form-group col-md-3 ">
                  <asp:Button ID="Button1" runat="server" Text="Today" class="btn btn-success btn-sm " OnClick="Button1_Click"   />
                          </div>
       <div class="form-group col-md-12 ">
                Dealer Name
                   <asp:DropDownList ID="ddldealer" runat="server" class="form-control chzn-select" AutoPostBack="True" OnSelectedIndexChanged="ddldealer_SelectedIndexChanged">
                                                    </asp:DropDownList>
           <%--<script src="js/jquery.min.js" type="text/javascript"></script>--%>
    <script src="js/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript"> $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
                          </div>
       <br />
       <asp:Button ID="btnsubmit2" runat="server" Text="Export to Excel" class="btn btn-success btn-sm " OnClick="btnsubmit2_Click"  />
    <br />
      <div class="row">
          
                      
                <div id="Div1" class="col-sx-4 table-responsive">
                     <div class="form-group col-md-12 ">
                        <h3 id="h3" runat="server" visible="false"> <%-- Total Debit:<asp:Label ID="Label3" runat="server" Text="Label" Font-Bold="True" ForeColor="Red"></asp:Label>&nbsp;|| Total Credit:<asp:Label ID="Label4" runat="server" Text="Label" Font-Bold="True" ForeColor="Red"></asp:Label>&nbsp;||--%> Total Available&nbsp; Balance:<asp:Label ID="Label5" runat="server" Text="Label" Font-Bold="True" ForeColor="Red"></asp:Label></h3>
             
              </div>
					<asp:GridView ID="GridView1" runat="server" CssClass="Grid" AutoGenerateColumns="False"  >
                                    <Columns>
                                      <asp:TemplateField HeaderText="Sr No.">
                            <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                                         <%--<asp:TemplateField HeaderText="ID" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>--%>
                                        <asp:BoundField DataField="date" HeaderText="Date" DataFormatString="{0:dd-MMM-yyyy}" />
                                   <%--     <asp:TemplateField HeaderText="Challan No.">
                                           
                                            <ItemTemplate>
                                                   <a href="print_challan.aspx?id=<%# Eval("challan_no") %>" target="_blank" >
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("challan_no") %>'></asp:Label>
                                                       </a>
                                            </ItemTemplate>
                                        </asp:TemplateField>--%>
                                        <asp:TemplateField HeaderText="Dealer Name">
                                                                                       <ItemTemplate>
                                                                                           <a href="view_dealer_ledger_pop_up.aspx?id=<%# Eval("dealer_id") %>" target="_blank" >
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("dealer_name") %>'></asp:Label>
                                                       </a>
                                              
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Total Amount">
                                            <ItemTemplate>
                                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("debit", "{0:n2}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Total Received">
                                            <ItemTemplate>
                                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("credit", "{0:n2}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                               <asp:TemplateField HeaderText="Total Balance">
                                            <ItemTemplate>
                                                <asp:Label ID="Label8" runat="server" Text='<%# Bind("bal", "{0:n2}") %>'></asp:Label>
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
          
      </div>
    </asp:Content>


