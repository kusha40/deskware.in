<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="routine_job_task.aspx.cs" Inherits="routine_job_task" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row gutter">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="panel panel-blue"><div class="panel-heading">
                      <h4>Daily Routine  Job Task</h4>
                                              </div>
                    <div class="panel-body">
                    <asp:Button ID="btnsubmit" runat="server" Text="Update" class="btn btn-sm btn-info " OnClick="btnsubmit_Click"  />
                        <br />      <br />
                        <div class="table-responsive col-lg-12">
                               
                            <asp:GridView ID="GridView1" runat="server" class="table table-striped table-bordered no-margin"  AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound"     >
                                    <Columns>
                                           <asp:TemplateField HeaderText="" >
                            <HeaderTemplate>
                                <asp:CheckBox ID="chkAll" runat="server" AutoPostBack="true"  OnCheckedChanged="ChkAllRows" Text="" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkAll0" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Sr No.">
                            <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                                           <asp:TemplateField HeaderText="Job Type">
                                               <ItemTemplate>
                                                   <asp:Label ID="Label1" runat="server" Text='<%# Bind("type") %>'></asp:Label>
                                               </ItemTemplate>
                                           </asp:TemplateField>
                                           <asp:TemplateField HeaderText="Job Task">
                                               <ItemTemplate>
                                                   <asp:Label ID="Label2" runat="server" Text='<%# Bind("task") %>'></asp:Label>
                                               </ItemTemplate>
                                           </asp:TemplateField>
                                           <asp:TemplateField HeaderText="Remarks">
                                               <ItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" class="form-control" TextMode="MultiLine" ></asp:TextBox>
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
                            </div></div></div></div></div>
</asp:Content>

