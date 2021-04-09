<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    
    <title>Login Tile Hub</title>
     <link href="css/bootstrap.min.css" media="screen" rel="stylesheet"/>
    <link href="css/main.css" rel="stylesheet" media="screen"/>
    <link href="fonts/icomoon/icomoon.css" rel="stylesheet"/>
    <link href="css/c3/c3.css" rel="stylesheet" />
    <link href="css/circliful/circliful.css" rel="stylesheet"/>
            <script src="js/jquery.js"></script><script src="js/bootstrap.min.js"></script><script src="js/sparkline/retina.js"></script><script src="js/sparkline/custom-sparkline.js"></script><script src="js/scrollup/jquery.scrollUp.js"></script><script src="js/d3/d3.v3.min.js"></script><script src="js/c3/c3.js"></script><script src="js/c3/c3.custom.js"></script><script src="js/jvectormap/jquery-jvectormap-2.0.3.min.js"></script><script src="js/jvectormap/world-mill-en.js"></script><script src="js/jvectormap/gdp-data.js"></script><script src="js/jvectormap/world-map.js"></script><script src="js/circliful/circliful.min.js"></script><script src="js/circliful/circliful.custom.js"></script><script src="js/peity/peity.min.js"></script><script src="js/peity/custom-peity.js"></script><script src="js/custom.js"></script>



    <link href="css/bootstrap.min.css" rel="stylesheet" media="screen"/><link href="css/main.css" rel="stylesheet"/><link href="fonts/icomoon/icomoon.css" rel="stylesheet"/>
</head>
<body class="login-bg">
    <form id="form1" runat="server">
      
    <div>
  <div class="login-wrapper">
      <div class="login">
          <div class="login-header">
       
              <div class="logo">
                <%--  <img src="img/bluemoon-lg.jpg" alt="CRM Dashboard Logo"/>--%>

              </div>
         <%--     <h5>Login to access to your CRM.</h5>--%>

          </div>
                    <div class="alert alert-danger " id="div2" runat="server" visible="false">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong>Alert!</strong> <span id ="spn2" runat="server"></span> 
  </div>
      <div class="login-body">
          <div class="form-group"><label for="emailID">User ID</label>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage=" * Enter User ID" ForeColor="Red" ControlToValidate="txtuid"></asp:RequiredFieldValidator>
      <asp:TextBox ID="txtuid" runat="server" class="form-control" placeholder="User ID"></asp:TextBox>
              </div>
      <div class="form-group">
          <label for="password">Password</label>
           <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage=" * Enter Password" ForeColor="Red" ControlToValidate="txtpwd"></asp:RequiredFieldValidator>
            <asp:TextBox ID="txtpwd" runat="server" class="form-control" placeholder="Password" TextMode="Password"></asp:TextBox></div>
           
    <asp:CheckBox ID="chkRememberMe" runat="server" Text="Remember me" /><br /><br />
          <asp:Button ID="Button1" runat="server" Text="Login" class="btn btn-danger btn-block" OnClick="Button1_Click" />
      
    </div>
          <p><a href="forgotpwd.aspx">Forgot Password ?</a></p>
      </div></div></div>
    </form>
</body>
</html>
