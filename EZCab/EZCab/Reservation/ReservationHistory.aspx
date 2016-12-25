<%@ Page Title="Reservation History" Language="C#" AutoEventWireup="true" MasterPageFile="~/ezCab.Master" CodeBehind="ReservationHistory.aspx.cs" Inherits="EZCab.Reservation.ReservationHistory" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div>
    
        Reservation History<br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="ReservationID" DataSourceID="SqlDataSource1">
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:Database1ConnectionString %>" SelectCommand="SELECT * FROM [RESERVATION] WHERE ([Email] = @Email)">
            <SelectParameters>
                <asp:SessionParameter Name="Email" SessionField="Email" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    
    &nbsp;<asp:Button ID="btnBack" runat="server" PostBackUrl="~/Homepage/AdminHomePage.aspx" Text="Back" />
    
    </div>
 </asp:Content>
