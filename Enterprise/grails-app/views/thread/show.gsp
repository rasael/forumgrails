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
    <title>Thread view</title>
</head>

<body>
<h1><%=thread.title%></h1>
<hr>
<g:render template="../header"/>
<br><br> <br>
<hr>
<table border="1" width="100%">

    <tr><th>Argument name</th><th>Informations</th></tr>

    <g:each var="post" in="${thread}">
        <tr>
            <td style="vertical-align: top">
              <a href="/Enterprise/argument/show?id=${thread.id}">${thread.title}</a></td>
        </tr>
    </g:each>
</table>
<g:render template="../footer" />
</body>
</html>
