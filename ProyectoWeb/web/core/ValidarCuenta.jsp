<%-- 
    Document   : ValidarCuenta
    Created on : 10-jun-2019, 16:02:04
    Author     : sortkrage
--%>

<%@page import="controlador.Usuario"%>
<%@page import="modelo.Persistencia"%>
<%
    HttpSession s = request.getSession();
    Persistencia p = new Persistencia();
    String nick = request.getParameter("nick");
    if (p.comprobarNick(nick)) {
        s.setAttribute("redirect", "1");
        response.sendRedirect("CrearCuenta.jsp");
    } else {
        Usuario u = new Usuario(0, nick, request.getParameter("nombre"),
                request.getParameter("ape"), request.getParameter("contrasenia"));
        p.guardarUsu(u);
        s.setAttribute("usuario", u);
        response.sendRedirect("../index.jsp");
    }
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
