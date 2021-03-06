<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="sale_report_amountwise.aspx.cs" Inherits="sale_report_amountwise" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
      <style>
		a img{border: none;}
		ol li{list-style: decimal outside;}
		div#container{width: 780px;margin: 0 auto;padding: 1em 0;}
		div.side-by-side{width: 100%;margin-bottom: 1em;}
		div.side-by-side > div{float: left;width: 50%;}
		div.side-by-side > div > em{margin-bottom: 10px;display: block;}
		.clearfix:after{content: "\0020";display: block;height: 0;clear: both;overflow: hidden;visibility: hidden;}
		
	</style>
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
    <link href="Content/chosen.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="row">
                <div class="col-md-10">
                    <div class="padding-md">&nbsp;<div class="panel panel-info">
                            <div class="panel-heading">
                                Sale Report  Amountwise</div>
                            <div class="panel-body">
                                <div class="tab-content">
                                   
                                        <form>
                                            <div class="form-group col-md-12">
                  	                  <div class="form-group col-md-6">
					                               Chosse Company
                   <asp:DropDownList ID="DropDownList1" runat="server" class="form-control chzn-select">
                       <asp:ListItem Value="AM">A Mark</asp:ListItem>
                       <asp:ListItem Value="AV">A Vitra</asp:ListItem>
                       <asp:ListItem Value="RO">Royal</asp:ListItem>
                       <asp:ListItem Value="WA">Wall Studio</asp:ListItem>
                       <asp:ListItem Value="TH">Tile HUB</asp:ListItem>
                       <asp:ListItem>ATH</asp:ListItem>
                                                    </asp:DropDownList>
    <script src="js/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript"> $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
				</div>
                                            </div>
                          
                                            <div class="form-group col-md-6">
					                                Dealer Name
                   <asp:DropDownList ID="ddldealer" runat="server" class="form-control chzn-select">
                                                    </asp:DropDownList>
                                              
					   <%--<script src="js/jquery.min.js" type="text/javascript"></script>--%>
    <script src="js/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript"> $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
				</div>
                                             <div class="form-group col-md-3">
                                                 From
                                                 <asp:TextBox ID="txtfrom" runat="server" class="form-control input-sm date"></asp:TextBox>
                                                 </div>
                                             <div class="form-group col-md-3">
                                                 To
                                                 <asp:TextBox ID="txtto" runat="server" class="form-control input-sm date"></asp:TextBox>
                                                 </div>
                                             <div class="form-group col-md-3" id="div1" runat="server" visible="false">
                                                 Particular Date
                                                 <asp:TextBox ID="txtpdate" runat="server" class="form-control input-sm date"></asp:TextBox>
                                                 </div>
                                            <div class="form-group col-md-6" >
                                               Area wise
                                               <asp:DropDownList ID="ddlarea" runat="server" class="form-control chzn-select" AutoPostBack="True" OnSelectedIndexChanged="ddlarea_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                              
					   <%--<script src="js/jquery.min.js" type="text/javascript"></script>--%>
    <script src="js/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript"> $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
                                                 </div>
                                       
                                            
			
                                        </form>
                                        

                                </div>

                            </div>

                            <div class="panel-footer">
                                		<asp:Button ID="btnsubmit" runat="server" Text="Show with Date Duration" class="btn btn-success btn-sm " OnClick="btnsubmit_Click" Visible="False"  />
                     &nbsp;<asp:Button ID="btnsubmit0" runat="server" Text="Show with Particular Date" class="btn btn-success btn-sm " OnClick="btnsubmit0_Click" Visible="False"   />
                     &nbsp;&nbsp;<asp:Button ID="btnsubmit2" runat="server" Text="Show Today All Dealer" class="btn btn-success btn-sm " OnClick="btnsubmit2_Click" Visible="False"   />
                     &nbsp;<asp:Button ID="btnsubmit1" runat="server" Text="Show All" class="btn btn-success btn-sm " OnClick="btnsubmit1_Click" Visible="False"   />
                     &nbsp;<asp:Button ID="btnview3" runat="server" Text="View" class="btn btn-sm btn-warning" OnClick="btnview3_Click"  />
                            &nbsp;<asp:Button ID="btnview4" runat="server" Text="Return View" class="btn btn-sm btn-danger" OnClick="btnview4_Click"  />
                            &nbsp;<asp:Button ID="btnsubmit3" runat="server" Text="Export to Excel" class="btn btn-success btn-sm " OnClick="btnsubmit3_Click"  />
                            </div>
                        </div>

                    </div>

                </div>
             
         </div>
      <div class="row">
          
                      
                <div id="Div1" class="col-sx-4 table-responsive">
                        <h3 id="h3" runat="server" visible="false">Total Sale:<asp:Label ID="Label5" runat="server" Text="Label" Font-Bold="True" ForeColor="Red"></asp:Label></h3>
             
              
					<asp:GridView ID="GridView1" runat="server" CssClass="Grid" AutoGenerateColumns="False"  >
                                    <Columns>
                                      <asp:TemplateField HeaderText="Sr No.">
                            <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="ID" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("dealer_id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                        <asp:BoundField DataField="dealer_name" HeaderText="Dealer Name" />
                                        <asp:TemplateField HeaderText="Total">
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("netamount", "{0:n2}") %>'></asp:Label>
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

