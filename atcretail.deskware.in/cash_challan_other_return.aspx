<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="cash_challan_other_return.aspx.cs" Inherits="cash_challan_other_return" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="row">
                <div class="col-lg-10">
                    <div class="padding-md">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                Issue Challan</div>
                            <div class="panel-body">
                                <div class="tab-content">
                                    <iframe id="myIframe" src="issue_cash_challan_new_other_return.aspx" height="700px" width="635px"></iframe>
                                    <%--<div class="col-lg-10 table-responsive">
                                        <form>
                      
                                            <div class="form-group col-lg-5 ">
					                                Date
                    <asp:TextBox ID="txtdate" runat="server" class="form-control input-sm date"></asp:TextBox>
					
				</div>
                                          
                                          <div class="form-group col-lg-5 ">
					                                Challan No.
                    <asp:TextBox ID="txtchallanno" runat="server" class="form-control input-sm"></asp:TextBox>
					
				</div>
                                                                  <div class="form-group col-lg-10  ">
					                               Select Dealer<asp:DropDownList ID="ddlvendor" class="form-control"  runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlvendor_SelectedIndexChanged"></asp:DropDownList>
                                                                      </div>
                                            <div class="form-group col-lg-5 " id="dname" runat="server" visible="false">
					                                Dealer&nbsp; Name

                    <asp:TextBox ID="txtvname" runat="server" class="form-control input-sm"  ReadOnly="True"></asp:TextBox>
					
				</div>
                                            <div class="form-group col-lg-5 " id="darea" runat="server" visible="false">
					                                Area
                    <asp:TextBox ID="txtarea" runat="server" class="form-control input-sm"  ReadOnly="True"></asp:TextBox>
					
				</div>
                                                 <div class="form-group col-lg-10 ">

                   </div>
                                             <div class="col-lg-12">
					 
				
                                            <div class="form-group col-lg-4 ">
					                                Size

                                                    <asp:Label ID="Label32" runat="server" Text="Label" Visible="False"></asp:Label>

                   <asp:DropDownList ID="ddlsize" runat="server" class="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlsize_SelectedIndexChanged" >
                                                   
                                                    <asp:ListItem>12x18</asp:ListItem>
                                                    <asp:ListItem>12x24</asp:ListItem>
                                                    <asp:ListItem>2x2</asp:ListItem>
                                                    <asp:ListItem>2x4</asp:ListItem>
                                                    <asp:ListItem>32x32</asp:ListItem>
                                                    </asp:DropDownList>
					
				</div>
                                            <div class="form-group col-lg-5 ">
					                                Company Name
                                                
                         <asp:DropDownList ID="ddlcompname" runat="server" class="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlcompname_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                               
					
				</div>
                                                                   <div class="form-group col-lg-3 ">
					                             Product Grade
                       <asp:DropDownList ID="ddlprotype" runat="server" class="form-control">
                                                                        <asp:ListItem>Premium</asp:ListItem>
                                                                       <asp:ListItem>Commercial</asp:ListItem>
                                                                       <asp:ListItem>NA</asp:ListItem>
                       </asp:DropDownList>
					
				</div>
                                                                       <div class="form-group col-lg-3 ">
					                             Qty.
                    <asp:TextBox ID="txtqty" runat="server" class="form-control input-sm">0</asp:TextBox>
					
				</div>
                                            <div class="form-group col-lg-4 ">
					                             Product Code
                   <asp:DropDownList ID="ddlpcode" runat="server" class="form-control">
                                                                                            </asp:DropDownList>
					
				</div>
                                                                                          <div class="form-group col-lg-1 " id ="div11" runat="server" visible="false">
					                             MRP
                    <asp:TextBox ID="txtmrp" runat="server" class="form-control input-sm" ReadOnly="True" >0</asp:TextBox>
					
				</div>
                     
                                            <div class="form-group col-lg-3 ">
					                             
                  
                                		<asp:Button ID="Button1" runat="server" Text="Add" class="btn btn-success btn-sm " OnClick="Button1_Click"   />
					
				</div>
                                                                         <div class="form-group col-lg-10 ">
