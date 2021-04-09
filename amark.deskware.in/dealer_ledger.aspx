<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="dealer_ledger.aspx.cs" Inherits="dealer_ledger" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
    
<%--<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script src="ASPSnippets_Pager.min.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {
        GetCustomers(1);
    });
    $(".Pager .page").live("click", function () {
        GetCustomers(parseInt($(this).attr('page')));
    });
    function GetCustomers(pageIndex) {
        $.ajax({
            type: "POST",
            url: "dealer_ledger.aspx/GetCustomers",
            data: '{pageIndex: ' + pageIndex + '}',
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: OnSuccess,
            failure: function (response) {
                alert(response.d);
            },
            error: function (response) {
                alert(response.d);
            }
        });
    }

    function OnSuccess(response) {
        var xmlDoc = $.parseXML(response.d);
        var xml = $(xmlDoc);
        var customers = xml.find("tbl_dealer_ledger_master");
        var row = $("[id*=gvCustomers] tr:last-child").clone(true);
        $("[id*=GridView1] tr").not($("[id*=GridView1] tr:first-child")).remove();
        $.each(customers, function () {
            var customer = $(this);
            $("td", row).eq(0).html($(this).find("id").text());
            $("td", row).eq(1).html($(this).find("challan_no").text());
            $("td", row).eq(3).html($(this).find("debit").text());
            $("td", row).eq(4).html($(this).find("credit").text());
            $("td", row).eq(5).html($(this).find("remarks").text());
            $("td", row).eq(6).html($(this).find("date").text());
            $("[id*=GridView1]").append(row);
            row = $("[id*=GridView1] tr:last-child").clone(true);
        });
        var pager = xml.find("Pager");
        $(".Pager").ASPSnippets_Pager({
            ActiveCssClass: "current",
            PagerCssClass: "pager",
            PageIndex: parseInt(pager.find("PageIndex").text()),
            PageSize: parseInt(pager.find("PageSize").text()),
            RecordCount: parseInt(pager.find("RecordCount").text())
        });
    };
</script>--%>

    <link href="Content/chosen.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="row">
                <div class="col-md-10">
                    <div class="padding-md">&nbsp;<div class="panel panel-info">
                            <div class="panel-heading">
                                Dealer Ledger</div>
                            <div class="panel-body">
                                <div class="tab-content">
                                                     <div class="form-group ">
					                                Dealer Name
                   <asp:DropDownList ID="ddldealer" runat="server" class="form-control chzn-select">
                                                    </asp:DropDownList>
                                              
					   <%--<script src="js/jquery.min.js" type="text/javascript"></script>--%>
    <script src="js/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript"> $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
				</div>

                                </div>

                            </div>

                            <div class="panel-footer">
                                		<asp:Button ID="btnsubmit" runat="server" Text="Show" class="btn btn-success btn-sm " OnClick="btnsubmit_Click"  />
       <asp:Button ID="btnsubmit2" runat="server" Text="Export to Excel" class="btn btn-success btn-sm " OnClick="btnsubmit2_Click"  />
                                        <br />
                                        <br />
                                        <asp:TextBox ID="TextBox1" runat="server" class="date"></asp:TextBox>
                                        <asp:TextBox ID="TextBox2" runat="server" class="date"></asp:TextBox>
                                        <asp:Button ID="btnview3" runat="server" Text="View" class="btn btn-sm btn-warning" OnClick="btnview3_Click"  />
                     </div>
                        </div>

                    </div>

                </div>
             
         </div>
      <div class="row">
          
                      
                <div id="Div1" class="col-sx-4 table-responsive">
                        <h3 id="h3" runat="server" visible="false">  Total Debit:<asp:Label ID="Label3" runat="server" Text="Label" Font-Bold="True" ForeColor="Red"></asp:Label>&nbsp;|| Total Credit:<asp:Label ID="Label4" runat="server" Text="Label" Font-Bold="True" ForeColor="Red"></asp:Label>&nbsp;|| Available Balance:<asp:Label ID="Label5" runat="server" Text="Label" Font-Bold="True" ForeColor="Red"></asp:Label></h3>

               <%--     <a href="http://www.telerik.com/purchase.aspx"><img src="http://www.sealights.io/wp-content/uploads/2016/12/Telerik_Logo.png" width="150" height="50" /></a>
              <img src="https://lh6.googleusercontent.com/-smlwe4dIA2o/VFULTq3Gc6I/AAAAAAAADhQ/y9J3a-ch6p0/w657-h374/5%2Bday%2Bfree%2Btrial.png" width="150" height="50" />--%>
        <%--      //AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" --%>
					    <br />
                        <br />
             
              
					        <asp:Button ID="Button4" runat="server" class="btn btn-sm btn-danger" Text="Delete" OnClick="Button4_Click" />
                            <asp:TextBox ID="TextBox3" runat="server" placeholder="Admin Password" TextMode="Password"></asp:TextBox>
					<asp:GridView ID="GridView1" runat="server" CssClass="Grid" AutoGenerateColumns="False" DataKeyNames="id" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="50" >
                                    <Columns>
                                           <asp:TemplateField HeaderText="">
                            <HeaderTemplate>
                                <asp:CheckBox ID="chkAll" runat="server" AutoPostBack="true" OnCheckedChanged="ChkAllRows" Text="" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkAll0" runat="server" />
                            </ItemTemplate>
                        </asp:TemplateField>
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
                                        <asp:BoundField DataField="date" HeaderText="Date" DataFormatString="{0:dd-MMM-yyyy}" />
                                        <asp:TemplateField HeaderText="Challan No.">
                                           
                                            <ItemTemplate>
                                                   <a href="ledger_challan_print_view.aspx?id=<%# Eval("challan_no") %>&val=<%# Eval("name") %>&val1=<%# Eval("dealer_id") %>&val2=<%# Eval("debit") %>" target="_blank" >
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("challan_no") %>'></asp:Label>
                                                       </a>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="name" HeaderText="Dealer Name" />
                                        <asp:TemplateField HeaderText="Debit">
                                            <ItemTemplate>
                                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("debit", "{0:n2}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Credit">
                                            <ItemTemplate>
                                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("credit", "{0:n2}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Balance">
                                            <ItemTemplate>
                                                                                            <asp:Label ID="lblbal" runat="server" Text='<%# Bind("Balance", "{0:n2}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:BoundField DataField="remarks" HeaderText="Remarks" />
                                        <asp:TemplateField HeaderText="Delete">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton5" runat="server" CausesValidation ="false" 
                                        CommandArgument='<%# Eval("id")%>' 
                                        CommandName="del">Delete</asp:LinkButton>
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
               <div class="Pager"></div>
			 </div>
          
      </div>
    </asp:Content>

