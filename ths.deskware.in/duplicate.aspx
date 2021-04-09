<%@ Page Language="C#" AutoEventWireup="true" CodeFile="duplicate.aspx.cs" Inherits="duplicate" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Button ID="Button2"   runat="server" Text="Duplicate Lead ID" class="btn btn-sm btn-danger" OnClick="Button2_Click"  />
          <asp:Button ID="Button1"   runat="server" Text="Duplicate Mobile" class="btn btn-sm btn-danger" OnClick="Button1_Click"  />
          <asp:Button ID="Button3"   runat="server" Text="Delete" class="btn btn-sm btn-danger" OnClick="Button3_Click"  />
    <div>
    				<asp:GridView ID="GridView1" runat="server" class="table table-striped table-bordered no-margin" AutoGenerateColumns="False"  >
                                    <Columns>
                                          <asp:TemplateField HeaderText="">
                            <HeaderTemplate>
                                <asp:CheckBox ID="chkAll" runat="server" CssClass="checlbox" AutoPostBack="true" OnCheckedChanged="ChkAllRows" Text="" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkAll0" CssClass="checlbox" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Sr No.">
                            <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="SysID" Visible="False">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="lead_id" HeaderText="Lead ID/Mob.No."  />
                                           <asp:BoundField DataField="fname" HeaderText="Name"  />
                                         <asp:BoundField DataField="created_by" HeaderText="created_by"  />
                                        <asp:BoundField DataField="assigned_to" HeaderText="assigned_to"  />
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
    </form>
</body>
</html>
