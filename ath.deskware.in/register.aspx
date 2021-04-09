<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="register.aspx.cs" Inherits="register" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
          <div class="row">
                <div class="col-md-10">
                    <div class="padding-md">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                Create User   
                            </div>
                            <div class="panel-body">
                                <div class="tab-content">
                                    <div class="col-md-10 table-responsive">
                                        <form>
				<div class="form-group col-lg-12">
					<label>Name</label>
                    <asp:TextBox ID="txtname" class="form-control" runat="server"></asp:TextBox>
				</div>
				
				<div class="form-group col-lg-12">
					<label>User ID</label>
					   <asp:TextBox ID="txtuserid" class="form-control" runat="server"></asp:TextBox>
				</div>
				
				<div class="form-group col-lg-12">
					<label>Password</label>
					   <asp:TextBox ID="txtpassword" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
				</div>
								
				<div class="form-group col-lg-12">
					<label>Contact No.</label>
				   <asp:TextBox ID="txtcontact" class="form-control" runat="server"></asp:TextBox>
				</div>
				
				<div class="form-group col-lg-12">
					<label>Email Address</label>
				   <asp:TextBox ID="txtemail" class="form-control" runat="server"></asp:TextBox>
				</div>	
                	<div class="form-group col-lg-12">
					<label>User Type</label>
                        <asp:DropDownList ID="ddltype" class="form-control" runat="server">
                            <asp:ListItem>Administrator</asp:ListItem>
                            <%--<asp:ListItem>Manager</asp:ListItem>--%>
                            <asp:ListItem>Executive</asp:ListItem>
                            <asp:ListItem>Salesman</asp:ListItem>
                        </asp:DropDownList>
				</div>	
                                            <div class="form-group col-lg-12" id="div3" runat="server" visible="false">
					<label>Operation</label>
                        <asp:DropDownList ID="ddloperation" class="form-control" runat="server">
                             <asp:ListItem>Marketing</asp:ListItem>
                            <asp:ListItem>Sales</asp:ListItem>
                            <asp:ListItem>NA</asp:ListItem>
                        </asp:DropDownList>
				</div>
                                            </form>
                                        </div></div>
                                </div>
                               <div class="panel-footer">
                                    <asp:Button ID="btnRegistration" runat="server" Text="Registration" class="btn btn-success btn-sm  " OnClick="btnRegistration_Click"  />	
                	<asp:Button ID="btnview" runat="server" Text="View All" class="btn btn-sm  btn-danger" OnClick="btnview_Click" />		
					 	</div></div>
			</div>
		</div>
</div>
     <div class="row">
                      
                <div id="Div1" class="col-sx-4 table-responsive">
					<asp:GridView ID="GridView1" runat="server" CssClass="Grid" AutoGenerateColumns="False" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" DataKeyNames="user_id" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging">
                                    <Columns>
                                      <asp:TemplateField HeaderText="Sr No.">
                            <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="User ID">
                                            <ItemTemplate>
                                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("user_id") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Name">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Contact No.">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("contact_no") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("contact_no") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Email ID">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("email_id") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("email_id") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Password">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("password") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("password") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="User Type">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("type") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("type") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                              <asp:TemplateField HeaderText="Operation" Visible="False">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox51" runat="server" Text='<%# Bind("operation") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label51" runat="server" Text='<%# Bind("operation") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Status">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("status") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("status") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                          <asp:CommandField ShowEditButton="True"  />
                                        <asp:CommandField ShowDeleteButton="True" />
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

