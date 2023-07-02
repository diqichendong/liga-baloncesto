<%-- 
    Document   : filtrarJornadas
    Created on : 23 feb. 2023, 11:10:27
    Author     : Di Qi
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<h3>Eligir jornada</h3>
<form method="post" id="jornada-form" class="d-flex mb-3">
    <div class="col-3 mx-2">
        <select id="jornada" class="form-select">
            <c:forEach items="${jornadas}" var="j">
                <option value="${j.id}">${j}</option>
            </c:forEach>
        </select>
    </div>
    <input type="submit" class="btn btn-outline-primary" value="Buscar" />
</form>
<script>
    $("#jornada-form").submit(function (e) {
        e.preventDefault();
        let jornadaId = e.target.elements.jornada.value;
        $.ajax({
            url: "FiltrarPartidos",
            data: {jornadaId: jornadaId},
            success: function (respuesta) {
                $("#partidos").html(respuesta)
            }
        });
    });
</script>
