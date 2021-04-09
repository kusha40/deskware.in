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
                    </div>
                    </div>
        </section></div>
  
</asp:Content>

