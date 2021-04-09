<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" MaintainScrollPositionOnPostback="true" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Deskware IT Solutions</title>
    <!-- BOOTSTRAP STYLES-->
    <link href="Content/bootstrap.simplex.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="Content/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLES-->
    <link href="Content/custom.css" rel="stylesheet" />
    <!-- GOOGLE FONTS-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans' rel='stylesheet' type='text/css' />

    <!-- /. WRAPPER  -->
    <!-- SCRIPTS -AT THE BOTOM TO REDUCE THE LOAD TIME-->
    <!-- JQUERY SCRIPTS -->
    <script src="js/jquery-1.10.2.js"></script>
    <!-- BOOTSTRAP SCRIPTS -->
    <script src="js/bootstrap.min.js"></script>


</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div id="loginbox" style="margin-top: 60px; top: 0px; left: 0px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <div class="panel-title">Login Panel</div>
                    </div>
                    <br />
                    <img src="img/logo.jpg" class="user-image img-responsive" />
                    <div style="padding-top: 30px" class="panel-body">
                        <div style="display: none" id="login-alert" class="alert alert-danger col-sm-12"></div>
                        <div class="panel panel-danger">
                            <div class="panel-body">
                                <div class="panel-title">Sign In</div>
                                <hr />
                                <div class="form-group">
                                    <label>Username</label>

                                    <asp:TextBox ID="txtUsername" runat="server" class="form-control input-sm"></asp:TextBox>
                                </div>
                                <div class="form-group">
                                    <label>Password</label>

                                    <asp:TextBox ID="txtPassword" runat="server" class="form-control input-sm" TextMode="Password"></asp:TextBox>
                                </div>

                                <hr />
                                <asp:Button ID="btnSign" runat="server" Text="Sign in" class="btn btn-success btn-sm  pull-right " OnClick="btnSign_Click" />

                            </div>

                        </div>
                     <%--   <div class="form-group">
                            <div class="col-md-12 control">
                                <br />
                                <img src="img/vcg.png" class="pull-left img-responsive" />
                            </div>
                            <div class="col-md-12 control" style="margin-top: -15px; margin-bottom: 10px;">
                                <a id="A1" href="http://www.vgcsoft.com/" runat="server" target="_blank" class="pull-right">VGC Soft Technologies LLP. </a>
                            </div>
                        </div>--%>
                    </div>




                </div>
            </div>
        </div>
    </form>
</body>
</html>
