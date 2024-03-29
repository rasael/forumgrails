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
  <title><g:message code="forumgrails.courseList" /></title>
</head>
<body>
  <h1>&nbsp<g:message code="forumgrails.courseList" /></h1>
  <hr>
<g:render template="../header"/>
<br><br> <br>
<hr>
<g:if test="${flash.message}">
  <br><center><font color="red">${flash.message}</font></center><br>
</g:if>      
<table border="1" width="100%">
  <tr><th><g:message code="forumgrails.courseName"/></th><th><g:message code="forumgrails.information"/></th></tr>
<g:each var="course" in="${Course.list(sort:"name",order:"asc")}">
  <tr>
    <td style="vertical-align: top"><a href="/Enterprise/course/show?id=${course.id}"><b>${course.name}</b></a>
      <br><ul>
        <g:each var="argument" in="${course.arguments.sort{a,b -> a.name.compareTo(b.name)}}">
          <li class="sublist"><g:link controller="Argument" action="show" id="${argument.id}">${argument.name}</g:link></li>
        </g:each>
      </ul>
    </td>
    <td>
  <g:message code="forumgrails.arguments"/>: ${course.arguments.size()}<br>
  <g:message code="forumgrails.threads"/>: ${course.getThreadsCount()}<br>
  <g:message code="forumgrails.posts"/>: ${course.getPostsCount()}<br>
  </td>
  <g:if test="${session.user && session.user.role.ordinal() > 1}">
    <td>
    <g:link action="remove" id="${course.id}"><g:message code="forumgrails.remove" args="${[course.name]}"></g:message></g:link>
    </td>
  </g:if>
  </tr>
</g:each>
</table>
<g:if test="${session.user && session.user.role.ordinal() > 0}">
  &nbsp<g:link action="add"><g:message code="forumgrails.addNewCourse"/></g:link>
  <br><br>
</g:if>

<hr>
<a href="services/course?wsdl">&nbspCourses WSDL</a>
<hr>
&nbsp<g:message code="forumgrails.coursesCount" args="${[Course.count()]}" default="forumgrails.nothing"/>
<g:render template="../footer" />
</body>
</html>
