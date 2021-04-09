<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="online_stock_show.aspx.cs" Inherits="online_stock_show" EnableEventValidation="false" %>

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
    <link href="Content/chosen.css" rel="stylesheet" />
	
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="row">
                <div class="col-md-10">
                    <div class="padding-md">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                Stock Show</div>
                            <div class="panel-body">
                                <div class="tab-content">
                                    <div class="col-md-10 table-responsive">
                                       
                      
                     
                                          
                                            <div class="form-group col-lg-3 ">
					                             Size
 <asp:DropDownList ID="ddlsize" runat="server" class="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlsize_SelectedIndexChanged" >
                                                    <asp:ListItem>12x18</asp:ListItem>
                                                    <asp:ListItem>12x24</asp:ListItem>
                                                    <asp:ListItem>2x2</asp:ListItem>
                                                    <asp:ListItem>2x4</asp:ListItem>
                                                    <asp:ListItem>32x32</asp:ListItem>
                                                       <asp:ListItem>15x24</asp:ListItem>
                                                    </asp:DropDownList>
					
				</div>
                                                                  <div class="form-group col-lg-3 ">
					                             Comp. Name
                    <asp:DropDownList ID="ddlcompname" runat="server" class="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlcompname_SelectedIndexChanged">
                                                    </asp:DropDownList>
					
				</div>
                                                                  <div class="form-group col-lg-3 " id="div" runat="server" visible="false">
					                             Product Grade
                   <asp:DropDownList ID="ddlprotype" runat="server" class="form-control">
                                                                       <asp:ListItem>Premium</asp:ListItem>
                                                                       <asp:ListItem>Commercial</asp:ListItem>
                                                                       <asp:ListItem>NA</asp:ListItem>
                       </asp:DropDownList>
					
				</div>
                                                                                     
                                        
                                        </div>

                                </div>
                     <div class="form-group col-lg-12 ">
					                            Product Code
                    <asp:DropDownList ID="ddlproductcode" runat="server" class="form-control chzn-select"></asp:DropDownList>
                        	<script src="js/jquery.min.js" type="text/javascript"></script>
		<script src="js/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript"> $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
                                                    
                                                         </div>
                            </div>

                                <div class="panel-footer">
                          <asp:Button ID="btnview" runat="server" Text="View Stock" class="btn btn-sm btn-danger" OnClick="btnview_Click"  />
                     &nbsp;<asp:Button ID="btnsubmit2" runat="server" Text="Export to Excel" class="btn btn-success btn-sm " OnClick="btnsubmit2_Click"  />
                     </div>
                        </div>

                    </div>

                </div>
             
         </div>
      <div class="row">
                      
                <div id="Div1" class="col-sx-4 table-responsive">
					<asp:GridView ID="GridView1" runat="server" CssClass="Grid" AutoGenerateColumns="False" DataKeyNames="id" >
                                    <Columns>
                                      <asp:TemplateField HeaderText="Sr No.">
                            <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
                                <br />
                            </ItemTemplate>
                                          <ItemStyle Width="5%" />
                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="ID" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                     <%--   <asp:BoundField DataField="date" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Date" />--%>
                                        <asp:BoundField DataField="size" HeaderText="Size" >
                                        <ItemStyle Width="10%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="c_name" HeaderText="Company Name" >
                                        <ItemStyle Width="20%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="p_grade" HeaderText="Product Grade" Visible="False" >
                                         <ItemStyle Width="10%" />
                                        </asp:BoundField>
                                         <asp:BoundField DataField="p_code" HeaderText="Product Code" >
                                        <ItemStyle Width="20%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="qty"  HeaderText="Qty"  >
                                        <ItemStyle Width="10%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="unit" HeaderText="Unit" />
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
