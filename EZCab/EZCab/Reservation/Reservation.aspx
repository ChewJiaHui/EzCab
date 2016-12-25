<%@ Page Title="Reservation" Language="C#" AutoEventWireup="true" CodeBehind="Reservation.aspx.cs" Inherits="EZCab.Reservation.Reservation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reservation Form</title>
    
    <style type="text/css">
        .auto-style1 {
            text-decoration: underline;
        }
        .auto-style2 {
            font-size: large;
            text-decoration: underline;
        }
        .auto-style3 {
            width: 100%;
            margin-right: 0px;
        }
        .auto-style4 {
            width: 210px;
        }
        .auto-style5 {
            width: 210px;
            height: 26px;
        }
        .auto-style6 {
            height: 26px;
            width: 253px;
        }
        .auto-style7 {
            width: 253px;
        }
    </style>
    <%--<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyAR9i2qHgZdXEJZKzeB8PkCnZ_aWtV2Zyg&sensor=false&libraries=places">  </script>--%>
    <script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyD4WrqdFYlzmDjrA1W7hCC-UoOXY9URHYU&sensor=false&libraries=places">  </script>

<script type="text/javascript">
    var source, destination;
    var directionsDisplay;
    var directionsService = new google.maps.DirectionsService();
    google.maps.event.addDomListener(window, 'load', function () {
        new google.maps.places.SearchBox(document.getElementById('txtPickUpAddress'));
        new google.maps.places.SearchBox(document.getElementById('txtDestinationAddress'));
        directionsDisplay = new google.maps.DirectionsRenderer({ 'draggable': true });
    });

    function initialize() {
        var mapProp = {
            center: new google.maps.LatLng(3.1388393, 101.5469003),
            zoom: 10,
            disableDefaultUI: true,
        };
        var map = new google.maps.Map(document.getElementById("dvMap"), mapProp);
    }
    google.maps.event.addDomListener(window, 'load', initialize);

    function GetRoute() {
        var mumbai = new google.maps.LatLng(3.1388393, 101.5469003);
        var mapOptions = {
            center: mumbai,
            zoom: 7,
            disableDefaultUI: true
        };
        map = new google.maps.Map(document.getElementById('dvMap'), mapOptions);
        directionsDisplay.setMap(map);
        directionsDisplay.setPanel(document.getElementById('dvPanel'));

        //*********DIRECTIONS AND ROUTE**********************//
        source = document.getElementById("txtPickUpAddress").value;
        destination = document.getElementById("txtDestinationAddress").value;

        var request = {
            origin: source,
            destination: destination,
            travelMode: google.maps.TravelMode.DRIVING
        };
        directionsService.route(request, function (response, status) {
            if (status == google.maps.DirectionsStatus.OK) {
                directionsDisplay.setDirections(response);
            }
        });

        //*********DISTANCE AND DURATION**********************//
        var service = new google.maps.DistanceMatrixService();
        service.getDistanceMatrix({
            origins: [source],
            destinations: [destination],
            travelMode: google.maps.TravelMode.DRIVING,
            unitSystem: google.maps.UnitSystem.METRIC,
            avoidHighways: false,
            avoidTolls: false
        }, function (response, status) {
            if (status == google.maps.DistanceMatrixStatus.OK && response.rows[0].elements[0].status != "ZERO_RESULTS") {
                var distance = response.rows[0].elements[0].distance.text;
                var duration = response.rows[0].elements[0].duration.text;

                var i;
                var newDistance;
                var newDuration;
                var price;

                i = distance.length;
                newDistance = distance.substring(0, i - 3);
                i = duration.length;
                newDuration = duration.substring(0, i - 4);

                //dvDistance.innerHTML = "";
                //dvDistance.innerHTML += "Distance: " + distance + "<br />";
                //dvDistance.innerHTML += "Duration:" + duration;
                document.getElementById('<%= HiddenField1.ClientID%>').value = distance;
                document.getElementById('<%= txtDistance.ClientID%>').value = distance;
                document.getElementById('<%= HiddenField2.ClientID%>').value = duration;
                document.getElementById('<%= txtDuration.ClientID%>').value = duration;
                price = 3 + ((newDistance * 1.2) + (newDuration / 60) * 1.2);
                document.getElementById('<%= HiddenField3.ClientID%>').value = price.toFixed(2);
                document.getElementById('<%= txtPrice.ClientID%>').value = price.toFixed(2);

            } else {
                alert("Unable to find the distance via road.");
            }
        });
    }
</script>
</head>
<body style="background-color:lightgrey">
    <form id="form1" runat="server">
       
    
        <h1 class="auto-style1">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/EzCab-App-icon-256.png" />
        </h1>
        <h1 class="auto-style1">Reservation form</h1>
        <span class="auto-style2">Enter your reservation details.</span><br />
        Your reservation will be confirmed by e-mail.<br />
        <br />
        <table class="auto-style3">
            <tr>
                <td class="auto-style4">Name :</td>
                <td class="auto-style7">
                    <asp:Label ID="lblName" runat="server" Text="[lblName]"></asp:Label>
                </td>
                <td class="auto-style7">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">E-mail address :<br />
                </td>
                <td class="auto-style7">
                    <asp:Label ID="lblEmail" runat="server" Text="[lblEmail]"></asp:Label>
                    <br />
                </td>
                <td class="auto-style7">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style6">
                &nbsp;<br />
                </td>
                <td class="auto-style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">Time :</td>
                <td class="auto-style7">
                    <asp:DropDownList ID="ddlHour" runat="server">
                        <asp:ListItem>1</asp:ListItem>
                        <asp:ListItem>2</asp:ListItem>
                        <asp:ListItem>3</asp:ListItem>
                        <asp:ListItem>4</asp:ListItem>
                        <asp:ListItem>5</asp:ListItem>
                        <asp:ListItem>6</asp:ListItem>
                        <asp:ListItem>7</asp:ListItem>
                        <asp:ListItem>8</asp:ListItem>
                        <asp:ListItem>9</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>11</asp:ListItem>
                        <asp:ListItem>12</asp:ListItem>
                    </asp:DropDownList>
