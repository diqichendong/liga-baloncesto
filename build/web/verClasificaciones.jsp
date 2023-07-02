<%-- 
    Document   : verClasificaciones
    Created on : 26 feb. 2023, 9:20:11
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
        <title><fmt:message key="index.clasificaciones"/></title>
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
            <h1><fmt:message key="index.clasificaciones"/></h1>
            <h3><fmt:message key="clasificaciones.elegir"/></h3>
            <form method="post" action="VerClasificaciones" class="d-flex">
                <div class="col-3 mx-2">
                    <select name="ligaId" class="form-select">
                        <c:forEach items="${ligas}" var="l">
                            <option value="${l.id}">${l.nombre}</option>
                        </c:forEach>
                    </select>
                </div>
                <input type="submit" class="btn btn-outline-primary" value="<fmt:message key="clasificaciones.ver"/>" />
            </form>
            <c:if test="${equipos ne null}">
                <h3>Clasificación ${liga.nombre}</h3>
                <table border="1" class="table table-primary table-striped">
                    <tr>
                        <th>Pos</th>
                        <th><fmt:message key="clasificacion.equipo"/></th>
                        <th><abbr title="<fmt:message key="clasificacion.partidos"/>"><fmt:message key="clasificacion.partidosabr"/></abbr></th>
                        <th><abbr title="<fmt:message key="clasificacion.ganados"/>"><fmt:message key="clasificacion.ganadosabr"/></abbr></th>
                        <th><abbr title="<fmt:message key="clasificacion.perdidos"/>"><fmt:message key="clasificacion.perdidosabr"/></abbr></th>
                        <th><abbr title="<fmt:message key="clasificacion.puntosAnotados"/>"><fmt:message key="clasificacion.puntosAnotadosabr"/></abbr></th>
                        <th><abbr title="<fmt:message key="clasificacion.puntosEncajados"/>"><fmt:message key="clasificacion.puntosEncajadosabr"/></abbr></th>
                        <th><abbr title="<fmt:message key="clasificacion.diferencial"/>"><fmt:message key="clasificacion.diferencialabr"/></abbr></th>
                        <th><fmt:message key="clasificacion.puntos"/></th>
                    </tr>
                    <c:forEach items="${equipos}" var="e" varStatus="status">
                        <tr>
                            <td>${status.index + 1}</td>
                            <td>${e.nombre}</td>
                            <td>${e.partidosJugados}</td>
                            <td>${e.partidosGanados}</td>
                            <td>${e.partidosPerdidos}</td>
                            <td>${e.puntosAnotados}</td>
                            <td>${e.puntosEncajados}</td>
                            <td>${e.puntosAnotados - e.puntosEncajados}</td>
                            <td>${e.puntosClasificacion}</td>
                        </tr>
                    </c:forEach>
                </table>
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
