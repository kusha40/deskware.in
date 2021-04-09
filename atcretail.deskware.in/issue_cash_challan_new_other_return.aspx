<%@ Page Language="C#" AutoEventWireup="true" CodeFile="issue_cash_challan_new_other_return.aspx.cs" Inherits="issue_cash_challan_new_other_return" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
    <table cellpadding="0" cellspacing="0" style="border:1px solid black; padding:10px" width="650px">
                                        <tr>
                                            <td>Date
                    </td>
                                             <td colspan="2">Challan No.
                    </td>
                                             <td></td>
                                        </tr>
                                        <tr>
                                            <td>
                    <asp:TextBox ID="txtdate" runat="server" class="date"></asp:TextBox>
					
					
				                            </td>
                                             <td colspan="2">
                    <asp:TextBox ID="txtchallanno" runat="server" ></asp:TextBox>
					
					
				                            </td>
                                             <td><asp:DropDownList ID="ddlprotype" runat="server" Visible="false">
                                                                        <asp:ListItem>Premium</asp:ListItem>
                                                                       <asp:ListItem>Commercial</asp:ListItem>
                                                                       <asp:ListItem>NA</asp:ListItem>
                       </asp:DropDownList>
					
				                            </td>
                                        </tr>
                                        <tr>
                                            <td>

                                                    <asp:Label ID="Label32" runat="server" Text="Label" Visible="False"></asp:Label>

                                            </td>
                                             <td colspan="2">
					                                Company Name
                                                
                         </td>
                                             <td></td>
                                        </tr>
                                        <tr>
                                            <td>

                                                &nbsp;</td>
                                             <td colspan="2">
                                                
                         <asp:DropDownList ID="ddlcompname" runat="server"  >
                                                    </asp:DropDownList>
                                               
					
				                            </td>
                                             <td>
          
                                                 <asp:DropDownList ID="ddlvendor"  runat="server" class="chzn-select" >
                                                        <asp:ListItem Selected="True" Value="99999">Cash</asp:ListItem>
                                                 </asp:DropDownList>
                
					
				                            </td>
                                        </tr>
                                        <tr>
                                            <td>
					                             Qty.</td>
                                             <td colspan="2">
					                             Product Code
                   </td>
                                             <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>
                    <asp:TextBox ID="txtqty" runat="server" Width="60px" ></asp:TextBox>
					
                   <asp:DropDownList ID="ddlsize0" runat="server" >
                                                   
                                                    <asp:ListItem>Box</asp:ListItem>
                                                    <asp:ListItem>Pcs</asp:ListItem>
                                                    </asp:DropDownList>
					
				                            </td>
                                             <td colspan="2">
               
                   <asp:DropDownList ID="ddlpcode" runat="server" class="chzn-select">
                                                                                            </asp:DropDownList>
                  
					
				                            </td>
                                             <td>&nbsp;&nbsp;&nbsp;
					                             
                  
                                		<asp:Button ID="Button1" runat="server" Text="Add" class="btn btn-success btn-sm " OnClick="Button1_Click"   />
					
				                                 &nbsp;</td>
                                        </tr>
                                        <tr id="h52" runat="server" visible="false">
                                            <td colspan="4">
