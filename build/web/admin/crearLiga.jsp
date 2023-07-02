<%-- 
    Document   : crearLiga
    Created on : 22 feb. 2023, 18:20:48
    Author     : Di Qi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Crear Liga</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
              rel="stylesheet" 
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
              crossorigin="anonymous">
    </head>
    <body class="bg-dark text-light">
        <jsp:include page="header.jsp"/>

        <div class="container my-5">
            <h1>Crear Liga</h1>

            <h3>Equipos participantes</h3>
            <table border="1" class="table table-primary table-striped">
                <tr>
                    <th></th>
                    <th>Nombre</th>
                    <th></th>
                </tr>
                <c:forEach items="${equipos}" var="e" varStatus="status">
                    <tr>
                        <td>${status.index + 1}</td>
                        <td>${e.nombre}</td>
                        <td>
                            <form method="post" action="CrearLiga">
                                <input type="hidden" name="eliminar" value="${status.index}" />
                                <input type="submit" class="btn btn-sm btn-danger" value="Eliminar" />
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
            <form method="post" action="CrearLiga">
                <label for="equipo">Nombre del equipo: </label>
                <input type="text" name="equipo" id="equipo" autofocus required />
                <input type="submit" class="btn btn-sm btn-warning" value="Añadir" />
            </form>
            <br><br>

            <h3>Datos de la liga</h3>
            <form action="CrearLiga" method="post">
                <div class="mb-3">
                    <label for="nombre">Nombre de la liga: </label>
                    <input type="text" name="nombre" id="nombre" required />
                </div>
                <div class="mb-3">
                    <label for="fecha">Fecha inicio: </label>
                    <input type="date" name="fecha" id="fecha" required />
                </div>
                <input type="submit" class="btn btn-outline-success" value="Crear liga"/>
            </form>
            <c:if test="${! empty error}">
                <p class="text-danger">
                    ${error}
                </p>
            </c:if>
            <p class="my-5">
                <a href="menuAdministrador.jsp" class="btn btn-outline-danger">Volver</a>
            </p>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" 
        crossorigin="anonymous"></script>
    </body>
</html>
