<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="print_all_challan, App_Web_zkaa0g3n" %>

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
            //$(".date").datepicker('setDate', new Date());
        });
    </script>
     <link href="Content/chosen.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
                <div class="col-md-10">
                    <div class="padding-md">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                Print All Challan</div>
                            <div class="panel-body">
                                <div class="tab-content">
                                    <div class="col-md-10 table-responsive ">
                                        <form>
                                                                  <div class="form-group form-group col-lg-6 ">
					                                Dealer Name
                   <asp:DropDownList ID="ddldealer" runat="server" class="form-control chzn-select">
                                                    </asp:DropDownList>
                                              
    <script src="js/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript"> $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
				</div>
                      
                                                                                                <div class="form-group col-lg-3 ">
					                           From  Date
                 <asp:TextBox ID="txtfrom" runat="server" class="form-control date"></asp:TextBox>
					
				</div>
                                                                                                                         <div class="form-group col-lg-3 ">
					                             To Date
                 <asp:TextBox ID="txtto" runat="server" class="form-control date"></asp:TextBox>
					
				</div>
                                                                                                                                             <div class="form-group col-lg-3 " id="div1" runat="server" visible="false">
					                             Particular Date
                 <asp:TextBox ID="TextBox1" runat="server" class="form-control date"></asp:TextBox>
					
				</div>
                                        </form>
                                        </div>

                                </div>
                     
                            </div>
                            
                                <div class="panel-footer">
                          <asp:Button ID="btnview" runat="server" Text="Today Dealerwise" class="btn btn-sm btn-danger" OnClick="btnview_Click" Visible="False"  />
                     &nbsp;<asp:Button ID="btnview0" runat="server" Text="Today All Challan" class="btn btn-sm btn-danger" OnClick="btnview0_Click" Visible="False"   />
                     &nbsp;<asp:Button ID="btnview1" runat="server" Text="Particular date Dealerwise Challan" class="btn btn-sm btn-danger" OnClick="btnview1_Click" Visible="False"    />
                     &nbsp;<asp:Button ID="btnview2" runat="server" Text="Date Duration Dealerwise Challan" class="btn btn-sm btn-danger" OnClick="btnview2_Click" Visible="False"  />
                     &nbsp;<asp:Button ID="btnview3" runat="server" Text="View" class="btn btn-sm btn-warning" OnClick="btnview3_Click"  />
                     </div>
                        </div>

                    </div>

                </div>
             
         </div>
</asp:Content>

