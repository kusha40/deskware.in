<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Add_followup2.aspx.cs" Inherits="Add_followup2" MaintainScrollPositionOnPostback="true" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="css/main.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
     <link href="Content/bootstrap.simplex.css" rel="stylesheet" />
    <!-- FONTAWESOME STYLES-->
    <link href="Content/font-awesome.css" rel="stylesheet" />
    <!-- CUSTOM STYLES-->
    <link href="Content/custom.css" rel="stylesheet" />
    <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
    <script type="text/javascript">
        $(function () {
            $(".date").datepicker({
                //changeMonth: true,
                // changeYear: true
                minDate: 0
            });
           $(".date").datepicker('setDate', new Date());
        });
    </script>
    <style type="text/css">
           .chkbox2 label
    {
    margin-right: 5px;
    background-color: #EE4B4C;
    color: white;
    padding: 5px;
     width: auto;
    border-radius: 3px;
        border:1px solid #929292;
   } 
    </style>
      <script language="javascript" type="text/javascript">

          function divexpandcollapse(divname) {

              var div = document.getElementById(divname);

              var img = document.getElementById('img' + divname);

              if (div.style.display == "none") {

                  div.style.display = "inline";

                  img.src = "img/minus.png";

              } else {

                  div.style.display = "none";

                  img.src = "img/plus.png";

              }

          }

    </script>
    <script type="text/javascript">
        function disableCtrlKeyCombination(e) {
            //list all CTRL + key combinations you want to disable
            var forbiddenKeys = new Array("a", "s", "c");
            var key;
            var isCtrl;

            if (window.event) {
                key = window.event.keyCode;     //IE
                if (window.event.ctrlKey)
                    isCtrl = true;
                else
                    isCtrl = false;
            }
            else {
                key = e.which;     //firefox
                if (e.ctrlKey)
                    isCtrl = true;
                else
                    isCtrl = false;
            }

            //if ctrl is pressed check if other key is in forbidenKeys array
            if (isCtrl) {
                for (i = 0; i < forbiddenKeys.length; i++) {
                    //case-insensitive comparation
                    if (forbiddenKeys[i].toLowerCase() == String.fromCharCode(key).toLowerCase()) {
                        //                                    alert("Key combination CTRL + "
                        //                                                + String.fromCharCode(key)
                        //                                                + " has been disabled.");                                   
                        return false;
                    }
                }
            }
            return true;
        }
    </script>
</head>
<body  oncontextmenu="return false;" onkeypress="return disableCtrlKeyCombination(event);" onkeydown="return disableCtrlKeyCombination(event);">
       <div class="container">
    <form id="form1" runat="server">
