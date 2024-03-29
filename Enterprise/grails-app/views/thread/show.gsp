<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->
<%@ page import="enterprise.*" %>
<%@ page import="java.text.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <g:render template="../css"/>
  <title><g:message code="forumgrails.threadsView"/></title>
</head>

<body>
  <h1>&nbsp;<g:link action="list" controller="Course">Home</g:link>&gt;<%=thread.title%></h1>
  <hr>
<g:render template="../header"/>
<br><br><center><b><g:message code="forumgrails.threadsView"/></b></center> <br>
<hr>
<!--<table border="1" width="100%">

  <tr><td>-->
      <table width="100%">
        <tr>
          <td width="240px">
            <h5>
              <b><g:message code="forumgrails.user"/>:</b> ${thread.author}<br><br>
              <b><g:message code="forumgrails.date"/>:</b> ${new SimpleDateFormat("dd.MM.yyyy").format(thread.date)}
            </h5>
          </td>
          <td style="vertical-align: top"><h1><b>${thread.title}</b></h1><br><h2>${thread.text}</h2></td>
        </tr>
      </table>

      <g:each var="post" in="${thread.posts.sort{b,a -> b.date.compareTo(a.date)}}">
        <table width="100%">
          <tr>
            <td width="240px">
              <h5>
                <b><g:message code="forumgrails.user"/>:</b> ${post.author}<br>
                <b><g:message code="forumgrails.date"/>:</b> ${new SimpleDateFormat("dd.MM.yyyy").format(post.date)}
              </h5>
            </td>
            <td style="vertical-align: top"><br><h2>${post.text}</h2></td>
          </tr>

        </table>
      </g:each>
<!--</table>-->
<hr>
<center>
   <g:link action="add" controller="Post" id="${thread.id}" >
        <g:message code="forumgrails.addPost" args="${[thread.title]}"/>
    </g:link>
   <g:if test="${session.user && session.user.role.ordinal() > 1}">
        - <g:link action="remove" id="${thread.id}"><g:message code="forumgrails.remove" args="${[thread.title]}"></g:message></g:link>
    </g:if>

</center>
<br>
<g:render template="../footer" />
</body>
</html>
