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
  <title>Course view</title>
</head>

<body>
  <h1>&nbsp;<g:link action="list" controller="Course">Home</g:link>&gt;<%=course.name%></h1>
  <hr>
<g:render template="../header"/>
<br><br> <center><b><g:message code="forumgrails.coursew"/></b></center><br>

<hr>
<table border="1" width="100%">

  <tr><th>Argument name</th><th>Informations</th></tr>
  <g:each var="argument" in="${course.arguments.sort{a,b -> a.name.compareTo(b.name)}}">
    <tr>
      <td style="vertical-align: top">
        <b><a href="/Enterprise/argument/show?id=${argument.id}">${argument.name}</a></b>
      </td>
      <td>
        Threads: ${argument.threads.size()}<br>
        Posts: ${argument.getPostsCount()}<br>
      </td>
      <g:if test="${session.user && session.user.role.ordinal() > 1}">
        <td>
          <g:link action="remove" controller="Argument" id="${argument.id}"><g:message code="forumgrails.remove" args="${[argument.name]}"></g:message></g:link>
        </td>
      </g:if>
    </tr>
  </g:each>
</table>
<g:if test="${session.user && session.user.role.ordinal() > 0}">
  <hr>
  <center>
    <g:link action="add" controller="Argument" id="${course.id}" >
      <g:message code="forumgrails.addArgument" args="${[course.name]}"/>
    </g:link> - 
    <g:if test="${session.user && session.user.role.ordinal() > 1}">
      <g:link action="remove" id="${course.id}"><g:message code="forumgrails.remove" args="${[course.name]}"></g:message></g:link>
    </g:if>

  </center>
  <br>
</g:if>
<g:render template="../footer" />
</body>
</html>
