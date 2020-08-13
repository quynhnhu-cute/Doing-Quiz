<%-- 
    Document   : quiz
    Created on : May 30, 2020, 8:07:53 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quiz Page</title>

    </head>
    <body>
        <c:if test="${empty sessionScope.STUDENT}">
            <c:redirect url="login.jsp"/>
        </c:if>
        <h1>Welcome To Quiz</h1>

        <h2>
            <font color="red">

            <input type="hidden" name="txtTimeQuiz" value="${requestScope.TIME}" id="timeQuizing"/>
            <span id="timeShowing"></span>

            </font>
        </h2>
        <script>
            const timeShow = document.getElementById("timeShowing");
            const momentTime = document.getElementById("timeQuizing");
            var timeCalculate = momentTime.value;
            function makeTimeOut() {
                setTimeShowing(timeCalculate);
                if (timeCalculate <= 0) {
                    document.getElementById("btnSubmitQuiz").click();
                } else {
                    setTimeShowing(timeCalculate);
                    setTimeout(function () {
                        timeCalculate -= 1;
                        makeTimeOut();
                    }, 1000);
                }

            }

            function getTimeForShowing(time) {
                var hr = Math.floor(time / 3600);
                var min = Math.floor(time / 60);
                var sec = time % 60;
                if (hr < 10) {
                    hr = "0" + hr;
                }
                if (min < 10) {
                    min = "0" + min;
                }
                if (sec < 10) {
                    sec = "0" + sec;
                }
                return hr + ":" + min + ":" + sec;
            }
            function setTimeShowing(time) {
                timeShow.innerHTML = getTimeForShowing(time);
                momentTime.value = time;
            }
            
            function time() {
                document.getElementById("timeme").value = document.getElementById("timeShowing").innerHTML;
            }
            makeTimeOut();
        </script>
        <c:set var="question" value="${requestScope.QUESTION}"/>
        <c:if test="${not empty question}">
            <form id="questionForm" action="DispatcherController">
                <c:set var="answerTicked" value="${question.ansTicked}"/>

                <table border="1">
                    <tbody>
                        <tr>

                            <td colspan="2">${question.quesContent}</td>
                        </tr>
                        <tr>
                            <td>
                                <input type="radio" name="answer" value="A" 
                                       <c:if test="${"A" eq answerTicked}">
                                           checked ="checked"
                                       </c:if>/>

                            </td>

                            <td>${question.answer1}</td>
                        </tr>
                        <tr>
                            <td>
                                <input type="radio" name="answer" value="B" 
                                       <c:if test="${"B" eq answerTicked}">
                                           checked ="checked"
                                       </c:if> />

                            </td>

                            <td>${question.answer2}</td>
                        </tr>
                        <tr>
                            <td>
                                <input type="radio" name="answer" value="C" 
                                       <c:if test="${"C" eq answerTicked}">
                                           checked ="checked"
                                       </c:if>/>

                            </td>

                            <td>${question.answer3}</td>
                        </tr>
                        <tr>
                            <td>
                                <input type="radio" name="answer" value="D" 
                                       <c:if test="${"D" eq answerTicked}">
                                           checked ="checked"
                                       </c:if>/>
                            </td>
                            <td>${question.answer4}</td>
                        </tr>

                    </tbody>
                </table>  
                <input type="hidden" name="number" value="${sessionScope.NUMBER}" />
                <input type="hidden" name="timeNow" value="" id="timeme" />
            </form>
            <c:if test="${sessionScope.NUMBER - 1 >= 0}">                
                <input type="submit" value="Previous" name="btnAction" form="questionForm" onclick="time()" />
            </c:if>
            <c:if test="${sessionScope.NUMBER + 1 < 10}">               
                <input type="submit" value="Next" name="btnAction" form="questionForm" onclick="time()" />
            </c:if> <br/>       
            <input type="submit" value="Submit" name="btnAction" form="questionForm" id="btnSubmitQuiz"/>
        </c:if>
    </body>
</html>
