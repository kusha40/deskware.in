<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="upload_document.aspx.cs" Inherits="upload_document" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link href="css/chosen.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row gutter">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            
            <div class="panel">
                <div class="panel-heading">
                    <h4>Upload Document </h4>

                </div>
                <div class="panel-body">
                
                        <div class="form-group">
                            <div class="row gutter">
                                <div class="col-md-12">
                                    <label class="control-label">Title </label>
                                   <asp:TextBox ID="txttitle" runat="server" class="form-control" placeholder="Title"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                     <div class="form-group">
                            <div class="row gutter">
                                <div class="col-md-12">
                                    <label class="control-label">Upload Document </label>
                                    <asp:FileUpload ID="FileUpload1" runat="server" class="form-control" />
                                </div>
                            </div>

                        </div>
                    
                                     </div>

            </div>
               <asp:Button ID="Button1" runat="server" Text="Submit" class="btn btn-info" OnClick="Button1_Click" />

             <asp:Button ID="Button2" runat="server" Text="Reset" class="btn btn-default" OnClick="Button2_Click" />

            <asp:Button ID="Button3" runat="server" Text="View All" class="btn btn-danger" OnClick="Button3_Click" />

           

        </div>

        </div>

    <br />
    <div class="row gutter">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="panel panel-blue"><div class="panel-heading">
                    <h4>Documents Details</h4>

                                              </div>
                    <div class="panel-body">
                        <div class="table-responsive">
                            <asp:GridView ID="GridView1" class="table table-striped table-bordered no-margin" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="15" OnRowCommand="GridView1_RowCommand" >
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
                                         <asp:BoundField DataField="title" HeaderText="Title" />
                                     <asp:TemplateField HeaderText="View">
                                         <ItemTemplate>
                                              <a href="<%# Eval("path") %>" target="_blank" style="color:#0066FF" >View
                                                 
                                                      </a>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Action">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton5" runat="server" CausesValidation ="false" 
                                        CommandArgument='<%# Eval("id")%>' 
                                        CommandName="edit1" ForeColor="#0066FF">Delete</asp:LinkButton>
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
                        </div>

                    </div></div></div></div>

 
</asp:Content>

