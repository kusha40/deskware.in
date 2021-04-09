<%@ Page Language="C#" AutoEventWireup="true" CodeFile="reschedule_todo.aspx.cs" Inherits="reschedule_todo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link href="css/bootstrap.min.css" media="screen" rel="stylesheet"/>
    <link href="css/main.css" rel="stylesheet" media="screen"/>
    <link href="fonts/icomoon/icomoon.css" rel="stylesheet"/>
    <link href="css/c3/c3.css" rel="stylesheet" />
    <link href="css/circliful/circliful.css" rel="stylesheet"/>
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".date").datepicker({
                //changeMonth: true,
                //changeYear: true
                minDate: 0
            });
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="row gutter">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            
            <div class="panel">
                <div class="panel-heading">
                    <h4>Reschedule To do</h4>

                </div>
                <div class="panel-body">
                    <div class="form-group">
                            <div class="row gutter">
                                <div class="form-group col-lg-2">
                                     <label>Previous Date</label>
                                    <asp:TextBox ID="txt1" runat="server" ReadOnly="true" class="form-control"></asp:TextBox>
                                    </div>
                                <div class="form-group col-lg-2">
                                     <label>Previous Time</label>
                                      <asp:TextBox ID="txt2" runat="server" ReadOnly="true" class="form-control"></asp:TextBox>
                                    </div>
                                </div>

                    </div>
                       <div class="form-group">
                            <div class="row gutter">
                                <div class="form-group col-lg-2">
                                     <label>Date</label>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Select Date" ControlToValidate="TextBox1"  ForeColor="Red"></asp:RequiredFieldValidator>
                           <asp:TextBox ID="TextBox1" runat="server" class="form-control date"  ></asp:TextBox>
                           </div>
                                  <div class="form-group col-lg-1">
                                     <label>Time (HH)</label>
                                      <asp:DropDownList ID="DropDownList2" class="form-control" runat="server">
                                          <asp:ListItem>09</asp:ListItem>
                                            <asp:ListItem>10</asp:ListItem>
                                            <asp:ListItem>11</asp:ListItem>
                                            <asp:ListItem>12</asp:ListItem>
                                            <asp:ListItem>01</asp:ListItem>
                                            <asp:ListItem>02</asp:ListItem>
                                            <asp:ListItem>03</asp:ListItem>
                                            <asp:ListItem>04</asp:ListItem>
                                            <asp:ListItem>05</asp:ListItem>
                                            <asp:ListItem>06</asp:ListItem>
                                            <asp:ListItem>07</asp:ListItem>
                                            <asp:ListItem>08</asp:ListItem>
                                            <asp:ListItem>09</asp:ListItem>
                                      </asp:DropDownList>
                           </div>
                                    <div class="form-group col-lg-1">
                                     <label>Time (MM)</label>
                                      <asp:DropDownList ID="DropDownList3" class="form-control" runat="server">
                                          <asp:ListItem>00</asp:ListItem>
                                            <asp:ListItem>15</asp:ListItem>
                                            <asp:ListItem>30</asp:ListItem>
                                            <asp:ListItem>45</asp:ListItem>
                                     </asp:DropDownList>
                           </div>
                                   <div class="form-group col-lg-1">
                                     <label>.</label>
                                      <asp:DropDownList ID="DropDownList4" class="form-control" runat="server">
                                          <asp:ListItem>AM</asp:ListItem>
                                            <asp:ListItem>PM</asp:ListItem>
                                     </asp:DropDownList>
                           </div>


                            </div></div></div>

                 <div class="panel-footer">
                                <asp:Button ID="btnsubmit" runat="server" Text="Update" class="btn btn-sm btn-info " OnClick="btnsubmit_Click" />
                                </div>
                </div></div></div>
    </form>
</body>
</html>
