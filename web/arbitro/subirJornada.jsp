<%-- 
    Document   : subirJornada
    Created on : 23 feb. 2023, 13:04:21
    Author     : Di Qi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Importar Jornada</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
              rel="stylesheet" 
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
              crossorigin="anonymous">
    </head>
    <body class="bg-dark text-light">
        <jsp:include page="header.jsp"/>

        <div class="container my-5">
            <h1>Importar Jornada</h1>

            <h3>Formato a importar</h3>
            <p class="border rounded border-white p-2">
                Jornada ${jornada.numero}<br>
                <c:forEach items="${jornada.partidos}" var="p">
                    ${p.local};${p.puntosLocal};${p.visitante};${p.puntosVisitante}<br>
                </c:forEach>
            </p>

            <form method="post" action="SubirJornada" enctype="multipart/form-data">
                <label for="fichero">Fichero de la jornada: </label>
                <input type="file" name="fichero" id="fichero" required />
                <input type="submit" class="btn btn-outline-primary" value="Importar" />
            </form>

            <c:if test="${! empty error}">
                <p class="text-danger">
                    ${error}
                </p>
            </c:if>

            <p class="my-5">
                <a href="GestionarPartidos" class="btn btn-outline-danger">Volver</a>
            </p>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" 
        crossorigin="anonymous"></script>

    </body>
</html>
