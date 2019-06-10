<%-- 
    Document   : login
    Created on : 04-jun-2019, 20:52:53
    Author     : sortkrage
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel=stylesheet href="CrearCuenta.css" type="text/css">
        <title>Inicia Sesión</title>
    </head>
    <body>
        <%
            HttpSession s = request.getSession();
            String r = (String) s.getAttribute("redirect");
            if (r != null) {
        %>
        <script>alert("El nick ya está cogido");</script>
        <%
            }
        %>
        <div id="header_1">
            <a href="../index.jsp">
                <img src="../images/crow.png" alt="Inicio" height="125" width="125"/>
            </a>
            <h1 id="tit">Sort Krage</h1>
        </div>
        <div id="core">
            <div id="content">
                <form name="formCrear" action="ValidarCuenta.jsp" method="post" onsubmit="return validar()">
                    <p>Nombre:</p>
                    <input type="text" name="nombre"/>
                    <p>Apellidos: </p>
                    <input type="text" name="ape"/>
                    <p>Usuario: </p>
                    <input type="text" name="nick"/>
                    <p>Contraseña: </p>
                    <input type="password" name="contrasenia"/>
                    <br/><br/>
                    <input type="submit" value="Crear Cuenta"/>
                    <a href="../index.jsp" style="text-decoration: none">
                        <input type="button" value="Cancelar">
                    </a>
                </form>
            </div>
        </div>
        <script>
            function validar() {
                with (document.formInit.nombre) {
                    if (value == "") {
                        alert("No se ha introducido ningún nombre")
                        focus()
                        return false
                    } else {
                        with (document.formInit.ape) {
                            if (value == "") {
                                alert("El apellido está vacío")
                                focus()
                                return false
                            } else {
                                with (document.formInit.nick) {
                                    if (value == "") {
                                        alert("El nick está vacío")
                                        focus()
                                        return false
                                    } else {
                                        with (document.formInit.contrasenia) {
                                            if (value == "") {
                                                alert("La contrasenia está vacía")
                                                focus()
                                                return false
                                            } else {
                                                return true
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        </script>
    </body>
</html> 