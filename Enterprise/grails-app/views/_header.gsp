<center>
  <a href="/Enterprise">Home</a> - 
  <g:if test="${session.user}">
    <g:link controller="user" action="logout">Logout</g:link> - 
  </g:if>
  <g:else>
    <g:link controller="user" action="login"><g:message code="forumgrails.login"/></g:link> -     
  </g:else>
  (<a href="?lang=en">En</a> - <a href="?lang=it">It</a>)
<g:render template="../menu"/>
</center>