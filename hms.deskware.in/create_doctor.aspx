<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="create_doctor.aspx.cs" Inherits="create_doctor" %>

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
                        url: "create_doctor.aspx/GetAutoCompleteData1",
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
    <h1>Create Doctor </h1>
    <table cellspacing=1 cellpadding=5>
<tr>
<td class="listtitle" colspan=2>Enter Doctor Details</td></tr>

<input type=hidden name=referer value="/CMD&#95LOGIN">
<tr>
    <td class="list" >School Name :</td><td class=list>
    <asp:DropDownList ID="ddlschoolname" class="inset" runat="server">
    </asp:DropDownList>

    <tr>
    <td class="list" >Doctor Type</td><td class=list>
        <asp:RadioButtonList ID="rbldoctortype" runat="server" ForeColor="Red" RepeatColumns="3">
            <asp:ListItem Selected="True" Value="P">PHYSICIAN</asp:ListItem>
            <asp:ListItem Value="D">DENTIST</asp:ListItem>
            <asp:ListItem Value="E">EYE SIGHT</asp:ListItem>
        </asp:RadioButtonList>

    <tr>
    <td class="list" >Doctor Name :</td><td class=list>
    <asp:TextBox ID="txtdoctorname" runat="server" class="inset input " Width="200px"></asp:TextBox>
    
    
<tr><td class="list" >Reg.No. :</td><td class=list>
  <asp:TextBox ID="txtregno" runat="server" class="inset input" Width="200px" ></asp:TextBox>

</tr>
    
    
<tr><td class="list" >Address :</td><td class=list>
  <asp:TextBox ID="txtaddress" runat="server" class="inset input" Width="200px" ></asp:TextBox>

</tr>
    
    
<tr><td class="list" >Mobile No. :</td><td class=list>
  <asp:TextBox ID="txtmobno" runat="server" class="inset input" Width="200px" ></asp:TextBox>

</tr>
    
    
<tr><td class="list" >Email ID :</td><td class=list>
  <asp:TextBox ID="txtemailid" runat="server" class="inset input" Width="200px" ></asp:TextBox>

</tr>
    
    
<tr><td class="list" >Remarks :</td><td class=list>
  <asp:TextBox ID="txtremarks" runat="server" class="inset input" Width="200px" TextMode="MultiLine"></asp:TextBox>

</tr>
    
    
<tr><td class="listtitle" align=right colspan=2>
  
    <asp:Button ID="btnsave" runat="server" Text="Save" OnClick="btnsave_Click"></asp:Button>
    &nbsp;<asp:Button ID="btnviewall" runat="server" Text="View All" Height="21px" OnClick="btnviewall_Click"></asp:Button>
    </td></tr>

</table>
    <br />
    <asp:TextBox ID="txtMenuTitle" runat="server" class="inset input autosuggest1" Width="200px"></asp:TextBox>
    &nbsp;<asp:Button ID="btnsearch" runat="server" Text="Search" OnClick="btnsearch_Click"></asp:Button>
    <br />
    <br />
    <asp:Panel ID="Panel1" runat="server" Width="100%" ScrollBars="Horizontal">
    <div >
					<asp:GridView ID="GridView1" runat="server" cssclass="list" AutoGenerateColumns="False" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" DataKeyNames="id" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging">
                                    <Columns>
                                         <asp:CommandField ShowEditButton="True"  />
                                        <asp:CommandField ShowDeleteButton="True" />
                                      <asp:TemplateField HeaderText="Sr No.">
                            <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="ID" Visible="false">
                            <ItemTemplate>
                                <asp:Label ID="lblid" runat="server" Text='<%# Bind("id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="School Name">
                                          <%--  <EditItemTemplate>
                                                <asp:TextBox ID="txtschoolname" runat="server" Text='<%# Bind("school_name") %>'></asp:TextBox>
                                            </EditItemTemplate>--%>
                                            <ItemTemplate>
                                                <asp:Label ID="lblschoolname" runat="server" Text='<%# Bind("school_name") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Doctor Type">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txttype" runat="server" Text='<%# Bind("type") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lbltype" runat="server" Text='<%# Bind("type") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Doctor Name">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtdoctorname" runat="server" Text='<%# Bind("doctor_name") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lbldoctorname" runat="server" Text='<%# Bind("doctor_name") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Reg.No.">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtregno" runat="server" Text='<%# Bind("reg_no") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblregno" runat="server" Text='<%# Bind("reg_no") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField HeaderText="Address">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtaddress" runat="server" Text='<%# Bind("address") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lbladdress" runat="server" Text='<%# Bind("address") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                            <asp:TemplateField HeaderText="Mobile No.">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtmobileno" runat="server" Text='<%# Bind("mob_no") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblmobileno" runat="server" Text='<%# Bind("mob_no") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Email ID">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtemailid" runat="server" Text='<%# Bind("email_id") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblemailid" runat="server" Text='<%# Bind("email_id") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Remarks">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtremarks" runat="server" Text='<%# Bind("remarks") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblremarks" runat="server" Text='<%# Bind("remarks") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Created By">
                                            <ItemTemplate>
                                                <asp:Label ID="lblcre" runat="server" Text='<%# Bind("created_by") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Date">
                                            <ItemTemplate>
                                                <asp:Label ID="lbldate" runat="server" Text='<%# Bind("date") %>'></asp:Label>
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

