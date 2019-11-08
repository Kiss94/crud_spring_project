<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Раимбек
  Date: 01.11.2019
  Time: 17:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<html>
<head>
    <title>Player info</title>
</head>
<body>
<form action="savePlayer">
    <div>
        <table border="1" cellpadding="5">
            <tr>
                <th>NAME</th>
                <th>SURNAME</th>
                <th>PLAYER NUMBER</th>
                <th>TEAM</th>
            </tr>
                <tr>
                    <td><input type="text" name="name"></td>
                    <td><input type="text" name="surname"></td>
                    <td><input type="text" name="playerNumber"></td>
                    <td><select name="teamId">
                        <c:forEach var="team" items="${teamList}">
                            <option value="${team.teamId}"> ${team.name}
                            </option>
                        </c:forEach>
                    </select></td>
                </tr>
            <tr>
                <td><input type="reset" value="RESET"></td>
                <td><input type="submit" value="SAVE"></td>
            </tr>
        </table>
    </div>
</form>
</body>
</html>
