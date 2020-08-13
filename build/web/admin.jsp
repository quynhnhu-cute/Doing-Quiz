<%-- 
    Document   : admin
    Created on : May 20, 2020, 9:49:24 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Admin Page</title>
    </head>
    <c:set var="admin" value="${sessionScope.ADMIN}"/>
    <c:if test="${empty admin}">
        <c:redirect url="login.jsp"/>
    </c:if>
    <c:set var="fullName" value="${sessionScope.FULLNAME}"/>
    <c:if test="${not empty fullName}">
        Welcome,
        <font color="red">${sessionScope.FULLNAME}</font>
    </c:if>
   
    <c:url var="logout" value="DispatcherController">
        <c:param name="btnAction" value="Logout"/>
    </c:url>
    <a href="${logout}">Logout</a>
    <body>
        <h1>Search Page</h1>
        <form action="DispatcherController" method="POST">
            Question name: <input type="text" name="txtQuestionContent" value="${param.txtQuestionContent}" /><br/>
            Subject: <input type="text" name="txtSubject" value="${param.txtSubject}" /><br/>
            Status: <select name="statusDropDown">
                <option>All</option>
                <option>Active</option>
                <option>Inactive</option>
            </select><br/>
            <input type="submit" value="Search" name="btnAction" />
            <input type="submit" value="Insert New Question" name="btnAction" />

        </form><br/>
        <c:set var="quesName" value="${param.txtQuestionContent}"/>
        <c:set var="subject" value="${param.txtSubject}"/>

        <c:set value="${param.statusDropDown}" var="status"/>

        <c:if test="${not empty quesName or not empty subject}">            
            <c:set var="searchResult" value="${requestScope.SHOWLIST}"/>
            <c:if test="${not empty searchResult}">


                <table border="1">
                    <c:forEach var="item" items="${searchResult}" varStatus="counter">  
                        <form action="DispatcherController">

                            <tbody>
                                <tr>
                                    <td>${counter.count}</td>
                                    <td>${item.quesContent}</td>
                                </tr>
                                <tr>
                                    <td>${item.answerId1}</td>
                                    <td>${item.answer1}</td>
                                </tr>
                                <tr>
                                    <td>${item.answerId2}</td>
                                    <td>${item.answer2}</td>
                                </tr>
                                <tr>
                                    <td>${item.answerId3}</td>
                                    <td>${item.answer3}</td>
                                </tr>
                                <tr>
                                    <td>${item.answerId4}</td>
                                    <td>${item.answer4}</td>
                                </tr>

                                <tr>
                                    <td>CORRECT ANSWER:</td>
                                    <td>${item.quesCorrectAnswer}</td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="hidden" name="quesId" value="${item.quesId}" />
                                        <input type="submit" value="Update" name="btnAction" />
                                    </td>
                                    <td>
                                        <c:url var="delete" value="${DispatcherController}">
                                            <c:param name="questionId" value="${item.quesId}"/>
                                            <c:param name="btnAction" value="Delete"/>
                                            <c:param name="txtLastQuesContent" value="${quesName}"/>
                                            <c:param name="txtLastQuesSubject" value="${subject}"/>
                                            <c:param name="txtLastStatus" value="${status}"/>
                                        </c:url>
                                        <a href="${delete}">Delete</a>
                                    </td>
                                </tr>

                            </tbody>   
                        </form>
                    </c:forEach>                   
                </table>
            <tr>
                <td>
                    <c:forEach begin="1" end="${requestScope.PAGENUMBER}" varStatus="counter" step="1">
                        <c:url var="number" value="${DispatcherController}">
                            <c:param name="pageNum" value="${counter.count}"/>

                            <c:param name="btnAction" value="Search"/>
                            <c:param name="txtQuestionContent" value="${quesName}"/>
                            <c:param name="txtSubject" value="${subject}"/>
                            <c:param name="statusDropDown" value="${status}"/>
                        </c:url>
                        <a href="${number}">${counter.count}</a>
                    </c:forEach>

                </td>

            </tr>

        </c:if> <%-- end when empty searchresult --%>
        <c:if test="${searchResult != null}">
            <c:if test="${empty searchResult}">
                <font color="red">There is no matching result!</font>
            </c:if>
        </c:if> <%--end when noot empty searchResult --%>
    </c:if> <%-- end when empty quesName --%>

</body>
</html>
