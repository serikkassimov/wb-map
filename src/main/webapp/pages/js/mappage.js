/**
 * Created by Serik on 12.12.2015.
 */


function treeMap(datavalue, oblname) {
    var options = {
        credits: {
            enabled: false
        },
        chart: {
            renderTo: 'chart'
        },
        series: [{
            type: "treemap",
            layoutAlgorithm: 'stripes',
            allowDrillToNode: true,
            alternateStartingDirection: true,
            levels: [{
                level: 1,
                layoutAlgorithm: 'sliceAndDice',
                borderWidth: 1,
                dataLabels: {
                    enabled: true,
                    align: 'left',
                    verticalAlign: 'top',
                    style: {
                        fontSize: '15px',
                        fontWeight: 'bold'
                    }
                }
            }],
            tooltip: {
                headerFormat: '<span style="font-size:15px">{point.key}</span><br/>',
                pointFormat: '{point.value} US$,m <br/> {point.description}',
                valueDecimals: 2
            },
            data: datavalue
        }],
        title: {
            text: 'Sectors and Themes'
        }
    };
    options.series[0].data = datavalue;
    options.title.text = oblname;
    var chart = new Highcharts.Chart(options);
}

function treeMapKZ(datavalue, oblname) {
    var options = {
        credits: {
            enabled: false
        },
        chart: {
            renderTo: 'chart'
        },
        series: [{
            type: "treemap",
            layoutAlgorithm: 'stripes',
            allowDrillToNode: true,
            alternateStartingDirection: true,
            levels: [{
                level: 1,
                layoutAlgorithm: 'sliceAndDice',
                borderWidth: 1,
                dataLabels: {
                    enabled: true,
                    align: 'left',
                    verticalAlign: 'top',
                    style: {
                        fontSize: '15px',
                        fontWeight: 'bold'
                    }
                }
            }],
            tooltip: {
                headerFormat: '<span style="font-size:15px">{point.key}</span><br/>',
                pointFormat: '{point.value:.1f} US$,m <br/> {point.description}'
            },
            data: datavalue
        }],
        title: {
            text: 'Sectors and Themes'
        }
    };
    options.series[0].data = datavalue;
    options.title.text = oblname;
    var chart = new Highcharts.Chart(options);
}
