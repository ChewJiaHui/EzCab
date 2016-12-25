<%@ Page Title="Email Notification" Language="C#" AutoEventWireup="true" MasterPageFile="~/ezCab.Master" CodeBehind="Notification.aspx.cs" Inherits="EZCab.Email.Notification" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div style="margin-left: 40px">
    
        <asp:DropDownList ID="DropDownList1" DataTextField="ReservationID" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem>Select</asp:ListItem>
        </asp:DropDownList>
        <br />
    
        <asp:TextBox ID="txtMail" runat="server" Width="306px" Enabled="False"></asp:TextBox>
        <br />
        <asp:Label ID="lblTo" runat="server"></asp:Label>
        <br />
        <asp:Label ID="lblFrom" runat="server"></asp:Label>
        <br />
        <asp:DropDownList ID="ddlOffer" runat="server">
        </asp:DropDownList>
        <br />
        <asp:Button ID="btnSend" runat="server" OnClick="Button1_Click" Text="Send" />
    
    </div>
 </asp:Content>
