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
    <title><g:message code="forumgrails.addNewPosts"/></title>
</head>
<body>
<h1>&nbsp<g:message code="forumgrails.addNewPosts"/></h1>
<hr>
<g:render template="../header"/>
<hr>
<g:if test="${flash.message}">
    <br><font color="red">${flash.message}</font><br>
</g:if>
<center>
    <g:form action="doAdd" method="post">
        <input type="hidden" name="threadID" value="${thread.id}"/>
        <b><g:message code="forumgrails.thread"/>:&nbsp</b> ${thread.title}<br><br>
        <b><g:message code="forumgrails.text"/>:&nbsp</b> <g:textArea name="text" value="${params.text}"/><br> <br>
        <input type="submit" value="Add"/>
    </g:form>
</center>
<br>
<hr>
</body>
</html>
