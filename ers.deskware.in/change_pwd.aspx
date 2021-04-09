<%@ Page Language="C#" AutoEventWireup="true" CodeFile="change_pwd.aspx.cs" Inherits="change_pwd" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
    <title>Forgot Password</title>
    <link rel="shortcut icon" href="http://eduliftsolution.com/favicon.ico"/>
  <link href="css/bootstrap.min.css" media="screen" rel="stylesheet"/>
    <link href="css/main.css" rel="stylesheet" media="screen"/>
    <link href="fonts/icomoon/icomoon.css" rel="stylesheet"/>
    <link href="css/c3/c3.css" rel="stylesheet" />
    <link href="css/circliful/circliful.css" rel="stylesheet"/>
            <script src="js/jquery.js"></script><script src="js/bootstrap.min.js"></script><script src="js/sparkline/retina.js"></script><script src="js/sparkline/custom-sparkline.js"></script><script src="js/scrollup/jquery.scrollUp.js"></script><script src="js/d3/d3.v3.min.js"></script><script src="js/c3/c3.js"></script><script src="js/c3/c3.custom.js"></script><script src="js/jvectormap/jquery-jvectormap-2.0.3.min.js"></script><script src="js/jvectormap/world-mill-en.js"></script><script src="js/jvectormap/gdp-data.js"></script><script src="js/jvectormap/world-map.js"></script><script src="js/circliful/circliful.min.js"></script><script src="js/circliful/circliful.custom.js"></script><script src="js/peity/peity.min.js"></script><script src="js/peity/custom-peity.js"></script><script src="js/custom.js"></script>
</head> 
<body class="login-bg">
    <form id="form1" runat="server">
    <div>
    <div class="login-wrapper">
        <div class="login">
            <div class="login-header">
                <div class="logo">
               <%--     <img src="img/bluemoon-lg.jpg" alt="CRM Dashboard Logo">--%></div>

                 <h5>Enter Details to Change your password.</h5>

                 <h5><a href="Dashboard.aspx" class="btn-link">Go to Home</a></h5>

            </div>
                        <div class="alert alert-danger " id="div2" runat="server" visible="false">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong>Danger!</strong> <span id ="spn2" runat="server"></span> 
  </div>
             <div class="alert alert-success" id="div1" runat="server" visible="false">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong>Success!</strong> <span id ="spn1" runat="server"></span> 
  </div>
            <div class="login-body">
                <div class="form-group">
                    <label for="emailId">Current Password</label>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage=" * Enter Password" ForeColor="Red" ControlToValidate="txtcurrent"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtcurrent" runat="server" class="form-control" placeholder="Current Password" TextMode="Password"></asp:TextBox>

               

            </div>
                    <div class="form-group">
                    <label for="emailId">New Password</label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage=" * Enter New Password" ForeColor="Red" ControlToValidate="txtnew"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtnew" runat="server" class="form-control" placeholder="New Password" TextMode="Password"></asp:TextBox>

               

            </div>
                    <div class="form-group">
                    <label for="emailId">Confirm Password</label>
                           <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage=" * Enter Confirm Password" ForeColor="Red" ControlToValidate="txtconfirmpassword"></asp:RequiredFieldValidator> 
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="  Password Not Matched" ForeColor="Red" ControlToCompare="txtnew" ControlToValidate="txtconfirmpassword"></asp:CompareValidator>
                    <asp:TextBox ID="txtconfirmpassword" runat="server" class="form-control" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>

               

            </div>
                <asp:Button ID="Button1" runat="server" Text="Submit" class="btn btn-danger btn-block" OnClick="Button1_Click" />
                </div>
            </div>
    </div>
        </div>
    </form>
    
</body>
</html>
