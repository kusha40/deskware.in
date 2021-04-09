<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="create_daily_labour_charges, App_Web_zkaa0g3n" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="row">
                <div class="col-md-10">
                    <div class="padding-md">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                Create Daily Labour Charges</div>
                            <div class="panel-body">
                                <div class="tab-content">
                                    <div class="col-md-10 table-responsive">
                                        <form>
                                            	<div class="form-group ">
					                                Size
                                                  <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="ddlsize" Font-Bold="True" Font-Size="Large" ForeColor="Red" InitialValue="Select"></asp:RequiredFieldValidator>--%>
                    
                                                <asp:DropDownList ID="ddlsize" runat="server" class="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlsize_SelectedIndexChanged">
                                                    <asp:ListItem>12x18</asp:ListItem>
                                                    <asp:ListItem>12x24</asp:ListItem>
                                                    <asp:ListItem>2x2</asp:ListItem>
                                                    <asp:ListItem>2x4</asp:ListItem>
                                                    <asp:ListItem>32x32</asp:ListItem>
                                                       <asp:ListItem>15x24</asp:ListItem>
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
					                               Labour Charges
                    <asp:TextBox ID="txtrate" runat="server" class="form-control input-sm"></asp:TextBox>
					
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
                                        <asp:BoundField DataField="unit" HeaderText="Unit" />
                                                                                <asp:BoundField DataField="rate" HeaderText="Labour Charges" DataFormatString="{0:n2}" />
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