<h5>Available Stock: <asp:Label ID="Label3" runat="server" Text="0" Font-Bold="True" ForeColor="Red"></asp:Label></h5>
                   </div>
                                                                                                          
                                                                <div class="form-group col-lg-10 ">
					                             
                  
                                		                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="Grid2" OnRowCommand="GridView1_RowCommand">
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderText="Sr No.">
                                                                                <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
                                <br />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Qty">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("qty") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Unit">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("unit") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Size">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("size") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                                 <asp:TemplateField HeaderText="Company Name">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="Label32" runat="server" Text='<%# Bind("c_name") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                                 <asp:TemplateField HeaderText="Product Code">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="Label31" runat="server" Text='<%# Bind("p_code") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                                  <asp:TemplateField HeaderText="Product Grade">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="Label39" runat="server" Text='<%# Bind("p_grade") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Rate" Visible="False">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("rate", "{0:n2}") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Amount" Visible="False">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("amount", "{0:n2}") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            
                                                                            <asp:TemplateField ShowHeader="False">
                                                                                <ItemTemplate>
                                                                                    <asp:LinkButton ID="lnkadd" runat="server" CausesValidation="False" CommandArgument='<%# Eval("p_code")%>' CommandName="delete1" Text="Remove"></asp:LinkButton>
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
                                                                        <PagerStyle CssClass="GridPager" HorizontalAlign="Left" />
                                                                    </asp:GridView>
                                                                    </div>
                                                                                                                <div class="form-group col-lg-5 " id="ttlamt" runat="server" visible="false">
					                             Total Amount
                    <asp:TextBox ID="txttotlamt" runat="server" class="form-control input-sm" ReadOnly="True">0</asp:TextBox>
					
				</div>
                                                                     <div class="form-group col-lg-5 ">
					                             Freight
                    <asp:TextBox ID="txtfraight" runat="server" class="form-control input-sm" AutoPostBack="True" OnTextChanged="txtfraight_TextChanged">0</asp:TextBox>
					
				</div>
                                                                    
                                                                     <div class="form-group col-lg-10 " id="ntamt" runat="server" visible="false">
					                             Net Amount
                    <asp:TextBox ID="txtnetamount" runat="server" class="form-control input-sm" ReadOnly="True">0</asp:TextBox>
					
				</div>
                                                                     <div class="form-group col-lg-10 " id="amtwrds" runat="server" visible="false">
					                             Amount In words
                    <asp:TextBox ID="txtinwords" runat="server" class="form-control input-sm" ReadOnly="True"></asp:TextBox>
					
				</div>

                                                 <div class="form-group col-lg-10 " id="Div1" runat="server" visible="false">
					                             Driver Name
                  <asp:DropDownList ID="ddldrivername" class="form-control " runat="server"  ></asp:DropDownList>
					
				</div>
                                                 <div class="form-group col-lg-10 " id="Div2" runat="server" visible="false">
					                             Address
                    <asp:TextBox ID="txtaddress" runat="server" class="form-control input-sm"> </asp:TextBox>
					
				</div>

					
				
                                            
              </div>
                   
				
			
                                        </form>
                                        </div>--%>

                                </div>

                            </div>

                            <%--<div class="panel-footer">
                                		<asp:Button ID="btnsubmit" runat="server" Text="Submit" class="btn btn-success btn-sm " OnClick="btnsubmit_Click"  />
                     &nbsp;<asp:Button ID="btnsubmit0" runat="server" Text="Print" class="btn btn-danger btn-sm " OnClick="btnsubmit0_Click"   />
                     &nbsp;<asp:Button ID="btnsubmit1" runat="server" Text="Print 2" class="btn btn-danger btn-sm " OnClick="btnsubmit1_Click" Visible="False"   />
                     </div>--%>
                        </div>

                    </div>

                </div>
             
         </div>
      <div class="row">
                      
                </div>
    </asp:Content>

