<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="purchase_price_master.aspx.cs" Inherits="purchase_price_master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="row">
                <div class="col-md-10">
                    <div class="padding-md">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                Set Purchase Price</div>
                            <div class="panel-body">
                                <div class="tab-content">
                                    <div class="col-md-10 table-responsive">
                                        <form>
                                            <asp:GridView ID="GridView2" runat="server" CssClass="Grid" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting"  >
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
                                        <asp:TemplateField HeaderText="Price">
                                            <ItemTemplate>
                                                 <asp:TextBox ID="TextBox4" runat="server" Text='0'></asp:TextBox>
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
                                            <div id="div1" runat="server" visible="false">
                                            	<div class="form-group ">
					                                Size
                                                  <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="ddlsize" Font-Bold="True" Font-Size="Large" ForeColor="Red" InitialValue="Select"></asp:RequiredFieldValidator>--%>
                    
                                                <asp:DropDownList ID="ddlsize" runat="server" class="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlsize_SelectedIndexChanged">
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
                                            <div class="form-group ">
					                                Company Name
                   <asp:DropDownList ID="ddlcompname" runat="server" class="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlcompname_SelectedIndexChanged">
                                                    </asp:DropDownList>
					
				</div>
                                            <div class="form-group ">
					                                Product Grade
                                                                   <asp:DropDownList ID="ddlprotype" runat="server" class="form-control">
                                                                       <asp:ListItem>Premium</asp:ListItem>
                                                                       <asp:ListItem>Commercial</asp:ListItem>
                                                                       <asp:ListItem>NA</asp:ListItem>
                                                    </asp:DropDownList>

					
				</div>
                                            <div class="form-group " id="pc" runat="server" visible="false">
					                                Product Code
                     <asp:DropDownList ID="ddlpcode" runat="server" class="form-control">
                                                                                            </asp:DropDownList>
					
				</div>
                                            <div class="form-group ">
Unit
                                                
                                                <asp:DropDownList ID="ddlunit" runat="server" class="form-control" >
                                                    <asp:ListItem>Box</asp:ListItem>
                                                    <asp:ListItem>PCS</asp:ListItem>
                                                    </asp:DropDownList>
					
				</div>
                                                                  <div class="form-group ">
					                                Price

                    <asp:TextBox ID="txtprice" runat="server" class="form-control input-sm">0</asp:TextBox>
					
				</div>
                                            
              </div>
                   
				
			
                                        </form>
                                        </div>

                                </div>

                            </div>

                            <div class="panel-footer">
                                		<asp:Button ID="btnsubmit" runat="server" Text="Submit" class="btn btn-success btn-sm " OnClick="btnsubmit_Click"  />
                          <asp:Button ID="btnview" runat="server" Text="View All" class="btn btn-sm btn-danger" OnClick="btnview_Click" CausesValidation="False"  />
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
                                        <asp:BoundField DataField="p_code" HeaderText="Product Code" Visible="False" />
                                        <asp:BoundField DataField="unit" HeaderText="Unit" />
                                                                                <asp:BoundField DataField="price" HeaderText="Price" DataFormatString="{0:n2}" />
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

