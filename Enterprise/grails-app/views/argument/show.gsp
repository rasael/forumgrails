<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->
<%@ page import="enterprise.*" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Argument view</title>
</head>

<body>
<h1><%=argument.name%></h1>
<hr>
Threads: <%=argument.threads.size()%><br>
Posts: <%=argument.getPostsCount()%><br>
<hr>
<table border="1" width="100%">

    <tr><th>Argument name</th><th>Informations</th></tr>

    <g:each var="thread" in="${argument.threads}">
        <tr>
            <td style="vertical-align: top"><a href="/Enterprise/thread/show?id=${thread.id}">${thread.title}</a></td>
            <td>
                Posts: ${thread.posts.size()}<br>
            </td>
        </tr>
    </g:each>
</table>
<hr>
<%=new Date()%>
</body>
</html>
