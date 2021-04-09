<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="dealer_check_in.aspx.cs" Inherits="dealer_check_in" %>

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
      <link href="Content/chosen.css" rel="stylesheet" />
     </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row">
                <div class="col-md-10">
                    <div class="padding-md">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                              Dealer Cheque In</div>
                            <div class="panel-body">
                                <div class="tab-content">
                                    <div class="col-md-10 table-responsive">
                                        <form>
                      
                                            <div class="form-group col-lg-5 ">
					                                Date
                    <asp:TextBox ID="txtdate" runat="server" class="form-control input-sm date"></asp:TextBox>
					
				</div>
                                          
                                          <div class="form-group col-lg-4 ">
					                               Select Day
                    <asp:DropDownList ID="ddlweek" runat="server" class="form-control" AutoPostBack="True" OnSelectedIndexChanged="ddlweek_SelectedIndexChanged">
                        <asp:ListItem>Select</asp:ListItem>
                        <asp:ListItem>Monday</asp:ListItem>
                        <asp:ListItem>Tuesday</asp:ListItem>
                        <asp:ListItem>Wednesday</asp:ListItem>
                        <asp:ListItem>Thursday</asp:ListItem>
                        <asp:ListItem>Friday</asp:ListItem>
                        <asp:ListItem>Saturday</asp:ListItem>
                        <asp:ListItem>Sunday</asp:ListItem>
                                                    </asp:DropDownList>
					
				</div>
                                                       <div class="form-group col-lg-3 ">
					                               Select Bank
                    <asp:DropDownList ID="ddlbank" runat="server" class="form-control" >
                        <asp:ListItem>Current</asp:ListItem>
                        <asp:ListItem>OBC</asp:ListItem>
                        <asp:ListItem>HDFC</asp:ListItem>
                                                    </asp:DropDownList>
					
				</div>
                                               <div class="form-group col-lg-8 ">
					                                Dealer Name
                    <asp:DropDownList ID="ddldealer" runat="server" class="form-control chzn-select"></asp:DropDownList>
                                                   	<script src="js/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript"> $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
					
                                          
                 
                    
                     
				</div>
                                             <div class="form-group col-lg-4 " >
                             <asp:Button ID="Button1" runat="server" Text="Add" class="btn btn-success btn-sm " OnClick="Button1_Click"  />
                         </div>
                                              <div class="form-group col-lg-12 ">
                                            <table style="padding:10px; background-color: #00CC99;" cellpadding="10" cellspacing="15" width="100px">
                                                <tr>
                                                    <td >
<asp:GridView ID="GridView1" runat="server"  AutoGenerateColumns="False" CssClass="Grid" Width="400px" OnRowCommand="GridView1_RowCommand"  >
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
                                        <asp:TemplateField HeaderText="Dealer Name">
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Payment Received">
                                            <ItemTemplate>
                                              <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Remarks" >
                                            <ItemTemplate>
                                               <asp:TextBox ID="TextBox3" runat="server" TextMode="MultiLine"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                         <asp:TemplateField ShowHeader="False">
                                                                                <ItemTemplate>
                                                                                    <asp:LinkButton ID="lnkadd" runat="server" CausesValidation="False" CommandArgument='<%# Eval("id")%>' CommandName="delete1" Text="Remove"></asp:LinkButton>
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
                                                    </td>
                                                </tr>
                                            </table>
                                                  </div>
                           
                                            
              
                   
				
			
                                        </form>
                                        </div>

                                </div>

                            </div>

                            <div class="panel-footer">
                                		<asp:Button ID="btnsubmit" runat="server" Text="Submit" class="btn btn-success btn-sm " OnClick="btnsubmit_Click"  />
                     </div>
                        </div>

                    </div>

                </div>
             
         </div>
</asp:Content>
