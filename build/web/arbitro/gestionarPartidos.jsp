<%-- 
    Document   : gestionarPartidos
    Created on : 23 feb. 2023, 10:39:43
    Author     : Di Qi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Gestionar Partidos</title>
        <script src="../js/jquery-3.6.3.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
              rel="stylesheet" 
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
              crossorigin="anonymous">
    </head>
    <body class="bg-dark text-light">
        <jsp:include page="header.jsp"/>

        <div class="container my-5">
            <h1>Gestionar Partidos</h1>

            <h3>Introducir liga</h3>
            <form method="post" id="liga-form" class="d-flex mb-3">
                <div class="col-3 mx-2">
                    <select id="liga" class="form-select">
                        <c:forEach items="${ligas}" var="l">
                            <option value="${l.id}">${l}</option>
                        </c:forEach>
                    </select>
                </div>
                <input type="submit" class="btn btn-outline-primary" value="Buscar" />
            </form>

            <div id="jornadas"></div>

            <div id="partidos"></div>

            <p class="my-5">
                <a href="menuArbitro.jsp" class="btn btn-outline-danger">Volver</a>
            </p>
        </div>

        <script>
            $("#liga-form").submit(function (e) {
                e.preventDefault();
                $("#partidos").html("");
                let ligaId = e.target.elements.liga.value;
                $.ajax({
                    url: "FiltrarJornadas",
                    data: {ligaId: ligaId},
                    success: function (respuesta) {
                        $("#jornadas").html(respuesta)
                    }
                });
            });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" 
        crossorigin="anonymous"></script>
    </body>
</html>