<h5 id="h5" runat="server" visible="false">Available Stock: <asp:Label ID="Label3" runat="server" Text="0" Font-Bold="True" ForeColor="Red"></asp:Label></h5>

                   <asp:DropDownList ID="ddlsize" runat="server"  >
                                                   
                                                  
                                                    </asp:DropDownList>
					
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
					                             
                  
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
                                                                            <asp:TemplateField HeaderText="Size" Visible="False">
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
                                                                                  <asp:TemplateField HeaderText="Product Grade" Visible="False">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="Label39" runat="server" Text='<%# Bind("p_grade") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Rate">
                                                                                <ItemTemplate>

                                                                                   <asp:TextBox ID="Label5" runat="server" Width="60" AutoPostBack="true" OnTextChanged="txtmrp_TextChanged" Text='<%# Bind("rate", "{0:n2}") %>'></asp:TextBox>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Amount">
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
                                            <td colspan="2">
                                                                     
					                             &nbsp;</td>
                                            <td>
                                                                     
					                             &nbsp;</td>
                                            <td>
                                                                     
					                             &nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                                     
					                             &nbsp;</td>
                                            <td>
                                                                     
					                             Total Amount</td>
                                            <td>
                                                                     
			
                    <asp:TextBox ID="txttotlamt" runat="server" class="form-control input-sm" ReadOnly="True">0</asp:TextBox>
					
				                            </td>
                                        </tr>
                                        <tr>
                                            <td>
					                             &nbsp;
					
				                                 Address<br />
                                                 <asp:TextBox ID="txtaddress" runat="server" class="form-control input-sm"> </asp:TextBox>
					
				                            </td>
                                             <td colspan="2">
                                                 Freight</td>
                                             <td><asp:TextBox ID="txtfraight" runat="server" class="form-control input-sm" AutoPostBack="True" OnTextChanged="txtfraight_TextChanged">0</asp:TextBox>
					
				                            </td>
                                        </tr>
                                        <tr>
                                            <td>
					                            
                                                Phone No<br />
                                                <asp:TextBox ID="txtmob" runat="server" class="form-control input-sm"> </asp:TextBox>
					
                  </td>
                                             <td colspan="2">
					                             Labour</td>
                                             <td><asp:TextBox ID="txtlabour" runat="server" class="form-control input-sm" AutoPostBack="True" OnTextChanged="txtlabour_TextChanged">0</asp:TextBox>
					
				                            </td>
                                        </tr>
                                        <tr>
                                            <td>
					                            
                                                Remarks<br />
                                                <asp:TextBox ID="txtremarks" runat="server" class="form-control input-sm" TextMode="MultiLine"> </asp:TextBox>
					
                  </td>
                                             <td colspan="2">
					                             Net Amount
                                              </td>
                                             <td>
                    <asp:TextBox ID="txtnetamount" runat="server" class="form-control input-sm" ReadOnly="True">0</asp:TextBox>
					
				                            </td>
                                        </tr>
                                        <tr>
                                            <td>
					                            
                                                &nbsp;</td>
                                             <td colspan="2">
					                             Paid</td>
                                             <td>
                    <asp:TextBox ID="txtpaid" runat="server" class="form-control input-sm" AutoPostBack="true" OnTextChanged="txtpaid_TextChanged">0</asp:TextBox>
					
				                            </td>
                                        </tr>
                                        <tr>
                                            <td>
					                            
                                                &nbsp;</td>
                                             <td colspan="2">
					                             Balance</td>
                                             <td>
                    <asp:TextBox ID="txtbalance" runat="server" class="form-control input-sm" ReadOnly="True">0</asp:TextBox>
					
				                            </td>
                                        </tr>
                                        <tr>
                                            <td>

                                                 &nbsp;</td>
                                             <td colspan="2">
                                                 <div class="form-group col-lg-10 " id="Div2" runat="server" visible="false">
                                                        &nbsp;&nbsp;</div>

					
				
                                            
                                            </td>
                                             <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>

                                                 &nbsp;</td>
                                             <td colspan="2">
                                                 &nbsp;</td>
                                             <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td>
                                		<asp:Button ID="btnsubmit" runat="server" Text="Submit" class="btn btn-success btn-sm " OnClick="btnsubmit_Click"  />
                                            </td>
                                             <td colspan="2">
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
                                             <td colspan="2">
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

                                                 <div class="form-group col-lg-10 " id="Div1" runat="server" visible="false">
                                                      Driver Name
                  <asp:DropDownList ID="ddldrivername" class="form-control " runat="server"  ></asp:DropDownList>
					
				</div>
                                                 </td>
                                             <td colspan="2">
                                                                    
                                                                     <div class="form-group col-lg-10 " id="ntamt" runat="server" visible="false">
					
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
                                             <td colspan="2">
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
