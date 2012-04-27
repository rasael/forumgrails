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
  <title><g:message code="forumgrails.addNewCourse"/></title>
</head>
<body>
  <h1><g:message code="forumgrails.addNewCourse"/></h1>
  <hr>
<g:render template="../header"/>
<hr>
<g:form action="doAdd" method="post">
  Name: <g:textField name="name" />
  <br>
  <input type="submit" value="Add"/>
</g:form>

<hr>
</body>
</html>
