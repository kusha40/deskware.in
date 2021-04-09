<%@ Page Language="C#" AutoEventWireup="true" CodeFile="view_stock_challan2.aspx.cs" Inherits="view_stock_challan2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
        <style type="text/css">
        .Grid {background-color: #fff; margin: 5px 0 10px 0; 
       font-size: 10px; font-weight:400; font-variant:normal; border-collapse:collapse; font-family:Verdana; color: #474747;border: solid 1px #F79034;
     overflow: scroll;
      margin-left: 15px;width: 800px;
}
.Grid td {
      padding: 2px;
      border: solid 1px gray; 
      width:auto;
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
  .Grid tr:nth-child(even)
    {
        background-color:rgba(0,0,0,.05);
    }
    .Grid tr:nth-child(odd)
    {
        background-color:#fff;
    }

    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
         <h3>Total No. Qty.:<asp:Label ID="Label4" runat="server" Font-Bold="True" ForeColor="Red" Text="0"></asp:Label>
                    <asp:Label ID="Label8" runat="server" Text="0" Visible="False"></asp:Label>
					
                    </h3>
    <asp:GridView ID="GridView1" runat="server" CssClass="Grid" AutoGenerateColumns="False" DataKeyNames="stock_id" OnRowDeleting="GridView1_RowDeleting" >
                                    <Columns>
                                      <%--  <asp:BoundField DataField="p_type" HeaderText="Product Grade" />--%>
                                        <%-- <asp:TemplateField HeaderText="Product Code">
                                             <ItemTemplate>
                                                 <asp:Label ID="Label200" runat="server" Text='<%# Bind("p_code") %>'></asp:Label>
                                             </ItemTemplate>
                                        </asp:TemplateField>--%>
                                        <%--<asp:BoundField DataField="remarks" HeaderText="Remarks" />--%>
                                      <asp:TemplateField HeaderText="Sr No.">
                            <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="ID" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("stock_id") %>'></asp:Label>
                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("id") %>' Visible="false"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                        <asp:BoundField DataField="date" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Date" />
                                        <asp:BoundField DataField="size" HeaderText="Size" />
                                        <asp:TemplateField HeaderText="Product Code">
                                            <ItemTemplate>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("p_code") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Company Name">
                                         
                                            <ItemTemplate>
                                              
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("c_name") %>'></asp:Label>
                                                    
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Qty">
                                            <ItemTemplate>
                                                <asp:Label ID="Label201" runat="server" Text='<%# Bind("qty") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="unit" HeaderText="Unit" />
                                        <asp:TemplateField HeaderText="Challan No">
                                            <ItemTemplate>
                                               
                                                <asp:Label ID="Label202" runat="server" Text='<%# Bind("stock_id") %>'></asp:Label>
                                                   
                                            </ItemTemplate>
                                        </asp:TemplateField>
               <asp:CommandField ShowDeleteButton="True"  />
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
