<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
        function Print() {
            var count = $('[id*=tblCustomer]').length;
            var pagebreakcount = 4;
            var i = 1;
            $('[id*=tblCustomer]').each(function () {
                if (i % pagebreakcount == 0) {
                    $(this).attr('style', 'page-break-after: always');
                }
                i++;
            });
            var divContents = document.getElementById("dvCustomers").innerHTML;
            var printWindow = window.open('', '', 'height=600,width=600');
            printWindow.document.write(divContents);
            printWindow.document.close();
            printWindow.print();
            Redirect();
        };
        function Redirect() {
            setTimeout(function () {
                location.href = location.href;
            }, 5000);
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <div>
   
    <asp:Button ID="btnPrint" Text="Print" runat="server" OnClick="Print" />
    <br />
    <div id="dvCustomers">
        <asp:DataList ID="dlCustomers" runat="server" RepeatColumns="1">
            <ItemTemplate>
                <table id="tblCustomer">
                    <tr>
                        <td>
                            <b><u>
                                <%# Eval("challan_no") %></u></b>
                        </td>
                    </tr>
                    <tr>
                        <td class="body">
                            <b>City: </b>
                            <%# Eval("dealer_name") %><br />
                            <b>Postal Code: </b>
                            <%# Eval("dealer_area") %><br />
                            <b>Country: </b>
                            <%# Eval("totlamount")%><br />
                            <b>Phone: </b>
                            <%# Eval("fraight")%><br />
                            <b>Fax: </b>
                            <%# Eval("netamount")%>
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </asp:DataList>
    </div>
</div>
    </div>
    </form>
</body>
</html>
