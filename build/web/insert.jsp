<%-- 
    Document   : insert
    Created on : May 26, 2020, 1:03:39 PM
    Author     : USER
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insert Page</title>
    </head>
    <body>
        <c:set var="admin" value="${sessionScope.ADMIN}"/>
        <c:if test="${empty admin}">
            <c:redirect url="login.jsp"/>
        </c:if>
        <h1>Insert</h1>
        <c:set var="error" value="${requestScope.ERROR}"/>
        <form action="DispatcherController" method="POST">
            Question Content(from 3 to 50 characters):<input type="text" name="txtQuestionContent1" value="" /><br>
            <c:if test="${not empty error.quesContentLengthError}">
                <font color="red">${error.quesContentLengthError}</font>

            </c:if><br/>
            Answer A(from 3 to 500 characters): <input type="text" name="txtAnsA" value="" /><br/>
            <c:if test="${not empty error.answerALengthError}">
                <font color="red">${error.answerALengthError}</font>
            </c:if><br/>
            Answer B(from 3 to 500 characters): <input type="text" name="txtAnsB" value="" /><br/>
            <c:if test="${not empty error.answerBLengthError}">
                <font color="red">${error.answerBLengthError}</font>
            </c:if><br/>
            Answer C(from 3 to 500 characters): <input type="text" name="txtAnsC" value="" /><br/>
            <c:if test="${not empty error.answerCLengthError}">
                <font color="red">${error.answerCLengthError}</font>
            </c:if><br/>
            Answer D(from 3 to 500 characters): <input type="text" name="txtAnsD" value="" /><br/>
            <c:if test="${not empty error.answerDLengthError}">
                <font color="red">${error.answerDLengthError}</font>
            </c:if><br/>
            Correct Answer: <input type="text" name="txtAnsCorrect" value="" /><br>
            <c:if test="${not empty error.correctAnsValid}">
                <font color="red">${error.correctAnsValid}</font>
            </c:if><br/>
            <c:set var="subList" value="${requestScope.SUBLIST}"/>
            <c:if test="${not empty subList}">
                Subject: <select name="dropDownSub">
                    <c:forEach var="item" items="${subList}" step="1">
                        <option>${item}</option>
                    </c:forEach>
                </select>
            </c:if><br/>
            <c:if test="${not empty error.questionAlreadyExisted}">
                <font color="red">${error.questionAlreadyExisted}</font>
            </c:if><br/>

            <input type="submit" value="Add" name="btnAction" />
            <input type="reset" value="Reset" /><br/>
            <a href="admin.jsp">Back To Admin Page</a>
        </form>
    </body>
</html>
