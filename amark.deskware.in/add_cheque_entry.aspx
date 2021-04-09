<%@ page language="C#" autoeventwireup="true" inherits="add_cheque_entry, App_Web_5i5ojnlf" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>

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
     <style>
		a img{border: none;}
		ol li{list-style: decimal outside;}
		div#container{width: 780px;margin: 0 auto;padding: 1em 0;}
		div.side-by-side{width: 100%;margin-bottom: 1em;}
		div.side-by-side > div{float: left;width: 50%;}
		div.side-by-side > div > em{margin-bottom: 10px;display: block;}
		.clearfix:after{content: "\0020";display: block;height: 0;clear: both;overflow: hidden;visibility: hidden;}
		
	</style>
    <link href="Content/chosen.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table cellpadding="4" cellspacing="0">
            <tr>
                <td>Date</td>
                <td>
                    <asp:TextBox ID="txtdate" runat="server" CssClass="date"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Select</td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" Class="chzn-select">
                    </asp:DropDownList>
                      <script src="js/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript"> $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
                </td>
            </tr>
            <tr>
                <td>Cheque Amount</td>
                <td>
                    <asp:TextBox ID="txtamount" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Cheque No.</td>
                <td>
                    <asp:TextBox ID="txtchequeno" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Cheque Date</td>
                <td>
                    <asp:TextBox ID="txtchequedate" runat="server" CssClass="date"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Bank Name</td>
                <td>
                    <asp:TextBox ID="txtbankname" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>Remarks</td>
                <td>
                    <asp:TextBox ID="txtremarks" runat="server" TextMode="MultiLine">Cheque</asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="Button1" runat="server" Text="Submit" OnClick="Button1_Click" />
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
