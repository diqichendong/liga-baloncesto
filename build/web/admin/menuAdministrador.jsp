<%-- 
    Document   : menuAdministrador
    Created on : 22 feb. 2023, 10:14:34
    Author     : Di Qi
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Menú Administrador</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
              rel="stylesheet" 
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
              crossorigin="anonymous">
    </head>
    <body class="bg-dark text-light">
        <jsp:include page="header.jsp"/>
        <div class="container my-5">
            <h1>Menú Administrador</h1>
            <p>
                <a href="GestionarUsuarios" class="btn btn-outline-primary">Gestionar usuarios</a>
            </p>
            <p>
                <a href="CrearLiga" class="btn btn-outline-primary">Crear liga</a>
            </p>

            <p>
                <a href="../VerClasificaciones" class="btn btn-outline-primary">Ver clasificaciones</a>
            </p>
            <p>
                <a href="../VerEquipos" class="btn btn-outline-primary">Ver equipos</a>
            </p>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" 
        crossorigin="anonymous"></script>
    </body>
</html>
