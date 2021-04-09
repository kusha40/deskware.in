<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="cheque_entry.aspx.cs" Inherits="cheque_entry" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
            .chkbox1 label
    {
    margin-right: 5px;
    background-color: #2EBDE7;
    color: white;
    padding: 5px;
     width: auto;
    border-radius: 3px;
        border:1px solid #929292;
   } 

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="row">
                <div class="col-md-10">
                    <div class="padding-md">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                Cash IN</div>
                            <div class="panel-body">
                                <div class="tab-content">
                                    <div class="col-md-10 table-responsive">
                                    
                     <div class="form-group ">
					                                &nbsp;<asp:RadioButtonList ID="rbntype" runat="server" class="form-control" RepeatDirection="Horizontal" CssClass="chkbox1">
                     <asp:ListItem Selected="True">Dealer</asp:ListItem>
                     <%--<asp:ListItem>Company</asp:ListItem>
                     <asp:ListItem>Driver</asp:ListItem>
                     <asp:ListItem>Daily Labour</asp:ListItem>
                     <asp:ListItem>Trolla Labour</asp:ListItem>--%>
                                                    </asp:RadioButtonList>
					
				</div>
                                      
                                        </div>

                                </div>

                            </div>

                            <div class="panel-footer">
                                		<asp:Button ID="btnsubmit" runat="server" Text="Submit" class="btn btn-success btn-sm " OnClick="btnsubmit_Click"  />
                     </div>
                        </div>

                    </div>

                </div>
             
         </div>
      
    </asp:Content>







