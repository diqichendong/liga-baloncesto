<%-- 
    Document   : index
    Created on : 21 feb. 2023, 19:10:25
    Author     : Di Qi
--%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:setBundle basename="bundle.mensajes"/>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>
            <fmt:message key="index.titulo"/>
        </title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
              rel="stylesheet" 
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
              crossorigin="anonymous">
    </head>
    <body class="container bg-dark text-light">
        <c:if test="${usuario.tipo ne null}">
            <jsp:include page="header.jsp"/>
        </c:if>

        <div class="container my-5">
            <h1><fmt:message key="index.titulo"/></h1>
            <!-- Para administradores y árbitros -->
            <c:if test="${usuario eq null}">
                <p>
                    <a href="Login" class="btn btn-outline-primary">
                        <fmt:message key="index.login"/>
                    </a>
                </p>
            </c:if>
            <br>
            <!-- Para todos los usuarios -->
            <p>
                <a href="VerClasificaciones" class="btn btn-outline-warning">
                    <fmt:message key="index.clasificaciones"/>
                </a>
            </p>
            <p>
                <a href="VerEquipos" class="btn btn-outline-success">
                    <fmt:message key="index.equipos"/>
                </a>
            </p>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" 
        crossorigin="anonymous"></script>
    </body>
</html>
