<!--
  To change this template, choose Tools | Templates
  and open the template in the editor.
-->

<%@ page contentType="text/html;charset=UTF-8" %>

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <g:render template="../css"/>
  <title>User Login</title>
</head>
<body>  
  <hr>
<g:render template="../header"/>
<hr>
<div class="body">
  <g:form action="doLogin" method="post">
    <input type="hidden" name="ref" value="${request.getHeader('referer')}"/>
    <div class="dialog">
      <p>Enter your login details below:</p>
      <g:if test="${flash.message}">
        <br>
        ${flash.message}
        <br>
      </g:if>      
      <table class="userForm">
        <tr class='prop'>
          <td valign='top' style='text-align:left;' width='20%'>
            <label for='email'>Email:</label>
          </td>
          <td valign='top' style='text-align:left;' width='80%'>
            <input id="email" type='text' name='email' value='${user?.email}' />
          </td>
          <td>forumgrails&#64;supsi.ch</td>
        </tr>
        <tr class='prop'>
          <td valign='top' style='text-align:left;' width='20%'>
            <label for='password'>Password:</label>
          </td>
          <td valign='top' style='text-align:left;' width='80%'>
            <input id="password" type='password' name='password'
                   value='${user?.password}' />
          </td>
          <td>forumpassword</td>
        </tr>
      </table>
    </div>
    <div class="buttons">
      <span class="formButton">
        <input type="submit" value="Login"></input>
      </span>
    </div>
  </g:form>
</div>  
</body>
</html>
