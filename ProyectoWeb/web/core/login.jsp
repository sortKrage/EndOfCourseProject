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
                <form>
                    <p>Usuario: </p>
                    <input type="text" name="usuario"/>
                    <p>Contraseña: </p>
                    <input type="text" name="contrasenia"/>
                </form>
            </div>
        </div>
    </body>
</html>
