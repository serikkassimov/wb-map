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
    <script type="text/javascript" src="<c:url value="/pages/js/modules/treemap.js" />"></script>
    <script type="text/javascript" src="<c:url value="/pages/js/modules/map.js" />"></script>

    <script type="text/javascript" src="<c:url value="/pages/js/modules/data.js" />"></script>
    <script type="text/javascript" src="<c:url value="/pages/js/modules/exporting.js" />"></script>
    <link rel="stylesheet" href="<c:url value="/pages/css/mymap.css" />" type="text/css">
    <link rel="stylesheet" href="<c:url value="/pages/css/mytables.css" />" type="text/css">

</head>
<script type="text/javascript">
    function pointClick() {
        var oblname = this.name;
        var param = "&oblcode=" + this.code;
        $('#table').load('${pageContext.request.contextPath}/getoblast', param);
        $.getJSON('${pageContext.request.contextPath}/getoblasttreemap', param, function (datavalue) {
            treeMap(datavalue, oblname);
        });

    }
    ;
    $(function () {
        $.getJSON('${pageContext.request.contextPath}/getkztreemap', function (datavalue) {
            treeMap(datavalue, "Kazakhstan");
        });
        $('#table').load('${pageContext.request.contextPath}/getalltable');
        var chart;
        $.getJSON('${pageContext.request.contextPath}/getdata', function (data) {
            $.getJSON("<c:url value="/pages/jsondata/kz-all.geo1.json" />", function (geojson) {
                $.getJSON("<c:url value="/pages/jsondata/kz-road.json" />", function (geojsonroad) {
                    // Initiate the chart
                    $.getJSON('${pageContext.request.contextPath}/getmap', function (map) {
                        console.log(map.max);

                        $('#container').highcharts
                        ('Map', {
                            credits: {
                               enabled: false
                            },
                            title: {
                                style: { "color": "blue", "fontSize": "28px" },
                                text: map.text
                            },

                            tooltip: {
                                headerFormat: '<span style="font-size:10px">Total financing</span><br/>',
                                pointFormat: '{point.name}: {point.value:.1f} US$,mln'
                            },

                            mapNavigation: {
                                enabled: false,
                                buttonOptions: {
                                    verticalAlign: 'bottom'
                                }
                            },
                            legend: {
                                title: {
                                    text:  'Investments in US$,mln',
                                    style: {
                                        color: (Highcharts.theme && Highcharts.theme.textColor) || 'black'
                                    }
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
                                    borderColor: "blue",
                                    borderWidth: 1,

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
                                        y: -10,
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
                                        enabled: false,
                                        format: '{point.name}'
                                    }
                                }]
                        });
                        //  chart = $('#container').highcharts();
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
