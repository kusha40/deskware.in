<%@ Page Language="C#" AutoEventWireup="true" CodeFile="issue_comp_return_inventry_other.aspx.cs" Inherits="issue_comp_return_inventry_other" %>

<!DOCTYPE html>

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
		
	    .auto-style1 {
            height: 42px;
        }
		
	    #darea {
            height: 26px;
            width: 162px;
        }
		
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
                                             <td>Company Name
                                                
                         </td>
                                        </tr>
                                        <tr>
                                            <td class="auto-style1">
                    <asp:TextBox ID="txtdate" runat="server" class="date"></asp:TextBox>
					
					
				                            </td>
                                             <td colspan="2" class="auto-style1">
                    <asp:TextBox ID="txtchallanno" runat="server" ></asp:TextBox>
					
					
				                            </td>
                                             <td class="auto-style1">
					
                         <asp:DropDownList ID="ddlcompname" runat="server"  >
                                                    </asp:DropDownList>
                                               
					
				                            </td>
                                        </tr>
                                        <tr>
                                            <td>
					                                &nbsp;</td>
                                             <td colspan="2">
					                             Qty.</td>
                                             <td>Product Code
                   </td>
                                        </tr>
                                        <tr>
                                            <td >

                                                &nbsp;</td>
                                             <td colspan="2">
                                                
                    <asp:TextBox ID="txtqty" runat="server" Width="60px" ></asp:TextBox>
					
                   <asp:DropDownList ID="ddlsize0" runat="server" >
                                                   
                                                    <asp:ListItem>Box</asp:ListItem>
                                                    <asp:ListItem>Pcs</asp:ListItem>
                                                    </asp:DropDownList>
					
					
				                            </td>
                                             <td>
          
                   <asp:DropDownList ID="ddlpcode" runat="server" class="chzn-select">
                                                                                            </asp:DropDownList>
                  
					
				                            &nbsp;&nbsp;&nbsp;
					                             
                  
                                		<asp:Button ID="Button1" runat="server" Text="Add" class="btn btn-success btn-sm " OnClick="Button1_Click"   />
					
				                                 </td>
                                        </tr>
                                        <tr id="tr1" runat="server" visible="false">
                                            <td colspan="4">

                   <asp:DropDownList ID="ddlsize" runat="server"  >
                                                   
                                                  
                                                    </asp:DropDownList>
					
					                                Size

                                                    <asp:Label ID="Label32" runat="server" Text="Label" Visible="False"></asp:Label>

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
                                                                     
                    <asp:TextBox ID="txtmrp" runat="server" Width="60px" Visible="false" ></asp:TextBox>
					
                                                    <asp:Label ID="Label3" runat="server" Text="Label" Visible="False"></asp:Label>

                                            </td>
                                            <td>
                                                                     
					                             Total Amount</td>
                                            <td>
                                                                     
			
                    <asp:TextBox ID="txttotlamt" runat="server" class="form-control input-sm" ReadOnly="True">0</asp:TextBox>
					
				                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                		<asp:Button ID="btnsubmit" runat="server" Text="Submit" class="btn btn-success btn-sm " OnClick="btnsubmit_Click"  />
                                            </td>
                                             <td colspan="2">
                                                 <asp:Label ID="Label8" runat="server" visible="false" Text="0"></asp:Label>
                                                 </td>
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

