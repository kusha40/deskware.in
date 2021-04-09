<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="set_dealer_min_pricing.aspx.cs" Inherits="set_dealer_min_pricing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="Content/chosen.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="row">
                <div class="col-md-10">
                    <div class="padding-md">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                Set Dealer & Salesman Minimum Pricing</div>
                            <div class="panel-body">
                                <div class="tab-content">
                                    <div class="col-md-10 table-responsive">
                                        <form>
                     <div class="form-group col-lg-12 " id="div" runat="server" visible="false">
					                             Dealer Name
                                                                                        <asp:DropDownList ID="ddldealer" runat="server" class="form-control chzn-select">
                                                                                            </asp:DropDownList>
                                                                                             <script src="js/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript"> $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
					
				</div>
                                  <div id="div2" runat="server" >
                                          <div class="form-group col-lg-3 ">
					                             Size
 <asp:DropDownList ID="ddlsize" runat="server" class="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlsize_SelectedIndexChanged" >
                                                   
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
					
				</div>
                                                                  <div class="form-group col-lg-3 ">
					                             Comp. Name
                    <asp:DropDownList ID="ddlcompname" runat="server" class="form-control" >
                                                    </asp:DropDownList>
					
				</div>
                                          
                                                                 <div class="form-group col-lg-2 ">
					                            Dealer Pricing
&nbsp;<asp:TextBox ID="txtdprice" runat="server" class="form-control input-sm"></asp:TextBox>
					
				</div>
                                                                  <div class="form-group col-lg-2 ">
					                          Saleman Pricing
&nbsp;<asp:TextBox ID="txtsprice" runat="server" class="form-control input-sm"></asp:TextBox>
					
				</div>
                                                                                         
                         <div class="form-group col-lg-2 " >
                             <asp:Button ID="Button1" runat="server" Text="Add" class="btn btn-success btn-sm " OnClick="Button1_Click"  />
                         </div>
                                        
                   </div>            
              <asp:GridView ID="GridView2" runat="server" CssClass="Grid" AutoGenerateColumns="False" OnRowCommand="GridView2_RowCommand"  >
                                    <Columns>
                                      <asp:TemplateField HeaderText="Sr No.">
                            <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Size">
                                            <ItemTemplate>
                                                <asp:Label ID="lblsize" runat="server" Text='<%# Bind("size") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Company Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblc_name" runat="server" Text='<%# Bind("c_name") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Dealer Price">
                                            <ItemTemplate>
                                                <asp:Label ID="lbld_price" runat="server" Text='<%# Bind("d_price") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Salesman Price">
                                                 <ItemTemplate>
                                                     <asp:Label ID="lbls_price" runat="server" Text='<%# Bind("s_price") %>'></asp:Label>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                       
                                          <asp:TemplateField ShowHeader="False">
                                                                                <ItemTemplate>
                                                                                    <asp:LinkButton ID="lnkadd" runat="server" CausesValidation="False" CommandArgument='<%# Eval("size")%>' CommandName="delete1" Text="Remove"></asp:LinkButton>
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
                   
				
			
                                        </form>
                                        </div>

                                </div>
                     
                            </div>

                                <div class="panel-footer">
                          &nbsp;<asp:Button ID="btnsubmit" runat="server" Text="Submit" class="btn btn-success btn-sm " OnClick="btnsubmit_Click"  />
					
				                                &nbsp;<asp:Button ID="btnview" runat="server" Text="View All Dealer Minimum Pricing" class="btn btn-sm btn-danger" OnClick="btnview_Click"  />
                     &nbsp;<asp:Button ID="btnview0" runat="server" Text="Delete Previous Pricing" class="btn btn-sm btn-danger" OnClientClick="return confirm('Are you sure to delete?')" OnClick="btnview0_Click"   />
                     </div>
                        </div>

                    </div>

                </div>
             
         </div>
     
        
                <div id="Div3" class="col-sx-4 table-responsive">
                  
					<asp:GridView ID="GridView1" runat="server" CssClass="Grid" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting" DataKeyNames="id"  >
                                    <Columns>
                                      <asp:TemplateField HeaderText="Sr No.">
                            <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="ID" Visible="false">
                            <ItemTemplate>
                                <%--<asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>--%>
                            </ItemTemplate>
                        </asp:TemplateField>
                                        <asp:BoundField DataField="dealer_name" HeaderText="Dealer Name" />
                                        <asp:BoundField DataField="size" HeaderText="Size" />
                                        <asp:BoundField DataField="c_name" HeaderText="Company Name" />
                                        <asp:BoundField DataField="d_price" HeaderText="Dealer Price" DataFormatString="{0:n2}" />
                                        <asp:BoundField DataField="s_price" HeaderText="Saleman Price" DataFormatString="{0:n2}" />
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
			 </div>
    </asp:Content>

