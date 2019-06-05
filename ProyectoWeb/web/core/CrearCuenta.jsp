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
        <div id="header_1">
            <a href="../index.jsp">
                <img src="../images/crow.png" alt="Inicio" height="125" width="125"/>
            </a>
            <h1 id="tit">Sort Krage</h1>
        </div>
        <div id="core">
            <div id="content">
                <form>
                    <p>Nombre:</p>
                    <input type="text" name="nombre"/>
                    <p>Apellidos: </p>
                    <input type="text" name="ape"/>
                    <p>Usuario: </p>
                    <input type="text" name="usuario"/>
                    <p>Contraseña: </p>
                    <input type="password" name="contrasenia"/>
                    <br/><br/>
                    <input type="button" value="Crear Cuenta"/>
                    <a href="../index.jsp" style="text-decoration: none">
                        <input type="button" value="Cancelar">
                    </a>
                </form>

            </div>
        </div>
    </body>
</html> 