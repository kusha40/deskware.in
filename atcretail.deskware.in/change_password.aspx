<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="change_password.aspx.cs" Inherits="change_password" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="row">
                <div class="col-md-10">
                    <div class="padding-md">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                Change Password  
                            </div>
                            <div class="panel-body">
                                <div class="tab-content">
                                    <div class="col-md-10 table-responsive">
                                        <form>
				
				<div class="form-group col-lg-12">
					<label>Current Password</label>
                    <asp:TextBox ID="txtcurrent" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
				</div>
				
				<div class="form-group col-lg-6">
					<label>New Password</label>
					   <asp:TextBox ID="txtnewpassword" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
				</div>
				
				<div class="form-group col-lg-6">
					<label>Confirm Password</label>
					   <asp:TextBox ID="txtconfirmpassword" class="form-control" runat="server" TextMode="Password"></asp:TextBox>
				</div>
				</form></div></div></div>
                             <div class="panel-footer">
					  <asp:Button ID="btnupdate" runat="server" Text="Update" class="btn btn-success btn-sm " OnClick="btnupdate_Click"  />		
			 </div>
			</div>
		
		</div>
		</div>
	
</div>
</asp:Content>

