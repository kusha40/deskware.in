<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="order_generation.aspx.cs" Inherits="order_generation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h3>Order Generation
       
    </h3>
     <asp:Button ID="Button2" runat="server" Text="Export to Excel" OnClick="Button2_Click" />
    &nbsp;<asp:Button ID="btnsubmit1" runat="server" Text="Show All" class="btn btn-success btn-sm " OnClick="btnsubmit1_Click"   />
      <br />
      <div class="form-group col-md-3">
                                                 Size
                                          <asp:DropDownList ID="ddlsize" runat="server" class="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlsize_SelectedIndexChanged" >
                                                   
                                                    <asp:ListItem>----</asp:ListItem>
                                                   
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
                                               <div class="form-group col-md-3">
                                                 Company Name
                                              <asp:DropDownList ID="ddlcompname" runat="server" class="form-control" ></asp:DropDownList>
                                                     &nbsp;<br />
                                                  
                                                     </div>
    <div class="form-group col-md-2">
         <asp:Button ID="btnsubmit2" runat="server" Text="Show with Size & Cname" class="btn btn-success btn-sm " OnClick="btnsubmit2_Click"   />
        </div>
                     &nbsp;<div class="row">
                      <br /><br />
                <div id="Div1" class="col-sx-4 table-responsive">
                         <h3 id="h3" runat="server" visible="false">  &nbsp;Total No of Qty:<asp:Label ID="Label5" runat="server" Text="Label" Font-Bold="True" ForeColor="Red"></asp:Label></h3>
					<asp:GridView ID="GridView1" runat="server" CssClass="Grid" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound"   >
                                    <Columns>
                                      <asp:TemplateField HeaderText="Sr No.">
                            <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                                          
                                         <asp:TemplateField HeaderText="Product Code">
                                            
                                             <ItemTemplate>
                                                 <asp:Label ID="Label1" runat="server" Text='<%# Bind("p_code") %>'></asp:Label>
                                             </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:BoundField DataField="c_name"  HeaderText="Company Name"/>
                                        <asp:BoundField DataField="size" HeaderText="Size"/>
                                        <asp:BoundField DataField="unit" HeaderText="Unit"/>
                                         
                                        <asp:TemplateField HeaderText="Min. Stock">
                                            <ItemTemplate>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("min_stock") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Actual Stock">
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text=''></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Final Order">
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text=''></asp:Label>
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
			 </div></div>
</asp:Content>

