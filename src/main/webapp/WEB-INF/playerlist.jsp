<%--
  Created by IntelliJ IDEA.
  User: Раимбек
  Date: 28.10.2019
  Time: 14:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Player List</title>
    <form action="addPlayerForm"><input type="submit" value="ADD PLAYER"></form>
</head>
<body>
    <div>
        <table border="1" cellpadding="5">
            <tr>
                <th>ID</th>
                <th>NAME</th>
                <th>SURNAME</th>
                <th>PLAYER NUMBER</th>
                <th>TEAM</th>
                <th>ACTIONS</th>
            </tr>
            <c:forEach var="player" items="${playerList}">
                <tr>
                    <td><c:out value="${player.playerId}"/></td>
                    <td><c:out value="${player.name}"/></td>
                    <td><c:out value="${player.surname}"/></td>
                    <td><c:out value="${player.playerNumber}"/></td>
                    <td><c:out value="${player.teamId}"/></td>
                    <td><form action="editPlayerForm"><input type="hidden" name="playerId" value="${player.playerId}">
                        <input type="submit" value="EDIT"></form></td>
                    <td><form action="deletePlayer"><input type="hidden" name="playerId" value="${player.playerId}">
                        <input type="submit" value="DELETE"></form></td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
