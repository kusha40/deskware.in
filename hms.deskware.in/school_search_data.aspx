<%@ Page Title="" Language="C#" MasterPageFile="~/school.master" AutoEventWireup="true" CodeFile="school_search_data.aspx.cs" Inherits="school_search_data" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <%-- <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>--%>
    
    <link rel="stylesheet"  href="JS/jquery-ui.css" />
    <script type="text/javascript" src="JS/jquery-1.9.1.js"></script>
    <script type="text/javascript"  src="JS/jquery-ui.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            SearchText1();
        });
        function SearchText1() {
            $(".autosuggest1").autocomplete({
                source: function (request, response) {
                    $.ajax({
                        type: "POST",
                        contentType: "application/json; charset=utf-8",
                        url: "school_search_data.aspx/GetAutoCompleteData1",
                        data: "{'username':'" + request.term + "','flag':'" + $('[name=rdlMinor]:checked').val() + "'}",
                        dataType: "json",
                        success: function (data) {
                            response(data.d);
                        },
                        error: function (result) {
                            alert("Error");
                        }
                    });
                }
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>GENERATE HEALTH CARD </h1>
    <table cellspacing="1" cellpadding="5">
<tr>
<td class="listtitle" colspan=2>Enter&nbsp; Details</td></tr>

<input type=hidden name=referer value="/CMD&#95LOGIN">
    <tr>
    <td class="list" >Select Session : </td><td class=list>
                    <asp:DropDownList ID="ddlsession" class="inset" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlsession_SelectedIndexChanged" >
                    </asp:DropDownList>

                      <tr>
    <td class="list" >Class Name :</td><td class=list>
                    <asp:DropDownList ID="ddlClass" class="inset" runat="server">
                    </asp:DropDownList>
                          
    
<tr><td class="listtitle" align=right colspan=2>
  
    <asp:Button ID="btnsave" runat="server" Text="View" OnClick="btnsave_Click"></asp:Button>
    </td></tr>

</table>
    <br />
    <asp:TextBox ID="txtMenuTitle" runat="server" class="inset input autosuggest1" Width="200px"></asp:TextBox>
    &nbsp;<asp:Button ID="btnsearch" runat="server" Text="Search" OnClick="btnsearch_Click"></asp:Button>
    <br />
    <br />
      <asp:Panel ID="Panel1" runat="server" Width="100%" >
    <div >
					<asp:GridView ID="GridView1" runat="server" cssclass="list" AutoGenerateColumns="False" DataKeyNames="id" OnRowDataBound="GridView1_RowDataBound">
                                    <Columns>
                                      <asp:TemplateField HeaderText="Sr No.">
                            <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="UNIQUE ID">
                                            <ItemTemplate>
                                                <asp:Label ID="lblremarks" runat="server" Text='<%# Bind("UNQUEID") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Student Name">
                                            <%--<EditItemTemplate>
                                                <asp:TextBox ID="txtschoolname" runat="server" Text='<%# Bind("school_name") %>'></asp:TextBox>
                                            </EditItemTemplate>--%>
                                            <ItemTemplate>
                                                <asp:Label ID="lblschoolname" runat="server" Text='<%# Bind("NAME") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Father Name">
                                            <ItemTemplate>
                                                <asp:Label ID="lblclassname" runat="server" Text='<%# Bind("FATHERNAME") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                          <asp:TemplateField HeaderText="DOB">
                                            <ItemTemplate>
                                                <asp:Label ID="lblsection" runat="server" Text='<%# Bind("DOB","{0:dd-MMM-yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Created By">
                                            <ItemTemplate>
                                                <asp:Label ID="lblcre" runat="server" Text='<%# Bind("createdby") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lbldate" runat="server" Text='<%# Bind("examdate","{0:dd-MMM-yyyy}") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                              <asp:TemplateField HeaderText="Print">
                                           
                                             <ItemTemplate>
                                                  
                                                 <asp:HyperLink ID="HyperLink1" Target="_blank" runat="server">Print</asp:HyperLink>
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
        </asp:Panel>
</asp:Content>

