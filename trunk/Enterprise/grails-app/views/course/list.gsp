<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->
<%@ page import="enterprise.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Course list</title>
  </head>
  <body>
    <h1>Course list</h1>
    <hr>
    <table border="1" width="100%">
      <tr><th>Course name</th><th>Informations</th></tr>
      <g:each var="course" in="${Course.list()}">
        <tr>
          <td style="vertical-align: top"><a href="/Enterprise/course/show?id=${course.id}">${course.name}</a></td>
          <td>
            Arguments: ${course.arguments.size()}<br>
            Threads: ${course.getThreadsCount()}<br>
            Posts: ${course.getPostsCount()}<br>
          </td>
        </tr>
      </g:each>
    </table>
    <hr>
    Total of <%=Course.count()%> courses
    <hr>
<%=  new Date() %>
  </body>
</html>
