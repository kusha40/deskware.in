<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="movement_of_stock.aspx.cs" Inherits="movement_of_stock" EnableEventValidation="false" %>

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
            $(".date").datepicker('setDate', new Date());
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="row">
                <div class="col-md-10">
                    <div class="padding-md">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                Movement of Stock</div>
                            <div class="panel-body">
                                <div class="tab-content">
                                    <div class="col-md-10 table-responsive">
                                        <form>
                      
                                                                                                <div class="form-group col-lg-3 ">
					                           From  Date
                 <asp:TextBox ID="txtfrom" runat="server" class="form-control date"></asp:TextBox>
					
				</div>
                                                                                                                         <div class="form-group col-lg-3 ">
					                             To Date
                 <asp:TextBox ID="txtto" runat="server" class="form-control date"></asp:TextBox>
					
				</div>
                                                                                                                                            <div class="form-group col-lg-3 ">
					                            Company Name
                  <asp:DropDownList ID="ddlcompname" runat="server" class="form-control" >
                                                    </asp:DropDownList>
					
				</div>
                                        </form>
                                        </div>

                                </div>
                     
                            </div>
                            
                                <div class="panel-footer">
                          <asp:Button ID="btnview" runat="server" Text="Issue Challan" class="btn btn-sm btn-danger" OnClick="btnview_Click"  />
                     &nbsp;<asp:Button ID="btnview0" runat="server" Text="Return Challan" class="btn btn-sm btn-danger" OnClick="btnview0_Click"   />
                     &nbsp;<asp:Button ID="btnview1" runat="server" Text="Cancel Challan" class="btn btn-sm btn-danger" OnClick="btnview1_Click"   />
                     &nbsp;<asp:Button ID="btnview2" runat="server" Text="Stock Entry" class="btn btn-sm btn-danger" OnClick="btnview2_Click"   />
                     &nbsp;<asp:Button ID="btnsubmit2" runat="server" Text="Export to Excel" class="btn btn-success btn-sm " OnClick="btnsubmit2_Click"  />
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
                        </asp:TemplateField>
                                          
                                        <asp:TemplateField HeaderText="Date">
                                            <ItemTemplate>
                                                 <a href="view_movement.aspx?id=<%# Eval("date","{0:MM/dd/yyyy}") %>&pid=<%# Eval("p_code") %>&typ=<%# Eval("type") %>" target="_blank" >
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("date", "{0:dd-MMM-yyyy}") %>'></asp:Label>
                                                     </a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="challan_no" HeaderText="Challan no"/>
                                         <asp:BoundField DataField="dealer_name" HeaderText="Dealer Name"/>
                                        <asp:BoundField DataField="c_name" HeaderText="C.Name"/>
                                         <asp:BoundField DataField="p_code" HeaderText="Product Code"/>
                                        <asp:BoundField DataField="size" HeaderText="Size"/>
                                        <asp:BoundField DataField="qty"  HeaderText="Qty"/>
                                        <asp:BoundField DataField="unit" HeaderText="Unit"/>
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


