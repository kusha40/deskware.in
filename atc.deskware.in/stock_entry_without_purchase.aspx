<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="stock_entry_without_purchase.aspx.cs" Inherits="stock_entry_without_purchase" MaintainScrollPositionOnPostback="true" %>

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
     <link href="Content/chosen.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="row">
                <div class="col-md-10">
                    <div class="padding-md">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                Create&nbsp; Stock Entry wthout purchase</div>
                            <div class="panel-body">
                                <div class="tab-content">
                                    <div class="col-md-10 table-responsive">
                                   
                      <div class="form-group col-lg-10 ">
                                                                                         <div class="form-group col-lg-10 ">
					                             Date
                                                                      <asp:Label ID="Label6" runat="server" Text="Label" Visible="False"></asp:Label>
&nbsp;<asp:TextBox ID="txtdate" runat="server" class="form-control date input-sm"></asp:TextBox>
					
				</div>

						

                      </div>
                     <div id="div1" runat="server" >
                                          
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
                                                                  <div class="form-group col-lg-4 ">
					                             Comp. Name
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
&nbsp;<asp:TextBox ID="txtqty" runat="server" class="form-control input-sm">0</asp:TextBox>
					
				</div>
                                                                                         <div class="form-group col-lg-5 ">
					                             Product Code
                                                                                        <asp:DropDownList ID="ddlpcode" runat="server" class="form-control chzn-select">
                                                                                            </asp:DropDownList>
                                                                                             <script src="js/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript"> $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
					
				</div>
                         <div class="form-group col-lg-4 " >
                             <asp:Button ID="Button1" runat="server" Text="Add" class="btn btn-success btn-sm " OnClick="Button1_Click"  />
                         </div>
                                            <div class="form-group col-lg-1 ">
					                 ..            
                    							
				                                <asp:Label ID="Label7" runat="server" Text="0000" Visible="False"></asp:Label>
					
				&nbsp;<asp:Label ID="Label8" runat="server" Text="0" Visible="False"></asp:Label>
					
				</div>
                                                                                        <div class="form-group col-lg-10 " id="div11" runat="server" visible="false">
					                             Remarks
<asp:TextBox ID="txtremarks" runat="server" class="form-control input-sm" TextMode="MultiLine"></asp:TextBox>
					
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
                                        <asp:TemplateField HeaderText="Product Grade">
                                            <ItemTemplate>
                                                <asp:Label ID="lblp_type" runat="server" Text='<%# Bind("p_type") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Product Code">
                                                 <ItemTemplate>
                                                     <asp:Label ID="lblp_code" runat="server" Text='<%# Bind("p_code") %>'></asp:Label>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Qty.">
                                            <ItemTemplate>
                                                 <asp:Label ID="lbl_qty" runat="server"  Text='<%# Bind("qty") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Unit">
                                            <ItemTemplate>
                                                <asp:Label ID="lblunit" runat="server" Text='<%# Bind("unit") %>'></asp:Label>
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
                                     <PagerStyle HorizontalAlign = "Left" CssClass = "GridPager" />
                    </asp:GridView>
				
			
                                      
                                        </div>

                                </div>
                     
                            </div>

                                <div class="panel-footer">
                    		<asp:Button ID="btnsubmit" runat="server" Text="Submit" class="btn btn-success btn-sm " OnClick="btnsubmit_Click"  />
					
				                                &nbsp;<asp:Button ID="btnview" runat="server" Text="View Stock Entry" class="btn btn-sm btn-danger" OnClick="btnview_Click"  />
                     </div>
                        </div>

                    </div>

                </div>
             
         </div>
      <div class="row">
                      <div id="div2" runat="server" visible="false">
                                                                                                   <div class="form-group col-lg-3">
					                            From
&nbsp;<asp:TextBox ID="txtfrom" runat="server" class="form-control date input-sm"></asp:TextBox>
					
				</div>
                                                                                                        <div class="form-group col-lg-3">
					                            To
&nbsp;<asp:TextBox ID="txtto" runat="server" class="form-control date input-sm"></asp:TextBox>
					
				</div>
                                                                                                           <div class="form-group col-lg-2">
					                             
<asp:Button ID="btn1" runat="server" Text="View Datewise" class="btn btn-sm btn-danger" OnClick="btn1_Click" />
					
				</div>
                                                                                                           <div class="form-group col-lg-2">
					                             
<asp:Button ID="btn2" runat="server" Text="Today" class="btn btn-sm btn-danger" OnClick="btn2_Click" />

					
				</div>
                       
                                                                                              <div class="form-group col-lg-3">

                                                                                                  <asp:DropDownList ID="DropDownList1" runat="server" class="form-control" Visible="False"></asp:DropDownList>

					
				</div>
                                                                                                                 <div class="form-group col-lg-3">
					                             
<asp:Button ID="Button2" runat="server" Text="View Comapnywise" class="btn btn-sm btn-danger" OnClick="Button2_Click" Visible="False"  />

					
				</div>

                    </div>
          <br />
                <div id="Div1" class="col-sx-4 table-responsive">
                    <h3>Total No. Qty.:<asp:Label ID="Label4" runat="server" Font-Bold="True" ForeColor="Red" Text="0"></asp:Label>
                    </h3>
					<asp:GridView ID="GridView1" runat="server" CssClass="Grid" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting" DataKeyNames="stock_id" >
                                    <Columns>
                                      <asp:TemplateField HeaderText="Sr No.">
                            <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="ID" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("stock_id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                        <asp:BoundField DataField="date" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Date" />
                                       <%-- <asp:BoundField DataField="size" HeaderText="Size" />--%>
                                        <asp:BoundField DataField="c_name" HeaderText="Company Name" />
                                      <%--  <asp:BoundField DataField="p_type" HeaderText="Product Grade" />--%>
                                        <asp:TemplateField HeaderText="Qty">
                                            <ItemTemplate>
                                                <asp:Label ID="Label201" runat="server" Text='<%# Bind("qty") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="unit" HeaderText="Unit" />
                                        <asp:TemplateField HeaderText="Challan No">
                                            <ItemTemplate>
                                                <a href="view_stock_challan.aspx?id=<%# Eval("stock_id") %>" target="_blank" >
                                                <asp:Label ID="Label202" runat="server" Text='<%# Bind("stock_id") %>'></asp:Label>
                                                    </a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <%-- <asp:TemplateField HeaderText="Product Code">
                                             <ItemTemplate>
                                                 <asp:Label ID="Label200" runat="server" Text='<%# Bind("p_code") %>'></asp:Label>
                                             </ItemTemplate>
                                        </asp:TemplateField>--%>
                                        <%--<asp:BoundField DataField="remarks" HeaderText="Remarks" />--%>
                <%--                                                                                                        <asp:CommandField ShowDeleteButton="True" Visible="false" />--%>
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

