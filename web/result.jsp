<%-- 
    Document   : result
    Created on : Jun 1, 2020, 4:38:06 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Result Page</title>
    </head>
    <body>
        <c:set var="user" value="${sessionScope.STUDENT}"/>
        <c:if test="${empty user}">
            <c:redirect url="login.jsp"/>
        </c:if>
        <h1>Result Page</h1>
        <p>
            Your mark is: <font color="red">${requestScope.MARK}</font><br/>
            Number of correct chosen: <font color="red">${requestScope.MARK}</font><br/>
            Thanks for doing quiz
        </p>
        <a href="LoadSubjectServlet">Do another quiz</a>
    </body>
</html>
