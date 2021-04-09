<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="assign_lead.aspx.cs" Inherits="assign_lead" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
         <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>
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
                         url: "assign_lead.aspx/GetAutoCompleteData1",
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
   <%--     <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>--%>
       <script type="text/javascript">
           $(function () {
               $(".date").datepicker({
                   //changeMonth: true,
                   //changeYear: true
                   minDate: 0
               });
               $(".date").datepicker('setDate', new Date());
           });
    </script>

      <link href="css/chosen.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row gutter">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            
            <div class="panel">
                <div class="panel-heading">
                    <h4>Assign Leads </h4>

                </div>
                <div class="panel-body">
                <div class="form-group">
                            <div class="row gutter">
                                <div class="col-md-5">
                                    <label class="control-label">Search </label>
                                     <asp:TextBox ID="txtMenuTitle" runat="server" class="form-control autosuggest1" placeholder="Search Customer" ></asp:TextBox>
                                </div>
                                    <div class="col-md-1">
                                    <label class="control-label">. </label><br />
                                        <asp:Button ID="btnview2"  runat="server" Text="Search" class="btn btn-sm btn-success" OnClick="btnview2_Click" CausesValidation="False"  />
                                        </div>
                                 <div class="col-md-2">
                                    <label class="control-label">Lead Type </label>
                                       <asp:DropDownList ID="DropDownList1" class="form-control" runat="server"></asp:DropDownList>
                                </div>
                                    <div class="col-md-1">
                                    <label class="control-label">. </label><br />
                                        <asp:Button ID="Button1"  runat="server" Text="View" class="btn btn-sm btn-default"  CausesValidation="False" OnClick="Button1_Click"  />
                                </div>
                                 <div class="col-md-2">
                                    <label class="control-label">Lead User </label>
                                       <asp:DropDownList ID="DropDownList2" class="form-control" runat="server"></asp:DropDownList>
                                </div>
                                    <div class="col-md-1">
                                    <label class="control-label">. </label><br />
                                        <asp:Button ID="Button2"  runat="server" Text="View Userwise" class="btn btn-sm btn-default"  CausesValidation="False" OnClick="Button2_Click"   />
                                </div>
                                </div></div>
                           <div class="row gutter">
                                    <div class="form-group col-lg-2">
					<label>Date</label>
                    <asp:TextBox ID="TextBox1" runat="server" class="form-control date" ></asp:TextBox>
                              </div>                                                  
                            <div class="col-md-3" >
                                    <label class="control-label">Assigned To</label>
                                            <asp:DropDownList ID="ddlassign" runat="server" class="form-control chzn-select">
                                             </asp:DropDownList>
                                      <%--   <script src="js/jquery.min.js" type="text/javascript"></script>--%>
    <script src="js/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript"> $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
                                                   
                                                                   </div>
                               <div class="col-md-1" >
                                    <label class="control-label">.</label><br />
                                     <asp:Button ID="Button3" runat="server" Text="Assign" class="btn btn-info" OnClick="Button3_Click" />   
                                   </div>
                                     </div>
                       <br />
     <div class="row gutter">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="panel panel-blue"><div class="panel-heading">
                    <h4>Lead Details</h4>

                                              </div>
                    <div class="panel-body">
                               
                        <div class="table-responsive">
                           
                            <asp:GridView ID="GridView1" class="table table-striped table-bordered no-margin" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" PageSize="15" >
                                 <Columns>
                                      <asp:TemplateField HeaderText="">
                            <HeaderTemplate>
                                <asp:CheckBox ID="chkAll" runat="server" CssClass="checlbox" AutoPostBack="true" OnCheckedChanged="ChkAllRows" Text="" />
                            </HeaderTemplate>
                            <ItemTemplate>
                                <asp:CheckBox ID="chkAll0" CssClass="checlbox" runat="server" />
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
                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("lead_id") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                                      <asp:BoundField DataField="date" HeaderText="Date" DataFormatString="{0:dd-MMM-yyyy}" />
                                      <asp:BoundField DataField="lead_id" HeaderText="Lead ID" />
                                     <asp:BoundField DataField="ltype" HeaderText="Type" />
                                        <asp:BoundField DataField="ctype" HeaderText="Status" />
                                        <asp:BoundField DataField="dsource" HeaderText="Source" />
                                         <asp:TemplateField HeaderText="Name">
                                             <ItemTemplate>
                                                 <asp:Label ID="Label2" runat="server" Text='<%# Eval("title")+" "+Eval("lname")+" "+Eval("fname") %>'></asp:Label>
                                             </ItemTemplate>
                                     </asp:TemplateField>
                                     <asp:BoundField DataField="address" HeaderText="Address" />
                                     <asp:BoundField DataField="city" HeaderText="Town/City" />
                                      <asp:BoundField DataField="postcode" HeaderText="Postcode" Visible="False" />
                                      <asp:BoundField DataField="mob" HeaderText="Mobile No." />
                                      <asp:BoundField DataField="email_id" HeaderText="Email ID" />
                                           <asp:BoundField DataField="created_by" HeaderText="Created By" />
                                          <asp:BoundField DataField="assigned_to" HeaderText="Assigned To" />
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

                    </div></div></div></div></div>

                </div></div></div>
</asp:Content>


