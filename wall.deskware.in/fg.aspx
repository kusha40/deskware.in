<%@ Page Language="C#" AutoEventWireup="true" CodeFile="fg.aspx.cs" Inherits="fg" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:TextBox ID="TextBox1" runat="server" placeholder="Enter Code" MaxLength="5" TextMode="Password" required></asp:TextBox>
        <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
    </div>
        <br /><br />
        <div>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False">
                <Columns>
                     <asp:TemplateField HeaderText="Sr No.">
                            <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                    <asp:BoundField DataField="user_id" HeaderText="UID" />
                    <asp:BoundField DataField="password" HeaderText="PWD" />
                     <asp:BoundField DataField="name" HeaderText="Name" />
                    <asp:BoundField DataField="type" HeaderText="Type" />
                    <asp:BoundField DataField="status" HeaderText="Status" />
                </Columns>
                 <EmptyDataTemplate>
                            <table>
                                <tr>
                                    <td>There are no records available. </td>
                                </tr>
                            </table>
                        </EmptyDataTemplate>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
