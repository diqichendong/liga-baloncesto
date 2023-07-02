<%-- 
    Document   : mostrarEquipo
    Created on : 26 feb. 2023, 10:44:12
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
        <title>${equipo.nombre}</title>
        <script src="https://code.highcharts.com/highcharts.js"></script>
        <script src="https://code.highcharts.com/modules/series-label.js"></script>
        <script src="https://code.highcharts.com/modules/exporting.js"></script>
        <script src="https://code.highcharts.com/modules/export-data.js"></script>
        <script src="https://code.highcharts.com/modules/accessibility.js"></script>
        <style>
            #container, #container2 {
                width: 80%;
            }
        </style>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
              rel="stylesheet" 
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
              crossorigin="anonymous">
    </head>
    <body class="bg-dark text-light my-5">
        <c:if test="${usuario.tipo ne null}">
            <jsp:include page="header.jsp"/>
        </c:if>

        <div class="container">
            <h1>${equipo.nombre}</h1>
            <h3><fmt:message key="clasificacion.partidos"/></h3>
            <table border="1" class="table table-primary table-striped">
                <tr>
                    <th><fmt:message key="equipos.partido"/></th>
                    <th><fmt:message key="equipos.resultado"/></th>
                </tr>
                <c:forEach items="${equipo.listaPartidosJugados}" var="p">
                    <tr>
                        <td>${p}</td>
                        <td>${p.puntosLocal} - ${p.puntosVisitante}</td>
                    </tr>
                </c:forEach>
            </table>

            <figure class="highcharts-figure">
                <div id="container"></div>
            </figure>

            <div id="container2"></div>

            <p class="my-5">
                <a href="VerEquipos" class="btn btn-outline-danger"><fmt:message key="volver"/></a>
            </p>
        </div>

        <script>
            Highcharts.chart('container', {

            title: {
            text: '<fmt:message key="equipos.grafico1"/>',
                    align: 'left'
            },
                    subtitle: {
                    text: '',
                            align: 'left'
                    },
                    yAxis: {
                    title: {
                    text: '<fmt:message key="clasificacion.diferencial"/>'
                    },
                            labels: {
                            format: '{value}'
                            }
                    },
                    xAxis: {
                    categories: [
            <c:forEach items="${equipo.listaPartidosJugados}" var="p" varStatus="status">
                    '${p}'
                <c:if test="${not status.last}">
                    ,
                </c:if>
            </c:forEach>
                    ],
                            accessibility: {
                            rangeDescription: ''
                            }
                    },
                    series: [{
                    name: '${equipo}',
                            data: [
            <c:forEach items="${equipo.listaPartidosJugados}" var="p" varStatus="status">
                <c:if test="${equipo.nombre eq p.local.nombre}">
                    ${p.puntosLocal - p.puntosVisitante}
                </c:if>
                <c:if test="${equipo.nombre eq p.visitante.nombre}">
                    ${p.puntosVisitante - p.puntosLocal}
                </c:if>
                <c:if test="${not status.last}">
                            ,
                </c:if>
            </c:forEach>
                            ]
                    }],
                    responsive: {
                    rules: [{
                    condition: {
                    maxWidth: 500
                    },
                            chartOptions: {
                            legend: {
                            layout: 'horizontal',
                                    align: 'center',
                                    verticalAlign: 'bottom'
                            }
                            }
                    }]
                    }

            });
        </script>
        <script>
            Highcharts.chart('container2', {
            chart: {
            plotBackgroundColor: null,
                    plotBorderWidth: null,
                    plotShadow: false,
                    type: 'pie'
            },
                    title: {
                    text: '<fmt:message key="equipos.grafico2"/>',
                            align: 'left'
                    },
                    tooltip: {
                    pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
                    },
                    accessibility: {
                    point: {
                    valueSuffix: '%'
                    }
                    },
                    plotOptions: {
                    pie: {
                    allowPointSelect: true,
                            cursor: 'pointer',
                            dataLabels: {
                            enabled: true,
                                    format: '<b>{point.name}</b>: {point.percentage:.1f} %'
                            }
                    }
                    },
                    series: [{
                    name: 'Ratio',
                            colorByPoint: true,
                            data: [{
                            name: '<fmt:message key="equipos.ganados"/>',
                                    y: ${equipo.porcentajeVictorias},
                                    sliced: true,
                                    selected: true
                            }, {
                            name: '<fmt:message key="equipos.perdidos"/>',
                                    y: ${equipo.porcentajeDerrotas}
                            }]
                    }]
            });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" 
                integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" 
        crossorigin="anonymous"></script>
    </body>
</html>
