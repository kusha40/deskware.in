<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="challan_view.aspx.cs" Inherits="challan_view" %>

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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <h5>Challan View</h5> 
    <div class="row">
                    
                <div id="Div1" class="col-sx-4 table-responsive">
					<asp:GridView ID="GridView2" runat="server" CssClass="Grid" AutoGenerateColumns="False" DataKeyNames="id" Visible="False" >
                                    <Columns>
                                      <asp:TemplateField HeaderText="Sr No.">
                            <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="ID" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="QTY">
                                            <ItemTemplate>
                                                <asp:Label ID="lblqty" runat="server" Text='<%# Bind("qty") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:BoundField DataField="unit" HeaderText="Unit" />
                                        <asp:TemplateField HeaderText="Size">
                                            <ItemTemplate>
                                                <asp:Label ID="lblsize" runat="server" Text='<%# Bind("size") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="CN">
                                            <ItemTemplate>
                                                <asp:Label ID="lblc_name" runat="server" Text='<%# Bind("c_name") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="PC">
                                            <ItemTemplate>
                                                <asp:Label ID="lblp_code" runat="server" Text='<%# Bind("p_code") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="PG">
                                            <ItemTemplate>
                                                <asp:Label ID="lblp_grade" runat="server" Text='<%# Bind("p_grade") %>'></asp:Label>
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
                    <asp:Label ID="Label41" runat="server" Text="Label" Visible="false"></asp:Label>
                     <asp:Label ID="Label51" runat="server" Text="Label" Visible="false"></asp:Label>
                                		&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                		<asp:Button ID="btnsubmit" runat="server" Text="Cancel" class="btn btn-success btn-sm " OnClick="btnsubmit_Click" Visible="False"  />
					<br />
                      <div class="form-group col-md-2 ">
                  <asp:DropDownList ID="ddluser" class="form-control " runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddluser_SelectedIndexChanged"  ></asp:DropDownList>
                          </div>
                     <div class="form-group col-md-2 ">From
                   <asp:TextBox ID="txtfrom" runat="server" class="form-control input-sm date"></asp:TextBox>
                          </div>
                     <div class="form-group col-md-2 ">To
                     <asp:TextBox ID="txtto" runat="server" class="form-control input-sm date"></asp:TextBox>
                          </div>
                    <div class="form-group col-md-2 ">
                  <asp:Button ID="Button2" runat="server" Text="View" class="btn btn-success btn-sm " OnClick="Button2_Click"   />
                          </div>
                     <div class="form-group col-md-2 ">
                  <asp:Button ID="Button1" runat="server" Text="Today" class="btn btn-success btn-sm " OnClick="Button1_Click"   />
                          </div>
					      <div class="form-group col-md-8 ">
                Dealer Name
                   <asp:DropDownList ID="ddldealer" runat="server" class="form-control chzn-select" AutoPostBack="True" OnSelectedIndexChanged="ddldealer_SelectedIndexChanged" >
                                                    </asp:DropDownList>
          <%-- <script src="js/jquery.min.js" type="text/javascript"></script>--%>
    <script src="js/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript"> $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
                          </div>
                      <div class="form-group col-md-2 ">
                  <asp:Button ID="Button3" runat="server" Text="Dealer Datewise" class="btn btn-success btn-sm " OnClick="Button3_Click"    />
                          </div>
					<asp:GridView ID="GridView1" runat="server" CssClass="Grid" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="20" OnRowDeleting="GridView1_RowDeleting" DataKeyNames="challan_no" OnRowCommand="GridView1_RowCommand"  >
                                    <Columns>
                                                <asp:TemplateField HeaderText="" Visible="False">
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
                                        <asp:BoundField DataField="date" HeaderText="Date" DataFormatString="{0:dd-MMM-yyyy}" />
                                         <asp:TemplateField HeaderText="ID" Visible="false">
                            <ItemTemplate>
                                <%--<asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>--%>
                            </ItemTemplate>
                        </asp:TemplateField>
                                                <asp:TemplateField HeaderText="Challan No.">
                                                  
                                                    <ItemTemplate>
                                                        <asp:Label ID="lblchallanno" runat="server" Text='<%# Bind("challan_no") %>'></asp:Label>
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                        <asp:BoundField DataField="dealer_name" HeaderText="Dealer Name" />
<asp:BoundField DataField="dealer_area" HeaderText="Area"></asp:BoundField>
                                        <asp:BoundField DataField="created_by"  HeaderText="Created By" />
                                         <asp:TemplateField HeaderText="Type">
                                             <ItemTemplate>
                                                 <asp:Label ID="lbltype" runat="server" Text='<%# Bind("type") %>'></asp:Label>
                                             </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Status">
                                            <ItemTemplate>
                                                <asp:Label ID="lblsts" runat="server" Text='<%# Bind("status") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="">
                                           
                                             <ItemTemplate>
                                                  <a href="csp.aspx?id=<%# Eval("challan_no") %>&val=<%# Eval("created_by") %>&val1=<%# Eval("type")%>" target="_blank" >
                                                 <asp:Label ID="Label1" runat="server" Text='Print1'></asp:Label>
                                                      </a>
                                             </ItemTemplate>
                                        </asp:TemplateField>
                                             <asp:TemplateField HeaderText="">
                                           
                                             <ItemTemplate>
                                                  <a href="csp1.aspx?id=<%# Eval("challan_no") %>&val=<%# Eval("created_by") %>&val1=<%# Eval("type")%>" target="_blank" >
                                                 <asp:Label ID="Label2" runat="server" Text='Print2'></asp:Label>
                                                      </a>
                                             </ItemTemplate>
                                        </asp:TemplateField>
                                       
                                            <asp:CommandField ShowDeleteButton="True" DeleteText="Cancel" Visible="true" />
                                        <asp:TemplateField >
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton2" OnClientClick="return confirm('Are you sure to delete?')" CommandArgument='<%# Eval("challan_no")%>' 
                                        CommandName="del" runat="server" CausesValidation ="false" >Delete</asp:LinkButton>                                                       
                                </ItemTemplate></asp:TemplateField>

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

