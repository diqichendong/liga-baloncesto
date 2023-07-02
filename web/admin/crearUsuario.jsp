<%-- 
    Document   : crearUsuario
    Created on : 21 feb. 2023, 20:01:47
    Author     : Di Qi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Crear Usuario</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
              rel="stylesheet" 
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
              crossorigin="anonymous">
    </head>
    <body class="bg-dark text-light">
        <jsp:include page="header.jsp"/>

        <div class="container my-5">
            <h1>Crear Usuario</h1>
            <form method="post" action="CrearUsuario">
                <div class="mb-3">
                    <label for="nombre">Nombre: </label>
                    <input type="text" name="nombre" id="nombre" required />
                </div>
                <div class="mb-3">
                    <label for="login">Usuario: </label>
                    <input type="text" name="login" id="login" required />
                </div>
                <div class="mb-3">
                    <label for="password">Contraseña: </label>
                    <input type="password" name="password" id="password" required />
                </div>
                <div class="mb-3">
                    <label for="tipo">Tipo: </label>
                    <select name="tipo" id="tipo">
                        <option value="Administrador">Administrador</option>
                        <option value="Arbitro">Árbitro</option>
                    </select>
                </div>
                <input type="submit" class="btn btn-outline-success" value="Crear" />
            </form>
            <c:if test="${! empty error}">
                <p class="text-danger">
                    ${error}
                </p>
            </c:if>
            <p class="my-5">
                <a href="GestionarUsuarios" class="btn btn-outline-danger">Volver</a>
            </p>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" 
        crossorigin="anonymous"></script>
    </body>
</html>
