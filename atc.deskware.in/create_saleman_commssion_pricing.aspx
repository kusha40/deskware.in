<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="create_saleman_commssion_pricing.aspx.cs" Inherits="create_saleman_commssion_pricing" %>

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
                                Create Saleman Commission Pricing</div>
                            <div class="panel-body">
                                <div class="tab-content">
                                                        <div class="form-group ">
					                                Sales man&nbsp; Name <asp:Literal ID="dealer_id" runat="server" Visible="false"></asp:Literal><asp:Literal ID="dealer_name" runat="server" Visible="false"></asp:Literal>
                    <asp:DropDownList ID="ddlsalesman" runat="server" class="form-control chzn-select" AutoPostBack="True" OnSelectedIndexChanged="ddlsalesman_SelectedIndexChanged"></asp:DropDownList>
                                                 <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript"> $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>			
				</div>
                                    <div class="col-md-10 table-responsive">
                                        <form>
                      
                        

                                                                  <div class="form-group ">
					                                Product Listing
                    <div id="Div2" class="col-sx-4 table-responsive">
					<asp:GridView ID="GridView2" runat="server" CssClass="Grid" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting" DataKeyNames="id" OnRowDataBound="GridView2_RowDataBound" >
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
                                         <asp:TemplateField HeaderText="ID" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Size">
                                            
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("size") %>'></asp:Label>
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
                                                  <asp:Label ID="Label8" runat="server" Text='0.00'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Commission">
                                            <EditItemTemplate>
                                                
                                            </EditItemTemplate>
                                            <ItemTemplate>
<asp:TextBox ID="TextBox4" runat="server" Text='0.00' AutoPostBack="true" OnTextChanged="txtBox_TextChanged"></asp:TextBox>

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
                			
			
                                        </form>
                                        </div>

                                </div>
                     
                            </div>

                                <div class="panel-footer">
                                    <asp:Button ID="btnsubmit" runat="server" Text="Submit" class="btn btn-success btn-sm " OnClick="btnsubmit_Click"  />
                          <asp:Button ID="btnview" runat="server" Text="View Commission Pricing" class="btn btn-sm btn-danger" OnClick="btnview_Click"  />
                     &nbsp;<asp:Button ID="btnview0" runat="server" Text="Delete Previous Pricing" class="btn btn-sm btn-danger" OnClick="btnview0_Click" OnClientClick="return confirm('Are you sure to delete?')"   />
                     &nbsp;<asp:Button ID="btnview1" runat="server" Text="Delete All Salesman Previous Pricing" class="btn btn-sm btn-danger" OnClick="btnview1_Click" OnClientClick="return confirm('Are you sure to delete?')" Visible="False"   />
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
                                        <asp:BoundField DataField="p_type" HeaderText="Product Type" />
                                        <asp:BoundField DataField="com_price"  HeaderText="Commission" DataFormatString="{0:n2}" />
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

