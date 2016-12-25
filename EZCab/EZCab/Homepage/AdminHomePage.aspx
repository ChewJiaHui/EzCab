<%@ Page Title="Customer Home Page" Language="C#" MasterPageFile="~/ezCab.Master" AutoEventWireup="true" CodeBehind="AdminHomePage.aspx.cs" Inherits="EZCab.Homepage.AdminHomePage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Button ID="btnEditCust" runat="server" OnClick="btnEditCust_Click" Text="Edit Profile" />
&nbsp;&nbsp;
    <asp:Button ID="btnEditdri" runat="server" OnClick="btnEditdri_Click" Text="Reservation" />
&nbsp;&nbsp;
    <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Reservation History" />
&nbsp;&nbsp; 
</asp:Content>
