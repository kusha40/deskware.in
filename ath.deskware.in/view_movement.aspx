<%@ Page Language="C#" AutoEventWireup="true" CodeFile="view_movement.aspx.cs" Inherits="view_movement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">




.Grid {background-color: #fff; margin: 5px 0 10px 0; 
       font-size: 10px; font-weight:400; font-variant:normal; border-collapse:collapse; font-family:Verdana; color: #474747;border: solid 1px #F79034;
     overflow: scroll;
      margin-left: 15px;width: 800px;
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <h3>Total No. Qty.:&nbsp;&nbsp; <asp:Label ID="Label4" runat="server" Font-Bold="True" ForeColor="Red" Text="0"></asp:Label>
                    </h3>
					<asp:GridView ID="GridView1" runat="server" CssClass="Grid" AutoGenerateColumns="False"  >
                                    <Columns>
                                      <asp:TemplateField HeaderText="Sr No.">
                            <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                                          
                                        <asp:BoundField DataField="date" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Date" />
                                        <asp:BoundField DataField="challan_no" HeaderText="Challan no"/>
                                        <asp:BoundField DataField="c_name" HeaderText="C.Name"/>
                                         <asp:BoundField DataField="p_code" HeaderText="Product Code"/>
                                        <asp:BoundField DataField="size" HeaderText="Size"/>
                                        <asp:TemplateField HeaderText="Qty">
                                            <ItemTemplate>
                                                <asp:Label ID="Label201" runat="server" Text='<%# Bind("qty") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="unit" HeaderText="Unit"/>
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
    
    </div>
    </form>
</body>
</html>
