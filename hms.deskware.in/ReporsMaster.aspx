<%@ Page Title="" Language="C#" MasterPageFile="~/site.master" AutoEventWireup="true" CodeFile="ReporsMaster.aspx.cs" Inherits="ReporsMaster" MaintainScrollPositionOnPostback="true" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .auto-style1 {
            height: 23px;
        }
        .auto-style2 {
            height: 54px;
        }
    </style>
     <%-- <link rel="stylesheet" href="http://code.jquery.com/ui/1.10.3/themes/smoothness/jquery-ui.css" />
    <script type="text/javascript" src="http://code.jquery.com/jquery-1.9.1.js"></script>
    <script type="text/javascript" src="http://code.jquery.com/ui/1.10.3/jquery-ui.js"></script>--%>
    
    <link rel="stylesheet"  href="JS/jquery-ui.css" />
    <script type="text/javascript" src="JS/jquery-1.9.1.js"></script>
    <script type="text/javascript"  src="JS/jquery-ui.js"></script>

    <script type="text/javascript">
        $(function () {
            $(".date").datepicker({
                changeMonth: true,
                changeYear: true
            });
            //$(".date").datepicker('setDate', new Date());
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
  
        <div runat="server" id="div2" >
    

        <table cellpadding="5" cellspacing="5">
            <tr  >
                <td class="listtitle"  colspan="6" style="width:800px" >School  Details</td>
            </tr>
            <tr>
                <td>Select Session :</td>
                <td class="list">
                    <asp:DropDownList ID="ddlsession" class="inset" runat="server" >
                    </asp:DropDownList>

                      <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" InitialValue="Select"
        ControlToValidate="ddlsession" Display="Dynamic" ForeColor="Red"  ErrorMessage="Select School" ValidationGroup="a">*</asp:RequiredFieldValidator> 

                </td>
                <td class="list">
                    Select School :</td>
                <td class="list">
                    <asp:DropDownList ID="ddlschoolname" class="inset" runat="server" AutoPostBack="True"    OnSelectedIndexChanged="ddlschoolname_SelectedIndexChanged">
                    </asp:DropDownList>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" InitialValue="Select"
        ControlToValidate="ddlschoolname" Display="Dynamic" ForeColor="Red"  ErrorMessage="Select School" ValidationGroup="a">*</asp:RequiredFieldValidator> 

                </td>
                <td class="list">
                    Select Class :</td>
                <td class="list">
                    <asp:DropDownList ID="ddlClass" class="inset" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ddlClass_SelectedIndexChanged">
                    </asp:DropDownList>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" InitialValue="Select"
        ControlToValidate="ddlClass" Display="Dynamic" ForeColor="Red"  ErrorMessage="Select School" ValidationGroup="a">*</asp:RequiredFieldValidator> 

                </td>
            </tr>
            <tr>
             <%--   <td class="listtitle" align="right" colspan="6">
                    <asp:Button ID="btnOK" runat="server"  ValidationGroup="a" OnClick="btnOK_Click" Text="Submit" />
                </td>--%>
            </tr>
        </table>
    </div>
        <br />
        <br />

        <div runat="server" id="div1" visible="true">
            <table>
               
            </table>
        <table>
              <tr>
                    <td colspan="5">DATE OF EXAMINATION&nbsp;
                    <asp:TextBox ID="TextBox30" runat="server" class="date"></asp:TextBox>
                    </td>
                </tr>
              <tr>
                    <td colspan="2"><h3>School Name : <asp:Literal ID="ltrSchool" runat="server" ></asp:Literal></h3></td>
                    <td colspan="2"><h3>Session : <asp:Literal ID="ltrsession" runat="server" ></asp:Literal></h3></td>
                    <td><h3>Classs : <asp:Literal ID="ltrClass" runat="server" ></asp:Literal></h3></td>
                </tr>
            <tr>
                <td class="listtitle" style="width:800px"  colspan="5">PERSONAL INFORMATION</td>
            </tr>
           
            <tr>
                <td>NAME
                </td>
                <td>FATHER&#39;S&nbsp; NAME
                </td>
                <td>CLASS
                </td>
                <td> UNQUE ID
                </td>
                
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox></td>
                <td class="auto-style1">
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
                <td class="auto-style1">
                    <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox></td>
                <td class="auto-style1">
                    <asp:TextBox ID="TextBox4" runat="server" ReadOnly="True"></asp:TextBox></td>
                
            </tr>

             
            <tr>
                <td>DOB
                    (mm/dd/yyyy)</td>
                <td> AGE
                </td>
                <td>GENDER</td>
                <td>BLOOD GROUP
                </td>
                
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="TextBox20" runat="server" class="date" AutoPostBack="True" OnTextChanged="TextBox20_TextChanged"></asp:TextBox>
                </td>
                <td>
                    <asp:TextBox ID="TextBox21" runat="server"></asp:TextBox></td>
                <td>
                    <asp:DropDownList ID="DropDownList3" runat="server">
                        <asp:ListItem>M</asp:ListItem>
                        <asp:ListItem>F</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:TextBox ID="TextBox23" runat="server">-</asp:TextBox></td>
              
            </tr>


        </table> <br />
        <br />
        <table >
            <tr>
                <td class="listtitle" style="width:800px" colspan="5">PHYSICAL MEASURMENT</td>
            </tr>
            <tr>
                <td>HEIGHT (IN CM.)
                </td>
                <td>WEIGHT (IN KG.)
                </td>
                <td>B.M.I.      
                </td>
                <td>OBESITY LEVEL
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="TextBox5" runat="server" AutoPostBack="True" OnTextChanged="TextBox5_TextChanged"></asp:TextBox></td>
                <td>
                    <asp:TextBox ID="TextBox6" runat="server" AutoPostBack="True" OnTextChanged="TextBox6_TextChanged"></asp:TextBox></td>
                <td>
                    <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox></td>
                <td>
                    <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox></td>
            </tr>
        </table> <br />
        <br />

        <table>
              <tr>
                <td class="listtitle" style="width:800px"  colspan="6">GROWTH ANALYSIS</td>
            </tr>
            <tr>
                <td colspan="4">IDEL HEIGHT FOR THIS AGE SHOULD BE</td>
                <td>
                    <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="4">DEVIATION FROM THE IDEAL HEIGHT IS -</td>
                <td>
                    <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    DEVIATION UPTO +/-10 % IS CONSIDERED AS NORMAL
                </td>
            </tr>
        </table>
         <br />
        <br />
        <table>
            <tr>
                <td class="listtitle" style="width:800px"  colspan="5">EYE SIGHT WITHOUT SPECTS</td>
            </tr>
            <tr>
                <td colspan="2">DISTANT VISION 



                </td>
                <td colspan="2">NEAR VISION
                </td>
                <td rowspan="4">
                       <asp:CheckBoxList ID="CheckBoxList4"  RepeatColumns="2" runat="server" >
                        <asp:ListItem>CB </asp:ListItem>
                        <asp:ListItem>SQUINT</asp:ListItem>
                        <asp:ListItem Selected="True">NAD</asp:ListItem>
                        <asp:ListItem>OTHERS</asp:ListItem>
                    </asp:CheckBoxList></td>


            </tr>
            <tr>
                <td >RT</td>
                <td >LT</td>
                  <td >RT</td>
                <td >LT</td>
            </tr>
            <tr>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>6/6</asp:ListItem>
                        <asp:ListItem>6/9</asp:ListItem>
                        <asp:ListItem>6/12</asp:ListItem>
                        <asp:ListItem>6/18</asp:ListItem>
                        <asp:ListItem>6/24</asp:ListItem>
                        <asp:ListItem>6/36</asp:ListItem>
                        <asp:ListItem>6/60</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:DropDownList ID="DropDownList2" runat="server">
                        <asp:ListItem>6/6</asp:ListItem>
                        <asp:ListItem>6/9</asp:ListItem>
                        <asp:ListItem>6/12</asp:ListItem>
                        <asp:ListItem>6/18</asp:ListItem>
                        <asp:ListItem>6/24</asp:ListItem>
                        <asp:ListItem>6/36</asp:ListItem>
                        <asp:ListItem>6/60</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:TextBox ID="TextBox13" runat="server">N6</asp:TextBox></td>
                <td>
                    <asp:TextBox ID="TextBox14" runat="server">N6</asp:TextBox></td>
            </tr>
            <tr>
                <td colspan="4">
                    <asp:TextBox ID="TextBox32" Width="500px"  TextMode="MultiLine" placeholder="OTHERS" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
 <br />
        <br />
        <table>

            <tr>
                <td class="listtitle" style="width:800px">DENTAL CHECK UP</td>

            </tr>
            <tr>
                <td>
                    <asp:CheckBoxList ID="CheckBoxList1"  RepeatColumns="4" runat="server">
                        <asp:ListItem>CARIES PRESENT NEED TREATMENT </asp:ListItem>
                        <asp:ListItem Selected="True">GOOD ORAL HYGIENE</asp:ListItem>
                        <asp:ListItem>CALCULUS PRESENT</asp:ListItem>
                            <asp:ListItem>ORTHO TREATMENT REQUIRED</asp:ListItem>
                    </asp:CheckBoxList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="TextBox28" Width="500px"  TextMode="MultiLine" placeholder="OTHERS" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
        <br />

        <table>

            <tr>
                <td class="listtitle" style="width:800px">PERSONAL HYGIENE & IMMUNISATION</td>

            </tr>
            <tr>
                <td>
                    <asp:CheckBoxList ID="CheckBoxList2" RepeatColumns="4" runat="server">
                        <asp:ListItem Selected="True">BCG SEEN</asp:ListItem>
                        <asp:ListItem>BCG NOT SEEN</asp:ListItem>
                        <asp:ListItem Selected="True">HYGIENE GOOD</asp:ListItem>
                        <asp:ListItem>HYGIENE NOT GOOD</asp:ListItem>
                    </asp:CheckBoxList>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="TextBox31" Width="500px"  TextMode="MultiLine" PLACEHOLDER="OTHERS" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>

        <br />



        <table>

            <tr>
                <td class="listtitle" style="width:800px">OBSSERVATION AND IMPORTANT FINDINGS</td>
                <td></td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:CheckBoxList ID="CheckBoxList5" RepeatColumns="4" runat="server">
                        <asp:ListItem >MILD ANEMIC</asp:ListItem>
                         <asp:ListItem >NEED IRON RICH DIET</asp:ListItem>
                        <asp:ListItem>SKIN ALLERGY</asp:ListItem>
                        <asp:ListItem Selected="True">CHILD IS NORMAL AND HEALTHY</asp:ListItem>
                        <asp:ListItem>EYE SIGHT IS CORRECT WITH SPECTS</asp:ListItem>
                        <asp:ListItem>NEED TO CHANGE THE GLASS OF SPECTS </asp:ListItem>
                        <asp:ListItem>WAX FOUND IN EARS</asp:ListItem>

                    </asp:CheckBoxList>

                  
                </td>
            </tr>
            <tr>
                <td>&nbsp;<asp:TextBox ID="TextBox17" Width="500px"  TextMode="MultiLine" PLACEHOLDER="OTHERS" runat="server"></asp:TextBox>
                </td>

            </tr>
        </table>
        <br />

        <table>

            <tr>
                <td class="listtitle" style="width:800px">  REMARKS / ADVISE / PRESRIPTION</td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="TextBox18" Width="700PX" runat="server" Text="AVOID JUNK FOOD"></asp:TextBox>
                </td>

            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="TextBox16" Width="700PX" Text="EAT GREEN LEAFY VEGETABLES AND FRUITS" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>

                <td>
                    <asp:TextBox ID="TextBox19" Width="700PX" Text="GO FOR MORNING WALK DAILY" runat="server"></asp:TextBox>

                </td>
            </tr>
            <tr>

                <td>
                    <asp:TextBox ID="TextBox29" Width="500px"  TextMode="MultiLine" PLACEHOLDER="OTHERS" runat="server"></asp:TextBox>

                </td>
            </tr>
        </table>

        <br />

        <table>

            <tr>
                <td class="listtitle" style="width:800px"  colspan="4">REFERRED TO</td>

            </tr>
            <tr>
                <td colspan="4">
                    <asp:CheckBoxList ID="CheckBoxList3" RepeatColumns="4" runat="server">
                        <asp:ListItem>PHYSICIAN</asp:ListItem>
                        <asp:ListItem>DENTIST</asp:ListItem>
                        <asp:ListItem>OPTOMETRIST</asp:ListItem>
                        <asp:ListItem>ENT</asp:ListItem>
                        <asp:ListItem>PEDIATRICIAN</asp:ListItem>
                        <asp:ListItem>SKIN SPECIALIST</asp:ListItem>
                        <asp:ListItem Selected="True">NOT REQUIRED</asp:ListItem>
                        <asp:ListItem>NIL</asp:ListItem>
                    </asp:CheckBoxList>
                </td>
            </tr>
        </table>
        <br />
        <br />
          <table>

            <tr>
                <td class="listtitle" style="width:800px"  colspan="4">HEALTH EXAMINATION DONE BY</td>

            </tr>
            <tr>
                <td >
                   PHYSICIAN:
                </td>
                <td>
              <asp:TextBox ID="TextBox15" Width="400px" runat="server"></asp:TextBox>

                </td>
            </tr>
                <tr>
                <td >
                   DENTIST 
                </td>
                <td>
                       <asp:TextBox ID="TextBox26" Width="400px"  runat="server"></asp:TextBox>
                </td>
            </tr>
                <tr>
                <td >
                   EYE SIGHT CHECKUP BY 
                </td>
                <td>
                       <asp:TextBox ID="TextBox27" Width="400px"  runat="server"></asp:TextBox>
                </td>
            </tr>


          
        </table>
            <table>
                 <tr>
                  <td align="right" class="listtitle" style="width:800px" >
                      <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="Save" />
                 
                      <asp:Button ID="Button4" runat="server" Text="Reset" OnClick="Button4_Click" />
                  </td>
              </tr>
            </table>

    </div>
</asp:Content>

