<%@ Page Title="" Language="C#" MasterPageFile="~/ezCab.Master" AutoEventWireup="true" CodeBehind="AddDriver.aspx.cs" Inherits="EZCab.AddDriver" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        table
{
    font-family:Verdana,Arial,sans-serif;
    font-size:13pt;
            }


        .auto-style6 {
            width: 201px;
            height: 33px;
        }
        .auto-style7 {
            width: 6px;
            height: 33px;
        }
        .auto-style8 {
            height: 33px;
            width: 747px;
        }


        .auto-style5 {
            font-size: small;
        }


        .auto-style2 {
            width: 201px;
        }
        

        .auto-style1 {
            width: 6px;
        }
        .auto-style9 {
            width: 747px;
        }
        </style>
<div>
    
                    <table>
                        <tr>
                            <td class="auto-style6">Driver ID</td>
                            <td class="auto-style7">:</td>
                            <td class="auto-style8">
                                <asp:TextBox ID="txtDriverID" runat="server" Font-Names="Verdana" Font-Size="13pt" Width="220px" ReadOnly="True"></asp:TextBox>
                                &nbsp; </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Driver Name</td>
                            <td class="auto-style1">:</td>
                            <td class="auto-style9">
                                <asp:TextBox ID="txtDriverName" runat="server" Font-Names="Verdana" Font-Size="13pt" Width="220px"></asp:TextBox>
                                &nbsp;*<span class="auto-style5">
                                <asp:Label ID="lblNameNotNull" runat="server"></asp:Label>
                                </span></td>
                        </tr>
                        <tr>
                            <td class="auto-style2">IC No. </td>
                            <td class="auto-style1">:</td>
                            <td class="auto-style9">
                                <asp:TextBox ID="txtICNO" runat="server" Font-Names="Verdana" Font-Size="13pt" Width="220px" MaxLength="12"></asp:TextBox>
                                &nbsp;*
                                <asp:Label ID="lblICnotNull" runat="server" style="font-size: small"></asp:Label>
                                <span class="auto-style5">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtICNO"  Type="Integer"
                                Operator="DataTypeCheck" ErrorMessage="Value must be an integer!" ForeColor="Red"></asp:RequiredFieldValidator>
                                </span></td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Car Plate Number</td>
                            <td class="auto-style1">:</td>
                            <td class="auto-style9">
                                <asp:TextBox ID="txtCarPlateNo" runat="server" Font-Names="Verdana" Font-Size="13pt" Width="220px" MaxLength="7"></asp:TextBox>
                                &nbsp;* <asp:Label ID="lblCarPlate" runat="server" style="font-size: small"></asp:Label></td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Contact Number</td>
                            <td class="auto-style1">:</td>
                            <td class="auto-style9">
                                <asp:TextBox ID="txtPhoneNum" runat="server" Font-Names="Verdana" Font-Size="13pt" Width="220px" MaxLength="11"></asp:TextBox>
                            &nbsp;<span class="auto-style5" style="color:gray;">Example:0120123456
                                </span>  &nbsp;*
                                <asp:Label ID="lblNoNotNull" runat="server" style="font-size: small"></asp:Label>
                                <span class="auto-style5">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPhoneNum" Type="Integer"
                                Operator="DataTypeCheck" ErrorMessage="Value must be an integer!" ForeColor="Red"></asp:RequiredFieldValidator>
                                </span>
                                
                               </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Expired Driver License</td>
                            <td class="auto-style1">:</td>
                            <td class="auto-style9">
                                <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" CellSpacing="1" Font-Names="Verdana" Font-Size="9pt" ForeColor="Black" Height="250px" NextPrevFormat="ShortMonth" Width="330px" SelectedDate="08/13/2016 17:04:59">
                                    <DayHeaderStyle Font-Bold="True" Font-Size="8pt" ForeColor="#333333" Height="8pt" />
                                    <DayStyle BackColor="#CCCCCC" />
                                    <NextPrevStyle Font-Bold="True" Font-Size="8pt" ForeColor="White" />
                                    <OtherMonthDayStyle ForeColor="#999999" />
                                    <SelectedDayStyle BackColor="#333399" ForeColor="White" />
                                    <TitleStyle BackColor="#333399" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="12pt" />
                                    <TodayDayStyle BackColor="#999999" ForeColor="White" />
                                </asp:Calendar>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style1">&nbsp;</td>
                            <td class="auto-style9">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style2">
                                <asp:Button ID="btnBack" runat="server" CausesValidation="false" Font-Names="Verdana" Font-Size="13pt" OnClick="btnBack_Click" Text="Back" Width="149px" />
                            </td>
                            <td class="auto-style1">&nbsp;</td>
                            <td class="auto-style9">
                                <asp:Button ID="btnAddDriver" runat="server" Font-Names="Verdana" Font-Size="13pt" style="margin-bottom: 0px" Text="Add Driver" OnClick="btnAddDriver_Click" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style14" colspan="3">
                                <asp:Label ID="lblMsg" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
    
    </div>
</asp:Content>
