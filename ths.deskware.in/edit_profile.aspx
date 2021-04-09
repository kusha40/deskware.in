<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="edit_profile.aspx.cs" Inherits="edit_profile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <div class="alert alert-success col-lg-6" id="div1" runat="server" visible="false">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong>Success!</strong> <span id ="spn1" runat="server"></span> 
  </div>
    <div class="row gutter">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            
            <div class="panel">
                <div class="panel-heading">
                    <h4>Edit User Profile</h4>

                </div>
                <div class="panel-body">
                  
                   <div class="panel-body"><div class="user-profile clearfix"><div class="user-img"><img id="img" runat="server" src="img/thumbs/user7.png" alt="User Info"> </div></div>
                       </div>
                        <div class="form-group">
                            <div class="row gutter">
                                <div class="col-md-3">
                                    <label class="control-label">Email ID</label>
                                       <asp:RegularExpressionValidator ID="RegularExpressionValidator5" runat="server"  ErrorMessage="Invaild Email ID" ControlToValidate="txtemailid" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                    <asp:TextBox ID="txtemailid" runat="server" class="form-control" placeholder="Email ID" ></asp:TextBox>
                                </div>
                                  <div class="col-md-3">
                                    <label class="control-label">Name</label>
                                    <asp:TextBox ID="txtname" runat="server" class="form-control" placeholder="Name"></asp:TextBox>
                                </div>
                                    <div class="col-md-3">
                                    <label class="control-label">User ID</label>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage=" * User ID" ForeColor="Red" ControlToValidate="txtuid"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtuid" runat="server" class="form-control" ReadOnly="true" placeholder="User ID" ></asp:TextBox>
                                </div>
                                  <div class="col-md-3">
                                    <label class="control-label">Password</label>
                                         <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage=" * Password" ForeColor="Red" ControlToValidate="txtpwd"></asp:RequiredFieldValidator>
                                    <asp:TextBox ID="txtpwd" runat="server" class="form-control" ReadOnly="true" placeholder="Password"></asp:TextBox>
                                </div>
                              

                            </div>

                        </div>
                              <div class="form-group">
                            <div class="row gutter">
                                <div class="col-md-3">
                                    <label class="control-label">Mobile No.</label>
                                           <asp:RegularExpressionValidator ID="RegularExpressionValidator6" runat="server" ValidationExpression="^[0-9]{10,10}$" ErrorMessage=" Invalid Mob.No." ControlToValidate="txtmob" ForeColor="Red"></asp:RegularExpressionValidator>
                                    <asp:TextBox ID="txtmob" runat="server" class="form-control" placeholder="Mobile No." MaxLength="10"
                                        ></asp:TextBox>
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label">Base Location</label>
                                    <asp:TextBox ID="txtbaselocation" runat="server" class="form-control" placeholder="Designation"></asp:TextBox>
                                </div>
                                  <div class="col-md-3">
                                    <label class="control-label">Designation</label>
                                    <asp:TextBox ID="txtdesig" runat="server" class="form-control" placeholder="Designation"></asp:TextBox>
                                </div>
                                  <div class="col-md-3">
                                    <label class="control-label">Upload Profile Image</label>
                                      <asp:FileUpload ID="FileUpload1" runat="server" class="form-control" />
                                      <asp:Label ID="Label1" runat="server" Text="Label" Visible="false"></asp:Label>
                                </div>
                              

                            </div>

                        </div>
                                            
                    
                                     </div>

            </div>

            
              <asp:Button ID="Button1" runat="server" Text="Submit" class="btn btn-info" OnClick="Button1_Click" />

             <asp:Button ID="Button2" runat="server" Text="Reset" class="btn btn-info" CausesValidation="false" />
        </div>

        </div>
</asp:Content>

