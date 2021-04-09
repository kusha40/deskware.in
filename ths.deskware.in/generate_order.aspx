<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="generate_order.aspx.cs" Inherits="generate_order" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row gutter">
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            
            <div class="panel">
                <div class="panel-heading">
                    <h4>Generate Order </h4>
                    
                </div>
                <div class="panel-body">
                
                        <div class="form-group">
                            <div class="row gutter">
                                <div class="col-md-2">
                                    <label class="control-label">Lead ID </label>
                                   <asp:TextBox ID="txtcno" runat="server" ReadOnly="true" class="form-control" placeholder="Lead ID"></asp:TextBox>
                                </div>
                                <div class="col-md-4">
                                    <label class="control-label">Name </label>
                                   <asp:TextBox ID="txttitle" runat="server" class="form-control" placeholder="Title"></asp:TextBox>
                                </div>
                                  <div class="col-md-6">
                                    <label class="control-label">Address</label>
                                   <asp:TextBox ID="txtaddress" runat="server" class="form-control" placeholder="Address"></asp:TextBox>
                                </div>
                                  
                            </div>

                        </div>

                      <div class="form-group">
                            <div class="row gutter">
                                <div class="col-md-3">
                                    <label class="control-label">Town/City</label>
                                   <asp:TextBox ID="txttown" runat="server" class="form-control" placeholder="Town/City"></asp:TextBox>
                                </div>
                                <div class="col-md-3">
                                    <label class="control-label">Postcode</label>
                                   <asp:TextBox ID="txtpostcode" runat="server" class="form-control" placeholder="Postcode"></asp:TextBox>
                                    </div>
                                    <div class="col-md-3">
                                    <label class="control-label">Email ID</label>
                                   <asp:TextBox ID="txtemail" runat="server" class="form-control" placeholder="Email ID"></asp:TextBox>
                                </div>
                                 <div class="col-md-3">
                                    <label class="control-label">Mobile No.</label>
                                   <asp:TextBox ID="txtmobile" runat="server" class="form-control" placeholder="Mobile No."></asp:TextBox>
                                    </div>
                                </div>


                            </div>
                    <div class="form-group">
                            <div class="row gutter">
                                 <div class="col-md-12">
                                    <label class="control-label">Product Desc</label>
                                   <asp:TextBox ID="TextBox18" runat="server" class="form-control" TextMode="MultiLine"></asp:TextBox>
                                </div>
                                </div></div>
                               <div class="form-group">
                            <div class="row gutter">
                                <div class="col-md-3">
                                    <label class="control-label">Product</label>
                                   <asp:DropDownList ID="DropDownList1" class="form-control"  runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
                                </div>
                                 <div class="col-md-2">
                                    <label class="control-label">Price</label>
                                 <asp:TextBox ID="TextBox1" runat="server" class="form-control" text="0"></asp:TextBox>
                                </div>
                                 <div class="col-md-1">
                                    <label class="control-label">Qty</label>
                                   <asp:TextBox ID="TextBox2" runat="server" class="form-control" text="0"></asp:TextBox>
                                </div>
                                <div class="col-md-1">
                                    <label class="control-label">Discount %</label>
                                   <asp:TextBox ID="TextBox3" runat="server" class="form-control" text="0"></asp:TextBox>
                                </div>
                                 <div class="col-md-1">
                                    <label class="control-label">Tax %</label>
                                   <asp:TextBox ID="TextBox5" runat="server" class="form-control" text="0"></asp:TextBox>
                                </div>
                                  <div class="col-md-2">
                                    <label class="control-label">Subsidy (Rs.)</label>
                                   <asp:TextBox ID="TextBox19" runat="server" class="form-control" text="0"></asp:TextBox>
                                </div>
                              
                               
                                 <div class="col-md-2">
                                    <label class="control-label">Total Amount</label>
                                   <asp:TextBox ID="TextBox4" runat="server" class="form-control" text="0" ReadOnly="true"></asp:TextBox>
                                </div>
                                </div></div>
                         
                     <div class="form-group">
                            <div class="row gutter">
                                <div class="col-md-2">
                                    <label class="control-label">Discount Amount</label>
                                   <asp:TextBox ID="TextBox15" runat="server" class="form-control" text="0" ReadOnly="true"></asp:TextBox>
                                </div>
                                   <div class="col-md-2">
                                    <label class="control-label">Tax Amount</label>
                                   <asp:TextBox ID="TextBox10" runat="server" class="form-control" text="0" ReadOnly="true"></asp:TextBox>
                                </div>
                                 <div class="col-md-2">
                                    <label class="control-label">Grand Total</label>
                                   <asp:TextBox ID="TextBox11" runat="server" class="form-control" text="0" ReadOnly="true"></asp:TextBox>
                                </div>
                                  <div class="col-md-4">
                                    <label class="control-label">Amount In Words</label>
                                   <asp:TextBox ID="TextBox12" runat="server" class="form-control"  ReadOnly="true"></asp:TextBox>
                                </div>
                                <div class="col-md-1">
                                    <label class="control-label">Order No.</label>
                                   <asp:TextBox ID="TextBox16" runat="server" class="form-control"  ReadOnly="true"></asp:TextBox>
                                </div>
                                </div>

                     </div>
                     <div class="form-group">
                            <div class="row gutter">
                                 <div class="col-md-2">
                                    <label class="control-label">Due on Purchase  / Sales Order</label>
                                     <asp:TextBox ID="Label1" runat="server" Text="0" ForeColor="Chocolate" Font-Bold="true" Width="30px"></asp:TextBox>%
                                   <asp:TextBox ID="TextBox6" runat="server" class="form-control" text="0" ReadOnly="true"></asp:TextBox>
                                </div>
                                <div class="col-md-2">
                                    <label class="control-label">Due on Completion of Structure</label>
                                    <asp:TextBox ID="Label2" runat="server" Text="0" ForeColor="Chocolate" Font-Bold="true" Width="30px"></asp:TextBox>%
                                   <asp:TextBox ID="TextBox7" runat="server" class="form-control" text="0" ReadOnly="true"></asp:TextBox>
                                </div>
                                  <div class="col-md-2">
                                    <label class="control-label">
