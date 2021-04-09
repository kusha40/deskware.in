<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>
<head>
<title>Login</title>
     <link href="css/style.css" rel="stylesheet" />
</head>
<body onload="document.form.username.focus();if(document.form.referer.value.indexOf('#')==-1)document.form.referer.value+=location.hash;">
<center><br><br><br><br>
    <img src="img/logo1.jpg" />
<h1>&nbsp;Login Panel</h1>
        <form id="form1" runat="server">
<table cellspacing=1 cellpadding=5>
<tr>
<td class=listtitle colspan=2>Please enter your Username and Password</td></tr>

<input type=hidden name=referer value="/CMD&#95LOGIN">
<tr><td class=list align=right>Username:</td><td class=list>
    <asp:TextBox ID="txtusername" runat="server" class="inset input">

    </asp:TextBox>
    
    
<tr><td class=list align=right >Password:</td><td class=list>
  <asp:TextBox ID="txtpassword" runat="server" class="inset input" TextMode="Password"></asp:TextBox>

</tr>
<tr><td class=listtitle align=right colspan=2>
  
    <asp:Button ID="Button1" runat="server" Text="Login" OnClick="Button1_Click"></asp:Button>
    </td></tr>

</table>
            </form>
</center></body>
