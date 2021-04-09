<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="update_sample_qty.aspx.cs" Inherits="update_sample_qty" %>

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
                             Update Sample Qty</div>
                            <div class="panel-body">
                                <div class="tab-content">
                                     <div class="form-group ">
                                    <div class="col-md-3 table-responsive">
					                            Size
                    <asp:DropDownList ID="ddlcompname" runat="server" class="form-control" >
                        <asp:ListItem>12x18</asp:ListItem>
                                                    <asp:ListItem>12x24</asp:ListItem>
                                                    <asp:ListItem>2x2</asp:ListItem>
                                                    <asp:ListItem>2x4</asp:ListItem>
                                                    <asp:ListItem>32x32</asp:ListItem>
                         <asp:ListItem>15x24</asp:ListItem>
                                                    </asp:DropDownList>
				</div>
                                         </div>
                           
                          
                                    </div>
                            
                                </div>
                                               <div class="panel-footer">
                          <asp:Button ID="btnview" runat="server" Text="View Product" class="btn btn-sm btn-danger" OnClick="btnview_Click"  />
                     </div>

                    </div>

                </div>
             
         </div>
                        </div>
      <div class="row">
                   
                <div id="Div1" class="col-sx-4 table-responsive">
                   
              					<asp:GridView ID="GridView1" runat="server" CssClass="Grid" Width="300px" AutoGenerateColumns="False"  >
                                    <Columns>
                                      <asp:TemplateField HeaderText="Sr No.">
                            <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
                                  <asp:Label ID="Label11" runat="server" Text='<%# Bind("id") %>' Visible="false"></asp:Label>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Size" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("size") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Company Name" >
                                            
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("c_name") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Product Code">
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("p_code") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="">

                            <HeaderTemplate>
                                <asp:CheckBox ID="chkAll" runat="server" AutoPostBack="true" OnCheckedChanged="ChkAllRows" Text="" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkAll0" runat="server" Width="30px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Qty">
                                            <ItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Width="50px" Text="1" ></asp:TextBox> 
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
                          <div class="panel-footer">
                          <asp:Button ID="Button1" runat="server" Text="Update" class="btn btn-sm btn-danger" OnClick="Button1_Click"  />
                     </div>
</asp:Content>