Due against Delivery of Material </label>
                                      <asp:TextBox ID="Label3" runat="server" Text="0" ForeColor="Chocolate" Font-Bold="true" Width="30px"></asp:TextBox>%
                                   <asp:TextBox ID="TextBox8" runat="server" class="form-control" text="0" ReadOnly="true"></asp:TextBox>
                                </div>
                                <div class="col-md-2">
                                    <label class="control-label">
Due after testing commissioning & handing over</label>
                                    <asp:TextBox ID="Label4" runat="server" Text="0" ForeColor="Chocolate" Font-Bold="true" Width="30px"></asp:TextBox>%
                                   <asp:TextBox ID="TextBox9" runat="server" class="form-control" text="0" ReadOnly="true"></asp:TextBox>
                                </div>
                                   <div class="col-md-1">
                                    <label class="control-label">.</label><br />
                                   <asp:Button ID="Button3" runat="server" Text="Calc" class="btn btn-danger" OnClick="Button3_Click"   /> 
                                </div>
                                </div>

                     </div>
                   
                     <div class="form-group">
                            <div class="row gutter">
                               <div class="col-md-2">
                                    <label class="control-label">Advance</label>
                                   <asp:TextBox ID="TextBox13" runat="server" class="form-control" text="0" AutoPostBack="True" OnTextChanged="TextBox13_TextChanged"></asp:TextBox>
                                </div>
                                  <div class="col-md-2">
                                    <label class="control-label">Balance</label>
                                   <asp:TextBox ID="TextBox14" runat="server" class="form-control" text="0" ReadOnly="true"></asp:TextBox>
                                        <asp:TextBox ID="TextBox17" runat="server" class="form-control" visible="false" ReadOnly="true"></asp:TextBox>
                                </div>
                                  <div class="col-md-6">
                                    <label class="control-label">Payment Remarks</label>
                                   <asp:TextBox ID="TextBox20" runat="server" class="form-control" ></asp:TextBox>
                                </div>
                                </div>

                     </div>
                    </div></div></div>
        <asp:Button ID="Button1" runat="server" Text="Generate" class="btn btn-info" OnClick="Button1_Click"  />

    </div>
</asp:Content>


