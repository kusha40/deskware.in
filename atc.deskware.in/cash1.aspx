<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="cash1.aspx.cs" Inherits="cash1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="row">
                <div class="col-lg-10">
                    <div class="padding-md">
                        <div class="panel panel-info">
                            <div class="panel-heading">
                                Issue Cash Challan</div>
                            <div class="panel-body">
                                <div class="tab-content">
                                    <iframe id="myIframe" src="issue_cash_challan_new.aspx" height="700px" width="635px"></iframe>
                                       </div>

                            </div>
                        </div>

                    </div>

                </div>
             
         </div>
</asp:Content>

