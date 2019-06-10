<%-- 
    Document   : Usuario
    Created on : 10-jun-2019, 13:04:02
    Author     : sortkrage
--%>
<%@page import="controlador.Usuario"%>
<%
    HttpSession s = request.getSession();
    Usuario u = (Usuario) s.getAttribute("usuario");
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel=stylesheet href="CrearCuenta.css" type="text/css">
        <title>Inicia Sesión</title>
    </head>
    <body>
        <div id="header_1">
            <a href="../index.jsp">
                <img src="../images/crow.png" alt="Inicio" height="125" width="125"/>
            </a>
            <h1 id="tit">Sort Krage</h1>
        </div>
        <div id="core">
            <div id="content">
                <%
                    if (u == null) {
                %>
                <h1>No has iniciado iniciado sesión</h1>
                <%
                } else {
                %>
                <form>
                    <p>Nombre:</p>
                    <p><% out.println(u.getNombre()); %></p>
                    <p>Apellido:</p>
                    <p><% out.println(u.getApellido()); %></p>
                    <p>Nick: </p>
                    <p><% out.println(u.getNick()); %></p>
                </form>
                <% }%>
            </div>
        </div>
    </body>
</html> 