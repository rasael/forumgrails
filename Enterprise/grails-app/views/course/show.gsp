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
<h1><%=course.name%></h1>
<hr>
<g:render template="../header"/>
<hr>
Arguments: <%=course.arguments.size()%><br>
Threads: <%=course.getThreadsCount()%><br>
Posts: <%=course.getPostsCount()%><br>
<hr>
<table border="1" width="100%">

    <tr><th>Argument name</th><th>Informations</th></tr>

    <g:each var="argument" in="${course.arguments}">
        <tr>
            <td style="vertical-align: top">
              <a href="/Enterprise/argument/show?id=${argument.id}">${argument.name}</a></td>
            <td>
                Threads: ${argument.threads.size()}<br>
                Posts: ${argument.getPostsCount()}<br>
            </td>
        </tr>
    </g:each>
</table>
<g:render template="../footer" />
</body>
</html>
