<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="sample_report.aspx.cs" Inherits="sample_report" EnableEventValidation="false" %>

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
     <%--<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>--%>
<%--<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.0.3/js/bootstrap.min.js"></script>--%>
<link href="https://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/css/bootstrap-multiselect.css" rel="stylesheet" type="text/css" />
<script src="https://cdn.rawgit.com/davidstutz/bootstrap-multiselect/master/dist/js/bootstrap-multiselect.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        $('[id*=DropDownList1]').multiselect({
            //includeSelectAllOption: true
        });
    });
</script>
    <link href="Content/chosen.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="row">
                <div class="col-md-10">
                    <div class="padding-md">&nbsp;<div class="panel panel-info">
                            <div class="panel-heading">
                                Sample Report</div>
                            <div class="panel-body">
                                <div class="tab-content">
                                                     <div class="form-group ">
					                                Dealer Name
                   <asp:DropDownList ID="ddldealer" runat="server" class="form-control chzn-select">
                                                    </asp:DropDownList>
                                              
					   <%--<script src="js/jquery.min.js" type="text/javascript"></script>--%>
    <script src="js/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript"> $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
				</div>

                                </div>

                            </div>

                            <div class="panel-footer">
                                        <asp:TextBox ID="TextBox1" runat="server" class="date"></asp:TextBox>
                                        <asp:TextBox ID="TextBox2" runat="server" class="date"></asp:TextBox>
                                        &nbsp;<asp:Button ID="btnview3" runat="server" Text="View" class="btn btn-sm btn-warning" OnClick="btnview3_Click"  />
                     &nbsp;<asp:Button ID="btnview4" runat="server" Text="View Sent Sample Report" class="btn btn-sm btn-warning" OnClick="btnview4_Click"  />
                     &nbsp;<asp:Button ID="btnview5" runat="server" Text="View Dealerwise Sample Report" class="btn btn-sm btn-warning" OnClick="btnview5_Click"  />
                     &nbsp;
                                        <br />
                                        <br />    <asp:DropDownList ID="ddlcompname" runat="server"  AutoPostBack="True" OnSelectedIndexChanged="ddlcompname_SelectedIndexChanged" >
                        <asp:ListItem>12x18</asp:ListItem>
                                                    <asp:ListItem>12x24</asp:ListItem>
                                                    <asp:ListItem>2x2</asp:ListItem>
                                                    <asp:ListItem>2x4</asp:ListItem>
                                                    <asp:ListItem>32x32</asp:ListItem>
                         <asp:ListItem>15x24</asp:ListItem>
                                                    </asp:DropDownList>
                                        <asp:ListBox ID="DropDownList1"  runat="server" SelectionMode="Multiple">
                                        </asp:ListBox>
&nbsp;<asp:Button ID="btnview6" runat="server" Text="View Product wise" class="btn btn-sm btn-warning" OnClick="btnview6_Click"  />
                     </div>
                        </div>

                    </div>

                </div>
             
         </div>
    <div class="row">
                   
                <div id="Div1" class="col-sx-4 table-responsive">
                   <h5>All Product</h5>
              					<asp:GridView ID="GridView1" runat="server" CssClass="Grid"  AutoGenerateColumns="False" OnPreRender="GridView1_PreRender"  >
                                    <Columns>
                                      <asp:TemplateField HeaderText="Sr No.">
                            <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Size" >
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("size") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Company Name" >
                                            
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("cname") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Product Code">
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("pcode") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Avg. Sample Qty.">
                                             <ItemTemplate>
                                                 <asp:Label ID="Label6" runat="server" Text='<%# Bind("qty") %>'></asp:Label>
                                             </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Sent Qty">
                                            <ItemTemplate>
                                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("sentqty") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="">

                         
                            <ItemTemplate>
                                <asp:CheckBox ID="chkAll0" runat="server" Width="30px" Visible="false" />
                                    <asp:Label ID="Label4" runat="server" Visible="false" Text='<%# Bind("sts") %>' ></asp:Label>
                            </ItemTemplate>
                                            <ItemStyle Width="30px" />
                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkAll01" runat="server" Width="30px" Visible="false" />
                                  <asp:Label ID="Label41" runat="server" Visible="false" Text='<%# Bind("sts2") %>' ></asp:Label>
                            </ItemTemplate>
                                            <ItemStyle Width="30px" />
                        </asp:TemplateField>
                                         <asp:BoundField DataField="dealer_name"  HeaderText="Dealer Name" />
                                                                         <asp:BoundField DataField="created_by" HeaderText="Created By" />
                                          <asp:BoundField DataField="date" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Date" />
                                         <asp:TemplateField HeaderText="">
                                             <ItemTemplate>
                                                 <table>
                                                     <tr>
                                                         <td>
               <a href="view_sample.aspx?dt=<%# Eval("date", "{0:MM/dd/yyyy}") %>&did=<%# Eval("dealer_name") %>" target="_blank"><%# Eval("date", "{0:dd-MMM-yyyy}") %></a>
                                                         </td>
                                                         <td>
