<%@ Page Title="Selection Admin " Language="C#" MasterPageFile="~/ezCab.Master" AutoEventWireup="true" CodeBehind="SelectionAdmin.aspx.cs" Inherits="EZCab.SelectionAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/AddDriver.aspx">Add Driver</asp:HyperLink>
    <br />
    <br />
    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="~/EditDriver.aspx">Edit Driver</asp:HyperLink>
    <br />
    <br />
    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Report/GenarateReport.aspx">Check Report</asp:HyperLink>
</asp:Content>
