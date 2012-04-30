<%@ page import="enterprise.*" %>

<div id="menuh-container" align="center">
    <div id="menuh" >
        <ul>
            <li><a href="/Enterprise" >Home</a>
            </li>
        </ul>
        <ul>
            <li><a href="#" class="top_parent"><g:message code="forumgrails.courseList" /></a>
                <ul>
                <g:each var="course2" in="${Course.list().sort{a,b -> a.name.compareTo(b.name)}}">
                      <li><a href="/Enterprise/course/show?id=${course2.id}" class="parent">${course2.name}</a>
                        <ul>
                            <g:each var="argument" in="${course2.arguments.sort{a,b -> a.name.compareTo(b.name)}}">
                            <li><a href="/Enterprise/argument/show?id=${argument.id}">${argument.name}</a></li>
                            </g:each>
                        </ul></li>
                    </g:each>
                </ul>
            </li>
        </ul>

        <ul>
            <li><a href="#" class="top_parent"><g:message code="forumgrails.language" /></a>
                <ul>
                    <li><a href="?lang=en"><g:message code="forumgrails.english" /></a></li>
                    <li><a href="?lang=it"><g:message code="forumgrails.italian" /></a></li>
                </ul>
            </li>
        </ul>
        <ul>
            <li><g:if test="${session.user}">
                <g:link controller="user" action="logout">Logout</g:link>
            </g:if>
                <g:else>
                    <g:link controller="user" action="login"><g:message code="forumgrails.login"/></g:link>
                </g:else>
            </li>
        </ul>
    </div> 	<!-- end the menuh-container div -->
</div>	<!-- end the menuh div -->

