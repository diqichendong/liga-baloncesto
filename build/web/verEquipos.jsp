<%-- 
    Document   : verEquipos
    Created on : 26 feb. 2023, 10:18:27
    Author     : Di Qi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setBundle basename="bundle.mensajes"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><fmt:message key="index.equipos"/></title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
              rel="stylesheet" 
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
              crossorigin="anonymous">
    </head>
    <body class="bg-dark text-light">
        <c:if test="${usuario.tipo ne null}">
            <jsp:include page="header.jsp"/>
        </c:if>

        <div class="container my-5">
            <h1><fmt:message key="index.equipos"/></h1>
            <h3><fmt:message key="equipos.elegirLiga"/></h3>
            <form method="post" action="VerEquipos" class="d-flex mb-3">
                <div class="col-3 mx-2">
                    <select name="ligaId" class="form-select">
                        <c:forEach items="${ligas}" var="l">
                            <option value="${l.id}">${l.nombre}</option>
                        </c:forEach>
                    </select>
                </div>
                <input type="submit" class="btn btn-outline-primary" value="<fmt:message key="equipos.verEquipos"/>" />
            </form>

            <c:if test="${equipos ne null}">
                <h3><fmt:message key="equipos.elegirEquipo"/></h3>
                <form method="post" action="MostrarEquipo" class="d-flex">
                    <div class="col-3 mx-2">
                        <select name="equipoId" class="form-select">
                            <c:forEach items="${equipos}" var="e">
                                <option value="${e.id}">${e.nombre}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <input type="submit" class="btn btn-outline-primary" value="<fmt:message key="equipos.mostrar"/>" />
                </form>
            </c:if>

            <p class="my-5">
                <c:if test="${usuario == null}">
                    <a href="index.jsp" class="btn btn-outline-danger"><fmt:message key="volver"/></a>
                </c:if>
                <c:if test="${usuario.tipo == 'Administrador'}">
                    <a href="admin/menuAdministrador.jsp" class="btn btn-outline-danger"><fmt:message key="volver"/></a>
                </c:if>
                <c:if test="${usuario.tipo == 'Arbitro'}">
                    <a href="arbitro/menuArbitro.jsp" class="btn btn-outline-danger"><fmt:message key="volver"/></a>
                </c:if>
            </p>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" 
        crossorigin="anonymous"></script>
    </body>
</html>
