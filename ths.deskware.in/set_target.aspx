<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="set_target.aspx.cs" Inherits="set_target" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/chosen.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row gutter">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            
            <div class="panel">
                <div class="panel-heading">
                    <h4>Set Sales & Meeting Target</h4>
                </div>
                <div class="panel-body">
                <div class="form-group">
                            <div class="row gutter">
                                          <div class="col-md-4" >
                                    <label class="control-label">Select User</label>
                                            <asp:DropDownList ID="ddlassign" runat="server" class="form-control chzn-select">
                                             </asp:DropDownList>
                                      <%--   <script src="js/jquery.min.js" type="text/javascript"></script>--%>
    <script src="js/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript"> $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
                                                   
                                                                   </div>
                                  <div class="col-md-1" >
                                   <label class="control-label">.</label><br />
                                     <asp:Button ID="Button1" runat="server" Text="View" class="btn btn-success" OnClick="Button1_Click"  />           
                                     </div>
                                </div></div>
                    <h4>Sales Target</h4>
                        <div class="form-group">
                            <div class="row gutter">
                                 <div class="col-md-1" >
                                    <label class="control-label">Apr</label>
                                     <asp:TextBox ID="TextBox1" runat="server" Text="0" class="form-control"></asp:TextBox>          

                                 </div>
                             
                            <div class="col-md-1" >
                                    <label class="control-label">May</label>
                                     <asp:TextBox ID="TextBox2" runat="server" Text="0" class="form-control"></asp:TextBox>     
                                 </div>
                                <div class="col-md-1" >
                                    <label class="control-label">June</label>
                                     <asp:TextBox ID="TextBox3" runat="server" Text="0" class="form-control"></asp:TextBox>     
                                 </div>
                                <div class="col-md-1" >
                                    <label class="control-label">July</label>
                                     <asp:TextBox ID="TextBox4" runat="server" Text="0" class="form-control"></asp:TextBox>     
                                 </div>
                                <div class="col-md-1" >
                                    <label class="control-label">Aug</label>
                                     <asp:TextBox ID="TextBox5" runat="server" Text="0" class="form-control"></asp:TextBox>     
                                 </div>
                                <div class="col-md-1" >
                                    <label class="control-label">Sep</label>
                                     <asp:TextBox ID="TextBox6" runat="server" Text="0" class="form-control"></asp:TextBox>     
                                 </div>
                                <div class="col-md-1" >
                                    <label class="control-label">Oct</label>
                                     <asp:TextBox ID="TextBox7" runat="server" Text="0" class="form-control"></asp:TextBox>     
                                 </div>
                                <div class="col-md-1" >
                                    <label class="control-label">Nov</label>
                                     <asp:TextBox ID="TextBox8" runat="server" Text="0" class="form-control"></asp:TextBox>     
                                 </div>
                                <div class="col-md-1" >
                                    <label class="control-label">Dec</label>
                                     <asp:TextBox ID="TextBox9" runat="server" Text="0" class="form-control"></asp:TextBox>     
                                 </div>
                                <div class="col-md-1" >
                                    <label class="control-label">Jan</label>
                                     <asp:TextBox ID="TextBox10" runat="server" Text="0" class="form-control"></asp:TextBox>     
                                 </div>
                                <div class="col-md-1" >
                                    <label class="control-label">Feb</label>
                                     <asp:TextBox ID="TextBox11" runat="server" Text="0" class="form-control"></asp:TextBox>     
                                 </div>
                                <div class="col-md-1" >
                                    <label class="control-label">Mar</label>
                                     <asp:TextBox ID="TextBox12" runat="server" Text="0" class="form-control"></asp:TextBox>     
                                 </div>

                       
                    </div>
                            
                        </div>


                          <h4>Meetings Target</h4>
                        <div class="form-group">
                            <div class="row gutter">
                                 <div class="col-md-1" >
                                    <label class="control-label">Apr</label>
                                     <asp:TextBox ID="TextBox13" runat="server" Text="0" class="form-control"></asp:TextBox>          

                                 </div>
                             
                            <div class="col-md-1" >
                                    <label class="control-label">May</label>
                                     <asp:TextBox ID="TextBox14" runat="server" Text="0" class="form-control"></asp:TextBox>     
                                 </div>
                                <div class="col-md-1" >
                                    <label class="control-label">June</label>
                                     <asp:TextBox ID="TextBox15" runat="server" Text="0" class="form-control"></asp:TextBox>     
                                 </div>
                                <div class="col-md-1" >
                                    <label class="control-label">July</label>
                                     <asp:TextBox ID="TextBox16" runat="server" Text="0" class="form-control"></asp:TextBox>     
                                 </div>
                                <div class="col-md-1" >
                                    <label class="control-label">Aug</label>
                                     <asp:TextBox ID="TextBox17" runat="server" Text="0" class="form-control"></asp:TextBox>     
                                 </div>
                                <div class="col-md-1" >
                                    <label class="control-label">Sep</label>
                                     <asp:TextBox ID="TextBox18" runat="server" Text="0" class="form-control"></asp:TextBox>     
                                 </div>
                                <div class="col-md-1" >
                                    <label class="control-label">Oct</label>
                                     <asp:TextBox ID="TextBox19" runat="server" Text="0" class="form-control"></asp:TextBox>     
                                 </div>
                                <div class="col-md-1" >
                                    <label class="control-label">Nov</label>
                                     <asp:TextBox ID="TextBox20" runat="server" Text="0" class="form-control"></asp:TextBox>     
                                 </div>
                                <div class="col-md-1" >
                                    <label class="control-label">Dec</label>
                                     <asp:TextBox ID="TextBox21" runat="server" Text="0" class="form-control"></asp:TextBox>     
                                 </div>
                                <div class="col-md-1" >
                                    <label class="control-label">Jan</label>
                                     <asp:TextBox ID="TextBox22" runat="server" Text="0" class="form-control"></asp:TextBox>     
                                 </div>
                                <div class="col-md-1" >
                                    <label class="control-label">Feb</label>
                                     <asp:TextBox ID="TextBox23" runat="server" Text="0" class="form-control"></asp:TextBox>     
                                 </div>
                                <div class="col-md-1" >
                                    <label class="control-label">Mar</label>
                                     <asp:TextBox ID="TextBox24" runat="server" Text="0" class="form-control"></asp:TextBox>     
                                 </div>

                       
                    </div>
                            
                        </div>


                        <div class="form-group">
                            <div class="row gutter">
                                 <div class="col-md-1" >
                                   <label class="control-label">.</label><br />
                                     <asp:Button ID="Button3" runat="server" Text="Update" class="btn btn-info" OnClick="Button3_Click"  />           
                                     </div>

                            </div></div>
                                 </div>
                </div>
                        
                        </div></div>
        </div>
</asp:Content>

