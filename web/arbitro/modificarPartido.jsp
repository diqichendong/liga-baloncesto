<%-- 
    Document   : modificarPartido
    Created on : 23 feb. 2023, 11:58:47
    Author     : Di Qi
--%>

<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-18">
        <title>Establecer Resultado</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
              rel="stylesheet" 
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
              crossorigin="anonymous">
    </head>
    <body class="bg-dark text-light">
        <jsp:include page="header.jsp"/>

        <div class="container my-5">
            <h1>Establecer Resultado</h1>
            <form action="ModificarPartido" method="post">
                <input type="hidden" name="id" value="${partido.id}" />
                <div class="mb-3">
                    <label for="local">${partido.local}: </label>
                    <input type="number" name="local" id="local" min="0" step="1" value="${partido.puntosLocal}" required />
                </div>
                <div class="mb-3">
                    <label for="visitante">${partido.visitante}: </label>
                    <input type="number" name="visitante" id="visitante" min="0" step="1" value="${partido.puntosVisitante}" required />
                </div>
                <input type="submit" class="btn btn-outline-success" value="Establecer resultado" />
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