&nbsp;:
                    <asp:DropDownList ID="ddlMin" runat="server">
                        <asp:ListItem>00</asp:ListItem>
                        <asp:ListItem>05</asp:ListItem>
                        <asp:ListItem>10</asp:ListItem>
                        <asp:ListItem>15</asp:ListItem>
                        <asp:ListItem>20</asp:ListItem>
                        <asp:ListItem>25</asp:ListItem>
                        <asp:ListItem>30</asp:ListItem>
                        <asp:ListItem>35</asp:ListItem>
                        <asp:ListItem>40</asp:ListItem>
                        <asp:ListItem>45</asp:ListItem>
                        <asp:ListItem>50</asp:ListItem>
                        <asp:ListItem>55</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RadioButtonList ID="rblAmPm" runat="server" style="margin-bottom: 0px">
                        <asp:ListItem>AM</asp:ListItem>
                        <asp:ListItem>PM</asp:ListItem>
                    </asp:RadioButtonList>
&nbsp;</td>
                <td class="auto-style7">
                    &nbsp;</td>
                <td>
                    <asp:Label ID="lblSelectTime" runat="server" Text="[lblSelectTime]" ForeColor="Red"></asp:Label>
                    <br />
                    <asp:Label ID="lblBookingAdvance" runat="server" Text="[booking]" ForeColor="Red"></asp:Label>
                    <br />
                </td>
            </tr>
            <tr>
                <td class="auto-style4">Date :</td>
                <td class="auto-style7">
                    
                    
                <asp:TextBox ID="txtCalander" runat="server" ReadOnly="True"></asp:TextBox>
                    <asp:Calendar ID="Calendar1" runat="server" BackColor="White" BorderColor="#999999" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" OnSelectionChanged="Calendar1_SelectionChanged" Width="200px" CellPadding="4">
                        <DayHeaderStyle BackColor="#CCCCCC" Font-Bold="True" Font-Size="7pt" />
                        <NextPrevStyle VerticalAlign="Bottom" />
                        <OtherMonthDayStyle ForeColor="#808080" />
                        <SelectedDayStyle BackColor="#666666" ForeColor="White" Font-Bold="True" />
                        <SelectorStyle BackColor="#CCCCCC" />
                        <TitleStyle BackColor="#999999" Font-Bold="True" BorderColor="Black" />
                        <TodayDayStyle BackColor="#CCCCCC" ForeColor="Black" />
                        <WeekendDayStyle BackColor="#FFFFCC" />
                    </asp:Calendar>
                </td>
                <td class="auto-style7">
                    
                    
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style7">
                    &nbsp;</td>
                <td class="auto-style7">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">Pick up address :</td>
                <td class="auto-style7">
                    <asp:TextBox ID="txtPickUpAddress" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    &nbsp;</td>
                <td>
                    
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">Destination address :</td>
                <td class="auto-style7">
                    <asp:TextBox ID="txtDestinationAddress" runat="server"></asp:TextBox>
                    <input type="button" value="Get Route" onclick="GetRoute()" />
                </td>
                <td class="auto-style7">
                    <asp:Label ID="lblGetRoute" runat="server" ForeColor="Red" Text="[lblGetRoute]"></asp:Label>
                </td>
            </tr>
            
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style7">
                    &nbsp;</td>
                <td class="auto-style7">
                    &nbsp;</td>
            </tr>
            
            <tr>
                <td class="auto-style4">Driver :</td>
                <td class="auto-style7">
                    <asp:DropDownList ID="ddlDriver" runat="server" OnSelectedIndexChanged="ddlDriver_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
                <td class="auto-style7">
                    &nbsp;</td>
            </tr>
            
            <tr>
                
                <td class="auto-style4">Distance :<asp:HiddenField ID="HiddenField1" runat="server" OnValueChanged="HiddenField1_ValueChanged" />
                </td>
                <td class="auto-style7">
            <asp:TextBox ID="txtDistance" runat="server" ReadOnly="True"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">Estimated duration :<asp:HiddenField ID="HiddenField2" runat="server" OnValueChanged="HiddenField2_ValueChanged" />
                </td>
                <td class="auto-style7">
                    <asp:TextBox ID="txtDuration" runat="server" ReadOnly="True"></asp:TextBox>
                </td>

                <td class="auto-style7">
                    &nbsp;</td>

            </tr>
            <tr>
                <td class="auto-style4">Estimated charges (in RM) :<asp:HiddenField ID="HiddenField3" runat="server" OnValueChanged="HiddenField3_ValueChanged" />
                </td>
                <td class="auto-style7">
                    <asp:TextBox ID="txtPrice" runat="server" ReadOnly="True"></asp:TextBox>
                </td>
                
                <td class="auto-style7">
                    &nbsp;</td>
                
            </tr>
            
        </table>
        <asp:Button ID="btnConfirm" runat="server" Text="Confirm Reservation" OnClick="btnConfirm_Click" />
        &nbsp;
        <asp:Button ID="btnCancel" runat="server" OnClick="btnCancel_Click" Text="Cancel" />
        <br />
        <br />
       
        <table>
<tr>
    <td colspan="2">
        <div id="dvMap" style="width: 400px; height: 250px">
        </div>
    </td>
</tr>
</table>
        </form>
</body>
   
</html>

