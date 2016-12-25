<%@ Page Title="Admin Login" Language="C#" AutoEventWireup="true" MasterPageFile="~/ezCab.Master" CodeBehind="AdminLogin.aspx.cs" Inherits="EZCab.AdminLogin" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
    
        <table style="width:100%;">
            <tr>
                <td class="auto-style5">AdminID</td>
                <td class="auto-style4">:</td>
                <td>
        <asp:TextBox ID="txtAdminID" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">Password</td>
                <td class="auto-style4">:</td>
                <td>
        <asp:TextBox ID="txtPassword" runat="server" TextMode="Password"></asp:TextBox>
    
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td>
                    <asp:Button ID="btnLogin" runat="server" style="font-size: large" Text="Login" Width="105px" OnClick="btnLogin_Click" />
                </td>
            </tr>
        </table>
    
        <br />
    
    </div>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">
        .auto-style5 {
            width: 120px;
            font-size: x-large;
        }
    .auto-style4 {
        width: 12px;
    }

    .auto-style3 {
        width: 120px;
    }
    </style>
</asp:Content>
