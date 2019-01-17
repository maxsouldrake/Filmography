<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <c:choose>
        <c:when test="${empty film.title}">
            <title>Add</title>
        </c:when>
        <c:otherwise>
            <title>Edit</title>
        </c:otherwise>
    </c:choose>
</head>
<body>
<c:url value="/add" var="addUrl"/>
<c:url value="/edit" var="editUrl"/>
<form action="${empty film.title ? addUrl : editUrl}" name="film" method="POST">
    <c:choose>
        <c:when test="${!empty film.title}">
            <p>Edit film</p>
            <input type="hidden" name="id" value="${film.id}">
        </c:when>
        <c:otherwise>
            <p>Add new film</p>
        </c:otherwise>
    </c:choose>
    <p><input type="text" name="title" placeholder="title" value="${film.title}" maxlength="100" required>
    <p><input type="number" name="year" placeholder="year" value="${film.year}" required>
    <p><input type="text" name="genre" placeholder="genre" value="${film.genre}" maxlength="20" required>
    <p>
        <c:if test="${film.watched == true}">
            <input type="checkbox" name="watched" id="watched" checked>
        </c:if>
        <c:if test="${film.watched != true}">
            <input type="checkbox" name="watched" id="watched">
        </c:if>
        <label for="watched">watched</label>
    </p>
    <p>
        <c:set value="add" var="add"/>
        <c:set value="edit" var="edit"/>
        <input type="submit" value="${empty film.title ? add : edit}">
    </p>
    <p>${message}</p>
</form>
</body>
</html>
