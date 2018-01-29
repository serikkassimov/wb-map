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
    <script type="text/javascript" src="<c:url value="/pages/js/highmaps.js" />"></script>
    <script type="text/javascript" src="<c:url value="/pages/js/modules/data.js" />"></script>
    <script type="text/javascript" src="<c:url value="/pages/js/modules/exporting.js" />"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/proj4js/2.3.6/proj4.js"></script>
    <link rel="stylesheet" href="<c:url value="/pages/css/mymap.css" />" type="text/css">


</head>
<script type="text/javascript">
    function pointClick() {
        var param = "&oblcode=" + this.code;
        $('#right-panel').load('${pageContext.request.contextPath}/getoblast', param);
    }
    ;
    $(function () {
        var chart;
        $.getJSON('${pageContext.request.contextPath}/getdata', function (data) {
            $.getJSON("<c:url value="/pages/jsondata/kz-all.geo1.json" />", function (geojson) {
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
                                formatter: function () {
                                    return null;
                                },
                                crosshairs: [{
                                    zIndex: 5,
                                    dashStyle: 'dot',
                                    snap: false,
                                    color: 'gray'
                                }, {
                                    zIndex: 5,
                                    dashStyle: 'dot',
                                    snap: false,
                                    color: 'gray'
                                }]
                            },

                            mapNavigation: {
                                enabled: true,
                                buttonOptions: {
                                    verticalAlign: 'bottom'
                                }
                            },
                            /* colorAxis: {
                             type: 'logarithmic',
                             endOnTick: false,
                             startOnTick: false,
                             min: 10
                             },*/

                            mapNavigation: {
                                enabled: true
                            },

                            colorAxis: {
                                min: 10,
                                max: map.max
                            },
                            series: [
                                {
                                    data: {
                                        name: "point.plan_value"
                                    },
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
                                    color: "green",
                                    joinBy: ['postal-code', 'code'],

                                    // name: 'Исполнение',

                                    enableMouseTracking: true,
                                    dataLabels: {
                                        enabled: true,
                                        format: '{point.code} {point.name}'
                                    }
                                }]
                        });
                        chart = $('#container').highcharts();
                    });

                });
            });
        });

        $('#container').mousemove(function (e) {
            var position;

            if (chart) {
                if (!chart.lab) {
                    chart.lab = chart.renderer.text('', 0, 0)
                            .attr({
                                zIndex: 5
                            })
                            .css({
                                color: '#505050'
                            })
                            .add();
                }

                e = chart.pointer.normalize(e);
                position = chart.fromPointToLatLon({
                    x: chart.xAxis[0].toValue(e.chartX),
                    y: chart.yAxis[0].toValue(e.chartY)
                });

                chart.lab.attr({
                    x: e.chartX + 5,
                    y: e.chartY - 22,
                    text: 'Lat: ' + position.lat.toFixed(2) + '<br>Lon: ' + position.lon.toFixed(2)
                });
            }
        });

        $('#container').mousedown(function (e) {
            var position;
            if (chart) {
                if (!chart.lab) {
                    chart.lab = chart.renderer.text('', 0, 0)
                            .attr({
                                zIndex: 5
                            })
                            .css({
                                color: '#505050'
                            })
                            .add();
                }

                e = chart.pointer.normalize(e);
                position = chart.fromPointToLatLon({
                    x: chart.xAxis[0].toValue(e.chartX),
                    y: chart.yAxis[0].toValue(e.chartY)
                });

                chart.lab.attr({
                    x: e.chartX + 5,
                    y: e.chartY - 22,
                    text: 'Lat: ' + position.lat.toFixed(1) + '<br>Lon: ' + position.lon.toFixed(1)
                });
                if (chart != null) {
                    var xp = Math.round(chart.xAxis[0].toValue(e.chartX));
                    var yp = Math.round(chart.yAxis[0].toValue(e.chartY) * -1);
                    console.log("[" + xp + "," + yp + "],");
                    // console.log('Lat: ' + position.lat.toFixed(1) + ' Lon: ' + position.lon.toFixed(1));
                }

            }
            // console.log("[" + position.lat.toFixed(2) + "," + position.lon.toFixed(2) + "]"); // нужна для построения новых элементов
        });

        $('#container').mouseout(function () {
            if (chart && chart.lab) {
                chart.lab.destroy();
                chart.lab = null;
            }
        });

    });


</script>


<body>

<h1>Map</h1>

<div id="main-panel1">
    <div id="container" style="min-width: 600px; max-width: 100%; min-height: 800px"></div>
</div>
</body>
</html>
