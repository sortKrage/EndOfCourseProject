<%-- 
    Document   : Documentacion
    Created on : 10-jun-2019, 12:50:57
    Author     : sortkrage
--%>

<%@page import="controlador.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    HttpSession s = request.getSession();
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel=stylesheet href="AcercaDe.css" type="text/css">
        <title>SK - El portal para desarrolladores</title>
    </head>
    <body>
        <div id="content">
            <div id="header_1">
                <a href="../index.jsp">
                    <img src="../images/crow.png" alt="Inicio" height="125" width="125"/>
                </a>
                <h1 id="tit">Sort Krage</h1>
                <ul id="menu_1">
                    <li><a href="/srv/ftp/SortKrage.deb">Instalar</a></li>
                    <li><a href="login.jsp">Iniciar Sesión</a></li>
                </ul>
            </div>
            <div id="header_2">
                <ul id="menu_2">
                    <li><a href="Galeria.jsp">Tu Galería</a></li>
                    <li><a href="Explorar.jsp">Explorar</a></li>
                    <li><a href="Documentacion.jsp">Documentación</a></li>
                    <li><a href="AcercaDe.jsp">Acerca de</a></li>
                    <li style="float: right"><a href="Usuario.jsp">
                            <%
                                Usuario u = (Usuario) s.getAttribute("usuario");
                                if (u == null) {
                                    out.println("Invitado");
                                } else {
                                    out.println(u.getNick());
                                }
                            %>
                        </a></li>
                </ul>
            </div>
            <div id="core">
                <div id="wigdet">
                    <p>
                        Pulsa <a href="/srv/src/Memoria.pdf">aquí</a>. Para descargar la documentación del proyecto.
                    </p>
                </div>
            </div>
        </div>
    </body>
</html>