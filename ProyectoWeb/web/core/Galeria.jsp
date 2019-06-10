<%-- 
    Document   : index
    Created on : 02-abr-2019, 11:49:44
    Author     : sortkrage
--%>

<%@page import="controlador.Usuario"%>
<%@page import="java.util.Enumeration"%>
<%@page import="java.io.FileReader"%>
<%@page import="java.util.Properties"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%
    HttpSession s = request.getSession();
    Usuario u = (Usuario) s.getAttribute("usuario");
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel=stylesheet href="Galeria.css" type="text/css">
        <title>SK - El portal de descargas</title>
    </head>
    <body>
        <div id="content">
            <div id="header_1">
                <a href="../index.jsp">
                    <img src="../images/crow.png" alt="Inicio" height="125" width="125"/>
                </a>
                <h1 id="tit">Sort Krage</h1>
            </div>
            <div id="header_2">
                <ul id="menu_2">
                    <li><a href="Galeria.jsp">Tu Galería</a></li>
                    <li><a href="Explorar.jsp">Explorar</a></li>
                    <li><a href="Documentacion.jsp">Documentación</a></li>
                    <li><a href="AcercaDe.jsp">Acerca de</a></li>
                    <li style="float: right"><a href="Usuario.jsp">
                            <%
                                if (u == null) {
                                    out.println("Invitado");
                                } else {
                                    out.println(u.getNick());
                                }
                            %>
                        </a></li>                </ul>
            </div>
            <div id="widget">
                <%
                    if (u == null) {
                %>
                <h1>No has iniciado sesión</h1>
                <p>Pulsa <a href="login.jsp">aquí</a> para Iniciar Sesión.</p>
                <%
                } else {
                %>
                <table style="width: 100%">
                    <tr>
                        <th>Lista de Descargas</th>
                    </tr>
                    <%
                        Properties p = new Properties();
                        p.load(new FileReader(new File("prop/" + u.getNick())));
                        Enumeration e = p.keys();
                        while (e.hasMoreElements()) {
                            Object nextElement = e.nextElement();
                    %>
                    <tr>
                        <td style="text-align:left"><% out.println(String.valueOf(nextElement)); %></td>
                    </tr>
                    <%
                        }
                    %>
                </table>
                <% }%>
            </div>
        </div>  
    </body>
</html>