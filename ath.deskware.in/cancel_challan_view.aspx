<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cancel_challan_view.aspx.cs" Inherits="cancel_challan_view" %>

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
    
        <table class="">
            <tr>
                <td colspan="2">Are You Sure Want to Cancel Challan&nbsp; ?.</td>
            </tr>
            <tr>
                <td>Password</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
        </table>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Delete" />
        <br />
        <asp:Label ID="Label41" runat="server" Text="Label" Visible="False"></asp:Label>
    
    </div>
    
					<asp:GridView ID="GridView2" runat="server" CssClass="Grid" AutoGenerateColumns="False" DataKeyNames="id" Visible="False" >
                                    <Columns>
                                      <asp:TemplateField HeaderText="Sr No.">
                            <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="ID" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="QTY">
                                            <ItemTemplate>
                                                <asp:Label ID="lblqty" runat="server" Text='<%# Bind("qty") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:BoundField DataField="unit" HeaderText="Unit" />
                                        <asp:TemplateField HeaderText="Size">
                                            <ItemTemplate>
                                                <asp:Label ID="lblsize" runat="server" Text='<%# Bind("size") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="CN">
                                            <ItemTemplate>
                                                <asp:Label ID="lblc_name" runat="server" Text='<%# Bind("c_name") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="PC">
                                            <ItemTemplate>
                                                <asp:Label ID="lblp_code" runat="server" Text='<%# Bind("p_code") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="PG">
                                            <ItemTemplate>
                                                <asp:Label ID="lblp_grade" runat="server" Text='<%# Bind("p_grade") %>'></asp:Label>
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
    </form>
</body>
</html>
