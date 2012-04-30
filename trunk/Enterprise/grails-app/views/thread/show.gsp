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
  <title>Thread view</title>
</head>

<body>
  <h1>&nbsp;<g:link action="list" controller="Course">Home</g:link>&gt;<%=thread.title%></h1>
  <hr>
<g:render template="../header"/>
<br><br><center><b>Thread view</b></center> <br>
<hr>
<!--<table border="1" width="100%">

  <tr><td>-->
      <table width="100%">
        <tr>
          <td width="240px">
            <h5>
              <b>User:</b> ${thread.author}<br><br>
              <b>Date:</b> ${new SimpleDateFormat("dd.MM.yyyy").format(thread.date)}
            </h5>
          </td>
          <td style="vertical-align: top"><h1><b>${thread.title}</b></h1><br><h2>${thread.text}</h2></td>
        </tr>
      </table>

      <g:each var="post" in="${thread.posts.sort{a,b -> b.date.compareTo(a.date)}}">
        <table width="100%">
          <tr>
            <td width="240px">
              <h5>
                <b>User:</b> ${post.author}<br>
                <b>Date:</b> ${new SimpleDateFormat("dd.MM.yyyy").format(post.date)}
              </h5>
            </td>
            <td style="vertical-align: top"><br><h2>${post.text}</h2></td>
          </tr>
        </table>
      </g:each>

<!--</table>-->
<g:render template="../footer" />
</body>
</html>
