<%-- 
Document   : ValidarLogin
Created on : 10-jun-2019, 14:06:19
Author     : sortkrage
--%>

<%@page import="controlador.Usuario"%>
<%@page import="modelo.Persistencia"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    HttpSession s = request.getSession();
    Persistencia p = new Persistencia();
    Usuario u = new Usuario();
    u.setNick(request.getParameter("nick"));
    u = p.getUsuario(u);
%>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% if (u.getNick().equals("Invitado")) {

                response.sendRedirect("login.jsp");

            } else {

                s.setAttribute("usuario", u);
                response.sendRedirect("../index.jsp");

            }
        %>
    </body>
</html>
