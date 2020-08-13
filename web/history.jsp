<%-- 
    Document   : history
    Created on : Jun 1, 2020, 7:46:10 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>History Page</title>
    </head>
    <body>
        <c:set var="user" value="${sessionScope.STUDENT}"/>
        <c:if test="${empty user}">
            <c:redirect url="login.jsp"/>
        </c:if>
        <h1>History Page</h1>
        <form action="DispatcherController">
            Subject: <input type="text" name="txtSubject" value="${param.txtSubject}" /><br/>
            SubjectId: <input type="text" name="txtSubId" value="${param.txtSubId}" /><br/>
            <input type="submit" value="Search History" name="btnAction" />
        </form>
        <form action="DispatcherController">
            <input type="submit" value="View All" name="btnAction" /> 
        </form>
        <c:set var="subject" value="${param.txtSubject}"/>
        <c:set var="subId" value="${param.txtSubId}"/>
        <c:set var="searchList" value="${requestScope.SEARCHLIST}"/>
        <c:if test="${not empty subject or not empty subId}">
            <c:if test="${not empty searchList}">
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
                        <c:forEach var="item" items="${searchList}" varStatus="counter">
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
                    <c:param name="txtSubject" value="${param.txtSubject}"/>
                    <c:param name="txtSubId" value="${param.txtSubId}"/>
                    <c:param name="numberPaging" value="${counter.count}"/>
                    <c:param name="btnAction" value="Search History"/>
                </c:url>
                <a href="${page}">${counter.count}</a>
            </c:forEach>
        </c:if><br/>
        <c:if test="${empty searchList}">
            <font color="red">There is no matching result!</font>
        </c:if>
    </c:if>
    <a href="LoadSubjectServlet">Back to Student Page</a>
</body>
</html>
