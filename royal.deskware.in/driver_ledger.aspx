<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="driver_ledger.aspx.cs" Inherits="driver_ledger" EnableEventValidation="false" %>

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
                                Driver Ledger</div>
                            <div class="panel-body">
                                <div class="tab-content">
                                                     <div class="form-group ">
					                               Driver Name
                   <asp:DropDownList ID="ddldriver" runat="server" class="form-control chzn-select">
                                                    </asp:DropDownList>
                                                   <%--<script src="js/jquery.min.js" type="text/javascript"></script>--%>
    <script src="js/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript"> $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
					
				</div>
                                    <div class="col-md-10 table-responsive">
                                        <form>
                                            	
                           
                                       
			
                                        </form>
                                        </div>

                                </div>

                            </div>

                            <div class="panel-footer">
                                		<asp:Button ID="btnsubmit" runat="server" Text="Show" class="btn btn-success btn-sm " OnClick="btnsubmit_Click"  />
                     &nbsp;<asp:Button ID="btnsubmit2" runat="server" Text="Export to Excel" class="btn btn-success btn-sm " OnClick="btnsubmit2_Click"  />
                                        <br />
                                        <br />
                                        <asp:TextBox ID="TextBox1" runat="server" class="date"></asp:TextBox>
                                        <asp:TextBox ID="TextBox2" runat="server" class="date"></asp:TextBox>
                                        <asp:Button ID="btnview3" runat="server" Text="View" class="btn btn-sm btn-warning" OnClick="btnview3_Click"  />
                     </div>
                        </div>

                    </div>

                </div>
             
         </div>
      <div class="row">
                      
                <div id="Div1" class="col-sx-4 table-responsive">
                                        <h3 id="h3" runat="server" visible="false">  Total Debit:<asp:Label ID="Label3" runat="server" Text="Label" Font-Bold="True" ForeColor="Red"></asp:Label>&nbsp;|| Total Credit:<asp:Label ID="Label4" runat="server" Text="Label" Font-Bold="True" ForeColor="Red"></asp:Label>&nbsp;|| Available Balance:<asp:Label ID="Label5" runat="server" Text="Label" Font-Bold="True" ForeColor="Red"></asp:Label></h3>
					                    <br />
             
              
					        <asp:Button ID="Button4" runat="server" class="btn btn-sm btn-danger" Text="Delete" OnClick="Button4_Click" />
                            <asp:TextBox ID="TextBox3" runat="server" placeholder="Admin Password" TextMode="Password"></asp:TextBox>
					                    <br />
					<asp:GridView ID="GridView1" runat="server" CssClass="Grid" AutoGenerateColumns="False" DataKeyNames="id" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound"  >
                                    <Columns>
                                           <asp:TemplateField HeaderText="">
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
                                         <asp:TemplateField HeaderText="ID" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                        <asp:BoundField DataField="date" HeaderText="Date" DataFormatString="{0:dd-MMM-yyyy}" />
                                            <asp:TemplateField HeaderText="Challan No.">
                                           
                                            <ItemTemplate>
                                                   <a href="print_challan.aspx?id=<%# Eval("challan_no") %>" target="_blank" >
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("challan_no") %>'></asp:Label>
                                                       </a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="drivername" HeaderText="Driver Name" />
                                        <asp:TemplateField HeaderText="Debit">

                                            <ItemTemplate>
                                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("debit", "{0:n2}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Credit">
                                          
                                            <ItemTemplate>
                                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("credit", "{0:n2}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Balance">
                                            <ItemTemplate>
                                                <asp:Label ID="lblbal" runat="server" Text="0.00"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="remarks" HeaderText="Remarks" />
                                          <asp:TemplateField HeaderText="Delete">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton5" runat="server" CausesValidation ="false" 
                                        CommandArgument='<%# Eval("id")%>' 
                                        CommandName="del">Delete</asp:LinkButton>
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

