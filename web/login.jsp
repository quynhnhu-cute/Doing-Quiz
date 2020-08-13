<%-- 
    Document   : login
    Created on : May 20, 2020, 9:27:18 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
    </head>
    <body>
        <h1>Login Page</h1>
        <form action="DispatcherController" method="POST">
            Username: <input type="text" name="txtUsername" value="" /><br/>
            Password: <input type="password" name="txtPassword" value="" /><br/>
            <input type="submit" value="Login" name="btnAction" />
            <input type="reset" value="Reset" />      
        </form>
        <c:set var="fail" value="${requestScope.LOGINFAIL}"/>
            <c:if test="${not empty fail}">
                <p>
                    <font color="red">
                        ${fail}
                    </font>
                </p>
                
            </c:if>
        
        <a href="register.jsp">Register here!</a>
    </body>
</html>
