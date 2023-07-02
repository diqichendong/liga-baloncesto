<%-- 
    Document   : gestionarUsuarios
    Created on : 21 feb. 2023, 19:33:51
    Author     : Di Qi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1">
        <title>Gestionar Usuarios</title>
        <script src="../js/jquery-3.6.3.min.js"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
              rel="stylesheet" 
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
              crossorigin="anonymous">
    </head>
    <body class="bg-dark text-light">
        <jsp:include page="header.jsp"/>

        <div class="container my-5">
            <h1>Gestionar Usuarios</h1>
            <table border="1" class="table table-primary table-striped">
                <tr>
                    <th>Nombre</th>
                    <th>Usuario</th>
                    <th>Tipo</th>
                    <th></th>
                    <th></th>
                </tr>
                <c:forEach items="${usuarios}" var="u">
                    <tr>
                        <td>${u.nombre}</td>
                        <td>${u.login}</td>
                        <td>${u.tipo}</td>
                        <td>
                            <form method="post" action="EditarUsuario">
                                <input type="hidden" name="id" value="${u.id}" />
                                <input type="submit" class="btn btn-sm btn-warning" value="Editar" />
                            </form>
                        </td>
                        <td>
                            <form method="post" class="eliminar" action="EliminarUsuario">
                                <input type="hidden" name="id" value="${u.id}" />
                                <input type="hidden" id="nombre" value="${u.nombre}" />
                                <input type="submit" class="btn btn-sm btn-danger" value="Eliminar" />
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>

            <p class="my-3">
                <a href="CrearUsuario" class="btn btn-outline-success">Crear usuario</a>
            </p>

            <p class="my-5">
                <a href="menuAdministrador.jsp" class="btn btn-outline-danger">Volver</a>
            </p>
        </div>

        <script>
            const eliminar = $(".eliminar").each(function () {
                $(this).submit(function (e) {
                    let nombre = e.target.elements.nombre.value;
                    if (!confirm("¿Estás seguro que quiere eliminar a " + nombre + "?")) {
                        e.preventDefault();
                    }
                })
            })
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" 
        crossorigin="anonymous"></script>
    </body>
</html>
