<%-- 
    Document   : update
    Created on : May 25, 2020, 10:59:31 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Question Details</title>
    </head>
    <body>
        <c:set var="admin" value="${sessionScope.ADMIN}"/>
        <c:if test="${empty admin}">
            <c:redirect url="login.jsp"/>
        </c:if>
        <h1>Details</h1>
        <c:set var="question" value="${requestScope.QUESTION}"/>
        <c:set var="answer" value="${requestScope.ANSWER}"/>
        <c:set var="subjects" value="${requestScope.SUBJECTS}"/>
        <c:set var="errors" value="${requestScope.UPDATEERROR}"/>
        <form action="DispatcherController">
            Question Content :<input type="text" name="txtQuesContent" value="${question.quesContent}" /><br/>
            <c:if test="${not empty errors.quesContentLengthError}">
                <font color="red">${errors.quesContentLengthError}</font>
            </c:if><br/>
            <input type="hidden" name="txtQuesId" value="${answer.quesId}"/>
            Answer A: <input type="text" name="txtAnsA" value="${answer.answer1}" /><br/>
            <c:if test="${not empty errors.answerALengthError}">
                <font color="red">${errors.answerALengthError}</font>
            </c:if><br/>
            Answer B: <input type="text" name="txtAnsB" value="${answer.answer2}" /><br/>
            <c:if test="${not empty errors.answerBLengthError}">
                <font color="red">${errors.answerBLengthError}</font>
            </c:if><br/>
            Answer C: <input type="text" name="txtAnsC" value="${answer.answer3}" /><br/>
            <c:if test="${not empty errors.answerCLengthError}">
                <font color="red">${errors.answerCLengthError}</font>
            </c:if><br/>
            Answer D: <input type="text" name="txtAnsD" value="${answer.answer4}" /><br/>
            <c:if test="${not empty errors.answerDLengthError}">
                <font color="red">${errors.answerDLengthError}</font>
            </c:if><br/>
            Answer Correct: <input type="text" name="txtCorrectAns" value="${question.correctAnsId}" /><br/>
            <c:if test="${not empty errors.correctAnsValid}">
                <font color="red">${errors.correctAnsValid}</font>
            </c:if><br/>
            Subject: <select name="dropDownSub">
                <c:forEach var="item" items="${subjects}">
                    <option>${item}</option>
                </c:forEach>
            </select><br/>

            Status: <select name="dropDownStatus">
                <option>Active</option>
                <option>Passive</option>
            </select><br/>
            <input type="submit" value="Update Question" name="btnAction" />
            <input type="reset" value="Reset" /><br/>
            <input type="hidden" name="txtQuesId" value="${question}" />
        </form>
    </body>
</html>
