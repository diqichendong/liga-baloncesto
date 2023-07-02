<%-- 
    Document   : login
    Created on : 22 feb. 2023, 17:44:48
    Author     : Di Qi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Iniciar Sesión</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
              rel="stylesheet" 
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
              crossorigin="anonymous">
    </head>
    <body class="bg-dark text-light container my-5">

        <h1>Iniciar Sesión</h1>

        <form method="post" action="Login">
            <div class="mb-3">
                <label for="login" class="col text-right">Usuario: </label>
                <input type="text" name="login" id="login" required />
            </div>
            <div class="mb-3">
                <label for="password" class="col">Contraseña: </label>
                <input type="password" name="password" id="password" required />
            </div>
            <input type="submit" class="btn btn-outline-primary" value="Iniciar sesión" />
        </form>
        <c:if test="${! empty error}">
            <p class="error">
                ${error}
            </p>
        </c:if>
        <p class="my-5">
            <a href="index.jsp" class="btn btn-outline-danger">Volver</a>
        </p>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" 
        crossorigin="anonymous"></script>

    </body>
</html>
