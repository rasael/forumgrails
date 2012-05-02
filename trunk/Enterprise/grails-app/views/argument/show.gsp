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
  <title><g:message code="forumgrails.threadsView"/></title>
</head>

<body>
  <h1>
      &nbsp;<g:link action="list" controller="Course">Home</g:link> &gt; <%=argument.name%>
  </h1>
  <hr>
<g:render template="../header"/>
<br><br>
<center><b><g:message code="forumgrails.threadsView"/></b></center>
<br>
<hr>
<table border="1" width="100%">

  <tr><th><g:message code="forumgrails.threadName"/></th><th><g:message code="forumgrails.information"/></th></tr>

  <g:each var="thread" in="${argument.threads.sort{a,b -> a.title.compareTo(b.title)}}">
    <tr>
      <td style="vertical-align: top"><g:link action="show" controller="Thread" id="${thread.id}">${thread.title}</g:link></td>
    <td><g:message code="forumgrails.posts"/>: ${thread.posts.size()}<br></td>
    <g:if test="${session.user && session.user.role.ordinal() > 1}">
      <td><g:link action="remove" controller="Thread" id="${thread.id}"><g:message code="forumgrails.remove" args="${[thread.title]}"></g:message></g:link></td>
    </g:if>
    </tr>
  </g:each>
</table>
  <hr>
  <center>
<g:if test="${session.user && session.user.role.ordinal() > 1}">
    <g:link action="add" controller="Thread" id="${argument.id}" >
      <g:message code="forumgrails.addThread" args="${[argument.name]}"/>
    </g:link>
</g:if>
    <g:if test="${session.user && session.user.role.ordinal() > 1}">
       - <g:link action="remove" id="${argument.id}"><g:message code="forumgrails.remove" args="${[argument.name]}"></g:message></g:link>
    </g:if>

  </center>
  <br>

<g:render template="../footer" />
</body>
</html>
