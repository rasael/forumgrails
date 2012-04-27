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
            <li><a href="#" class="top_parent">Supsi</a>
                <ul>
                    <li><a href="appweb.php" class="parent">Applicazioni web</a>
                        <ul>
                            <li><a href="http://www.w3schools.com/html5/html5_reference.asp" target="_blank">HTML5 Tag Reference</a></li>
                            <li><a href="webcl.php" >Materiale WebCl</a></li>
                        </ul>
                    </li>
                    <li><a href="telematica.php" >Telematica</a>

                    </li>
                </ul>
            </li>
        </ul>
        <ul>
            <li><a href="#" class="top_parent">Link utili</a>
                <ul>
                    <li><a href="#" class="parent">Supsi</a>
                        <ul>
                            <li><a href="http://webmail.ti-edu.ch/" target="_blank">WebMail</a></li>
                            <li><a href="http://www.icorsi.ch/" target="_blank">Icorsi</a></li>
                            <li><a href="http://www.dti.supsi.ch/~ceppi/" target="_blank">Sito Ceppi</a></li>
                            <li><a href="https://point.switch.ch/econfportal/www-aai/websms_v2_send/" target="_blank">SMS Switch</a></li>
                        </ul>
                    </li>

                </ul>
            </li>
        </ul>
        <ul>
            <li><a href="#" class="top_parent">Calendario</a>
                <ul>
                    <li><a href="calendario.php"> Visualizza</a></li>
                    <li><a href="https://www.google.com/calendar/" target="_blank"> Modifica</a></li>
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
                <g:link controller="user" action="logout">Logout</g:link> -
            </g:if>
                <g:else>
                    <g:link controller="user" action="login"><g:message code="forumgrails.login"/></g:link> -
                </g:else>
            </li>
        </ul>


    </div> 	<!-- end the menuh-container div -->
</div>	<!-- end the menuh div -->