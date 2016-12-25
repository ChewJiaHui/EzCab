<%@ Page Title="Report" Language="C#" MasterPageFile="~/ezCab.Master" AutoEventWireup="true" CodeBehind="GenarateReport.aspx.cs" Inherits="EZCab.Report.GenarateReport" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
    
        <asp:DropDownList ID="ddlType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem>Select Type</asp:ListItem>
            <asp:ListItem>Reserveration Report</asp:ListItem>
            <asp:ListItem>Transaction Report</asp:ListItem>
        </asp:DropDownList>
        <asp:GridView ID="viewRe" runat="server" AutoGenerateColumns="False" DataKeyNames="ReservationID" DataSourceID="SqlDataSource1">
            <Columns>
                <asp:BoundField DataField="ReservationID" HeaderText="ReservationID" InsertVisible="False" ReadOnly="True" SortExpression="ReservationID" />
                <asp:BoundField DataField="ReservationStartTime" HeaderText="ReservationStartTime" SortExpression="ReservationStartTime" />
                <asp:BoundField DataField="ReservationEndTime" HeaderText="ReservationEndTime" SortExpression="ReservationEndTime" />
                <asp:BoundField DataField="PickUpLocation" HeaderText="PickUpLocation" SortExpression="PickUpLocation" />
                <asp:BoundField DataField="Destination" HeaderText="Destination" SortExpression="Destination" />
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                <asp:BoundField DataField="DriverID" HeaderText="DriverID" SortExpression="DriverID" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" />
            </Columns>
        </asp:GridView>
        <asp:GridView ID="viewTrans" runat="server" AutoGenerateColumns="False" DataKeyNames="TransactionID" DataSourceID="SqlDataSource2">
            <Columns>
                <asp:BoundField DataField="TransactionID" HeaderText="TransactionID" InsertVisible="False" ReadOnly="True" SortExpression="TransactionID" />
                <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:Database1ConnectionString %>" SelectCommand="SELECT * FROM [TRANSACTION2]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Database1ConnectionString %>" SelectCommand="SELECT * FROM [RESERVATION]"></asp:SqlDataSource>
        <br />
        <asp:Button ID="btnBack" runat="server" OnClick="btnBack_Click" Text="Back" />
    
    </div>
   </asp:Content>
