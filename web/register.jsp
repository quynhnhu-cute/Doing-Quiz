<%-- 
    Document   : register
    Created on : May 19, 2020, 2:53:36 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register Page</title>
    </head>
    <body>
        <h1>Register</h1>
        <form action="DispatcherController" method="POST">
            <c:set var="errors" value="${requestScope.CREATEERROR}"/>
            Email(from 12-50 characters): <input type="text" name="txtEmail" value="" /><br/>
            <c:if test="${not empty errors.usernameLengthError}">
                <font color="red">
                    ${errors.usernameLengthError}
                </font>
            </c:if><br/>
            <c:if test="${not empty errors.usernameDuplicatedError}">
                <font color="red">
                    ${errors.usernameDuplicatedError}
                </font>
            </c:if><br/>
            <c:if test="${not empty errors.usernameNotValid}">
                <font color="red">
                    ${errors.usernameNotValid}
                </font>
            </c:if><br/>
            FullName(from 3-50 characters): <input type="text" name="txtFullname" value="" /><br/>
            <c:if test="${not empty errors.fullnameLengthError}">
                <font color="red">
                    ${errors.fullnameLengthError}
                </font>
            </c:if><br/>
            Password(from 3-10 characters): <input type="password" name="txtPassword" value="" /><br/>
            <c:if test="${not empty errors.passwordLengthError}">
                <font color="red">
                    ${errors.passwordLengthError}
                </font>
            </c:if><br/>
            Password Confirm(from 3-10 characters): <input type="password" name="txtPasswordConfirm" value="" /><br/>
            <c:if test="${not empty errors.passwordNotMatchingError}">
                <font color="red">
                    ${errors.passwordNotMatchingError}
                </font>
            </c:if><br/>
            <input type="submit" value="Register" name="btnAction" />
            <input type="reset" value="Reset" />
        </form>
    </body>
</html>
