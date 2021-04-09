<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default3.aspx.cs" Inherits="Default3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script  type="text/javascript">
        function Button1_onclick() {
            window.print();
        }
</script>
</head>
<body>
    <form id="form1" runat="server">
         <p><input id="Button1" type="button" value="Print" onclick="return Button1_onclick()" /></p>
    <div>
    
        <p style="page-break-after:always"/>
         <p style="page-break-after:always"/>
      
    </div>
    </form>
</body>
</html>
