<%@ Page Language="C#" AutoEventWireup="true" CodeFile="add_feedback.aspx.cs" Inherits="add_feedback" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link href="css/main.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
     <link href="Content/bootstrap.simplex.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="Content/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLES-->
    <link href="Content/custom.css" rel="stylesheet" />
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
     <style type="text/css">
           .chkbox2 label
    {
    margin-right: 5px;
    background-color: #EE4B4C;
    color: white;
    padding: 5px;
     width: auto;
    border-radius: 3px;
        border:1px solid #929292;
   } 
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div class="row">
                <div class="col-md-10">
                    <div class="padding-md">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                Add Feedback</div>
                            <div class="panel-body">
                                                        	<div class="form-group col-md-12 ">
					 <table class="table-responsive table table-bordered">
                    <tr>
                        <td><label>Lead ID&nbsp;&nbsp;&nbsp; </label></td>
                        <td><label>&nbsp;Name&nbsp;&nbsp;&nbsp;</label></td>
                        <td><label>Mobile No.&nbsp;&nbsp;&nbsp;</label></td>
                        <td><label>Remarks&nbsp;&nbsp;</label></td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server"    ForeColor="Red"  Text="Label"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label5" runat="server"  ForeColor="Red"  Text="Label"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label6" runat="server"   ForeColor="Red" Text="Label"></asp:Label>
                            <br />
                        </td>
                        <td>
                            <asp:Label ID="Label12" runat="server"   ForeColor="Red" Text="Label"></asp:Label>
                        </td>
                    </tr>
                </table>
                                                                </div>
                                 <div class="form-group col-md-12 ">

               
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" class="table table-striped table-bordered no-margin" >
                    <Columns>
                                      <asp:TemplateField HeaderText="title">
                                          <ItemTemplate>
                                              <asp:Label ID="Label1" runat="server" Text='<%# Bind("title") %>'></asp:Label>
                                          </ItemTemplate>
                                      </asp:TemplateField>
                                      <asp:TemplateField>
                                          <ItemTemplate>
                                              <asp:RadioButtonList ID="RadioButtonList1" runat="server" CssClass="chkbox2" RepeatColumns="4" RepeatDirection="Horizontal">
                                                  <asp:ListItem>Excellent</asp:ListItem>
                                                  <asp:ListItem Selected="True">Good</asp:ListItem>
                                                  <asp:ListItem>Fair</asp:ListItem>
                                                  <asp:ListItem>Poor</asp:ListItem>
                                              </asp:RadioButtonList>
                                          </ItemTemplate>
                                      </asp:TemplateField>
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
                                                                          <div class="form-group col-lg-4" >
					<label>Rating</label>
					<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage=" * Enter Rating" ControlToValidate="TextBox1" ForeColor="Red" ValidationGroup="g"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="TextBox1" runat="server"  class="form-control"></asp:TextBox>
				</div>
                                                                <div class="form-group col-lg-12" >
					<label>Comments</label>
					<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage=" * Enter Comment" ControlToValidate="txtremark" ForeColor="Red" ValidationGroup="g"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtremark" runat="server" TextMode="MultiLine" class="form-control"></asp:TextBox>
				</div>
                            </div> <div class="panel-footer" id="divfooter" runat="server" >
                                <asp:Button ID="btnaddfollowup"  runat="server" Text="Submit" class="btn btn-sm btn-success " ValidationGroup="g" OnClick="btnaddfollowup_Click"   />
            </div></div></div></div></div>
        
       
    </div>
    </form>
</body>
</html>
