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
  <title><g:message code="forumgrails.addNewThread"/></title>
</head>
<body>
  <h1>&nbsp<g:message code="forumgrails.addNewThread"/></h1>
  <hr>
<g:render template="../header"/>
<hr>
<g:if test="${flash.message}">
  <br><font color="red">${flash.message}</font><br>
</g:if>
<center>
<g:form action="doAdd" method="post">
  <input type="hidden" name="argumentID" value="${argument.id}"/>
  <b><g:message code="forumgrails.argument"/>:&nbsp</b> ${argument.name}<br><br>
  <b><g:message code="forumgrails.title"/>:&nbsp</b> <g:textField name="title" value="${params.title}"/><br> <br>
  <b><g:message code="forumgrails.text"/>:&nbsp</b> <g:textArea name="text" value="${params.text}"/><br> <br>
  <input type="submit" value="Add"/>
</g:form>
</center>
<br>
<hr>
</body>
</html>
