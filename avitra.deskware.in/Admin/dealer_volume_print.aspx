<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/site.master" AutoEventWireup="true" CodeFile="dealer_volume_print.aspx.cs" Inherits="Admin_dealer_volume_print" EnableEventValidation="false" %>

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
     <link href="../Content/chosen.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row gutter">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
             <div class="panel-body">
                
                        <div class="form-group">
                            <div class="row gutter">
                                 <div class="col-md-2">
                                    <label class="control-label">From Date</label>
                                    <asp:TextBox ID="txtfdate" runat="server" class="form-control date" ></asp:TextBox>
                                </div>
                                  <div class="col-md-2">
                                    <label class="control-label">To Date</label>
                                    <asp:TextBox ID="txttdate" runat="server" class="form-control date" ></asp:TextBox>
                                </div>
                              
                               
                                 
                                </div>
                           
                        </div>
                    

                   <asp:Button ID="Button1" runat="server" Text="View" class="btn btn-info" OnClick="Button1_Click" />
             </div>
              
        
        </div>
       </div>
    
</asp:Content>






