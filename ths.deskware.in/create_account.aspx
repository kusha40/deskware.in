<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="create_account.aspx.cs" Inherits="create_account" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <link href="css/chosen.css" rel="stylesheet" />
    <style  type="text/css">
        
    .GridPager a, .GridPager span
    {
        display: block;
        height: 20px;
        width: 20px;
        /*font-weight: bold;*/
        text-align: center;
        text-decoration: none;
    }
    .GridPager a
    {
        background-color: #f5f5f5;
        color: #969696;
        border: 1px solid #969696;
    }
    .GridPager span
    {
        background-color: #A1DCF2;
        color: #000;
        border: 1px solid #3AC0F2;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
          <div class="alert alert-success col-lg-6" id="div1" runat="server" visible="false">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong>Success!</strong> <span id ="spn1" runat="server"></span> 
  </div>
     <div class="alert alert-danger col-lg-6" id="div2" runat="server" visible="false">
    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
    <strong>Danger!</strong> <span id ="spn2" runat="server"></span> 
  </div>

    <div class="row gutter">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            
            <div class="panel">
                <div class="panel-heading">
                    <h4>Create User Account</h4>

                </div>
                <div class="panel-body">
                
                        <div class="form-group">
                            <div class="row gutter">
                                <div class="col-md-3">
                                    <label class="control-label">Enter Email ID</label>
                                    <asp:TextBox ID="txtemailid" runat="server" class="form-control" placeholder="Enter Email ID"></asp:TextBox>
                                </div>
                                  <div class="col-md-3">
                                    <label class="control-label">Enter Name</label>
                                    <asp:TextBox ID="txtname" runat="server" class="form-control" placeholder="Enter Name"></asp:TextBox>
                                </div>
                                   <div class="col-md-3">
                                    <label class="control-label">Enter User ID</label>
                                    <asp:TextBox ID="txtuid" runat="server" class="form-control" placeholder="Enter User ID" ></asp:TextBox>
                                </div>
                                  <div class="col-md-3">
                                    <label class="control-label">Enter Password</label>
                                    <asp:TextBox ID="txtpwd" runat="server" class="form-control" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
                                </div>
                              

                            </div>

                        </div>
                              <div class="form-group">
                            <div class="row gutter">
                                <div class="col-md-4">
                                    <label class="control-label">Enter Mobile No.</label>
                                    <asp:TextBox ID="txtmob" runat="server" class="form-control" placeholder="Enter Mobile No."></asp:TextBox>
                                </div>
                                  <div class="col-md-4">
                                    <label class="control-label">Enter Designation</label>
                                    <asp:TextBox ID="txtdesignation" runat="server" class="form-control" placeholder="Enter Designation"></asp:TextBox>
                                </div>
                                  <div class="col-md-4">
                                    <label class="control-label">User Type</label>
                                      <asp:DropDownList ID="ddltype" runat="server" class="form-control chzn-select">
                                          <asp:ListItem>User</asp:ListItem>
                                          <asp:ListItem>Administrator</asp:ListItem>
                                         <asp:ListItem>Accounts</asp:ListItem>
                                      </asp:DropDownList>
                                        <script src="js/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript"> $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
                                </div>
                              

                            </div>

                        </div>
                    
                                     </div>

            </div>
             <asp:Button ID="Button1" runat="server" Text="Submit" class="btn btn-info" OnClick="Button1_Click" />

             <asp:Button ID="Button2" runat="server" Text="Reset" class="btn btn-default" OnClick="Button2_Click" /> 

            <asp:Button ID="Button3" runat="server" Text="View All" class="btn btn-danger" OnClick="Button3_Click" />

           <a class="btn btn-success" href="set_target.aspx">Set Target</a>

        </div>

        </div>
     <br />
     <div class="row gutter">
            <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
                <div class="panel panel-blue"><div class="panel-heading">
                    <h4>User Account Details</h4>

                                              </div>
                    <div class="panel-body">
                          <div class="form-group">
                            <div class="row gutter">
                             <div class="col-md-4">
                                    <label class="control-label">Search User ID</label>
                                      <asp:DropDownList ID="ddlemailid" runat="server" class="form-control chzn-select" AutoPostBack="True" OnSelectedIndexChanged="ddlemailid_SelectedIndexChanged">
                                      </asp:DropDownList>
                                        <script src="js/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript"> $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
                                </div></div></div>
                        <div class="table-responsive">
  
<asp:GridView ID="GridView1" runat="server" CssClass="table table-striped table-bordered no-margin" AutoGenerateColumns="False" OnRowUpdating="GridView1_RowUpdating" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" DataKeyNames="user_id" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging">
                                    <Columns>
                                      <asp:TemplateField HeaderText="Sr No.">
                            <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="User ID">
                                            <ItemTemplate>
                                                <asp:Label ID="Label6" runat="server" Text='<%# Bind("user_id") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Name">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("name") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Contact No.">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("contact_no") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Bind("contact_no") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Email ID">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("email_id") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Bind("email_id") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Password">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("password") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("password") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="User Type">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("type") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("type") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                              <asp:TemplateField HeaderText="Designation">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox51" runat="server" Text='<%# Bind("designation") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label51" runat="server" Text='<%# Bind("designation") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="Status">
                                            <EditItemTemplate>
                                                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("status") %>'></asp:TextBox>
                                            </EditItemTemplate>
                                            <ItemTemplate>
                                                <asp:Label ID="Label7" runat="server" Text='<%# Bind("status") %>'></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                          <asp:CommandField ShowEditButton="True"  >
                                        <ControlStyle ForeColor="#0066FF" />
                                        </asp:CommandField>
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
                        <PagerSettings Position="TopAndBottom" />
                                     <PagerStyle HorizontalAlign = "Left" CssClass ="GridPager"/>
                    </asp:GridView>	
                        </div>

                    </div></div>
                </div></div>

</asp:Content>

