<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="challan_issue_without_material.aspx.cs" Inherits="challan_issue_without_material" %>

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
                              Issue Challan Without Material</div>
                            <div class="panel-body">
                                <div class="tab-content">
                                    <div class="col-md-10 table-responsive">
                                        <form>
                      
                                            <div class="form-group col-lg-5 ">
					                                Date
                    <asp:TextBox ID="txtdate" runat="server" class="form-control input-sm date"></asp:TextBox>
					
				</div>
                                          
                                          <div class="form-group col-lg-5 ">
					                                Challan No.
                    <asp:TextBox ID="txtchallanno" runat="server" class="form-control input-sm"></asp:TextBox>
					
				</div>
                                               <div class="form-group col-lg-10 ">
					                                Dealer Name
                    <asp:DropDownList ID="ddldealer" runat="server" class="form-control chzn-select"></asp:DropDownList>
                                                   	<script src="js/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript"> $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
					
                                          
                                            <div class="form-group col-lg-10 ">
					                                Amount
                    <asp:TextBox ID="txtamount" runat="server" class="form-control input-sm"></asp:TextBox>
					
				</div>
                                            <div class="form-group col-lg-10 ">
					                                Remarks
                    <asp:TextBox ID="txtremarks" runat="server" class="form-control input-sm"></asp:TextBox>
					<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtremarks" ErrorMessage="Enter Remarks" Font-Bold="True" Font-Size="Small" ForeColor="Red"></asp:RequiredFieldValidator>
				</div>
                     
				</div>
                           
                                            
              
                   
				
			
                                        </form>
                                        </div>

                                </div>

                            </div>

                            <div class="panel-footer">
                                		<asp:Button ID="btnsubmit" runat="server" Text="Submit" class="btn btn-success btn-sm " OnClick="btnsubmit_Click"  />
                          <asp:Button ID="btnview" runat="server" Text="View All" class="btn btn-sm btn-danger" OnClick="btnview_Click" Visible="False" CausesValidation="False"  />
                     &nbsp;<asp:Button ID="btnsubmit1" runat="server" Text="Print 2" class="btn btn-danger btn-sm " OnClick="btnsubmit1_Click" CausesValidation="False"   />
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
                                        <asp:BoundField DataField="dealer_name" HeaderText="Dealer Name" />
                                        <asp:BoundField DataField="debit" HeaderText="Amount" />
                                        <asp:BoundField DataField="remarks" HeaderText="Remarks" />
                                        <asp:BoundField DataField="date"  HeaderText="Date" DataFormatString="{0:dd-MMM-yyyy}" />
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



