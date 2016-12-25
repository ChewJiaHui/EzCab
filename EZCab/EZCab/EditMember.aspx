<%@ Page Title="" Language="C#" MasterPageFile="~/ezCab.Master" AutoEventWireup="true" CodeBehind="EditMember.aspx.cs" Inherits="EZCab.EditMember" %>
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


        .auto-style2 {
            width: 201px;
        }
        

        .auto-style1 {
            width: 6px;
        }
        

        .auto-style5 {
            font-size: small;
        }


        </style>

    <div>
    
                    <table>
                        <tr>
                            <td class="auto-style2">User Name</td>
                            <td class="auto-style1">:</td>
                            <td class="auto-style13">
                                <asp:TextBox ID="txtUserName" runat="server" Font-Names="Verdana" Font-Size="13pt" Width="220px" ReadOnly="True"></asp:TextBox>
                                &nbsp;*
                                <asp:Label ID="lblNameNotNull" runat="server" style="font-size: small"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Email</td>
                            <td class="auto-style1">:</td>
                            <td class="auto-style12">
                                <asp:TextBox ID="txtEmail" runat="server" Font-Names="Verdana" Font-Size="13pt" Width="220px" ReadOnly="True"></asp:TextBox>
                                &nbsp;*
                                <asp:Label ID="lblEmailNotNull" runat="server" style="font-size: small"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Phone Number</td>
                            <td class="auto-style1">:</td>
                            <td class="auto-style12">
                                <asp:TextBox ID="txtPhoneNum" runat="server" Font-Names="Verdana" Font-Size="13pt" Width="220px" ReadOnly="True"></asp:TextBox>
                                &nbsp;*&nbsp;<asp:Label ID="lblNoNotNull" runat="server" style="font-size: small"></asp:Label>
&nbsp;<span class="auto-style5"><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPhoneNum"  Type="Integer"
                                Operator="DataTypeCheck" ErrorMessage="Value must be an integer!" ForeColor="Red"></asp:RequiredFieldValidator>
                                </span></td>
                        </tr>
                        <tr>
                            <td class="auto-style2">Address</td>
                            <td class="auto-style1">:</td>
                            <td class="auto-style12">
                                <asp:TextBox ID="txtAddress" runat="server" Height="85px" TextMode="MultiLine" Width="220px"></asp:TextBox>
                            &nbsp;*&nbsp;<asp:Label ID="lblAddNotNull" runat="server" style="font-size: small"></asp:Label>
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
                                <asp:Button ID="btnEditSave" runat="server" Font-Names="Verdana" Font-Size="13pt" OnClick="btnEditSave_Click" style="margin-bottom: 0px" Text="Edit" />
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
