<hr>
<h2 align="right">
  <g:if test="${session.user}">
    <g:message code="forumgrails.currentlyLogged" args="${[session.user,session.user.role]}" default="forumgrails.nothing"/>
  </g:if>
  <g:else>
    <g:message code="forumgrails.notLoggedIn"/>
  </g:else>
</h2>
<hr>
<center>
    <h2>ForumGrails 0.1 - <g:formatDate format="dd.MM.yyyy k:mm:ss" date="${new Date()}"/>  <br>
  R.Bervini - D.Gallan - S.Nava</h2>
</center>