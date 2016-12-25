<%@ Page Title="" Language="C#" MasterPageFile="~/ezCab.Master" AutoEventWireup="true" CodeBehind="EditDriver.aspx.cs" Inherits="EZCab.EditDriver" %>
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
            width: 562px;
        }


        .auto-style2 {
            width: 201px;
        }
        

        .auto-style1 {
            width: 6px;
        }
        .auto-style9 {
            width: 562px;
        }
    

        .auto-style5 {
            font-size: small;
        }


        </style>

    <div>
    
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionStrings %>" SelectCommand="SELECT * FROM [DRIVER]"></asp:SqlDataSource>
        <br />
    
                    <table>
                        <tr>
                            <td class="auto-style6">Driver ID</td>
                            <td class="auto-style7">:</td>
                            <td class="auto-style8">
                                <asp:DropDownList ID="ddlDriverID" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="DriverID" DataValueField="DriverID" Height="16px" OnSelectedIndexChanged="ddlDriverID_SelectedIndexChanged">
                                </asp:DropDownList>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Driver Name</td>
                            <td class="auto-style1">:</td>
                            <td class="auto-style9">
                                <asp:TextBox ID="txtDriverName" runat="server" Font-Names="Verdana" Font-Size="13pt" Width="220px" ReadOnly="True"></asp:TextBox>
                                &nbsp;* <span class="auto-style5">
                                <asp:Label ID="lblNameNotNull" runat="server"></asp:Label>
                                </span></td>
                        </tr>
                        <tr>
                            <td class="auto-style2">IC No. </td>
                            <td class="auto-style1">:</td>
                            <td class="auto-style9">
                                <asp:TextBox ID="txtICNO" runat="server" Font-Names="Verdana" Font-Size="13pt" Width="220px" ReadOnly="True" MaxLength="12"></asp:TextBox>
                                &nbsp;* <span class="auto-style5">
                                <asp:Label ID="lblICNotNull" runat="server"></asp:Label>
                                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtICNO"  Type="Integer"
                                Operator="DataTypeCheck" ErrorMessage="Value must be an integer!" ForeColor="Red"></asp:RequiredFieldValidator>
                                </span></td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Car Plate Number</td>
                            <td class="auto-style1">:</td>
                            <td class="auto-style9">
                                <asp:TextBox ID="txtCarPlateNo" runat="server" Font-Names="Verdana" Font-Size="13pt" Width="220px" ReadOnly="True" MaxLength="7"></asp:TextBox>
                                &nbsp;* <span class="auto-style5">
                                <asp:Label ID="lblCarPlateNotNull" runat="server"></asp:Label>
                                &nbsp;</span></td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Contact Number</td>
                            <td class="auto-style1">:</td>
                            <td class="auto-style9">
                                <asp:TextBox ID="txtPhoneNum" runat="server" Font-Names="Verdana" Font-Size="13pt" Width="220px" ReadOnly="True" MaxLength="1"></asp:TextBox>
                            &nbsp;* <span class="auto-style5">
                                <asp:Label ID="lblNoNotNull" runat="server"></asp:Label>
                                </span>&nbsp; <span class="auto-style5">
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtPhoneNum"  Type="Integer"
                                Operator="DataTypeCheck" ErrorMessage="Value must be an integer!" ForeColor="Red"></asp:RequiredFieldValidator>
                                </span>
                                
                               </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Expired Driver License</td>
                            <td class="auto-style1">:</td>
                            <td class="auto-style9">
                                <asp:TextBox ID="txtDriverLicense" runat="server" Font-Names="Verdana" Font-Size="13pt" Width="220px" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style1">&nbsp;</td>
                            <td class="auto-style9">
                                <asp:Calendar ID="Calendar1" runat="server" Visible="False" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
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
                                <asp:Button ID="btnEditSave" runat="server" Font-Names="Verdana" Font-Size="13pt" style="margin-bottom: 0px" Text="Edit" OnClick="btnEditSave_Click" Width="149px" />
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
