<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="payment_terms.aspx.cs" Inherits="payment_terms" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="row gutter">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            
            <div class="panel">
                <div class="panel-heading">
                    <h4>Create Payment Terms</h4>

                </div>
                <div class="panel-body">
                     <div class="form-group">
                            <div class="row gutter">
                                <div class="col-md-4">
                                    <label class="control-label">Product Name</label>
                                    <asp:DropDownList ID="DropDownList1" class="form-control"  runat="server"></asp:DropDownList>
                                </div>
                                </div></div>
                                 <div class="form-group">
                            <div class="row gutter">
                                <div class="col-md-3">
                                    <label class="control-label">Due on Purchase/ Sales Order</label>
                                   <asp:TextBox ID="TextBox1" runat="server" class="form-control" ></asp:TextBox>
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label">Due on Completion of Structure</label>
                                   <asp:TextBox ID="TextBox2" runat="server" class="form-control" ></asp:TextBox>
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label">Due against Delivery of Material </label>
                                   <asp:TextBox ID="TextBox3" runat="server" class="form-control" ></asp:TextBox>
                                </div>
                                 <div class="col-md-3">
                                    <label class="control-label">Due after testing commissioning&handing over</label>
                                   <asp:TextBox ID="TextBox4" runat="server" class="form-control" ></asp:TextBox>
                                </div>
                            </div>
                                   
                        </div>
                   
                    </div>
                   
                </div>
               <asp:Button ID="Button1" runat="server" Text="Submit" class="btn btn-info" OnClick="Button1_Click" />

             <asp:Button ID="Button2" runat="server" Text="Reset" class="btn btn-default" OnClick="Button2_Click" CausesValidation="false" />

            <asp:Button ID="Button3" runat="server" Text="View All" class="btn btn-danger" OnClick="Button3_Click" CausesValidation="false" />
            <br />
            <br />
         </div>
            </div>
      <div class="row gutter">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="panel panel-blue"><div class="panel-heading">
                    <h4>Payment Details</h4>

                                              </div>
                    <div class="panel-body">
                        <div class="table-responsive">
					<asp:GridView ID="GridView1" runat="server" class="table table-striped table-bordered no-margin" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting" DataKeyNames="id">
                                    <Columns>
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
                                        <asp:TemplateField HeaderText="Product">
                                            <ItemTemplate>
                                                <asp:Label ID="Label2403" runat="server" Text='<%# Bind("pname") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Due on Purchase/ Sales Order">
                                            <ItemTemplate>
                                                <asp:Label ID="Label21" runat="server" Text='<%# Bind("p1") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Due on Completion of Structure">
                                            <ItemTemplate>
                                                <asp:Label ID="Label212" runat="server" Text='<%# Bind("p2") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Due against Delivery of Material">
                                            <ItemTemplate>
                                                <asp:Label ID="Label213" runat="server" Text='<%# Bind("p3") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Due after testing commissioning & handing over">
                                            <ItemTemplate>
                                                <asp:Label ID="Label2413" runat="server" Text='<%# Bind("p4") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:CommandField ShowDeleteButton="True" >
                                        <ControlStyle ForeColor="Red" />
                                        </asp:CommandField>
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
                        </div></div></div>
        </div>
</asp:Content>

