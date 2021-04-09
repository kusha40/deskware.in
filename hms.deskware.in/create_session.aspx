<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="create_session.aspx.cs" Inherits="create_session" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <h1>Create Session </h1>
    <table cellspacing="1" cellpadding="5">
<tr>
<td class="listtitle" colspan=2>Enter Class Details</td></tr>

<input type=hidden name=referer value="/CMD&#95LOGIN">
    <tr>
    <td class="list" >Session :</td><td class=list>
    <asp:TextBox ID="txtsession" runat="server" class="inset input " Width="200px"></asp:TextBox>
    
    
<tr><td class="listtitle" align=right colspan=2>
  
    <asp:Button ID="btnsave" runat="server" Text="Save" OnClick="btnsave_Click"></asp:Button>
    &nbsp;<asp:Button ID="btnviewall" runat="server" Text="View All" Height="21px" OnClick="btnviewall_Click"></asp:Button>
    </td></tr>

</table>
     <br />
    &nbsp;<br />
    <br />
      <asp:Panel ID="Panel1" runat="server" Width="100%" ScrollBars="Horizontal">
    <div >
					<asp:GridView ID="GridView1" runat="server" cssclass="list" AutoGenerateColumns="False" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" DataKeyNames="id">
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
                                  
                                          <asp:TemplateField HeaderText="Session">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="txtclassname" runat="server" Text='<%# Bind("session") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="lblclassname" runat="server" Text='<%# Bind("session") %>'></asp:Label>
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