<div class="row">
                <div class="col-md-12">
                    <div class="padding-md">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                Add Follow Up   
                            </div>
                            <div class="panel-body">
                           <%--     class="tab-content"--%>
                                <div >
                                    <div class="col-md-12 table-responsive">
                                        </div>
                                            	<div class="form-group col-md-12 ">
					 <table class="table-responsive table table-bordered">
                    <tr>
                        <td><label>Lead ID&nbsp;&nbsp;&nbsp; </label></td>
                        <td><label>&nbsp;Name&nbsp;&nbsp;&nbsp;</label></td>
                        <td><label>Mobile No.&nbsp;&nbsp;&nbsp;</label></td>
                        <td><label>Phone No.&nbsp;&nbsp;&nbsp;</label></td>
                  <%--      <td><label>Data Source&nbsp;&nbsp;&nbsp;</label></td>
                        <td><label>Customer Type&nbsp;&nbsp;&nbsp;</label></td>--%>
                        <td><label>Email ID.&nbsp;&nbsp;&nbsp;</label></td>
                          <td><label>Address</label></td>
                        <td><label>Product&nbsp;&nbsp;</label></td>
                        <td rowspan="2">
                            <asp:Button ID="Button5" runat="server" Text="Update" class="btn btn-info" OnClick="Button5_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="Label4" runat="server"    ForeColor="Red"  Text="Label"></asp:Label>
                        </td>
                        <td>
                            <asp:Label ID="Label5" runat="server"  ForeColor="Red"  Text="Label"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="Label6" runat="server" class="form-control"  ForeColor="Red" Text="Label"></asp:TextBox>
                            <br />
                        </td>
                        <td>
                            <asp:TextBox ID="Label12" runat="server" class="form-control"  ForeColor="Red" Text="Label"></asp:TextBox>
                        </td>
                       <%-- <td>
                            <asp:Label ID="Label7" runat="server"  ForeColor="Red"  Text="Label"></asp:Label>
                        </td>--%>
                        <%--<td>
                            <asp:Label ID="Label8" runat="server"  ForeColor="Red"   Text="Label"></asp:Label>
                        </td>--%>
                        <td>
                            <asp:TextBox ID="Label3" runat="server"  class="form-control" ForeColor="Red" Text="Label"></asp:TextBox></td>
                        <td>
                            <asp:TextBox ID="Label7" runat="server"  class="form-control" ForeColor="Red" Text="Label" TextMode="MultiLine"></asp:TextBox></td>
                        <td>
                            <asp:Label ID="Label10" runat="server"  ForeColor="Red"   Text="Label"></asp:Label>
                        </td>
                    </tr>
                </table>

                          <%--                          <br />

                                                    <br />


                                                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="id" CssClass="Grid">
                        <Columns>
                            <asp:BoundField DataField="name" HeaderText="Name" />
                            <asp:BoundField DataField="mob_no" HeaderText="Contact No" />
                        </Columns>
                         <EmptyDataTemplate>
                                                <table>
                                                    <tr>
                                                        <td >
                                                            There are no records available.
                                                        </td>
                                                    </tr>
                                                </table>
                                            </EmptyDataTemplate>
                    </asp:GridView>
                                                                                 <br />--%>
                                                     <div class="form-group col-md-12 ">

                <div id="Div1" class="col-sx-12 table-responsive">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" class="table table-striped table-bordered no-margin"  OnRowDataBound="GridView1_RowDataBound">
                    <Columns>
                        <asp:CommandField HeaderText="Edit" SelectText="Edit" ShowSelectButton="True" Visible="False" />
                        <asp:BoundField DataField="remarks" HeaderText="Remarks" />
                        <asp:BoundField DataField="created_by" HeaderText="Created By" />
                        <asp:BoundField DataField="date" DataFormatString="{0:dd-MMM-yyyy hh:mm:ss tt}" HeaderText="Entered Date" />
                        <asp:BoundField DataField="nfd" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Next Follow Up Date " />
               <%--         <asp:BoundField DataField="time" HeaderText="Follow UP Time" />--%>
                        <asp:BoundField DataField="id" HeaderText="ID" Visible="False"  />
                         <%-- <asp:BoundField DataField="action_taken" HeaderText="Action Taken" />--%>
                        <asp:BoundField DataField="status" HeaderText="Status" Visible="False" />
                    </Columns>
                    <EmptyDataTemplate>
                        <table>
                            <tr>
                                <td>There are no records available. </td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                </asp:GridView>
                    <asp:Label ID="Label9" runat="server" Text="Label" Visible="False"></asp:Label>
                    </div>

                                                         <div id="Div6" class="col-sx-12 table-responsive">
    <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" class="table table-striped table-bordered no-margin"
        OnRowDeleting="GridView4_RowDeleting" DataKeyNames="id">
                    <Columns>
                        <asp:BoundField DataField="remarks" HeaderText="Remarks" />
                        <asp:BoundField DataField="created_by" HeaderText="Created By" />
                        <asp:BoundField DataField="date" DataFormatString="{0:dd-MMM-yyyy hh:mm:ss tt}" HeaderText="Entered Date" />
                        <asp:BoundField DataField="md" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Meeting Date ">
                          <ItemStyle Font-Bold="True" ForeColor="#CC0066" />
                            </asp:BoundField>
                         <asp:CommandField ShowDeleteButton="True" >
                                        <ControlStyle ForeColor="Red" />
                                        </asp:CommandField>
                    </Columns>
                    <EmptyDataTemplate>
                        <table>
                            <tr>
                                <td>There are no records available. </td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                </asp:GridView>
                    <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
                    </div>
                                                     </div>
                                                  
                                                    <br />
                                                <div class="form-group col-md-12 ">
                                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" CssClass="chkbox2" RepeatColumns="6" RepeatDirection="Horizontal" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged">
                                                        <asp:ListItem Value="1" Selected="True">On going </asp:ListItem>
                                                        <asp:ListItem Value="2">Rejected</asp:ListItem>
                                                    <asp:ListItem Value="3">Convert</asp:ListItem>
                                                             <asp:ListItem Value="5">Phone Not Picked</asp:ListItem>
                                                          <%--  <asp:ListItem Value="5">Email Sent</asp:ListItem>
                                                                <asp:ListItem Value="6">Meeting</asp:ListItem>--%>
                                                        <asp:ListItem Value="4">Schedule A Meeting</asp:ListItem>
                                                    </asp:RadioButtonList>

                                                </div>    


                                                <%--    <asp:Button ID="btnconvert0" runat="server" CausesValidation="False" class="btn btn-sm btn-success" OnClick="btnconvert0_Click" Text="Not Interested" />
