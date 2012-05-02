<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->
<%@ page import="enterprise.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <g:render template="../css"/>
  <title><g:message code="forumgrails.addNewArgument"/></title>
</head>
<body>
  <h1>&nbsp<g:message code="forumgrails.addNewArgument"/></h1>
  <hr>
<g:render template="../header"/>
<hr>
<g:if test="${flash.message}">
  <br><font color="red">${flash.message}</font><br>
</g:if>
<center>
<g:form action="doAdd" method="post">
  <input type="hidden" name="courseID" value="${course.id}"/>
   <b> &nbsp<g:message code="forumgrails.courseName"/>:&nbsp</b>${course.name}<br><br>
   <b>&nbsp<g:message code="forumgrails.name"/>:&nbsp</b> <g:textField name="name" value="${params.name}"/><br> <br>
  <input type="submit" value="Add"/>
</g:form></center>
<br>
<hr>
</body>
</html>
