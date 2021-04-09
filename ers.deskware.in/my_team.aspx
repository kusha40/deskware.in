<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="my_team.aspx.cs" Inherits="my_team" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="row gutter">
    <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12"  ><div class="panel height2" style="height: 900px; overflow-y: scroll;" ><div class="panel-heading"><h4 style="font-size:12px">My Team Member</h4></div><div class="panel-body" >
        <asp:Button ID="btnsubmit2" runat="server" Text="Export to Excel" class="btn btn-success" OnClick="btnsubmit2_Click"  />
                            <br />
                               <br />
                  <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" class="table table-striped table-bordered no-margin" ShowHeader="false" OnRowDataBound="GridView1_RowDataBound">
                      <Columns>
                          <asp:TemplateField>
                              <ItemTemplate>
                             
                                                  <ul class="expenses"  >



                          <li style="padding:5px;"><a ><span class="expenses-icon red"><i class="icon-user2"></i> </span><span class="expenses-type"><%# Eval("name") %></span> </a></li>
                         <asp:Label ID="Label1" runat="server" Text='<%# Eval("user_id")%>' Visible="false" ></asp:Label>
                                                                                                                                                                                 </ul>
                              </ItemTemplate>
                          </asp:TemplateField>

                           <asp:TemplateField>
                              <ItemTemplate>
                                   <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" GridLines="None" class="table table-striped table-bordered no-margin" OnRowDataBound="GridView2_RowDataBound" ShowHeader="false">
                      <Columns>
                          <asp:TemplateField>
                              <ItemTemplate>
                             <asp:Label ID="Label2" runat="server" Text='<%# Eval("user_id")%>' Visible="false" ></asp:Label>
                                                  <ul class="expenses"  >



                          <li style="padding:5px;"><a ><span class="expenses-icon red"><i class="icon-user2"></i> </span><span class="expenses-type"><%# Eval("name") %></span> </a></li>
                        
                                                                                                                                                                                 </ul>
                              </ItemTemplate>
                          </asp:TemplateField>

                          <asp:TemplateField>
                              <ItemTemplate>
                                   <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" GridLines="None" ShowHeader="false">
                      <Columns>
                          <asp:TemplateField>
                              <ItemTemplate>
                             
                                                  <ul class="expenses"  >



                          <li style="padding:5px;"><a ><span class="expenses-icon red"><i class="icon-user2"></i> </span><span class="expenses-type"><%# Eval("name") %></span> </a></li>
                        
                                                                                                                                                                                 </ul>
                              </ItemTemplate>
                          </asp:TemplateField>
                           </Columns>
                                         </asp:GridView>
                                  </ItemTemplate>
                                  </asp:TemplateField>
                          
                           </Columns>
                                         </asp:GridView>
                                  </ItemTemplate>
                                  </asp:TemplateField>
                          
          
                      </Columns>
                       <EmptyDataTemplate>
                            <table>
                                <tr>
                                    <td>There are no Team Member available. </td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
                  </asp:GridView>
                  </div></div></div>
         </div>
</asp:Content>