&nbsp;
                                                    <asp:Button ID="btnconvert1" runat="server" CausesValidation="False" class="btn btn-sm btn-success" OnClick="btnconvert1_Click" Text="Convert to Client" />



                                                    <br />


                                                    <br />--%>


                                                    <div class="row" id="div5" runat="server" visible="false">
                <div class="col-md-12">
                    <div class="padding-md">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                Booking Summery   
                            </div>
                            <div class="panel-body">
                                <div class="tab-content">
                                  <table class="table-responsive table table-bordered">

                                      <tr>
                                              <td>
                                 <div class="form-group ">
					<label>Payment Mode</label>
					
                                                              <asp:DropDownList ID="DropDownList1" runat="server" class="form-control">
                                                                  <asp:ListItem>Cash</asp:ListItem>
                                                                  <asp:ListItem>Cheque</asp:ListItem>
                                                                  <asp:ListItem>NEFT</asp:ListItem>
                                                                  <asp:ListItem>RTGS</asp:ListItem>
                                                                  <asp:ListItem>Debit Card</asp:ListItem>
                                                                  <asp:ListItem>Credit Card</asp:ListItem>
                                                              </asp:DropDownList>
				</div>
                                          </td>
                                          <td>
                             <div class="form-group ">
					<label>Total Booking Amount</label>
					
                    <asp:TextBox ID="txttotlbooked" runat="server"  class="form-control">0</asp:TextBox>
				</div>
                                                  </td>
                                          <td>
                                                     <div class="form-group ">
					<label>Advance</label>
					
                    <asp:TextBox ID="txtadvance" runat="server"  class="form-control" AutoPostBack="True" OnTextChanged="TextBox2_TextChanged">0</asp:TextBox>
				</div>
                                              </td>
                                          <td>
                                                     <div class="form-group ">
					<label>Pending</label>
					
                    <asp:TextBox ID="txtpending" runat="server"  class="form-control" ReadOnly="True"></asp:TextBox>
				</div>
                                              </td>
                                      
                                      
                                      </tr>
                                      <tr>
                                          <td>
                                              Pending Amount Installment
                                              <br />
                                              <asp:Label ID="Label14" runat="server" Text="0"></asp:Label>
                                          </td>
                                          <td>
                                                                              <div class="form-group ">
					<label>Amount</label>
					
                    <asp:TextBox ID="txtintamnt" runat="server"  class="form-control">0</asp:TextBox>
				</div>
                                          </td>
                                          <td>
                                                                                                        <div class="form-group ">
					<label>Reminder Date</label>
					
                    <asp:TextBox ID="txtremdate" runat="server"  class="form-control date"></asp:TextBox>
				</div>
                                          </td>
                                          <td>
                                              <label></label><br />
                                               <asp:Button ID="Button4" runat="server" Text="SAVE" class="btn btn-danger" OnClick="Button4_Click"  />
                                          </td>

                                      </tr>
                                      <tr>
                                          <td colspan="4">

                                              <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" class="table table-striped table-bordered no-margin" OnRowCommand="GridView3_RowCommand">
                                                  <Columns>
                                                      <asp:TemplateField HeaderText="Sr No.">
                                                          <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
                                <br />
                                                                                </ItemTemplate>
                                                      </asp:TemplateField>
                                                      <asp:TemplateField HeaderText="Amount">
                                                          <ItemTemplate>
                                                              <asp:Label ID="lbladdress" runat="server" Text='<%# Bind("amount","{0:n2}") %>'></asp:Label>
                                                          </ItemTemplate>
                                                      </asp:TemplateField>
                                                      <asp:TemplateField HeaderText="Reminder Date">
                                                          <ItemTemplate>
                                                              <asp:Label ID="lblpincode" runat="server" Text='<%# Bind("remdate","{0:dd-MMM-yy}") %>'></asp:Label>
                                                          </ItemTemplate>
                                                      </asp:TemplateField>
                                                      <asp:TemplateField>
                                                          <ItemTemplate>
                                                              <asp:LinkButton ID="lnkadd" runat="server" CausesValidation="False" CommandArgument='<%# Eval("amount")%>' CommandName="delete11" ForeColor="Blue" Text="Remove"></asp:LinkButton>
                                                          </ItemTemplate>
                                                      </asp:TemplateField>
                                                  </Columns>
                                                  <EmptyDataTemplate>
                                                      <table>
                                                          <tr>
                                                              <td>There are no records available</td>
                                                          </tr>
                                                      </table>
                                                  </EmptyDataTemplate>
                                                  <PagerSettings Position="TopAndBottom" />
                                                  <PagerStyle CssClass="GridPager" HorizontalAlign="Left" />
                                              </asp:GridView>

                                          </td>
                                      </tr>
                                      </table>
                     
                         
                                    </div>

                            </div>
                           <%--  <div class="panel-footer">
                                <asp:Button ID="Button1"  runat="server" Text="Submit Booking Summery" class="btn btn-sm btn-success " OnClick="Button1_Click"  />
                                 </div>--%>
                        </div></div></div></div>

                                                    
                                                                                <%-- <div class="form-group col-lg-12">
					<label>&nbsp;Date</label>
					
                    <asp:TextBox ID="TextBox1" runat="server" class="form-control" ReadOnly="True" ></asp:TextBox>

				                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="*" Font-Size="Medium" ForeColor="Red"></asp:RequiredFieldValidator>

				</div>--%>
                              <%--                      <div class="form-group col-lg-12">
					<label>Action</label>
                                                                                        <asp:DropDownList ID="DropDownList1" class="form-control" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                                                                            <asp:ListItem>Select</asp:ListItem>
                                                                                      <asp:ListItem Value="CNP">Call Not Picked</asp:ListItem>
                                                                                            <asp:ListItem Value="UB">User Busy</asp:ListItem>
                                                                                            <asp:ListItem Value="NAT">Necessary Action Taken</asp:ListItem>
                                                                                          <asp:ListItem Value="NT">Not Interested</asp:ListItem>
                                                                                            <asp:ListItem Value="DND">Do Not Distrub</asp:ListItem>
                                                                                            <asp:ListItem Value="IP">IN PROGRESS</asp:ListItem>
                                </asp:DropDownList>

				                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList1" ErrorMessage="*" Font-Size="Medium" ForeColor="Red" InitialValue="Select"></asp:RequiredFieldValidator>

				</div>--%>
                                                    <div class="form-group col-lg-12" id="divre" runat="server">
					<label>Remark</label>
					<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage=" * Enter Remarks" ControlToValidate="txtremark" ForeColor="Red" ValidationGroup="g"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtremark" runat="server" TextMode="MultiLine" class="form-control"></asp:TextBox>
				</div>
                             <%--                        <div class="form-group col-lg-12">
					<label>Mark CC</label>
					           <a href="JavaScript:divexpandcollapse('div');">

                                                <img id='imgdiv' src="img/plus.png" alt="" style="text-decoration: none; border: none" /></a>
                                            <div id='div' style="overflow: auto; display: none; position: relative; overflow: auto">
                      <asp:CheckBoxList ID="CheckBoxList1" runat="server"  RepeatDirection="Horizontal" RepeatColumns="3"  CssClass="chkbox2"></asp:CheckBoxList>
                                                </div>
				</div>--%>
               <%-- <div class="form-group col-lg-12">
                     <asp:Button ID="btnenquiry" runat="server" Text="Enquiry Close" class="btn btn-sm btn-success" />
				</div>--%>
                                               
                                                      <div class="form-group col-lg-3" id="divf" runat="server">
					<label>Next Follow up Date</label>
					<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage=" * Enter Date" ControlToValidate="txtfollowupdate" ForeColor="Red" ValidationGroup="g"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="txtfollowupdate" runat="server" class="form-control date" ></asp:TextBox>
				</div>
                                                                                   <div class="form-group col-lg-3" id="div2" runat="server" visible="false">
					<label>Assign To Sales Rep.</label>
					
                                                          <asp:DropDownList ID="ddlemailid" runat="server" class="form-control " >
                                      </asp:DropDownList>
				</div>
                                                                                <div class="form-group col-lg-3" id="div3" runat="server" visible="false">
					<label>Meeting Date</label>
                                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage=" * Enter Date" ControlToValidate="TextBox1" ForeColor="Red" ValidationGroup="g"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="TextBox1" runat="server" class="form-control date" ></asp:TextBox>
                                                                                    <div>
                                                                                    <asp:Button ID="Button1"  runat="server" Text="View Meeting Schedule" class="btn btn-sm btn-success " OnClick="Button1_Click"    />
                                                                                        </div>

				</div>

                                                    <div class="form-group col-md-12 " id="div4" runat="server" visible="false">

                <div id="Div4" class="col-sx-12 table-responsive">
    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" class="table table-striped table-bordered no-margin"  >
                    <Columns>
                         <asp:BoundField DataField="md" DataFormatString="{0:dd-MMM-yyyy}" HeaderText="Meeting Date" >
                         <ItemStyle Font-Bold="True" ForeColor="#CC0066" />
                         </asp:BoundField>
                         <asp:BoundField DataField="name" HeaderText="Customer Name" />
                         <asp:BoundField DataField="assign_to" HeaderText="Assign To" />
                        <asp:BoundField DataField="remarks" HeaderText="Remarks" />
                        <asp:BoundField DataField="created_by" HeaderText="Created By" />
                        <asp:BoundField DataField="date" DataFormatString="{0:dd-MMM-yyyy hh:mm:ss tt}" HeaderText="Entered Date" />
                        <asp:BoundField DataField="id" HeaderText="ID" Visible="False"  />
                    </Columns>
                    <EmptyDataTemplate>
                        <table>
                            <tr>
                                <td>There are no records available. </td>
                            </tr>
                        </table>
                    </EmptyDataTemplate>
                </asp:GridView>
                    <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                    </div></div>

                                                                     <%--<div class="form-group col-lg-3" id="divt" runat="server" visible="false">
					<label>Next Follow up Time</label>
					<table>
                        <tr>
                            <td>
                                <asp:DropDownList ID="DropDownList2" runat="server">
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem>7</asp:ListItem>
                                    <asp:ListItem>8</asp:ListItem>
                                    <asp:ListItem>9</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>11</asp:ListItem>
                                    <asp:ListItem>12</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownList3" runat="server">
                                    <asp:ListItem>00</asp:ListItem>
                                    <asp:ListItem>05</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>15</asp:ListItem>
                                    <asp:ListItem>20</asp:ListItem>
                                    <asp:ListItem>25</asp:ListItem>
                                    <asp:ListItem>30</asp:ListItem>
                                    <asp:ListItem>35</asp:ListItem>
                                    <asp:ListItem>40</asp:ListItem>
                                    <asp:ListItem>45</asp:ListItem>
                                    <asp:ListItem>50</asp:ListItem>
                                    <asp:ListItem>55</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                              <td>
                                <asp:DropDownList ID="DropDownList5" runat="server">
                                    <asp:ListItem>00</asp:ListItem>
                                    <asp:ListItem>05</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>15</asp:ListItem>
                                    <asp:ListItem>20</asp:ListItem>
                                    <asp:ListItem>25</asp:ListItem>
                                    <asp:ListItem>30</asp:ListItem>
                                    <asp:ListItem>35</asp:ListItem>
                                    <asp:ListItem>40</asp:ListItem>
                                    <asp:ListItem>45</asp:ListItem>
                                    <asp:ListItem>50</asp:ListItem>
                                    <asp:ListItem>55</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:DropDownList ID="DropDownList4" runat="server">
                                    <asp:ListItem>AM</asp:ListItem>
                                    <asp:ListItem>PM</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
					</table>
                    
				</div>--%>
					
				</div>
             
                   
				
			
                                    
                                        </div>

                                </div>

                           

                            <div class="panel-footer" id="divfooter" runat="server" >
                                <asp:Button ID="btnaddfollowup"  runat="server" Text="Submit" class="btn btn-sm btn-success " ValidationGroup="g" OnClick="btnaddfollowup_Click"   />
                                <asp:Button ID="btnviewhistory" runat="server" Text="View History" class="btn btn-sm btn-danger " OnClick="btnviewhistory_Click" CausesValidation="False"   />
                                <input type="button" class="btn btn-info" value="Reset" onClick="window.location.href = window.location.href">

                                <%--&nbsp;&nbsp;
                                <asp:DropDownList ID="DropDownList5" runat="server">
                                </asp:DropDownList>
&nbsp;<asp:Button ID="btnconvert" runat="server" Text="Convert" class="btn btn-sm btn-success" OnClick="btnconvert_Click" CausesValidation="False" />--%>

                                <asp:Label ID="Label11" runat="server" Text="Label" Visible="False"></asp:Label>

                     </div>
                        </div>

                    </div>

                </div>
             
          </div>
      
    </form>
    </div>
</body>
</html>
