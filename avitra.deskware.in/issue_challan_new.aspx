<%@ Page Language="C#" AutoEventWireup="true" CodeFile="issue_challan_new.aspx.cs" Inherits="issue_challan_new" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
	

</head>
<body>
    <form id="form1" runat="server">
    <div>
    <table cellpadding="0" cellspacing="0" style="border:1px solid black; padding:10px">
                                        <tr>
                                            <td>Date
                    </td>
                                             <td>Challan No.
                    </td>
                                             <td>Product Grade</td>
                                        </tr>
                                        <tr>
                                            <td>
                    <asp:TextBox ID="txtdate" runat="server" class="date"></asp:TextBox>
					
					
				                            </td>
                                             <td>
                    <asp:TextBox ID="txtchallanno" runat="server" ></asp:TextBox>
					
					
				                            </td>
                                             <td><asp:DropDownList ID="ddlprotype" runat="server">
                                                                        <asp:ListItem>Premium</asp:ListItem>
                                                                       <asp:ListItem>Commercial</asp:ListItem>
                                                                       <asp:ListItem>NA</asp:ListItem>
                       </asp:DropDownList>
					
				                            </td>
                                        </tr>
                                        <tr>
                                            <td>
					                                Size

                                                    <asp:Label ID="Label32" runat="server" Text="Label" Visible="False"></asp:Label>

                                            </td>
                                             <td>
					                                Company Name
                                                
                         </td>
                                             <td>Select Dealer</td>
                                        </tr>
                                        <tr>
                                            <td>

                   <asp:DropDownList ID="ddlsize" runat="server"  AutoPostBack="True" OnSelectedIndexChanged="ddlsize_SelectedIndexChanged" >
                                                   
                                                    <asp:ListItem>12x18</asp:ListItem>
                                                    <asp:ListItem>12x24</asp:ListItem>
                                                    <asp:ListItem>2x2</asp:ListItem>
                                                    <asp:ListItem>2x4</asp:ListItem>
                                                    <asp:ListItem>32x32</asp:ListItem>
                                                       <asp:ListItem>15x24</asp:ListItem>
                                                    </asp:DropDownList>
					
				                            </td>
                                             <td>
                                                
                         <asp:DropDownList ID="ddlcompname" runat="server"  AutoPostBack="True" OnSelectedIndexChanged="ddlcompname_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                               
					
				                            </td>
                                             <td>
          
                                                 <asp:DropDownList ID="ddlvendor"  runat="server" AutoPostBack="True" class="chzn-select" OnSelectedIndexChanged="ddlvendor_SelectedIndexChanged"></asp:DropDownList>
                
					
				                            </td>
                                        </tr>
                                        <tr>
                                            <td>
					                             Qty.</td>
                                             <td>
					                             Product Code
                   </td>
                                             <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>
                    <asp:TextBox ID="txtqty" runat="server" ></asp:TextBox>
					
				                            </td>
                                             <td>
               
                   <asp:DropDownList ID="ddlpcode" runat="server" class="chzn-select">
                                                                                            </asp:DropDownList>
                  
					
				                            </td>
                                             <td>&nbsp;&nbsp;&nbsp;
					                             
                  
                                		<asp:Button ID="Button1" runat="server" Text="Add" class="btn btn-success btn-sm " OnClick="Button1_Click"   />
					
				                                 &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
