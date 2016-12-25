<%@ Page Title="Successful Payment" Language="C#" AutoEventWireup="true" CodeBehind="SucceessfulPayment.aspx.cs" Inherits="EZCab.Payment.SucceessfulPayment" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            font-weight: 700;
            font-size: x-large;
        }
    </style>
</head>
<body style="background-color:lightgrey">
    <form id="form1" runat="server">
        <asp:Image ID="Image1" runat="server" ImageUrl="~/EzCab-App-icon-256.png" />
        <span class="auto-style1">
        <br />
        Successful Payment. Thank You support EzCab<br />
        <br />
        </span><strong>Dear
        <asp:Label ID="lblName" runat="server" Text="lblName"></asp:Label>
&nbsp;,you have successful paid RM<asp:Label ID="lblPrice" runat="server" Text="lblPrice"></asp:Label>
        </strong>.<strong><br />
        </strong>
        <br />
        <strong>Taxi Driver Name:<asp:Label ID="lblDriver" runat="server" Text="lblDriver"></asp:Label>
        <br />
        <br />
        Vehicle Number:</strong><asp:Label ID="lblVehicleNo" runat="server" style="font-weight: 700" Text="lblVehicleNo"></asp:Label>
        <br />
        <br />
        <strong>Pick up From:<asp:Label ID="lblDepart" runat="server" Text="lblDepart"></asp:Label>
        <br />
        <br />
        Destination :<asp:Label ID="lblArrive" runat="server" Text="lblArrive"></asp:Label>
        </strong>
        <br />
        <br />
        <strong>Please be pation ,your car will be arrived around
        <asp:Label ID="lblDuration" runat="server" Text="lblDuration"></asp:Label>
        .
        <br />
        </strong>
        <br />
        <asp:Button ID="btnReturn" runat="server" OnClick="btnReturn_Click" Text="Return to Home" />
        <br />
        <br />
    </form>
</body>
</html>

