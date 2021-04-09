<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="edit_lead.aspx.cs" Inherits="edit_lead" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row gutter">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            
            <div class="panel">
                <div class="panel-heading">
                    <h4>Edit Lead </h4>

                </div>
                <div class="panel-body">
                
                        <div class="form-group">
                            <div class="row gutter">
                                <div class="col-md-2">
                                    <label class="control-label">Lead ID </label>
                                   <asp:TextBox ID="txtcno" runat="server" ReadOnly="true" class="form-control" placeholder="Lead ID"></asp:TextBox>
                                </div>
                                <div class="col-md-2">
                                    <label class="control-label">Title </label>
                                   <asp:TextBox ID="txttitle" runat="server" class="form-control" placeholder="Title"></asp:TextBox>
                                </div>
                                  <div class="col-md-4">
                                    <label class="control-label">First Name </label>
                                   <asp:TextBox ID="txtfname" runat="server" class="form-control" placeholder="First Name"></asp:TextBox>
                                </div>
                                  <div class="col-md-4">
                                    <label class="control-label">Last Name </label>
                                   <asp:TextBox ID="txtlname" runat="server" class="form-control" placeholder="Last Name"></asp:TextBox>
                                </div>
                            </div>

                        </div>
                     <div class="form-group">
                            <div class="row gutter">
                                <div class="col-md-12">
                                    <label class="control-label">Address</label>
                                   <asp:TextBox ID="txtaddress" runat="server" class="form-control" placeholder="Address"></asp:TextBox>
                                </div></div></div>

                      <div class="form-group">
                            <div class="row gutter">
                                <div class="col-md-4">
                                    <label class="control-label">Town/City</label>
                                   <asp:TextBox ID="txttown" runat="server" class="form-control" placeholder="Town/City"></asp:TextBox>
                                </div>
                                <div class="col-md-4">
                                    <label class="control-label">Postcode</label>
                                   <asp:TextBox ID="txtpostcode" runat="server" class="form-control" placeholder="Postcode"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                    <label class="control-label">Email ID</label>
                                   <asp:TextBox ID="txtemail" runat="server" class="form-control" placeholder="Email ID"></asp:TextBox>
                                </div>
                                </div>


                            </div>
                    <div class="form-group">
                            <div class="row gutter">
                                <div class="col-md-4">
                                    <label class="control-label">Home Phone No.</label>
                                   <asp:TextBox ID="txtphone" runat="server" class="form-control" placeholder="Home Phone No."></asp:TextBox>
                                </div>
                                <div class="col-md-4">
                                    <label class="control-label">Mobile No.</label>
                                   <asp:TextBox ID="txtmobile" runat="server" class="form-control" placeholder="Mobile No." MaxLength="10"></asp:TextBox>
                                    </div>
                                    <div class="col-md-4">
                                    <label class="control-label">Work</label>
                                   <asp:TextBox ID="txtwork" runat="server" class="form-control" placeholder="Work"></asp:TextBox>
                                </div>
                                 </div>
                         </div>
                               <div class="form-group">
                            <div class="row gutter">
                                <div class="col-md-3">
                                    <label class="control-label">Product</label>
                                   <asp:DropDownList ID="DropDownList1" class="form-control"  runat="server"></asp:DropDownList>
                                </div>
                                 <div class="col-md-3">
                                    <label class="control-label">Lead Status</label>
                                   <asp:DropDownList ID="DropDownList2" class="form-control"  runat="server">
                                       <asp:ListItem>On going</asp:ListItem>
                                       <asp:ListItem>Rejected</asp:ListItem>
                                       <asp:ListItem>Converted</asp:ListItem>
                                     </asp:DropDownList>
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label">Lead Source</label>
                                   <asp:DropDownList ID="DropDownList3" class="form-control"  runat="server">
                                     </asp:DropDownList>
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label">Lead Type</label>
                                   <asp:DropDownList ID="DropDownList4" class="form-control"  runat="server">
                                     </asp:DropDownList>
                                </div>
                                </div></div>
                    


                          
                    </div></div></div>
        <asp:Button ID="Button1" runat="server" Text="Update" class="btn btn-info" OnClick="Button1_Click" />

    </div>
</asp:Content>

