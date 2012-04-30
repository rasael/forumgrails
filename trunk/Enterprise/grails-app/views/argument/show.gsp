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
    <title>Argument view</title>
</head>

<body>
<h1><%=argument.name%></h1>
<hr>
<g:render template="../header"/>
<br><br> <br>
<hr>
<table border="1" width="100%">

    <tr><th>Thread name</th><th>Informations</th></tr>

    <g:each var="thread" in="${argument.threads}">
        <tr>
            <td style="vertical-align: top"><a href="/Enterprise/thread/show?id=${thread.id}">${thread.title}</a></td>
            <td>
                Posts: ${thread.posts.size()}<br>
            </td>
        </tr>
    </g:each>
</table>
<g:render template="../footer" />
</body>
</html>