<a href="view_checked_sample.aspx?dt=<%# Eval("date", "{0:MM/dd/yyyy}") %>&did=<%# Eval("dealer_name") %>" target="_blank">Checked</a>
                                                         </td>
                                                         <td>
<a href="view_unchecked_sample.aspx?dt=<%# Eval("date", "{0:MM/dd/yyyy}") %>&did=<%# Eval("dealer_name") %>" target="_blank">Unchecked</a>
                                                         </td>
                                                     </tr>
                                                 </table>
                                                <%-- <asp:Label ID="Label7" runat="server" Text='<%# Bind("date", "{0:dd-MMM-yyyy}") %>'></asp:Label>--%>
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
			                    <br />
                                
			 </div></div>
    <div id="div1" runat="server">


    <asp:Button ID="btnsubmit3" runat="server" Text="Export to Excel Checked" class="btn btn-success btn-sm " OnClick="btnsubmit3_Click"  />
     <div class="row">
                   
                <div id="Div2" class="col-sx-4 table-responsive">
                     <h5>Checked Product</h5>
              					<asp:GridView ID="GridView2" runat="server" CssClass="Grid"  AutoGenerateColumns="False" OnPreRender="GridView2_PreRender"  >
                                    <Columns>
                                      <asp:TemplateField HeaderText="Sr No.">
                            <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Size" >
                                            <ItemTemplate>
                                                <asp:Label ID="Label11" runat="server" Text='<%# Bind("size") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Company Name" >
                                            
                                            <ItemTemplate>
                                                <asp:Label ID="Label21" runat="server" Text='<%# Bind("cname") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Product Code">
                                            <ItemTemplate>
                                                <asp:Label ID="Label31" runat="server" Text='<%# Bind("pcode") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Avg. Sample Qty.">
                                             <ItemTemplate>
                                                 <asp:Label ID="Label61" runat="server" Text='<%# Bind("qty") %>'></asp:Label>
                                             </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Sent Qty">
                                            <ItemTemplate>
                                                <asp:Label ID="Label51" runat="server" Text='<%# Bind("sentqty") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="">

                         
                            <ItemTemplate>
                                <asp:CheckBox ID="chkAll01" runat="server" Width="30px" Visible="false" />
                                    <asp:Label ID="Label41" runat="server" Visible="false" Text='<%# Bind("sts") %>' ></asp:Label>
                            </ItemTemplate>
                                            <ItemStyle Width="30px" />
                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkAll011" runat="server" Width="30px" Visible="false" />
                                  <asp:Label ID="Label411" runat="server" Visible="false" Text='<%# Bind("sts2") %>' ></asp:Label>
                            </ItemTemplate>
                                            <ItemStyle Width="30px" />
                        </asp:TemplateField>
                                         <asp:BoundField DataField="dealer_name"  HeaderText="Dealer Name" />
                                                                         <asp:BoundField DataField="created_by" HeaderText="Created By" />
                                         <asp:BoundField DataField="date" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Date" />
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
     <asp:Button ID="Button1" runat="server" Text="Export to Excel UnChecked" class="btn btn-success btn-sm " OnClick="Button1_Click"  />
     <div class="row">
                   
                <div id="Div3" class="col-sx-4 table-responsive">
                      <h5>UnChecked Product</h5>
              					<asp:GridView ID="GridView3" runat="server" CssClass="Grid"  AutoGenerateColumns="False" OnPreRender="GridView3_PreRender"  >
                                    <Columns>
                                      <asp:TemplateField HeaderText="Sr No.">
                            <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Size" >
                                            <ItemTemplate>
                                                <asp:Label ID="Label111" runat="server" Text='<%# Bind("size") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Company Name" >
                                            
                                            <ItemTemplate>
                                                <asp:Label ID="Label211" runat="server" Text='<%# Bind("cname") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Product Code">
                                            <ItemTemplate>
                                                <asp:Label ID="Label311" runat="server" Text='<%# Bind("pcode") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Avg. Sample Qty.">
                                             <ItemTemplate>
                                                 <asp:Label ID="Label611" runat="server" Text='<%# Bind("qty") %>'></asp:Label>
                                             </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Sent Qty">
                                            <ItemTemplate>
                                                <asp:Label ID="Label511" runat="server" Text='<%# Bind("sentqty") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="">

                         
                            <ItemTemplate>
                                <asp:CheckBox ID="chkAll011" runat="server" Width="30px" Visible="false" />
                                    <asp:Label ID="Label411" runat="server" Visible="false" Text='<%# Bind("sts") %>' ></asp:Label>
                            </ItemTemplate>
                                            <ItemStyle Width="30px" />
                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkAll0111" runat="server" Width="30px" Visible="false" />
                                  <asp:Label ID="Label4111" runat="server" Visible="false" Text='<%# Bind("sts2") %>' ></asp:Label>
                            </ItemTemplate>
                                            <ItemStyle Width="30px" />
                        </asp:TemplateField>
                                         <asp:BoundField DataField="dealer_name"  HeaderText="Dealer Name" />
                                                                         <asp:BoundField DataField="created_by" HeaderText="Created By" />
                                         <asp:BoundField DataField="date" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Date" />
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
            </div>
</asp:Content>

