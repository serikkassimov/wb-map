<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Map page</title>
    <script type="text/javascript" src="<c:url value="/pages/js/jquery-1.11.3.min.js" />"></script>
    <script type="text/javascript" src="<c:url value="/pages/js/mappage.js" />"></script>
    <script type="text/javascript" src="<c:url value="/pages/js/highcharts.js" />"></script>
    <script type="text/javascript" src="<c:url value="/pages/js/highmaps.js" />"></script>
    <script type="text/javascript" src="<c:url value="/pages/js/modules/treemap.js" />"></script>
    <script type="text/javascript" src="<c:url value="/pages/js/modules/map.js" />"></script>
    <script type="text/javascript" src="<c:url value="/pages/js/modules/data.js" />"></script>
    <script type="text/javascript" src="<c:url value="/pages/js/modules/exporting.js" />"></script>
    <link rel="stylesheet" href="<c:url value="/pages/css/mymap.css" />" type="text/css">
    <link rel="stylesheet" href="<c:url value="/pages/css/mytables.css" />" type="text/css">

</head>
<script type="text/javascript">
    function pointClick() {
        var param = "&oblcode=" + this.code;
        $('#table').load('${pageContext.request.contextPath}/getoblast', param);
        $.getJSON('${pageContext.request.contextPath}/getoblasttreemap', param, function (datavalue) {
            treeMap(datavalue);
        });

    }
    ;
    $(function () {
        var chart;
        $.getJSON('${pageContext.request.contextPath}/getdata', function (data) {
            $.getJSON("<c:url value="/pages/jsondata/kz-all.geo.json" />", function (geojson) {
                $.getJSON("<c:url value="/pages/jsondata/kz-road.json" />", function (geojsonroad) {

                    // Initiate the chart
                    $.getJSON('${pageContext.request.contextPath}/getmap', function (map) {
                        console.log(map.max);

                        $('#container').highcharts
                        ('Map', {

                            title: {
                                text: map.text
                            },

                            tooltip: {
                                headerFormat: '<span style="font-size:10px">Сумма проекта по</span><br/>',
                                pointFormat: '{point.code} {point.name}: {point.value:.1f} US$,m'
                            },

                            mapNavigation: {
                                enabled: false,
                                buttonOptions: {
                                    verticalAlign: 'bottom'
                                }
                            },
                            colorAxis: {
                                min: 10,
                                max: map.max
                            },
                            series: [
                                {
                                    animation: {
                                        duration: 1000
                                    },
                                    data: data,
                                    mapData: geojson,
                                    joinBy: ['postal-code', 'code'],

                                    // name: 'Исполнение',
                                    states: {
                                        hover: {
                                            color: '#BADA55'
                                        }
                                    },
                                    enableMouseTracking: true,
                                    point: {
                                        events: {
                                            click: pointClick
                                        }
                                    },
                                    dataLabels: {

                                        verticalAlign: 'top',
                                        enabled: true,
                                        format: '{point.name}'
                                    }
                                },
                                {
                                    animation: {
                                        duration: 1500
                                    },
                                    data: data,
                                    mapData: geojsonroad,
                                    type: "mapline",
                                    lineWidth: 3,
                                    joinBy: ['postal-code', 'code'],

                                    // name: 'Исполнение',

                                    enableMouseTracking: true,
                                    dataLabels: {
                                        enabled: true,
                                        format: '{point.code} {point.name}'
                                    }
                                }
                            ]
                        });
                        chart = $('#container').highcharts();
                        chart.series[1].borderColor = "blue";
                    });

                });
            });
        });

    });


</script>


<body>

<div id="main-panel">
    <div id="container" style="min-width: 600px; max-width: 100%; min-height: 800px"></div>
</div>
<div id="right-panel">
    <div id="chart"></div>
    <div id="table"></div>
</div>
</body>
</html>
