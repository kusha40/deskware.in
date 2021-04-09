<%@ Page Language="C#" AutoEventWireup="true" CodeFile="view_meeting_history.aspx.cs" Inherits="view_meeting_history" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style type="text/css">




.Grid {background-color: #fff; /*margin: 5px 0 10px 0;*/ 
       font-size: 10px; font-weight:400; font-variant:normal; border-collapse:collapse; font-family:Verdana; color: #474747;border: solid 1px #F79034;
     overflow: scroll;
      /*margin-left: 15px;*/
}
table {
  background-color: transparent;
}
table {
  border-collapse: collapse;
  border-spacing: 0;
}
* {
  -webkit-box-sizing: border-box;
  -moz-box-sizing: border-box;
  box-sizing: border-box;
}
  * {
    text-shadow: none !important;
    color: #000 !important;
    background: transparent !important;
    box-shadow: none !important;
  }
  .Grid th  {
      padding : 4px 2px;
     /*color: #fff;*/
     color:white;
      background-color:#444444;
      /*background: #F6A828 url(Images/grid-header.png) repeat-x top;*/
      border-left: solid 1px #A1DCF2;
      font-variant:normal;
       font-size: 10px;
       }
  th {
  color: #444444;
}
th {
  text-align: left;
}
td,
th {
  padding: 0;
    margin-left: 120px;
}
.Grid td {
      padding: 2px;
      border: solid 1px gray; 
      width:auto;
}
a {
  color: #d9230f;
  text-decoration: none;
}
  a,
  a:visited {
    text-decoration: underline;
  }
  a {
  background: transparent;
}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table cellpadding="0" cellspacing="8">
            <tr >
                <td style="width:500px; font-family: Tahoma; font-size: large;">
    
                    View History<br />
                </td>
            </tr>
            <tr>
                <td align="left">
    
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="Grid" Width="100%">
                    <Columns>
                        <asp:BoundField DataField="remarks" HeaderText="Remarks" />
                        <asp:BoundField DataField="created_by" HeaderText="Created By" />
                        <asp:BoundField DataField="date" DataFormatString="{0:dd-MMM-yyyy hh:mm:ss tt}" HeaderText="Entered Date" />
                        <asp:BoundField DataField="md" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Meeting Date "/>
                    </Columns>
                    <EmptyDataTemplate>
                        <table>
                            <tr>
                                <td>There are no records available. </td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                </asp:GridView>
   
    </td>
             
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
