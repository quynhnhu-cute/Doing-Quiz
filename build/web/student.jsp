<%-- 
    Document   : student
    Created on : May 20, 2020, 9:49:08 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Student Page</title>
    </head>
    <c:if test="${empty sessionScope.STUDENT}">
        <c:redirect url="login.jsp"/>
    </c:if>
    <c:set var="fullName" value="${sessionScope.FULLNAME}"/>
    <c:if test="${not empty fullName}">

        Welcome, <font color="red">
        ${sessionScope.FULLNAME}
        </font>
    </c:if>
    <c:url var="logout" value="DispatcherController">
        <c:param name="btnAction" value="Logout"/>
    </c:url>
    <a href="${logout}">Logout</a>
    <body>
        <h1>Student Page</h1>
        <form action="DispatcherController">
            Subject: <select name="subjectList">
                <c:forEach var="subject" items="${requestScope.SUBLIST}">
                    <option>${subject}</option>
                </c:forEach>
            </select><br/><br/>
            <input type="submit" value="Start Quiz" name="btnAction" /><br/>
        </form>

        <a href="history.jsp">View History</a>
    </body>
</html>
