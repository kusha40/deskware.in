<%@ Page Language="C#" AutoEventWireup="true" CodeFile="print_payment_slip.aspx.cs" Inherits="print_payment_slip" EnableEventValidation="false" %>

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
    
              
					<br />
       <asp:Button ID="btnsubmit2" runat="server" Text="Export to Excel" class="btn btn-success btn-sm " OnClick="btnsubmit2_Click"  />
    
              
					<asp:GridView ID="GridView1" runat="server" CssClass="Grid" AutoGenerateColumns="False" OnRowDataBound="GridView1_RowDataBound"   >
                                    <Columns>
                                      <asp:TemplateField HeaderText="Sr No.">
                            <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="ID" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                        <asp:BoundField DataField="week" HeaderText="Day" />
                                        <asp:BoundField DataField="name" HeaderText="Dealer Name" />
                                        <asp:TemplateField HeaderText="Total Balance">
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text="0.00"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Payment Received">
                                            <ItemTemplate>
                                                <asp:TextBox ID="TextBox3" runat="server" BorderStyle="None"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Discount Received">
                                            <ItemTemplate>
                                                  <asp:TextBox ID="TextBox2" runat="server" BorderStyle="None"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Remarks">
                                <ItemTemplate>
                                                                             
                                        <asp:TextBox ID="TextBox1" runat="server"  Height="30" BorderStyle="None"></asp:TextBox>
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
               
    </div>
    </form>
</body>
</html>
