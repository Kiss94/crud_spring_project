<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Раимбек
  Date: 01.11.2019
  Time: 18:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>EDIT PLAYER</title>
</head>
<body>
<form action="editPlayer">
    <table border="1" cellpadding="5">
        <tr>
            <td>Name</td>
            <td><input type="text" name="name" value="${player.name}"></td>
        </tr>
        <tr>
            <td>Surname</td>
            <td><input type="text" name="surname" value="${player.surname}"></td>
        </tr>
        <tr>
            <td>Player Number</td>
            <td><input type="text" name="playerNumber" value="${player.playerNumber}"></td>
        </tr>
        <tr>
            <td>Team</td>
            <td><select name="teamId">
                <c:forEach var="team" items="${teamList}">
                    <option value="${team.teamId}"> ${team.name}
                    </option>
                </c:forEach>
            </select></td>
        </tr>
        <tr>
            <td><input type="reset" value="RESET"></td>
            <td><input type="submit" value="SAVE"><input type="hidden" name="playerId" value="${player.playerId}"></td>
        </tr>
    </table>
</form>
</body>
</html>
