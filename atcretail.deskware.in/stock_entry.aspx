<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="stock_entry.aspx.cs" Inherits="stock_entry" MaintainScrollPositionOnPostback="true" %>

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
                                Stock Master</div>
                            <div class="panel-body">
                     <div class="row">

                    <div id="div2" runat="server" visible="true">
                                                                                                   <div class="form-group col-lg-3">
					                            From
&nbsp;<asp:TextBox ID="txtfrom" runat="server" class="form-control date input-sm"></asp:TextBox>
					
				</div>
                                                                                                        <div class="form-group col-lg-3">
					                            To
&nbsp;<asp:TextBox ID="txtto" runat="server" class="form-control date input-sm"></asp:TextBox>
					
				</div>
                                                                                                           <div class="form-group col-lg-3">
					                             
<asp:Button ID="btn1" runat="server" Text="View Datewise" class="btn btn-sm btn-danger" OnClick="btn1_Click" />
					
				</div>


                    </div></div> 
                            </div>

                                <div class="panel-footer">
                          &nbsp;&nbsp;</div>
                        </div>

                    </div>

                </div>
             
         </div>
       
          <br /> 
                <div id="Div1" class="col-sx-4 table-responsive">
                    <h3>Total No. of QTY.:<asp:Label ID="Label4" runat="server" Font-Bold="True" ForeColor="Red" Text="0"></asp:Label>
                    </h3>
			<asp:GridView ID="GridView1" runat="server" CssClass="Grid" AutoGenerateColumns="False"  DataKeyNames="stock_id" >
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
			 </div>
    </asp:Content>

