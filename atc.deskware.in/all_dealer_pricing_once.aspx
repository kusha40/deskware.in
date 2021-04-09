<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="all_dealer_pricing_once.aspx.cs" Inherits="all_dealer_pricing_once" %>

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
     <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
     <script type="text/javascript">
         $(document).ready(function () {
             $("[id*=chkAll5]").bind("click", function () {
                 if ($(this).is(":checked")) {
                     $("[id*=CheckBoxList1] input").attr("checked", "checked");
                 } else {
                     $("[id*=CheckBoxList1] input").removeAttr("checked");
                 }
             });
             $("[id*=chkFruits] input").bind("click", function () {
                 if ($("[id*=CheckBoxList1] input:checked").length == $("[id*=CheckBoxList1] input").length) {
                     $("[id*=chkAll5]").attr("checked", "checked");
                 } else {
                     $("[id*=chkAll5]").removeAttr("checked");
                 }
             });
         });
</script>
 
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
                                    <div class="col-md-10 table-responsive">
                                        <form>
                      
                                            <div class="form-group ">
					                                Dealer Name
                  
                                                <asp:CheckBox ID="chkAll5" Text="Select All" runat="server" CssClass="checkbox" />
                                                <asp:CheckBoxList ID="CheckBoxList1" runat="server" RepeatColumns="3" CssClass="checkbox">

                                                </asp:CheckBoxList>			
				</div>
                                          
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

					<asp:GridView ID="GridView2" runat="server" CssClass="Grid" AutoGenerateColumns="False" OnRowDataBound="GridView2_RowDataBound"  >
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
                                           <asp:TemplateField HeaderText="Max.Price">
                                            <ItemTemplate>
                                                  <asp:Label ID="Label8" runat="server" Text='0'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Price">
                                            <ItemTemplate>
                                                 <asp:TextBox ID="TextBox4" runat="server" Text='0' ></asp:TextBox>
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

                                </div>
                     
                            </div>

                                <div class="panel-footer">
                                		<asp:Button ID="btnsubmit" runat="server" Text="Add" class="btn btn-success btn-sm " OnClick="btnsubmit_Click"  />
                          &nbsp;</div>
                        </div>

                    </div>

                </div>
             
         </div>
      <div class="row">
                      
                <div id="Div1" class="col-sx-4 table-responsive">
			 </div></div>
    </asp:Content>