<h5 id="h5" runat="server" visible="false">Available Stock: <asp:Label ID="Label3" runat="server" Text="0" Font-Bold="True" ForeColor="Red"></asp:Label></h5>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
					                             
                  
                                		                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"  OnRowCommand="GridView1_RowCommand">
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
                                                                                    <asp:Label ID="Label40" runat="server" Text='<%# Bind("size") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                                 <asp:TemplateField HeaderText="Company Name">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="Label41" runat="server" Text='<%# Bind("c_name") %>'></asp:Label>
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
                                                                                    <asp:LinkButton ID="lnkadd" runat="server" CausesValidation="False" CommandArgument='<%# Eval("qty")%>' CommandName="delete1" Text="Remove"></asp:LinkButton>
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
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;</td>
                                             <td>
                                                 &nbsp;</td>
                                             <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>
					                             Freight&nbsp;
                    <asp:TextBox ID="txtfraight" runat="server" class="form-control input-sm" AutoPostBack="True" OnTextChanged="txtfraight_TextChanged">0</asp:TextBox>
					
				                            </td>
                                             <td>
                                                 &nbsp;</td>
                                             <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>
					                            
                  </td>
                                             <td>
					                          </td>
                                             <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>

                                                 <div class="form-group col-lg-10 " id="Div1" runat="server" visible="false">
                                                      Driver Name
                  <asp:DropDownList ID="ddldrivername" class="form-control " runat="server"  ></asp:DropDownList>
					
				</div>
                                                 </td>
                                             <td>
                                                 <div class="form-group col-lg-10 " id="Div2" runat="server" visible="false">
                                                        Address
					                             &nbsp;<asp:TextBox ID="txtaddress" runat="server" class="form-control input-sm"> </asp:TextBox>
					
				</div>

					
				
                                            
                                            </td>
                                             <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>

                                                 &nbsp;</td>
                                             <td>
                                                 &nbsp;</td>
                                             <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>
                                		<asp:Button ID="btnsubmit" runat="server" Text="Submit" class="btn btn-success btn-sm " OnClick="btnsubmit_Click"  />
                                            </td>
                                             <td>
                                                 <asp:Button ID="btnsubmit0" runat="server" Text="Print" class="btn btn-danger btn-sm " OnClick="btnsubmit0_Click"   />
                     &nbsp;<asp:Button ID="btnsubmit1" runat="server" Text="Print 2" class="btn btn-danger btn-sm " OnClick="btnsubmit1_Click" Visible="False"   />
                                            </td>
                                             <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>
                                            <div class="form-group col-lg-5 " id="dname" runat="server" visible="false">
					                                Dealer&nbsp; Name

                    <asp:TextBox ID="txtvname" runat="server" class="form-control input-sm"  ReadOnly="True"></asp:TextBox>
					
				                                    <asp:Label ID="Label42" runat="server" Text="lblsaleman"></asp:Label>
                                                    <asp:Label ID="Label43" runat="server" Text="lblsalid"></asp:Label>
					
				</div>
                                            </td>
                                             <td>
                                            <div class="form-group col-lg-5 " id="darea" runat="server" visible="false">
					                                Area
                    <asp:TextBox ID="txtarea" runat="server" class="form-control input-sm"  ReadOnly="True"></asp:TextBox>
					
				</div>
                                                 </td>
                                             <td>
                                                                                          <div class="form-group col-lg-1 " id ="div11" runat="server" visible="false">
					                             MRP
                    <asp:TextBox ID="txtmrp" runat="server" class="form-control input-sm" ReadOnly="True" >0</asp:TextBox>
					
				</div>
                     
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                                                                                <div class="form-group col-lg-5 " id="ttlamt" runat="server" visible="false">
					                             Total Amount
                    <asp:TextBox ID="txttotlamt" runat="server" class="form-control input-sm" ReadOnly="True">0</asp:TextBox>
					
				</div>
                                                                     </td>
                                             <td>
                                                                    
                                                                     <div class="form-group col-lg-10 " id="ntamt" runat="server" visible="false">
					                             Net Amount
                    <asp:TextBox ID="txtnetamount" runat="server" class="form-control input-sm" ReadOnly="True">0</asp:TextBox>
					
				</div>
                                                                     </td>
                                             <td>
                                                                     <div class="form-group col-lg-10 " id="amtwrds" runat="server" visible="false">
					                             Amount In words
                    <asp:TextBox ID="txtinwords" runat="server" class="form-control input-sm" ReadOnly="True"></asp:TextBox>
					
				</div>

                                                 </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                &nbsp;</td>
                                             <td>
                                                 &nbsp;</td>
                                             <td>&nbsp;</td>
                                        </tr>
                                    </table>
    </div>
        	
		<%--<script src="js/jquery.min.js" type="text/javascript"></script>--%>
		<script src="js/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript"> $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
    </form>
</body>
</html>
