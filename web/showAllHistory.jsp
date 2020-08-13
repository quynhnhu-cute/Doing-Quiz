<%-- 
    Document   : showAllHistory
    Created on : Jun 1, 2020, 10:50:13 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Show All History Page</title>
    </head>
    <body>
        <c:set var="user" value="${sessionScope.STUDENT}"/>
        <c:if test="${empty user}">
            <c:redirect url="login.jsp"/>
        </c:if>

        <h1>History Page</h1>
        <c:set var="allList" value="${requestScope.ALLLIST}"/>
        <c:if test="${not empty allList}">
            <table border="1">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Create Date</th>
                        <th>Mark</th>
                        <th>Subject Name</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="item" items="${allList}" varStatus="counter">
                    <form action="DispatcherController">
                        <tr>
                            <td>${counter.count}</td>
                            <td>${item.createDate}</td>
                            <td>${item.mark}</td>
                            <td>${item.subName}</td>                           
                            <td>
                                <input type="hidden" name="testId" value="${item.testId}" />
                                <input type="submit" value="View Details" name="btnAction" />
                            </td>                           
                        </tr>
                    </form>
                </c:forEach>


            </tbody>
        </table>
        <c:forEach begin="1" end="${requestScope.PAGELIMIT}" step="1" varStatus="counter">
            <c:url var="page" value="DispatcherController">
                <c:param name="number" value="${counter.count}"/>
                <c:param name="btnAction" value="View All"/>
            </c:url>
            <a href="${page}">${counter.count}</a>
        </c:forEach>
    </c:if><br/>
    <c:if test="${empty allList}">
        <font color="red">There is no history for showing!</font>
    </c:if>
    <a href="LoadSubjectServlet">Back to Student Page</a>
</body>
</html>
