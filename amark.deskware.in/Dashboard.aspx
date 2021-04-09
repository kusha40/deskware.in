<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">


       <%--  <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>--%>
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    
          <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".date").datepicker({
                changeMonth: true,
                changeYear: true
            });
        });
    </script>
     <link href="Content/chosen.css" rel="stylesheet" />
    <style type="text/css">
        .lnk{
            background: #2fbf6f; -moz-border-radius: 5px; -webkit-border-radius: 5px; border-bottom: 2px solid #03883e !important;
        }
    </style>


    <%--<script type="text/javascript">
        google.load("visualization", "1", { packages: ["corechart"] });
        google.setOnLoadCallback(drawChart);
        function drawChart() {
            var options = {
                title: 'Enquiry Status Chart'
            };
            var chartType = $("#rblChartType input:checked").val();

            //3D Pie Chart
            if (chartType == "2") {
                options.is3D = true;

            }

            //Doughnut Chart
            if (chartType == "3") {
                options.pieHole = 0.5;
            }
            $.ajax({
                type: "POST",
                url: "dashboard.aspx/GetChartData",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var data = google.visualization.arrayToDataTable(r.d);
                    var chart = new google.visualization.PieChart($("#chart")[0]);
                    chart.draw(data, options);
                },
                failure: function (r) {
                    alert(r.d);
                },
                error: function (r) {
                    alert(r.d);
                }
            });
        }
    </script>

    <script type="text/javascript">
        google.load("visualization", "1", { packages: ["corechart"] });
        google.setOnLoadCallback(drawChart);
        function drawChart() {
            var options = {
                title: 'Followup Status Chart'
            };
            var chartType = $("#rblChartType input:checked").val();

            //3D Pie Chart
            if (chartType == "2") {
                options.is3D = true;

            }

            //Doughnut Chart
            if (chartType == "3") {
                options.pieHole = 0.5;
            }
            $.ajax({
                type: "POST",
                url: "dashboard.aspx/GetChartData1",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var data = google.visualization.arrayToDataTable(r.d);
                    var chart = new google.visualization.PieChart($("#chart1")[0]);
                    chart.draw(data, options);
                },
                failure: function (r) {
                    alert(r.d);
                },
                error: function (r) {
                    alert(r.d);
                }
            });
        }
    </script>
    
    <script type="text/javascript">
        google.load("visualization", "1", { packages: ["corechart"] });
        google.setOnLoadCallback(drawChart);
        function drawChart() {
            var options = {
                title: 'Leads Assign Status Chart'
            };
            var chartType = $("#rblChartType input:checked").val();

            //3D Pie Chart
            if (chartType == "2") {
                options.is3D = true;

            }

            //Doughnut Chart
            if (chartType == "3") {
                options.pieHole = 0.5;
            }
            $.ajax({
                type: "POST",
                url: "dashboard.aspx/GetChartData2",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var data = google.visualization.arrayToDataTable(r.d);
                    var chart = new google.visualization.PieChart($("#chart2")[0]);
                    chart.draw(data, options);
                },
                failure: function (r) {
                    alert(r.d);
                },
                error: function (r) {
                    alert(r.d);
                }
            });
        }
    </script>

    <script type="text/javascript">
        google.load("visualization", "1", { packages: ["corechart"] });
        google.setOnLoadCallback(drawChart);
        function drawChart() {
            var options = {
                title: ''
            };
            var chartType = $("#rblChartType input:checked").val();

            //3D Pie Chart
            if (chartType == "2") {
                options.is3D = true;

            }

            //Doughnut Chart
            if (chartType == "3") {
                options.pieHole = 0.5;
            }
            $.ajax({
                type: "POST",
                url: "dashboard.aspx/GetChartData3",
                data: '{}',
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (r) {
                    var data = google.visualization.arrayToDataTable(r.d);
                    var chart = new google.visualization.PieChart($("#chart3")[0]);
                    chart.draw(data, options);
                },
                failure: function (r) {
                    alert(r.d);
                },
                error: function (r) {
                    alert(r.d);
                }
            });
        }
    </script>--%>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <div class="container-fluid">
    <section class="container">
		<div class="container-page">				
			<div class="col-md-12">
				<h3 class="dark-grey">Dash Board</h3><br />
             <a href="Admin/Default.aspx"><img src="img/admin.png" id="img1" runat="server" visible="false" /></a>   
               <a id="a5" runat="server" href="pivotvolumewise.aspx" visible="false"><b>Volumewise Report</b></a>
                                    <table cellpadding="4" cellspacing="0" id="tbl1" runat="server" visible="false">
                                        
                    <tr>
                        <td id="tda" runat="server" ><h3>Discount Approval List</h3> </td>
                    </tr>
                    <tr>
                        <td >  
                            <asp:Panel ID="pnl" runat="server" ScrollBars="Both" Height="300px">
              
                               
                               
					                               
                
			
                                             
                                            
                                     
                        
                                <table cellpadding="4" cellspacing="0" width="500px">
                                    <tr id="td1" runat="server" visible="false">
                                        <td >
                                              Select Dealer
                                               <asp:DropDownList ID="ddldealer" runat="server" class=" chzn-select" Visible="false">
                                                  
                                                    </asp:DropDownList>
                                              
					   <%--<script src="js/jquery.min.js" type="text/javascript"></script>--%>
    <script src="js/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript"> $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
                                                 
                                        </td>
                                        <td>
                                        From
                                                 <asp:TextBox ID="txtfrom" runat="server" class="input-sm date" ></asp:TextBox>
                                             
                                        </td>
                                        <td>
                                         To
                                                 <asp:TextBox ID="txtto" runat="server" class=" input-sm date" ></asp:TextBox>
                                                
                                        </td>
                                        <td>
                                           
                                    <asp:Button ID="btnsubmit1" runat="server" Text="Show" class="btn btn-success btn-sm " OnClick="btnsubmit1_Click"   />
                                       
                                        </td>
                                    </tr>
                                </table>
                                    
              <asp:GridView ID="GridView2" runat="server" CssClass="Grid" AutoGenerateColumns="False" DataKeyNames="id" OnRowDeleting="GridView2_RowDeleting" OnRowCommand="GridView2_RowCommand"   >
                                    <Columns>
                                      <asp:TemplateField HeaderText="Sr No.">
                            <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Date">
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("date", "{0:dd-MM-yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Dealer Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_dealer_name" runat="server" Text='<%# Bind("dealer_name") %>'></asp:Label>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("dealer_id") %>' Visible="false"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Discount">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_discount" runat="server" Text='<%# Bind("discount","{0:n2}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Remarks">
                                            <ItemTemplate>
                                                <a target="_blank" href="view_remarks.aspx?id=<%# Eval("remarks") %>">View</a>
                                                <asp:Label ID="lbl_remarks" runat="server" Text='<%# Bind("remarks") %>' Visible="false"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Status">
                                                 <ItemTemplate>
                                                     <asp:Label ID="lbl_status0" runat="server" Text='<%# Bind("status") %>'></asp:Label>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                          <asp:CommandField ShowDeleteButton="True" DeleteText="Approve" />
                                             <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton5" runat="server" CausesValidation ="false" 
                                        CommandArgument='<%# Eval("id")%>' 
                                        CommandName="edit1" OnClientClick="return confirm('Are you sure to delete?')">Delete</asp:LinkButton>
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
                         <PagerSettings Position="TopAndBottom" />
                                     <PagerStyle HorizontalAlign = "Left" CssClass = "GridPager" />
                    </asp:GridView>
                   
				  </asp:Panel>          
			
                                        </td>
                    </tr>
                    <tr>
                        <td >&nbsp;</td>
                    </tr>
                   <tr>
                        <td id="thp" runat="server" ><h3>Permission Expense Approval List</h3> </td>
                    </tr>
                    <tr>
                        <td >  
                            <asp:Panel ID="Panel1" runat="server" ScrollBars="Both" Height="300px">
              
                               
                               
					                               
                
			
                                             
                                            
                                     
                        
                                <table cellpadding="4" cellspacing="0" width="500px">
                                    <tr id="td11" runat="server" visible="false">
                                        <td>
                                                 
                                        </td>
                                        <td>
                                         <asp:TextBox ID="TextBox1" runat="server" class="input-sm date" ></asp:TextBox>
                                             
                                        </td>
                                        <td>
                                          <asp:TextBox ID="TextBox2" runat="server" class=" input-sm date" ></asp:TextBox>
                                                
                                        </td>
                                        <td>
                                           
                                    <asp:Button ID="Button1" runat="server" Text="Show" class="btn btn-success btn-sm " OnClick="Button1_Click"   />
                                       
                                        </td>
                                    </tr>
                                </table>
                                    
              <asp:GridView ID="GridView1" runat="server" CssClass="Grid" AutoGenerateColumns="False" DataKeyNames="id" OnRowDeleting="GridView1_RowDeleting" OnRowCommand="GridView1_RowCommand"   >
                                    <Columns>
                                      <asp:TemplateField HeaderText="Sr No.">
                            <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Date">
                                            <ItemTemplate>
                                                <asp:Label ID="Label11" runat="server" Text='<%# Bind("date", "{0:dd-MM-yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Particular">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_dealer_name1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Amount">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_discount1" runat="server" Text='<%# Bind("amount","{0:n2}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Remarks">
                                            <ItemTemplate>
                                                  <asp:Label ID="lbl_Remarks1" runat="server" Text='<%# Bind("remarks") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Status">
                                                 <ItemTemplate>
                                                     <asp:Label ID="lbl_status1" runat="server" Text='<%# Bind("status") %>'></asp:Label>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                          <asp:CommandField ShowDeleteButton="True" DeleteText="Approve" />
                                             <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton5" runat="server" CausesValidation ="false" 
                                        CommandArgument='<%# Eval("id")%>' 
                                        CommandName="edit1" OnClientClick="return confirm('Are you sure to delete?')">Delete</asp:LinkButton>
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
                         <PagerSettings Position="TopAndBottom" />
                                     <PagerStyle HorizontalAlign = "Left" CssClass = "GridPager" />
                    </asp:GridView>
                   
				  </asp:Panel>          
			
                                        </td>
                    </tr>
                    <tr>
                        <td >&nbsp;</td>
                    </tr>
                </table>
                 </div>
                    </div>

               

         
		</div>
     <a id="a2" runat="server" visible="false" href="admin_employee_attendanvce.aspx">Take Attendance</a>
     <asp:Panel ID="Panel2" runat="server" ScrollBars="Both" Height="300px" Visible="false">
         <h3>Checking Expense Approval List</h3><br />
        
    <asp:GridView ID="GridView3" runat="server" CssClass="Grid" AutoGenerateColumns="False" DataKeyNames="id" OnRowDeleting="GridView3_RowDeleting" OnRowCommand="GridView3_RowCommand"   >
                                    <Columns>
                                      <asp:TemplateField HeaderText="Sr No.">
                            <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Date">
                                            <ItemTemplate>
                                                <asp:Label ID="Label111" runat="server" Text='<%# Bind("date", "{0:dd-MM-yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Particular">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_dealer_name11" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Amount">
                                            <ItemTemplate>
                                                <asp:Label ID="lbl_discount11" runat="server" Text='<%# Bind("amount","{0:n2}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Remarks">
                                            <ItemTemplate>
                                                  <asp:Label ID="lbl_Remarks11" runat="server" Text='<%# Bind("remarks") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Status">
                                                 <ItemTemplate>
                                                     <asp:Label ID="lbl_status11" runat="server" Text='<%# Bind("status") %>'></asp:Label>
                                                 </ItemTemplate>
                                             </asp:TemplateField>
                                          <asp:CommandField ShowDeleteButton="True" DeleteText="Approve" />
                                             <asp:TemplateField HeaderText="">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton5" runat="server" CausesValidation ="false" 
                                        CommandArgument='<%# Eval("id")%>' 
                                        CommandName="edit1" OnClientClick="return confirm('Are you sure to delete?')">Delete</asp:LinkButton>
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
                         <PagerSettings Position="TopAndBottom" />
                                     <PagerStyle HorizontalAlign = "Left" CssClass = "GridPager" />
                    </asp:GridView>
         </asp:Panel>
        <div class="row">
                   <div class="col-sx-4 table-responsive">

                   </div>  
    </div>
    </section>
           </div>
     <%-- <div class="row">
                   <div class="col-sx-4 table-responsive">
                   </div>  
                <div id="Div1" class="col-sx-4 table-responsive">
            
                    
       <table class="Grid" visible="false" >
                <tr>
                   
                    <td>
                           <div id="chart" style="width: 500px; height: 250px;">
    </div>
                               </td>
                    <td>
            <div id="chart1"  style="width: 500px; height: 250px;">
    </div>
                    </td>
                  
                </tr>
                <tr align="center">
                   
                    <td >
                         &nbsp;<div id="chart2" style="width: 500px; height: 250px;">
    </div>

                    </td>
                    <td>

                                       <%--<div id="chart3" style="width: 500px; height: 250px;">
    </div>

                    &nbsp;</td>
                   
                 
                   
                </tr>
                <tr align="center">
                   
                    <td colspan="2" >
                                         
                                          
                    </td>
                   
                 
                   
                </tr>
            </table>
                 
                      
                    </div>
                    </div>--%>
  
</asp:Content>

