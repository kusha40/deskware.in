<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="terms_condition.aspx.cs" Inherits="terms_condition" %>
<%@ Register assembly="CKEditor.NET" namespace="CKEditor.NET" tagprefix="CKEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row gutter">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            
            <div class="panel">
                <div class="panel-heading">
                    <h4>Create Product Terms & Condition</h4>

                </div>
                <div class="panel-body">
                                 <div class="form-group">
                            <div class="row gutter">
                                   <div class="col-md-2">
                                       <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatColumns="2" RepeatDirection="Horizontal">
                                           <asp:ListItem Selected="True">Order</asp:ListItem>
                                           <asp:ListItem>Quotation</asp:ListItem>
                                       </asp:RadioButtonList>
                                       </div>
                                <div class="col-md-6">
                                    <label class="control-label">Product Name</label>
                                    <asp:DropDownList ID="DropDownList1" class="form-control"  runat="server"></asp:DropDownList>
                                </div>
                                </div></div>
                                 <div class="form-group">
                            <div class="row gutter">
                                 <div class="col-md-12">
                                    <label class="control-label">Terms & Condition </label>
                                      <CKEditor:CKEditorControl ID="CKEditorControl1"   runat="server" height="400px" class="form-control" width="900px" ></CKEditor:CKEditorControl>
                                   <%--<asp:TextBox ID="TextBox2" runat="server" class="form-control" placeholder="Terms & Condition" TextMode="MultiLine"></asp:TextBox>--%>
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
                    <h4>Product Terms & Condition Details</h4>

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
                                        <asp:BoundField DataField="type" HeaderText="Type" />
                                        <asp:TemplateField HeaderText="Product Name">
                                            <ItemTemplate>
                                                <asp:Label ID="Label21" runat="server" Text='<%# Bind("pname") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Terms & Condition">
                                            <ItemTemplate>
                                                <asp:Label ID="Label23" runat="server" Text='<%# Bind("terms") %>'></asp:Label>
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

