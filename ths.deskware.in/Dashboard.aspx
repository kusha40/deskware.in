<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="Dashboard.aspx.cs" Inherits="Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="row gutter" >
        <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12" id="div1" runat="server"><div class="panel height2"><div class="panel-heading"><h4 style="font-size:12px">Leads </h4></div><div class="panel-body">
            
            <ul class="expenses">
     
             <li style="background-color:lightgray;padding:5px"><a href="total_lead.aspx" ><span class="expenses-icon red"><i class="icon-user2"></i> </span><span class="expenses-type">Total Leads</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <span class="expenses-amount text-default" id="Span2" runat="server">0</span></a></li>
    </ul>

            </div></div></div>
         <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12" id="div2" runat="server"><div class="panel height2"><div class="panel-heading"><h4 style="font-size:12px">Leads</h4></div><div class="panel-body">
            
            <ul class="expenses">
     
             <li style="background-color:#Cdde20;padding:5px"><a href="view_lead.aspx?id=c" target="_blank"><span class="expenses-icon red"><i class="icon-user2"></i> </span><span class="expenses-type">Converted</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <span class="expenses-amount text-default" id="Span1" runat="server">0</span></a></li>
                 <li style="background-color:#Cdde20;padding:5px"><a href="view_lead.aspx?id=o" target="_blank"><span class="expenses-icon red"><i class="icon-user2"></i> </span><span class="expenses-type">On Going</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <span class="expenses-amount text-default" id="Span4" runat="server">0</span></a></li>
                 <li style="background-color:#Cdde20;padding:5px"><a href="view_lead.aspx?id=r" target="_blank"><span class="expenses-icon red"><i class="icon-user2"></i> </span><span class="expenses-type">Rejected</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <span class="expenses-amount text-default" id="Span5" runat="server">0</span></a></li>
    </ul>

            </div></div></div>
         <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12" id="div3" runat="server"><div class="panel height2"><div class="panel-heading"><h4 style="font-size:12px">Follow up</h4></div><div class="panel-body">
            
            <ul class="expenses">
     
                      <li style="background-color:#89c541;padding:5px"><a href="today.aspx" target="_blank" ><span class="expenses-icon red"><i class="icon-bell3"></i> </span><span class="expenses-type">Today</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <span class="expenses-amount text-default" id="Span3" runat="server">0</span></a></li>
                 <li style="background-color:#89c541;padding:5px"><a href="pending.aspx" target="_blank"  ><span class="expenses-icon red"><i class="icon-bell3"></i> </span><span class="expenses-type">Pending</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <span class="expenses-amount text-default" id="Span6" runat="server">0</span></a></li>
                 <li style="background-color:#89c541;padding:5px"><a href="future.aspx" target="_blank"  ><span class="expenses-icon red"><i class="icon-bell3"></i> </span><span class="expenses-type">Future</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <span class="expenses-amount text-default" id="Span7" runat="server">0</span></a></li>
    </ul>

            </div></div></div>


   
        
 </div>
       <div class="row gutter" >
           <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12" id="div4" runat="server"><div class="panel height2"><div class="panel-heading"><h4 style="font-size:12px">Meeting Followups</h4></div><div class="panel-body">
            
            <ul class="expenses">
                   
     
                      <li style="background-color:#FFA07A;padding:5px"><a href="today_meeting.aspx" target="_blank" ><span class="expenses-icon red"><i class="icon-bell3"></i> </span><span class="expenses-type">Today</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <span class="expenses-amount text-default" id="Span8" runat="server">0</span></a></li>
                 <li style="background-color:#FFA07A;padding:5px"><a href="pending_meeting.aspx" target="_blank"  ><span class="expenses-icon red"><i class="icon-bell3"></i> </span><span class="expenses-type">Pending</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <span class="expenses-amount text-default" id="Span9" runat="server">0</span></a></li>
                 <li style="background-color:#FFA07A;padding:5px"><a href="future_meeting.aspx" target="_blank"  ><span class="expenses-icon red"><i class="icon-bell3"></i> </span><span class="expenses-type">Future</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <span class="expenses-amount text-default" id="Span10" runat="server">0</span></a></li>
    </ul>

            </div></div></div>
           <div class="col-lg-4 col-md-4 col-sm-12 col-xs-12" id="div5" runat="server"><div class="panel height2"><div class="panel-heading"><h4 style="font-size:12px">Meetings</h4></div><div class="panel-body">
                <ul class="expenses">
                    <li style="background-color:#F08080;padding:5px"><a href="total_meetings.aspx?id=1" ><span class="expenses-icon red"><i class="icon-user2"></i> </span><span class="expenses-type">Total Meetings</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <span class="expenses-amount text-default" id="Span11" runat="server">0</span></a></li>
                                <li style="background-color:#F08080;padding:5px"><a href="total_meetings.aspx?id=2" ><span class="expenses-icon red"><i class="icon-user2"></i> </span><span class="expenses-type">Meeting Done</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <span class="expenses-amount text-default" id="Span12" runat="server">0</span></a></li>
                                <li style="background-color:#F08080;padding:5px"><a href="total_meetings.aspx?id=3" ><span class="expenses-icon red"><i class="icon-user2"></i> </span><span class="expenses-type">Meeting Not Done</span> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <span class="expenses-amount text-default" id="Span13" runat="server">0</span></a></li>
                </ul>
               </div></div></div>
           </div>
     <div class="row gutter" >
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="div6" runat="server"><div class="panel height2"><div class="panel-heading"><h4 style="font-size:12px">Sales Target </h4></div><div class="panel-body">
               <div class="table-responsive">
            <asp:GridView ID="GridView1" class="table table-striped table-bordered no-margin" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnRowDataBound="GridView1_RowDataBound" OnPreRender="GridView1_PreRender" >
                                 <Columns>
                                 <asp:TemplateField HeaderText="Sr No.">
                            <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                                      <asp:TemplateField HeaderText="User">
                                          <ItemTemplate>
                                              <asp:Label ID="lbluser_id" runat="server" Text='<%# Bind("user_id") %>'></asp:Label>
                                          </ItemTemplate>
                                     </asp:TemplateField>
                                     <asp:BoundField DataField="year" HeaderText="Year" />
                                        <asp:TemplateField HeaderText="Apr(Target)">
                                            <ItemTemplate>
                                                <asp:Label ID="Label51" runat="server" Text='<%# Bind("m4", "{0:n2}") %>'></asp:Label>
                                            </ItemTemplate>
                                     </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Achived">
                                         <ItemTemplate>
                                             <asp:Label ID="Label1" runat="server" Text='0'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                        <asp:TemplateField HeaderText="May(Target)">
                                          
                                            <ItemTemplate>
                                                <asp:Label ID="Label52" runat="server" Text='<%# Bind("m5", "{0:n2}") %>'></asp:Label>
                                            </ItemTemplate>
                                     </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Achived">
                                         <ItemTemplate>
                                             <asp:Label ID="Label2" runat="server" Text='0'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                     <asp:TemplateField HeaderText="June(Target)">
                                   
                                         <ItemTemplate>
                                             <asp:Label ID="Label53" runat="server" Text='<%# Bind("m6", "{0:n2}") %>'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Achived">
                                         <ItemTemplate>
                                             <asp:Label ID="Label3" runat="server" Text='0'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                     <asp:TemplateField HeaderText="July(Target)">
                                      
                                         <ItemTemplate>
                                             <asp:Label ID="Label54" runat="server" Text='<%# Bind("m7", "{0:n2}") %>'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Achived">
                                         <ItemTemplate>
                                             <asp:Label ID="Label4" runat="server" Text='0'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Aug(Target)">
                                  
                                          <ItemTemplate>
                                              <asp:Label ID="Label55" runat="server" Text='<%# Bind("m8", "{0:n2}") %>'></asp:Label>
                                          </ItemTemplate>
                                     </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Achived">
                                         <ItemTemplate>
                                             <asp:Label ID="Label5" runat="server" Text='0'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Sep(Target)">
                                     
                                          <ItemTemplate>
                                              <asp:Label ID="Label56" runat="server" Text='<%# Bind("m9", "{0:n2}") %>'></asp:Label>
                                          </ItemTemplate>
                                     </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Achived">
                                         <ItemTemplate>
                                             <asp:Label ID="Label6" runat="server" Text='0'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Oct(Target)">
                                     
                                          <ItemTemplate>
                                              <asp:Label ID="Label57" runat="server" Text='<%# Bind("m10", "{0:n2}") %>'></asp:Label>
                                          </ItemTemplate>
                                     </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Achived">
                                         <ItemTemplate>
                                             <asp:Label ID="Label7" runat="server" Text='0'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                           <asp:TemplateField HeaderText="Nov(Target)">
                                         
                                               <ItemTemplate>
                                                   <asp:Label ID="Label58" runat="server" Text='<%# Bind("m11", "{0:n2}") %>'></asp:Label>
                                               </ItemTemplate>
                                     </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Achived">
                                         <ItemTemplate>
                                             <asp:Label ID="Label8" runat="server" Text='0'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Dec(Target)">
                                          
                                              <ItemTemplate>
                                                  <asp:Label ID="Label59" runat="server" Text='<%# Bind("m12", "{0:n2}") %>'></asp:Label>
                                              </ItemTemplate>
                                     </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Achived">
                                         <ItemTemplate>
                                             <asp:Label ID="Label9" runat="server" Text='0'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Jan(Target)">
                                          
                                                 <ItemTemplate>
                                                     <asp:Label ID="Label60" runat="server" Text='<%# Bind("m1", "{0:n2}") %>'></asp:Label>
                                                 </ItemTemplate>
                                     </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Achived">
                                         <ItemTemplate>
                                             <asp:Label ID="Label10" runat="server" Text='0'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Feb(Target)">
                                        
                                                 <ItemTemplate>
                                                     <asp:Label ID="Label61" runat="server" Text='<%# Bind("m2", "{0:n2}") %>'></asp:Label>
                                                 </ItemTemplate>
                                     </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Achived">
                                         <ItemTemplate>
                                             <asp:Label ID="Label11" runat="server" Text='0'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Mar(Target)">
                                             
                                                 <ItemTemplate>
                                                     <asp:Label ID="Label62" runat="server" Text='<%# Bind("m3", "{0:n2}") %>'></asp:Label>
                                                 </ItemTemplate>
                                     </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Achived">
                                         <ItemTemplate>
                                             <asp:Label ID="Label12" runat="server" Text='0'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Total Target">
                                         <ItemTemplate>
                                             <asp:Label ID="lbltarget" runat="server" Text='0'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                           <asp:TemplateField HeaderText="Total Achived">
                                         <ItemTemplate>
                                             <asp:Label ID="lblachived" runat="server" Text='0'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                     <asp:TemplateField HeaderText="Balance">
                                         <ItemTemplate>
                                             <asp:Label ID="lblbalance" runat="server" Text='0'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
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
            </div></div></div></div></div>
      <div class="row gutter" >
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" id="div7" runat="server"><div class="panel height2"><div class="panel-heading"><h4 style="font-size:12px">Meetings Target </h4></div><div class="panel-body">
               <div class="table-responsive">
            <asp:GridView ID="GridView2" class="table table-striped table-bordered no-margin" runat="server" AutoGenerateColumns="False" AllowPaging="True" OnRowDataBound="GridView2_RowDataBound" OnPreRender="GridView2_PreRender" >
                                 <Columns>
                                 <asp:TemplateField HeaderText="Sr No.">
                            <ItemTemplate>
                                <%#Container .DataItemIndex +1 %>
                                <br />
                            </ItemTemplate>
                        </asp:TemplateField>
                                    <asp:TemplateField HeaderText="User">
                                          <ItemTemplate>
                                              <asp:Label ID="lbluser_id1" runat="server" Text='<%# Bind("user_id") %>'></asp:Label>
                                          </ItemTemplate>
                                     </asp:TemplateField>
                                     <asp:BoundField DataField="year" HeaderText="Year" />
                                        <asp:TemplateField HeaderText="Apr(Target)">
                                         
                                            <ItemTemplate>
                                                <asp:Label ID="Label71" runat="server" Text='<%# Bind("m4", "{0:n0}") %>'></asp:Label>
                                            </ItemTemplate>
                                     </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Achived">
                                         <ItemTemplate>
                                             <asp:Label ID="Label13" runat="server" Text='0'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                        <asp:TemplateField HeaderText="May(Target)">
                                        
                                            <ItemTemplate>
                                                <asp:Label ID="Label72" runat="server" Text='<%# Bind("m5", "{0:n0}") %>'></asp:Label>
                                            </ItemTemplate>
                                     </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Achived">
                                         <ItemTemplate>
                                             <asp:Label ID="Label14" runat="server" Text='0'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                     <asp:TemplateField HeaderText="June(Target)">
                                    
                                         <ItemTemplate>
                                             <asp:Label ID="Label73" runat="server" Text='<%# Bind("m6", "{0:n0}") %>'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Achived">
                                         <ItemTemplate>
                                             <asp:Label ID="Label15" runat="server" Text='0'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                     <asp:TemplateField HeaderText="July(Target)">
                                     
                                         <ItemTemplate>
                                             <asp:Label ID="Label74" runat="server" Text='<%# Bind("m7", "{0:n0}") %>'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Achived">
                                         <ItemTemplate>
                                             <asp:Label ID="Label16" runat="server" Text='0'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Aug(Target)">
                                      
                                          <ItemTemplate>
                                              <asp:Label ID="Label75" runat="server" Text='<%# Bind("m8", "{0:n0}") %>'></asp:Label>
                                          </ItemTemplate>
                                     </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Achived">
                                         <ItemTemplate>
                                             <asp:Label ID="Label17" runat="server" Text='0'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Sep(Target)">
                                   
                                          <ItemTemplate>
                                              <asp:Label ID="Label76" runat="server" Text='<%# Bind("m9", "{0:n0}") %>'></asp:Label>
                                          </ItemTemplate>
                                     </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Achived">
                                         <ItemTemplate>
                                             <asp:Label ID="Label18" runat="server" Text='0'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Oct(Target)">
                                    
                                          <ItemTemplate>
                                              <asp:Label ID="Label77" runat="server" Text='<%# Bind("m10", "{0:n0}") %>'></asp:Label>
                                          </ItemTemplate>
                                     </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Achived">
                                         <ItemTemplate>
                                             <asp:Label ID="Label19" runat="server" Text='0'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                           <asp:TemplateField HeaderText="Nov(Target)">
                                               
                                               <ItemTemplate>
                                                   <asp:Label ID="Label78" runat="server" Text='<%# Bind("m11", "{0:n0}") %>'></asp:Label>
                                               </ItemTemplate>
                                     </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Achived">
                                         <ItemTemplate>
                                             <asp:Label ID="Label20" runat="server" Text='0'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Dec(Target)">
                                             
                                              <ItemTemplate>
                                                  <asp:Label ID="Label79" runat="server" Text='<%# Bind("m12", "{0:n0}") %>'></asp:Label>
                                              </ItemTemplate>
                                     </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Achived">
                                         <ItemTemplate>
                                             <asp:Label ID="Label21" runat="server" Text='0'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Jan(Target)">
                                            
                                                 <ItemTemplate>
                                                     <asp:Label ID="Label80" runat="server" Text='<%# Bind("m1", "{0:n0}") %>'></asp:Label>
                                                 </ItemTemplate>
                                     </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Achived">
                                         <ItemTemplate>
                                             <asp:Label ID="Label22" runat="server" Text='0'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Feb(Target)">
                                             
                                                 <ItemTemplate>
                                                     <asp:Label ID="Label81" runat="server" Text='<%# Bind("m2", "{0:n0}") %>'></asp:Label>
                                                 </ItemTemplate>
                                     </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Achived">
                                         <ItemTemplate>
                                             <asp:Label ID="Label23" runat="server" Text='0'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                             <asp:TemplateField HeaderText="Mar(Target)">
                                              
                                                 <ItemTemplate>
                                                     <asp:Label ID="Label82" runat="server" Text='<%# Bind("m3", "{0:n0}") %>'></asp:Label>
                                                 </ItemTemplate>
                                     </asp:TemplateField>
                                          <asp:TemplateField HeaderText="Achived">
                                         <ItemTemplate>
                                             <asp:Label ID="Label24" runat="server" Text='0'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                       <asp:TemplateField HeaderText="Total Target">
                                         <ItemTemplate>
                                             <asp:Label ID="lbltarget1" runat="server" Text='0'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                           <asp:TemplateField HeaderText="Total Achived">
                                         <ItemTemplate>
                                             <asp:Label ID="lblachived1" runat="server" Text='0'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
                                      <asp:TemplateField HeaderText="Balance">
                                         <ItemTemplate>
                                             <asp:Label ID="lblbalance1" runat="server" Text='0'></asp:Label>
                                         </ItemTemplate>
                                     </asp:TemplateField>
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
            </div></div></div></div></div>
    
   


 
</asp:Content>

