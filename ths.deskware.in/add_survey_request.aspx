<%@ Page Language="C#" AutoEventWireup="true" CodeFile="add_survey_request.aspx.cs" Inherits="add_survey_request" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
   <%-- <link rel="shortcut icon" href="img/favicon.png"/>--%>
    <title> Arkaya CRM</title>
    <link href="css/bootstrap.min.css" media="screen" rel="stylesheet"/>
    <link href="css/main.css" rel="stylesheet" media="screen"/>
    <link href="fonts/icomoon/icomoon.css" rel="stylesheet"/>
    <link href="css/c3/c3.css" rel="stylesheet" />
    <link href="css/circliful/circliful.css" rel="stylesheet"/>
            <script src="js/jquery.js"></script><script src="js/bootstrap.min.js"></script><script src="js/sparkline/retina.js"></script><script src="js/sparkline/custom-sparkline.js"></script><script src="js/scrollup/jquery.scrollUp.js"></script><script src="js/d3/d3.v3.min.js"></script><script src="js/c3/c3.js"></script><script src="js/c3/c3.custom.js"></script><script src="js/jvectormap/jquery-jvectormap-2.0.3.min.js"></script><script src="js/jvectormap/world-mill-en.js"></script><script src="js/jvectormap/gdp-data.js"></script><script src="js/jvectormap/world-map.js"></script><script src="js/circliful/circliful.min.js"></script><script src="js/circliful/circliful.custom.js"></script><script src="js/peity/peity.min.js"></script><script src="js/peity/custom-peity.js"></script><script src="js/custom.js"></script>
     <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".date").datepicker({
                changeMonth: true,
                changeYear: true
                //minDate: 0
            });
            $(".date").datepicker('setDate', new Date());
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="row gutter">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            
            <div class="panel">
                <div class="panel-heading">
                    <h4>Survey Request</h4>

                </div>
                <div class="panel-body">
                
                        <div class="form-group">
                            <div class="row gutter">
                                <div class="col-md-6">
                                    <label class="control-label">Customer Name </label>
                                   <asp:TextBox ID="TextBox1" runat="server"  class="form-control" placeholder="Customer Name"></asp:TextBox>
                                </div>
                                 <div class="col-md-6">
                                    <label class="control-label">Address </label>
                                   <asp:TextBox ID="TextBox2" runat="server"  class="form-control" placeholder="Address"></asp:TextBox>
                                </div>
                                </div></div>


                    <div class="form-group">
                            <div class="row gutter">
                                  <div class="col-md-2">
                                    <label class="control-label">Survey Type </label>
                                      <asp:DropDownList ID="DropDownList1" runat="server" class="form-control">
                                          <asp:ListItem Value="Domestic">Domestic</asp:ListItem>
                                          <asp:ListItem>Industry</asp:ListItem>
                                          <asp:ListItem>Farm</asp:ListItem>
                                          <asp:ListItem>Others</asp:ListItem>
                                      </asp:DropDownList>
                                </div>
                                 <div class="col-md-2">
                                    <label class="control-label">Survey Date </label>
                                      <asp:TextBox ID="TextBox3" runat="server"  class="form-control date" ></asp:TextBox>
                                     </div>
                                 <div class="col-md-2">
                                    <label class="control-label">Survey Time </label>
                                      <asp:TextBox ID="TextBox4" runat="server"  class="form-control " ></asp:TextBox>
                                     </div>
                                 <div class="col-md-2">
                                    <label class="control-label">Electricity type </label>
                                      <asp:DropDownList ID="DropDownList2" runat="server" class="form-control">
                                          <asp:ListItem>Three Phase</asp:ListItem>
                                          <asp:ListItem>Single Phase </asp:ListItem>
                                      </asp:DropDownList>
                                </div>
                                 <div class="col-md-2">
                                    <label class="control-label">Cylinder Required </label>
                                      <asp:DropDownList ID="DropDownList3" runat="server" class="form-control">
                                          <asp:ListItem>Yes</asp:ListItem>
                                          <asp:ListItem>No</asp:ListItem>
                                      </asp:DropDownList>
                                </div>
                                 <div class="col-md-2">
                                    <label class="control-label">Finance Required</label>
                                      <asp:DropDownList ID="DropDownList4" runat="server" class="form-control">
                                         <asp:ListItem>Yes</asp:ListItem>
                                          <asp:ListItem>No</asp:ListItem>
                                      </asp:DropDownList>
                                </div>
                                </div></div>

                     <div class="form-group">
                            <div class="row gutter">
                                  <div class="col-md-2">
                                    <label class="control-label">Electricity Cost kWh </label>
                                   <asp:TextBox ID="TextBox5" runat="server"  class="form-control" placeholder="Electricity Cost kWh"></asp:TextBox>
                                </div>
                                 <div class="col-md-8">
                                    <label class="control-label">Note/Remarks </label>
                                   <asp:TextBox ID="TextBox6" runat="server" TextMode="MultiLine"  class="form-control" placeholder="Note/Remarks "></asp:TextBox>
                                </div>
                                </div></div>
                </div>
                <asp:Button ID="Button1" runat="server" Text="Submit" class="btn btn-info" OnClick="Button1_Click" />
            </div>
            

        </div></div>
    </form>
</body>
</html>
