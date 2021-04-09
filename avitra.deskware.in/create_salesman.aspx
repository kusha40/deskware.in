<%@ page title="" language="C#" masterpagefile="~/Site.master" autoeventwireup="true" inherits="create_salesman, App_Web_zkaa0g3n" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
          <style>
		a img{border: none;}
		ol li{list-style: decimal outside;}
		div#container{width: 780px;margin: 0 auto;padding: 1em 0;}
		div.side-by-side{width: 100%;margin-bottom: 1em;}
		div.side-by-side > div{float: left;width: 50%;}
		div.side-by-side > div > em{margin-bottom: 10px;display: block;}
		.clearfix:after{content: "\0020";display: block;height: 0;clear: both;overflow: hidden;visibility: hidden;}
		
	</style>
 
    <link href="Content/chosen.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="row">
                <div class="col-md-10">
                    <div class="padding-md">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                Create Salesman</div>
                            <div class="panel-body">
                                <div class="tab-content">
                                    <div class="col-md-10 table-responsive">
                                        <form>
                      
                                            <div class="form-group ">
					                                Salesman Name
                    <asp:TextBox ID="txtname" runat="server" class="form-control input-sm"></asp:TextBox>
					
				</div>
                                          
                                            <div class="form-group ">
					                                Mobile No.
                    <asp:TextBox ID="txtmob" runat="server" class="form-control input-sm"></asp:TextBox>
					
				</div>
                                            <div class="form-group ">
					                                Address
                    <asp:TextBox ID="txtaddress" runat="server" class="form-control input-sm"></asp:TextBox>
					
				</div>
                                            <div class="form-group ">
					                                Dealer Name
                    <asp:DropDownList ID="ddldealer" runat="server" class="form-control chzn-select"></asp:DropDownList>
                                                 <script src="js/jquery.min.js" type="text/javascript"></script>
    <script src="js/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript"> $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
					
				</div>
                           
                                            
              
                   
				
			
                                        </form>
                                        </div>

                                </div>

                            </div>

                            <div class="panel-footer">
                                		<asp:Button ID="btnsubmit" runat="server" Text="Submit" class="btn btn-success btn-sm " OnClick="btnsubmit_Click"  />
                          <asp:Button ID="btnview" runat="server" Text="View All" class="btn btn-sm btn-danger" OnClick="btnview_Click"  />
                     </div>
                        </div>

                    </div>

                </div>
             
         </div>
      <div class="row">
                      
                <div id="Div1" class="col-sx-4 table-responsive">
					<asp:GridView ID="GridView1" runat="server" CssClass="Grid" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting" DataKeyNames="id" >
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
                                        <asp:BoundField DataField="name" HeaderText="Dealer Name" />
                                        <asp:BoundField DataField="mob_no" HeaderText="Mobile No" />
                                        <asp:BoundField DataField="address" HeaderText="Address" />
                                        <asp:BoundField DataField="dealer_name"  HeaderText="Dealer Name" />
                                                                                                                        <asp:CommandField ShowDeleteButton="True" />
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
			 </div></div>
    </asp:Content>

