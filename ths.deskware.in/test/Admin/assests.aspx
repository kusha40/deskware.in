<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/site.master" AutoEventWireup="true" CodeFile="assests.aspx.cs" Inherits="Admin_assests" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
                   <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".date").datepicker({
                changeMonth: true,
                changeYear: true
            });
            $(".date").datepicker('setDate', new Date());
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row gutter">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            
            <div class="panel">
                <div class="panel-heading">
                    <h4>Assets Entry</h4>

                </div>
                <div class="panel-body">
                
                        <div class="form-group">
                            <div class="row gutter">
                                 <div class="col-md-3">
                                    <label class="control-label">Date</label>
                                    <asp:TextBox ID="txtdate" runat="server" class="form-control date" ></asp:TextBox>
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label">Name</label>
                                    <asp:TextBox ID="txtname" runat="server" class="form-control" ></asp:TextBox>
                                </div>
                                 <div class="col-md-3">
                                    <label class="control-label">Amount</label>
                                    <asp:TextBox ID="txtamount" runat="server" class="form-control"></asp:TextBox>
                                </div>
                                   <div class="col-md-3">
                                    <label class="control-label"> Credit/Debit</label>
                                       <asp:RadioButtonList ID="RadioButtonList1" runat="server" class="form-control" RepeatColumns="2" RepeatDirection="Horizontal">
                                           <asp:ListItem Selected="True" Value="C">Credit</asp:ListItem>
                                           <asp:ListItem Value="D">Debit</asp:ListItem>
                                       </asp:RadioButtonList>
                                </div>
                               
                                </div></div>
                             <div class="form-group">
                            <div class="row gutter">
                                  <div class="col-md-6">
                                    <label class="control-label">Remarks</label>
                                    <asp:TextBox ID="txtreamrks" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
                                </div>
                                
                                </div></div>
                </div></div>
            <asp:Button ID="Button1" runat="server" Text="Submit" class="btn btn-info" OnClick="Button1_Click" />
        </div>
       </div>
</asp:Content>

