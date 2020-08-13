<%-- 
    Document   : detailsHistory
    Created on : Jun 2, 2020, 12:07:05 AM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Details Page</title>
    </head>
    <body>
        <c:set var="user" value="${sessionScope.STUDENT}"/>
        <c:if test="${empty user}">
            <c:redirect url="login.jsp"/>
        </c:if>
        <h1>Details History</h1>
        <c:set var="details" value="${requestScope.DETAILS}"/>
        <c:if test="${not empty details}">
            <table border="1">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Question Content</th>
                        <th>Answer</th>
                        <th>Your Chosen</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${details}" varStatus="counter">
                        <tr>
                            <td>${counter.count}</td>
                            <td>${item.quesContent}</td>
                            <td>${item.correctAnsId}</td>
                            <td>${item.ansId}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <a href="LoadSubjectServlet">Back to Student Page</a>       
        </c:if>
        <c:if test="${empty details}">errors</c:if>
    </body>
</html>
