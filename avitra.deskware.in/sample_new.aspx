<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="sample_new.aspx.cs" Inherits="sample_new" %>

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
                                Sample Products</div>
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
                                  <div class="form-group ">
                                                                   <div class="col-md-7 ">
					                                Dealer Name
                   <asp:DropDownList ID="ddldealer" runat="server" class="form-control chzn-select">
                                                    </asp:DropDownList>
    <script src="js/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript"> $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
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
                   
              					<asp:GridView ID="GridView1" runat="server" CssClass="Grid" Width="300px" AutoGenerateColumns="False" OnPreRender="GridView1_PreRender" OnRowDataBound="GridView1_RowDataBound"  >
                                    <Columns>
                                      <asp:TemplateField HeaderText="Sr No.">
                            <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
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
                                         <asp:TemplateField  >

                            <HeaderTemplate>
                                <asp:CheckBox ID="chkAll2" runat="server" AutoPostBack="true"  OnCheckedChanged="ChkAllRows2" Text="Dispatch Check"  />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkAll02" runat="server"  />
                            </ItemTemplate>
                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Product Code">
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("p_code") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Avg.Sample Qty">
                                            <ItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Width="30px" Enabled="false" Text='<%# Bind("sqty") %>' ></asp:TextBox> 
                                            </ItemTemplate>
                                        </asp:TemplateField>

                                           <asp:TemplateField HeaderText="">

                            <HeaderTemplate>
                                <asp:CheckBox ID="chkAll" runat="server" AutoPostBack="true" OnCheckedChanged="ChkAllRows" Text="" Visible="false" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkAll0" runat="server" Width="30px" />
                                    <asp:Label ID="Label4" runat="server" Visible="false" ></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkAll01" runat="server" Width="30px" />
                                  <asp:Label ID="Label41" runat="server" Visible="false" ></asp:Label>
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
                                <asp:TextBox ID="txtdate" runat="server" class="date"></asp:TextBox>  
                          <asp:Button ID="Button1" runat="server" Text="Update" class="btn btn-sm btn-danger" OnClick="Button1_Click"  />
                     </div>
</asp:Content>

