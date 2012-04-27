<%@ page import="enterprise.*" %>

<div id="menuh-container" align="center">
    <div id="menuh" >
        <ul>
            <li><a href="/Enterprise" >Home</a>
            </li>
        </ul>
        <ul>
            <li><a href="#" class="top_parent">Corsi</a>
                <ul>
                    <g:each var="course2" in="${Course.list()}">
                        <a href="/Enterprise/course/show?id=${course2.id}">${course2.name}</a>
                        <ul>
                            <li><g:each var="argument" in="${course2.arguments}">
                                <a href="/Enterprise/argument/show?id=${argument.id}">${argument.name}</a>
                            </g:each> </li>
                        </ul>
                    </g:each>
                </ul>
            </li>
        </ul>

        <ul>
            <li><a href="#" class="top_parent">Lingua</a>
                <ul>
                    <li><a href="?lang=en">En</a></li>
                    <li><a href="?lang=it">It</a></li>
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

