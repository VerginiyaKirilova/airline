<%@ page import="com.airline.models.Flight" %>
<%@ page import="java.util.List" %>
<%@ page import="com.airline.models.Pilot" %>
<%@ page import="com.airline.models.Passenger" %>
<%@ page import="org.hibernate.Hibernate" %>
<%--
  Created by IntelliJ IDEA.
  User: vegito
    Date: 12.01.25 г.
    Time: 12:21 ч.
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="resources/css/jpaStyles.css"/>
    <title>Flight list</title>
</head>

<body>
    <h1>List of Flights</h1>

    <table>
        <tr>
            <th>Id</th>
            <th>From</th>
            <th>To</th>
            <th>Time</th>
            <th>Price</th>
            <th>Airplane</th>
            <th>Seating</th>
            <th>Number of pilots</th>
            <th>Pilot names</th>
        </tr>

        <%
            List<Flight> flightList = (List<Flight>) request.getAttribute("flight_list");

            for (int i = 0; i < flightList.size(); i++)
            {

        %>
        <tr>
            <td><%= flightList.get(i).getId()%></td>
            <td><%= flightList.get(i).getFlightOrigin()%></td>
            <td><%= flightList.get(i).getFlightDestination()%></td>
            <td><%= flightList.get(i).getFlightTime()%></td>
            <td><%= flightList.get(i).getPrice()%></td>
            <td><%= flightList.get(i).getAirplaneDetails().getPlaneMake() + " " + flightList.get(i).getAirplaneDetails()
                    .getModelName()%></td>
            <td><%= flightList.get(i).getAirplaneDetails().getSeatingCapacity()%>

            <td>

                    <%

                            if(flightList.get(i).getPilots() != null) {


                        %>
                    <%= flightList.get(i).getPilots().size() %> pilots
                    <%
                        }
                        else {

                        %>

                No pilots yet

                    <%
                            }
                        %>

            <td>

                <%

                    if (flightList.get(i).getPilots() != null)
                    {

                        List<Pilot> pList = (List<Pilot>) flightList.get(i).getPilots();

                        for (Integer j = 0; j < pList.size(); j++)
                        {


                %>

                <%=
                (j + 1) + ") " + pList.get(j).getFirstName() + " " + pList.get(j).getLastName()
                        + " (" + pList.get(j).getPilotRank() + ")" + "<br />"
                %>

                <%
                        } //for

                    } //if

                %>

            </td>


        </tr>

        <tr>
                  <td colspan="9">
                <%
                    if ((flightList.get(i).getPassengers() != null) && !flightList.get(i).getPassengers().isEmpty()) {
                        List<Passenger> passengers = (List<Passenger>) flightList.get(i).getPassengers();

                        for (int k = 0; k < passengers.size(); k++)
                        {
                %>
                    <%= k+1 %>) <%=passengers.get(k).getFirstName()%>   <%=passengers.get(k).getLastName()%> <br />

                <%
                        } //for
                    } //if
                    else
                        {
                %>
                    No passengers on this flight yet.
                <%
                        } //else
                %>

            </td>
        </tr>

        <%
            }
        %>

    </table>

</body>

</html>
