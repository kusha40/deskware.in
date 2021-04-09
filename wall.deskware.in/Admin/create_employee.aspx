<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/site.master" AutoEventWireup="true" CodeFile="create_employee.aspx.cs" Inherits="Admin_create_employee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <div class="row gutter">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            
            <div class="panel">
                <div class="panel-heading">
                    <h4>Create Employee</h4>

                </div>
                <div class="panel-body">
                
                        <div class="form-group">
                            <div class="row gutter">
                                 <div class="col-md-3">
                                    <label class="control-label">Name</label>
                                    <asp:TextBox ID="txtname" runat="server" class="form-control" ></asp:TextBox>
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label">Mobile No.</label>
                                    <asp:TextBox ID="txtmob" runat="server" class="form-control" ></asp:TextBox>
                                </div>
                                 <div class="col-md-3">
                                    <label class="control-label">Salery In Hand</label>
                                    <asp:TextBox ID="txtsalry" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                 <div class="col-md-3">
                                    <label class="control-label">Address</label>
                                    <asp:TextBox ID="txtaddress" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                </div></div></div></div>
            <asp:Button ID="Button1" runat="server" Text="Submit" class="btn btn-info" OnClick="Button1_Click" />
            <asp:Button ID="Button2" runat="server" Text="View All" class="btn btn-default" OnClick="Button2_Click"  />
            <br />
            <br />
        </div>
       </div>
    <div class="row gutter">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="panel panel-blue"><div class="panel-heading">
                    <h4>Employee Details</h4>

                                              </div>
                    <div class="panel-body">
                        <div class="table-responsive">
    <asp:GridView ID="GridView1" runat="server" class="table table-striped table-bordered no-margin" AutoGenerateColumns="False" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" DataKeyNames="id" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" >
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
                                        <asp:TemplateField HeaderText="Name">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Mobile No">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("mob_no") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("mob_no") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Address">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("address") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("address") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Salery In Hand">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("salery","{0:n2}") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("salery","{0:n2}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                           <asp:CommandField ShowEditButton="True"  >
                                                                                                                        <ItemStyle ForeColor="Blue" />
                                        </asp:CommandField>
                                                                                                                        <asp:CommandField ShowDeleteButton="True" >
                                         <ItemStyle ForeColor="Blue" />
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
                            </div></div></div></div></div>
</asp:Content>



