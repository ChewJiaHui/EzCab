<%@ Page Title="Customer Register" Language="C#" MasterPageFile="~/ezCab.Master" AutoEventWireup="true" CodeBehind="CustRegister.aspx.cs" Inherits="EZCab.Register.CustRegister" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <style type="text/css">

        table
{
    font-family:Verdana,Arial,sans-serif;
    font-size:13pt;
            width: 1032px;
        }


        .auto-style1 {
            width: 6px;
        }
        .auto-style2 {
            width: 201px;
        }
        .auto-style3 {
            width: 404px;
        }


        .auto-style5 {
            font-size: small;
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
        }


    </style>
    <div>
    
        <table>
            <tr>
                <td class="auto-style3">
                    <table>
                        <tr>
                            <td class="auto-style6">User Name</td>
                            <td class="auto-style7">:</td>
                            <td class="auto-style8">
                                <asp:TextBox ID="txtUserName" runat="server" Font-Names="Verdana" Font-Size="13pt" Width="220px"></asp:TextBox>
                            &nbsp;*<span class="auto-style5">
                                <asp:Label ID="lblNameNotNull" runat="server"></asp:Label>
                                </span></td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Password</td>
                            <td class="auto-style1">:</td>
                            <td class="auto-style12">
                                <asp:TextBox ID="txtPassword" runat="server" Font-Names="Verdana" Font-Size="13pt" Width="220px" TextMode="Password" MaxLength="20"></asp:TextBox>
                            &nbsp;* <span class="auto-style5">
                                <asp:Label ID="lblPasswordNotNull" runat="server"></asp:Label>
                                </span></td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Confirm Password </td>
                            <td class="auto-style1">:</td>
                            <td class="auto-style12">
                                <asp:TextBox ID="txtConfirmPassword" runat="server" Font-Names="Verdana" Font-Size="13pt" Width="220px" TextMode="Password" MaxLength="20"></asp:TextBox>
                            &nbsp;*
                                <asp:Label ID="lblWrongPassword" runat="server" Font-Size="8pt" ForeColor="Red" style="font-size: xx-small"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Email</td>
                            <td class="auto-style1">:</td>
                            <td class="auto-style12">
                                <asp:TextBox ID="txtEmail" runat="server" Font-Names="Verdana" Font-Size="13pt" Width="220px"></asp:TextBox>
                            &nbsp;* <span style='color: gray;' class="auto-style5">Example:abc@yahoo.com</span>
                                <asp:Label ID="lblEmailNotNull" runat="server" style="font-size: small"></asp:Label>
                               </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Phone Number</td>
                            <td class="auto-style1">:</td>
                            <td class="auto-style12">
                                <asp:TextBox ID="txtPhoneNum" runat="server" Font-Names="Verdana" Font-Size="13pt" Width="220px" MaxLength="11"></asp:TextBox>
                            &nbsp;* <span class="auto-style5" style="color:gray;">Example:0120123456
                                </span> <span class="auto-style5" style="color:red;">
                                
                                </span><asp:Label ID="lblNoNotNull" runat="server" style="font-size: small"></asp:Label>&nbsp;<span class="auto-style5"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPhoneNum"  Type="Integer"
                                Operator="DataTypeCheck" ErrorMessage="Value must be an integer!" ForeColor="Red"></asp:RequiredFieldValidator>
                                </span></td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Address</td>
                            <td class="auto-style1">:</td>
                            <td class="auto-style12">
                                <asp:TextBox ID="txtAddress" runat="server" Font-Names="Verdana" Font-Size="13pt" Height="93px" Width="220px"  TextMode="MultiLine"></asp:TextBox>
                            &nbsp;<asp:Label ID="lblAddNotNull" runat="server" style="font-size: small"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style1">&nbsp;</td>
                            <td class="auto-style12">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style2">&nbsp;</td>
                            <td class="auto-style1">&nbsp;</td>
                            <td class="auto-style12">
                                <asp:Button ID="btnRegister" runat="server" Font-Names="Verdana" Font-Size="13pt" OnClick="btnRegister_Click" style="margin-bottom: 0px" Text="Register" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style14" colspan="3">
                                <asp:Label ID="lblMsg" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    
    </div>
        <p>
            &nbsp;</p>
</asp:Content>
