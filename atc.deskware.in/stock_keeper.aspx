<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="stock_keeper.aspx.cs" Inherits="stock_keeper" EnableEventValidation="false" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
       <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".date").datepicker({
                changeMonth: true,
                changeYear: true
            });
            $(".date").datepicker('setDate', -1);
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="row">
                <div class="col-md-10">
                    <div class="padding-md">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                Stock Keeper</div>
                            <div class="panel-body">
                                <div class="tab-content">
                                    <div class="col-md-10 table-responsive">
                                        <form>
                      
                     
                                          
                                            <div class="form-group col-lg-3 ">
					                             Size
 <asp:DropDownList ID="ddlsize" runat="server" class="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlsize_SelectedIndexChanged" >
     <asp:ListItem>All</asp:ListItem>
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
                    <asp:DropDownList ID="ddlcompname" runat="server" class="form-control">
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
					                             Date
                 <asp:TextBox ID="txtdate" runat="server" class="form-control date"></asp:TextBox>
					
				</div>
                                        </form>
                                        </div>

                                </div>
                     
                            </div>
                            
                                <div class="panel-footer">
                          <asp:Button ID="btnview" runat="server" Text="View Issue Challan Stock" class="btn btn-sm btn-danger" OnClick="btnview_Click"  />
                     &nbsp;<asp:Button ID="btnview0" runat="server" Text="View Return Challan Stock" class="btn btn-sm btn-danger" OnClick="btnview0_Click"   />
                     &nbsp;<asp:Button ID="btnview1" runat="server" Text="View Cancel Challan Stock" class="btn btn-sm btn-danger" OnClick="btnview1_Click"   />
                     &nbsp;<asp:Button ID="btnsubmit2" runat="server" Text="Export to Excel" class="btn btn-success btn-sm " OnClick="btnsubmit2_Click"  />
                     &nbsp;<asp:Button ID="btnview2" runat="server" Text="View All" class="btn btn-sm btn-danger" OnClick="btnview2_Click"   />
                     </div>
                        </div>

                    </div>

                </div>
             
         </div>
      <div class="row">
                      
                <div id="Div1" class="col-sx-4 table-responsive">
					<asp:GridView ID="GridView1" runat="server" CssClass="Grid" AutoGenerateColumns="False"  >
                                    <Columns>
                                      <asp:TemplateField HeaderText="Sr No.">
                            <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
                                <br />
                            </ItemTemplate>
                                          <HeaderStyle Width="10%" />
                        </asp:TemplateField>
                                     <%--   <asp:BoundField DataField="date" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Date" />--%>
                                        <asp:BoundField DataField="size" HeaderText="Size" Visible="False" />
                                        <asp:BoundField DataField="c_name" HeaderText="C.Name" Visible="False" />
                                         <asp:BoundField DataField="p_code" HeaderText="Product Code" >
                                        <ItemStyle Width="30%" />
                                        </asp:BoundField>
                                        <asp:BoundField DataField="qty"  HeaderText="Qty"  />
                                        <asp:BoundField DataField="unit" HeaderText="Unit" Visible="False" />
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

