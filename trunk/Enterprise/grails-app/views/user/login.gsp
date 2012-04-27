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
    <div class="dialog">
      <p>Enter your login details below:</p>
      <table class="userForm">
        <tr class='prop'>
          <td valign='top' style='text-align:left;' width='20%'>
            <label for='email'>Email:</label>
          </td>
          <td valign='top' style='text-align:left;' width='80%'>
            <input id="email" type='text' name='email' value='${user?.email}' />
          </td>
          <td>a&#64;b.c</td>
        </tr>
        <tr class='prop'>
          <td valign='top' style='text-align:left;' width='20%'>
            <label for='password'>Password:</label>
          </td>
          <td valign='top' style='text-align:left;' width='80%'>
            <input id="password" type='password' name='password'
                   value='${user?.password}' />
          </td>
          <td>abc</td>
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