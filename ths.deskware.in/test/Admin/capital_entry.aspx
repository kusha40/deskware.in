<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/site.master" AutoEventWireup="true" CodeFile="capital_entry.aspx.cs" Inherits="Admin_capital_entry" %>

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
                    <h4>Capital Entry</h4>

                </div>
                <div class="panel-body">
                
                        <div class="form-group">
                            <div class="row gutter">
                                 <div class="col-md-3">
                                    <label class="control-label">Date</label>
                                    <asp:TextBox ID="txtdate" runat="server" class="form-control date" ></asp:TextBox>
                                </div>
                                <div class="col-md-2">
                                    <label class="control-label">.</label><br />
                                   <asp:Button ID="Button2" runat="server" Text="Get Value" class="btn btn-danger" OnClick="Button2_Click"/>
                                </div>
                                </div>
                            </div>
                     <div class="form-group">
                            <div class="row gutter">
                                <div class="col-md-3">
                                    <label class="control-label">Stock Value</label>
                                    <asp:TextBox ID="txtstock" runat="server" class="form-control" ></asp:TextBox>
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label">Dealer</label>
                                    <asp:TextBox ID="txtdealer" runat="server" class="form-control" ></asp:TextBox>
                                </div>
                                  <div class="col-md-3">
                                    <label class="control-label">Company</label>
                                    <asp:TextBox ID="txtcomp" runat="server" class="form-control" ></asp:TextBox>
                                </div>
                                </div>
                              </div>
                     <div class="form-group">
                             <div class="row gutter">
                                <div class="col-md-3">
                                    <label class="control-label">Tilehub</label>
                                    <asp:TextBox ID="txttilehub" runat="server" class="form-control" ></asp:TextBox>
                                </div>
                                 <div class="col-md-3">
                                    <label class="control-label">Admin Cash</label>
                                    <asp:TextBox ID="txtadmincash" runat="server" class="form-control" ></asp:TextBox>
                                </div>
                                   <div class="col-md-3">
                                    <label class="control-label">OBC</label>
                                    <asp:TextBox ID="txtobc" runat="server" class="form-control" ></asp:TextBox>
                                </div>
                                </div>
                           </div>
                           <div class="form-group">
                             <div class="row gutter">
                                <div class="col-md-3">
                                    <label class="control-label">HDFC</label>
                                    <asp:TextBox ID="txthdfc" runat="server" class="form-control" ></asp:TextBox>
                                </div>
                                   <div class="col-md-3">
                                    <label class="control-label">Current</label>
                                    <asp:TextBox ID="txtcurrent" runat="server" class="form-control" ></asp:TextBox>
                                </div>
                                  <div class="col-md-3">
                                    <label class="control-label">Assets</label>
                                    <asp:TextBox ID="txtassets" runat="server" class="form-control" ></asp:TextBox>
                                </div>
                                </div>
                           
                                </div>
                      <div class="form-group">
                             <div class="row gutter">
                                <div class="col-md-3">
                                    <label class="control-label">Salesmen</label>
                                    <asp:TextBox ID="txtsaleman" runat="server" class="form-control" ></asp:TextBox>
                                </div>
                                 <div class="col-md-3">
                                    <label class="control-label">Employee Admin</label>
                                    <asp:TextBox ID="txtemployee" runat="server" class="form-control" ></asp:TextBox>
                                </div>
                                 <div class="col-md-3">
                                    <label class="control-label">Employee Tilehub</label>
                                    <asp:TextBox ID="txtemployee1" runat="server" class="form-control" ></asp:TextBox>
                                </div>
                                </div>
                           
                                </div>
                    </div></div>
                        <asp:Button ID="Button1" runat="server" Text="Submit" class="btn btn-info" OnClick="Button1_Click" />
        </div>
       </div>
</asp:Content>

