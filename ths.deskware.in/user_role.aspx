<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="user_role.aspx.cs" Inherits="user_role" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link href="css/chosen.css" rel="stylesheet" />
 <style type="text/css">
           .chkbox1 label
    {
    margin-right: 5px;
    background-color: #2EBDE7;
    color: white;
    padding: 5px;
    width: 200px;
    border-radius: 3px;
        border:1px solid #929292;
   } 
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="row gutter">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            
            <div class="panel">
                <div class="panel-heading">
                    <h4>Create User Role</h4>

                </div>
                <div class="panel-body">
                                 <div class="form-group">
                            <div class="row gutter">

                                <div class="col-md-6">
                                    <label class="control-label">Select User </label>
                                   <asp:DropDownList ID="ddlSelectUser" runat="server" class="form-control chzn-select" AppendDataBoundItems="true" ></asp:DropDownList>
                                     <script src="js/chosen.jquery.js" type="text/javascript"></script>
		<script type="text/javascript"> $(".chzn-select").chosen(); $(".chzn-select-deselect").chosen({ allow_single_deselect: true }); </script>
                                </div>
                                <div class="col-md-1">
                                    <label class="control-label">.</label><br />
                                 <asp:Button ID="Button3" runat="server" Text="View" class="btn btn-danger"  CausesValidation="false" OnClick="Button3_Click"  /> 
                                     </div>
                                </div>



                                 </div>
                        <div class="form-group">
                            <div class="row gutter">
                                 <div class="col-md-12">
                                    <label class="control-label">Select Role </label><br /><br />
                                      <asp:CheckBoxList ID="checkSelectMenu" runat="server" RepeatColumns="5" RepeatDirection="Horizontal" CssClass="chkbox1" >
                                     </asp:CheckBoxList>
                                </div>

</div>
                        </div>
                     <asp:Button ID="Button1" runat="server" Text="Update" class="btn btn-info"  CausesValidation="false" OnClick="Button1_Click"   />

                </div>
               
            </div></div></div>
</asp:Content>

