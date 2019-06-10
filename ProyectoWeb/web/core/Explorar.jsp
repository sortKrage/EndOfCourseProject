<%-- 
    Document   : index
    Created on : 02-abr-2019, 11:49:44
    Author     : sortkrage
--%>

<%@page import="controlador.Usuario"%>
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
                    <li><a href="#Soporte">Documentación</a></li>
                    <li><a href="#AcercaDe">Acerca de</a></li>
                    <li style="float: right"><a href="#Usuario">Usuario</a></li>
                </ul>
            </div>
            <div id="widget">
                <table style="width: 100%">
                    <tr>
                        <th>Lista de Descargas</th>
                    </tr>
                    <%
                        File f = new File("/srv/ftp/");
                        String[] files = f.list();
                        for (int i = 0; i < files.length; i++) {
                    %>
                    <tr>
                        <td style="text-align:left"><% out.println(files[i]); %></td>
                    </tr>
                    <%
                        }
                    %>
                </table>
            </div>
        </div>  
    </body>
</html>