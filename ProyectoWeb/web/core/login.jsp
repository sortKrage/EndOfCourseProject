<%-- 
    Document   : login
    Created on : 04-jun-2019, 20:52:53
    Author     : sortkrage
--%>
<%@page import="modelo.Persistencia"%>
<%@page import="controlador.Server"%>
<%@page import="controlador.Usuario"%>
<%
    HttpSession s = request.getSession();
    Usuario u = (Usuario) s.getAttribute("usuario");
    Persistencia p = new Persistencia();
%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel=stylesheet href="login.css" type="text/css">
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
                    if (u != null) {

                %>
                <h1>Ya has iniciados sesión como <% out.println(u.getNick()); %></h1>
                <%
                } else {
                %>
                <form name="formInit" action="ValidarLogin.jsp" method="post" onsubmit="return validar()" >
                    <p>Nick: </p>
                    <input type="text" name="nick"/>
                    <p>Contraseña: </p>
                    <input type="password" name="contrasenia"/>
                    <br/><br/>
                    <input type="submit" value="Iniciar Sesión"/>
                    <a href="../index.jsp" style="text-decoration: none">
                        <input type="button" value="Cancelar">
                    </a>
                    <p>
                        ¿No tienes cuenta? <a href="CrearCuenta.jsp">Crea una</a>
                    </p>
                </form>
                <% }%>
            </div>
        </div>
        <script>
            function validar() {
                with (document.formInit.nick) {
                    if (value == "") {
                        alert("No se ha introducido ningún nick")
                        focus()
                        return false
                    } else {
                        with (document.formInit.constrasenia) {
                            if (value == "") {
                                alert("La contraseña está vacía")
                                focus()
                                return false
                            } else {
                                return true
                            }
                        }
                    }
                }
            }
        </script>
    </body>
</html>
