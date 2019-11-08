<%--
  Created by IntelliJ IDEA.
  User: Раимбек
  Date: 01.11.2019
  Time: 15:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Team List</title>
</head>
<body>
<div>
    <table border="1" cellpadding="5">
        <tr>
            <th>ID</th>
            <th>NAME</th>
            <th>Country</th>
        </tr>
        <c:forEach var="team" items="${teamList}">
            <tr>
                <td><c:out value="${team.teamId}"/></td>
                <td><c:out value="${team.name}"/></td>
                <td><c:out value="${team.country}"/></td>
            </tr>
        </c:forEach>
    </table>
</div>
</body>
</html>
