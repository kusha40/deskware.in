<%@ Page Language="C#" AutoEventWireup="true" CodeFile="delete_ledger_entry.aspx.cs" Inherits="delete_ledger_entry" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    </head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="">
            <tr>
                <td colspan="2">Are You Sure Want to Delete Ledger Entry ?.</td>
            </tr>
            <tr>
                <td>Password</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
        </table>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Delete" />
        <br />
    
    </div>
    </form>
</body>
</html>
