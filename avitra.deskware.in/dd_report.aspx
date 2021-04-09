<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="dd_report.aspx.cs" Inherits="dd_report" EnableEventValidation="false" %>

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
                                        </form>
                                        </div>

                                </div>
                     
                            </div>
                            
                                <div class="panel-footer">
                          <asp:Button ID="btnview" runat="server" Text="View" class="btn btn-sm btn-danger" OnClick="btnview_Click"   />
                     &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btnsubmit2" runat="server" Text="Export to Excel" class="btn btn-success btn-sm " OnClick="btnsubmit2_Click"  />
                     </div>
                        </div>

                    </div>

                </div>
             
         </div>
      <div class="row">
                      
                <div id="Div1" class="col-sx-4 table-responsive">
					<asp:GridView ID="GridView1" runat="server" CssClass="Grid" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound"  >
                                    <Columns>
                                      <asp:TemplateField HeaderText="Sr No.">
                            <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="C.Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblcname" runat="server" Text='<%# Bind("c_name") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Product Code">
                                            <ItemTemplate>
                                                <asp:Label ID="lblpcode" runat="server" Text='<%# Bind("p_code") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Size">
                                            <ItemTemplate>
                                                <asp:Label ID="lblsize" runat="server" Text='<%# Bind("size") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Qty">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("qty") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Qty/Month Diff.">
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" ></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Avg. Qty">
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" ></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Final Qty">
                                            <ItemTemplate>
                                                <asp:Label ID="Label4" runat="server" ></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
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

