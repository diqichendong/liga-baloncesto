<%-- 
    Document   : filtrarPartidos
    Created on : 23 feb. 2023, 11:52:47
    Author     : Di Qi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<h3>Partidos</h3>

<fmt:setLocale value="es_Es"/>
<h4>
    Fecha: <fmt:formatDate value="${jornada.fecha}" pattern="dd-MM-yyyy"/>
</h4>
<table border="1" class="table table-primary table-striped">
    <tr>
        <th>Partido</th>
        <th>Resultado</th>
        <th></th>
    </tr>
    <c:forEach items="${partidos}" var="p">
        <tr>
            <td>${p}</td>
            <td>${p.puntosLocal} - ${p.puntosVisitante}</td>
            <td>
                <form method="post" action="ModificarPartido">
                    <input type="hidden" name="id" value="${p.id}" />
                    <input type="submit" class="btn btn-sm btn-success" value="Establecer resultado" />
                </form>
            </td>
        </tr>
    </c:forEach>
</table>
<p>
    <a href="SubirJornada" class="link">Subir jornada mediante fichero</a>
</p>
