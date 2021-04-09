<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="smtp.aspx.cs" Inherits="smtp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row gutter">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            
            <div class="panel">
                <div class="panel-heading">
                    <h4>Create SMTP</h4>

                </div>
                <div class="panel-body">
                                 <div class="form-group">
                            <div class="row gutter">
                                <div class="col-md-4">
                                    <label class="control-label">SMTP</label>
                                   <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="SMTP"></asp:TextBox>
                                </div>
                                <div class="col-md-4">
                                    <label class="control-label">Email ID</label>
                                   <asp:TextBox ID="TextBox2" runat="server" class="form-control" placeholder="Email ID"></asp:TextBox>
                                </div>
                                <div class="col-md-4">
                                    <label class="control-label">Password</label>
                                   <asp:TextBox ID="TextBox3" runat="server" class="form-control" placeholder="Password"></asp:TextBox>
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
                    <h4>SMTP Details</h4>

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
                                        <asp:TemplateField HeaderText="SMTP">
                                            <ItemTemplate>
                                                <asp:Label ID="Label21" runat="server" Text='<%# Bind("smtp") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Email ID">
                                            <ItemTemplate>
                                                <asp:Label ID="Label212" runat="server" Text='<%# Bind("email") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="PWD">
                                            <ItemTemplate>
                                                <asp:Label ID="Label213" runat="server" Text='<%# Bind("pwd") %>'></asp:Label>
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







