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
  <h1>&nbsp<g:message code="forumgrails.addNewCourse"/></h1>
  <hr>
<g:render template="../header"/>
<hr>
<center><g:form action="doAdd" method="post">
   <b> &nbsp<g:message code="forumgrails.name"/>:</b> <g:textField name="name" />
  <br> <br>
  <input type="submit" value="Add"/>
</g:form>      </center>
<br>
<hr>
</body>
</html>
