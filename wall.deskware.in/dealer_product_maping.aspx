<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="dealer_product_maping.aspx.cs" Inherits="dealer_product_maping" %>

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
                                Create Dealer Product Pricing</div>
                            <div class="panel-body">
                                <div class="tab-content">
                                                        <div class="form-group ">
					                                Dealer Name
                    <asp:DropDownList ID="ddldealername" runat="server" class="form-control chzn-select" ></asp:DropDownList>
                                                   <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript"> $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>			
				</div>
                                    <div class="col-md-10 table-responsive">
                                        <form>
                      
                        
                                          
                         <%--                   <div class="form-group col-lg-3 ">
					                             Size
 <asp:DropDownList ID="ddlsize" runat="server" class="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlsize_SelectedIndexChanged" >
                                                   
                                                    <asp:ListItem>12x18</asp:ListItem>
                                                    <asp:ListItem>12x24</asp:ListItem>
                                                    <asp:ListItem>2x2</asp:ListItem>
                                                    <asp:ListItem>2x4</asp:ListItem>
                                                    <asp:ListItem>32x32</asp:ListItem>
                                                    </asp:DropDownList>
					
				</div>
                                                                  <div class="form-group col-lg-3 ">
					                             Comp. Name
                    <asp:DropDownList ID="ddlcompname" runat="server" class="form-control">
                                                    </asp:DropDownList>
					
				</div>
                                                                  <div class="form-group col-lg-2 ">
					                                                  Product Grade
                   <asp:DropDownList ID="ddlprotype" runat="server" class="form-control">
                                                                       <asp:ListItem>Premium</asp:ListItem>
                                                                       <asp:ListItem>Commercial</asp:ListItem>
                                                                       <asp:ListItem>NA</asp:ListItem>
                       </asp:DropDownList>
					
				</div>
                                                                  <div class="form-group col-lg-3 ">
					                             Price
                                                                      <asp:Label ID="Label6" runat="server" Text="Label" Visible="False"></asp:Label>
&nbsp;<asp:TextBox ID="txtprice" runat="server" class="form-control input-sm"></asp:TextBox>
					
				</div>
                                            <div class="form-group col-lg-1 ">
					                 ..            
                    		<asp:Button ID="btnsubmit" runat="server" Text="Add" class="btn btn-success btn-sm " OnClick="btnsubmit_Click"  />
					
				</div>--%>
                           
                                            
              
                   
				
			
                                        </form>
                                        </div>
                                    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                        <ContentTemplate>

                                      
					<asp:GridView ID="GridView2" runat="server" CssClass="Grid" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting"  OnRowDataBound="GridView2_RowDataBound"  >
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
                                        <asp:TemplateField HeaderText="Size">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("size") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Company Name">
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("c_name") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Product Grade">
                                            <ItemTemplate>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("p_type") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                           <asp:TemplateField HeaderText="Min.Price">
                                            <ItemTemplate>
                                                  <asp:Label ID="Label8" runat="server" Text='0'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Price">
                                            <ItemTemplate>
                                                 <asp:TextBox ID="TextBox4" runat="server" Text='0' AutoPostBack="true" OnTextChanged="txtBox_TextChanged"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Unit">
                                            <ItemTemplate>
                                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("unit") %>'></asp:Label>
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
                                      </ContentTemplate>
                                    </asp:UpdatePanel>
                                </div>
                     
                            </div>

                                <div class="panel-footer">
                                		<asp:Button ID="btnsubmit" runat="server" Text="Add" class="btn btn-success btn-sm " OnClick="btnsubmit_Click"  />
                          &nbsp;<asp:Button ID="btnview" runat="server" Text="View Product Pricing" class="btn btn-sm btn-danger" OnClick="btnview_Click"  />
                     &nbsp; <asp:Button ID="btnview0" runat="server" Text="Delete Previous Pricing" class="btn btn-sm btn-danger" OnClientClick="return confirm('Are you sure to delete?')" OnClick="btnview0_Click"   />
                     &nbsp;<asp:Button ID="btnview1" runat="server" Text="Delete All Dealer Previous Pricing" class="btn btn-sm btn-danger" OnClick="btnview1_Click" OnClientClick="return confirm('Are you sure to delete?')" Visible="false"   />
                     </div>
                        </div>

                    </div>

                </div>
             
         </div>
      <div class="row">
                      
                <div id="Div1" class="col-sx-4 table-responsive">
					<asp:GridView ID="GridView1" runat="server" CssClass="Grid" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting" DataKeyNames="id" >
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
                                        <asp:BoundField DataField="size" HeaderText="Size" />
                                        <asp:BoundField DataField="c_name" HeaderText="Company Name" />
                                        <asp:BoundField DataField="p_type" HeaderText="Product Grade" />
                                        <asp:BoundField DataField="price"  HeaderText="Price" DataFormatString="{0:n2}" />
                                        <asp:BoundField DataField="unit" HeaderText="Unit" />
                                                                                                                        <asp:CommandField ShowDeleteButton="True" />
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
			 </div></div>
    </asp:Content>

