<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
         .PnlDesign
        {
            border: solid 1px #000000;
            height: 150px;
            width: 330px;
            overflow-y:scroll;
            background-color: #EAEAEA;
            font-size: 15px;
            font-family: Arial;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <asp:Panel ID="PnlCust" runat="server" CssClass="PnlDesign">
                    <asp:CheckBoxList ID="cblCustomerList" runat="server">
                        <asp:ListItem>Customer One</asp:ListItem>
                        <asp:ListItem>Customer Two</asp:ListItem>
                        <asp:ListItem>Customer Three</asp:ListItem>
                        <asp:ListItem>Customer Four</asp:ListItem>
                        <asp:ListItem>Customer Five</asp:ListItem>
                        <asp:ListItem>Customer Six</asp:ListItem>
                        <asp:ListItem>Customer Seven</asp:ListItem>
                    </asp:CheckBoxList>
                </asp:Panel>
    </div>
    </form>
</body>
</html>
