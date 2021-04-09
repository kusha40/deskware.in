<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="customer_challan.aspx.cs" Inherits="customer_challan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
  <%--  <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>--%>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".date").datepicker({
                changeMonth: true,
                changeYear: true
            });
            // $(".date").datepicker('setDate', new Date());
        });
    </script>
     <link href="css/chosen.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row gutter">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            
            <div class="panel">
                <div class="panel-heading">
                    <h4>Issue Customer Challan</h4>

                </div>
                <div class="panel-body">
                                 <div class="form-group">
                            <div class="row gutter">
                                 <div class="col-md-2">
                                    <label class="control-label">Date</label>
                                   <asp:TextBox ID="TextBox1" runat="server" class="form-control date" required ></asp:TextBox>
                                </div>
                                 <div class="col-md-3">
                                    <label class="control-label">Select Customer</label>
                                     <asp:DropDownList ID="DropDownList1" class="form-control chzn-select" runat="server">
                                     </asp:DropDownList>
                                      <script src="js/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript"> $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
                                </div>
                                <div class="col-md-2">
                                    <label class="control-label">Type</label>
                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" class="form-control" RepeatColumns="2">
                                        <asp:ListItem Selected="True" >Debit</asp:ListItem>
                                        <asp:ListItem>Credit</asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                                <div class="col-md-2">
                                    <label class="control-label">Amount</label>
                                   <asp:TextBox ID="TextBox2" runat="server" class="form-control " required></asp:TextBox>
                                </div>
                                 <div class="col-md-3">
                                    <label class="control-label">Remarks</label>
                                   <asp:TextBox ID="TextBox3" runat="server" class="form-control " required></asp:TextBox>
                                </div>
                            </div>
                                   
                        </div>
                   
                    </div>
                   
                </div>
               <asp:Button ID="Button1" runat="server" Text="Submit" class="btn btn-info" OnClick="Button1_Click" />

            <br />
            <br />
         </div>
            </div>
</asp:Content>

