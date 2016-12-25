<%@ Page Title="Payment" Language="C#" AutoEventWireup="true" CodeBehind="payment.aspx.cs" Inherits="EZCab.Payment.payment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 47%;
        }
        .auto-style2 {
            height: 19px;
            width: 336px;
        }
        .auto-style4 {
            font-weight: 700;
            width: 232px;
        }
        .auto-style5 {
            width: 336px;
        }
        .auto-style6 {
            height: 19px;
            width: 232px;
        }
        .auto-style12 {
            font-weight: 700;
            width: 232px;
            height: 20px;
        }
        .auto-style13 {
            width: 336px;
            height: 20px;
        }
    </style>
</head>
    <body style="background-color:lightgrey; height: 440px" >
    <form id="form1" runat="server">
    

    <div style="font-size: xx-large; font-weight: 700">
    
        <asp:Image ID="Image1" runat="server" ImageUrl="~/EzCab-App-icon-256.png" />
        <br />
    
        Summary Payment
    
    </div>
        <table class="auto-style1">
            <tr>
                <td class="auto-style6" style="font-weight: 700">Name:</td>
                <td class="auto-style2">
                    <asp:Label ID="lblName" runat="server" Text="lblName"></asp:Label>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Depart From:</td>
                <td class="auto-style5">
                    <asp:Label ID="lblDepart" runat="server" Text="lblDepart"></asp:Label>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style12">Arrive At:</td>
                <td class="auto-style13">
                    <asp:Label ID="lblArrive" runat="server" Text="lblArrive"></asp:Label>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Total Journey Price(RM):</td>
                <td class="auto-style5">
                    <asp:Label ID="lblPrice" runat="server" Text="lblPrice"></asp:Label>
                </td>
            </tr>
        </table>
        <br />
        &nbsp;&nbsp;
        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" Width="98px" />
        <br />
        <br />
    </form>
        </body>


     
    <form action="https://www.sandbox.paypal.com/cgi-bin/webscr" method="post">

    <input type="hidden" name="cmd" value="_xclick" />
    <input type="hidden" name="currency_code" value="MYR"/>
    <input type="hidden" name="business" value="alexzace2010@hotmail.com" />
    <input type="hidden" name="item_name" value="Total Journey Price" />
    <input type="hidden" name="amount" value="<%= val_amount %>" />  
    <input type="image" src="https://www.sandbox.paypal.com/en_US/i/btn/btn_paynowCC_LG.gif" border="0" name="submit" alt="PayPal - The safer, easier way to pay online!"/>
    <img alt="" border="0" src="https://www.sandbox.paypal.com/en_US/i/scr/pixel.gif" width="1" height="1"/>

    <input type="hidden" name="return" value="http://localhost:3995/Payment/SucceessfulPayment.aspx" />
    

</form>
</html>
