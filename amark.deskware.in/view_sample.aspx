<%@ Page Language="C#" AutoEventWireup="true" CodeFile="view_sample.aspx.cs" Inherits="view_sample" EnableEventValidation="false" %>

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
        <asp:Button ID="btnsubmit2" runat="server" Text="Export to Excel All" class="btn btn-success btn-sm " OnClick="btnsubmit2_Click"  />
    <div id="Div1" class="col-sx-4 table-responsive">
                   <h5>All Product</h5>
              					<asp:GridView ID="GridView1" runat="server" CssClass="Grid"  AutoGenerateColumns="False" OnPreRender="GridView1_PreRender"  >
                                    <Columns>
                                      <asp:TemplateField HeaderText="Sr No.">
                            <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Size" >
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("size") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Company Name" >
                                            
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("cname") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Product Code">
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("pcode") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Avg. Sample Qty.">
                                             <ItemTemplate>
                                                 <asp:Label ID="Label6" runat="server" Text='<%# Bind("qty") %>'></asp:Label>
                                             </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Sent Qty">
                                            <ItemTemplate>
                                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("sentqty") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="">

                         
                            <ItemTemplate>
                                <asp:CheckBox ID="chkAll0" runat="server" Width="30px" Visible="false" />
                                    <asp:Label ID="Label4" runat="server" Visible="false" Text='<%# Bind("sts") %>' ></asp:Label>
                            </ItemTemplate>
                                            <ItemStyle Width="30px" />
                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="">
                            <ItemTemplate>
                                <asp:CheckBox ID="chkAll01" runat="server" Width="30px" Visible="false" />
                                  <asp:Label ID="Label41" runat="server" Visible="false" Text='<%# Bind("sts2") %>' ></asp:Label>
                            </ItemTemplate>
                                            <ItemStyle Width="30px" />
                        </asp:TemplateField>
                                         <asp:BoundField DataField="dealer_name"  HeaderText="Dealer Name" />
                                                                         <asp:BoundField DataField="created_by" HeaderText="Created By" />
                                         <asp:TemplateField HeaderText="Date">
                                             <ItemTemplate>
                                                 <a><%# Eval("date", "{0:dd-MMM-yyyy}") %></a>
                                                <%-- <asp:Label ID="Label7" runat="server" Text='<%# Bind("date", "{0:dd-MMM-yyyy}") %>'></asp:Label>--%>
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
			                    <br />
                                
			 </div>
    </div>
    </form>
</body>
</html>
