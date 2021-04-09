<%@ Page Language="C#" AutoEventWireup="true" CodeFile="view_all_print.aspx.cs" Inherits="view_all_print" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
        <style type="text/css">

        .tbl
        {
            font-family:Tahoma;
            font-size:12px;
            padding:5px;
            border:1px solid black;
        }

      
    </style>
 
<script  type="text/javascript">
    function Button1_onclick() {
        window.print();
    }
</script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
       
        <p><input id="Button1" type="button" value="Print" onclick="return Button1_onclick()" /></p>
               
        <asp:DataList ID="DataList1" runat="server" RepeatColumns="1" OnItemDataBound="DataList1_ItemDataBound">
     
         
               
                                      <ItemTemplate>
                        <div>
    

   <p style="page-break-after:always"/>
        <table cellpadding="4" cellspacing="4"  class="tbl" valign="top"  >
              <tr align="center">
                <td colspan="2"><b>T.H.</b><br />Estimate
                 
                 
                </td>
                
            </tr>
            <tr>
                <td><b>Date :</b> <asp:Literal ID="Literal1" runat="server" Text='<%#Eval("date","{0:dd-MMM-yyyy}")%>'></asp:Literal></td>
                <td align="right"><b>Challan No. </b>: <asp:Literal ID="Literal2" runat="server" Text='<%#Eval("challan_no")%>'></asp:Literal>&nbsp;</td>
               
            </tr>
            <tr>
                <td colspan="2"><b>Dealer Name : </b><asp:Literal ID="Literal3" runat="server" Text='<%#Eval("dealer_name")%>'></asp:Literal></td>
            </tr>
            <tr>
                <td colspan="2"><b>Area/Address : </b><asp:Literal ID="Literal4" runat="server" Text='<%#Eval("dealer_area")%>'></asp:Literal></td>
            </tr>
              <tr>
                  <td colspan="2"><b>Remarks:</b>
                      <asp:Literal ID="Literal10" runat="server"></asp:Literal>
                  </td>
              </tr>
            <tr>
                <td colspan="2">
					                             
                  
                                		                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Font-Size="12px">
                                                                        <Columns>
                                                                            <asp:TemplateField HeaderText="SNo.">
                                                                                <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
                                <br />
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                                 <asp:TemplateField HeaderText="Qty.">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="Label31" runat="server" Text='<%# Bind("qty") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Unit">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("unit") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Size">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("size") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="C.Name">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("c_name") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                              <asp:TemplateField HeaderText="P.Code">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("p_code") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Rate">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="Label5" runat="server" Text='<%# Bind("mrp", "{0:n2}") %>'></asp:Label>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateField>
                                                                            <asp:TemplateField HeaderText="Amount">
                                                                                <ItemTemplate>
                                                                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("amount", "{0:n2}") %>'></asp:Label>
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
                                                                       
                                                                    </asp:GridView>
                                                                                                                </td>
            </tr>
            <tr align="right" >
                <td colspan="2">
                    <asp:Label ID="Label6" runat="server" Text="Total Amount" Font-Bold="true"></asp:Label>&nbsp;&nbsp; &nbsp;:&nbsp;</b><asp:Literal ID="Literal5" runat="server" Text='<%#Eval("totlamount","{0:n2}")%>'></asp:Literal>&nbsp;</td>
            </tr>
            <tr align="right" id="td2" runat="server">
                <td colspan="2"><asp:Label ID="Label7" runat="server" Text="Freight Charges" Font-Bold="true"></asp:Label>&nbsp; &nbsp;:&nbsp;<asp:Literal ID="Literal6" runat="server" Text='<%#Eval("fraight","{0:n2}")%>'></asp:Literal>&nbsp;</td>
            </tr>
            <tr align="right">
                <td colspan="2"><b>Net Amount&nbsp;&nbsp; :&nbsp; </b><asp:Literal ID="Literal7" runat="server" Text='<%#Eval("netamount","{0:n2}")%>'></asp:Literal>&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" ><asp:Label ID="Label8" runat="server" Text="Amount in words :" Font-Bold="true"></asp:Label><asp:Literal ID="Literal8" runat="server" Text='<%#Eval("inwords")%>'></asp:Literal></td>
            </tr>
            <tr>
                
                <td colspan="2" align="right">
                    <asp:Image ID="Image1" ImageUrl="~/img/return.png" runat="server" Visible="false" />
                    <%#Eval("created_by")%>
                    
                    ||  <asp:Literal ID="Literal9" runat="server" Text='<%#Eval("type")%>'></asp:Literal>  ||  <%#Eval("status")%></td>
            </tr>
        </table>
                    
         <%--</page>--%>
                          <%--  <br class="break"> --%>
     </div>
    </div>
                    </ItemTemplate>
           
      </asp:DataList>
           
        </div>
    </form>
</body>
</html>
