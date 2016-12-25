<%@ Page Title="Driver Login" Language="C#" AutoEventWireup="true" CodeBehind="driverLogin.aspx.cs" MasterPageFile="~/ezCab.Master" Inherits="EZCab.driverLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
    
        <table style="width:100%;">
            <tr>
                <td class="auto-style5">Driver ID</td>
                <td class="auto-style4">:</td>
                <td>
        <asp:TextBox ID="txtID" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">Contact No.</td>
                <td class="auto-style4">:</td>
                <td>
        <asp:TextBox ID="txtPhone" runat="server" TextMode="Password"></asp:TextBox>
    
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
                    <asp:Button ID="btnLogin" runat="server" Text="Login" style="font-size: large" OnClick="btnLogin_Click" />
                </td>
            </tr>
        </table>
    
    </div>
</asp:Content>
<asp:Content ID="Content2" runat="server" contentplaceholderid="head">
    <style type="text/css">

    .auto-style3 {
        width: 120px;
    }
    .auto-style4 {
        width: 12px;
    }
    .auto-style5 {
        width: 120px;
        font-size: x-large;
    }
</style>
</asp:Content>
