<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Main page</title>
    <script src="https://unpkg.com/vue"></script>
    <link rel="stylesheet" href="<c:url value="/pages/css/map_data.css"/>" type="text/css"/>
    <script type="text/javascript" src="<c:url value="/pages/js/jquery-1.11.3.min.js" />"></script>

</head>

<body>
<div id="app">
    <div class="map">
        <svg viewBox="0 0 210 297">
            <path d="M 95.014316,131.29289 74.434561,131.02562 94.346142,112.45039 C
            100.0483,101.45911 98.3022,95.973071 95.949758,90.935195 90.478969,82.315168 84.663453,80.244962
            78.844509,78.239892 72.200662,77.526768 65.693833,77.005468 62.541067,81.179857 c -2.941566,4.383114 -1.975039,9.026767
            0.400905,13.764381 5.660203,5.397642 6.660821,2.51709 10.022608,2.004522 1.202712,-0.860896 3.741772,-1.924798 4.944484,
            -3.474504 2.655723,2.449971 2.844196,4.899943 3.875411,7.349914 0.997055,3.28337 0.736759,6.42704 -1.469983,9.35443
            -3.340869,3.75194 -6.681738,4.9312 -10.022607,5.87993 -16.867655,1.4754 -17.267645,-1.48868 -21.916101,
            -2.53906 -5.926479,-2.61256 -10.19223,-7.59759 -13.630746,-13.764382 -1.92365,-6.141336 -0.816182,
            -12.619462 0.400905,-19.109769 5.591191,-16.040835 16.155242,-15.374281 19.243404,-16.83798 6.770828,
            -1.355426 13.541655,-0.889482 20.312483,-0.133636 l 19.777946,3.474503 C 87.946043,45.425869 93.453997,
            30.970068 107.57598,21.712388 c 19.17651,13.618762 17.35555,29.498789 13.76438,45.569454 8.29492,
            -2.160324 16.61219,-4.164136 25.25697,-3.875407 7.11973,-0.86852 13.59255,0.203667 19.64431,2.53906
            13.65291,7.217566 12.11772,11.754882 14.43256,16.971613 1.8466,11.63516 0.30469,15.815583 -1.33635,
            19.777942 -4.35446,9.37241 -14.46879,12.7745 -20.84702,14.03165 -9.74905,1.17137 -16.03125,-0.19961
            -20.44612,-2.93996 -4.36577,-3.32298 -5.78921,-7.23442 -4.81085,-11.62622 0.47149,-3.620478 2.43051,
            -6.249265 3.8754,-9.220805 1.45305,2.534619 3.13578,3.920862 4.94449,4.677217 3.47023,1.855609 6.77506,
            1.395586 9.88897,-1.737251 4.58766,-6.582538 2.87119,-10.363246 1.20272,-14.165284 -3.11008,-4.12553
            -8.67193,-4.437199 -14.9671,-3.608139 -13.52999,3.293728 -15.15998,8.639179 -18.8425,13.630746
            -3.64814,11.462136 -0.23216,14.535626 1.46998,19.644306 l 20.04522,19.64431 -20.17885,0.26727
            -12.96257,-12.29439 z" fill="#ffd42a" transform="translate(0,20)"></path>

        </svg>


        <svg viewBox="0 0 210 297" class="button1">
            <defs>
                <linearGradient id="grad0" x1="0%" y1="100%" x2="0%" y2="30%">
                    <stop offset="0%" style="stop-color:#ffd42a;stop-opacity:1"/>
                    <stop offset="100%" style="stop-color:#aa8800;stop-opacity:1"/>
                </linearGradient>
            </defs>
            <defs>
                <linearGradient id="grad1" x1="30%" y1="0%" x2="100%" y2="0%">
                    <stop offset="0%" style="stop-color: #ffd42a;stop-opacity:1"/>
                    <stop offset="100%" style="stop-color: #aa8800;stop-opacity:1"/>
                </linearGradient>

            </defs>
            <defs>
                <linearGradient id="grad2" x1="100%" y1="0%" x2="30%" y2="0%">
                    <stop offset="0%" style="stop-color:#ffd42a;stop-opacity:1"/>
                    <stop offset="100%" style="stop-color:#aa8800;stop-opacity:1"/>
                </linearGradient>
            </defs>
            <path transform="translate(0,20)" class="part0" d="M 94.479776,67.148206 C 88.284035,49.290786 90.037179,32.534538
            107.57598,21.712388 126.69062,34.15491 125.75732,50.464826 121.34036,67.281842 Z"
                  v-on:mouseover="showDescription(1)" v-on:mouseout="closeDescription()"
            ></path>
            <path transform="translate(0,20)" class="part2" d="M 94.479776,67.148206 C 81.1163,64.358435 67.752823,61.222168 54.389347,63.807339 c -13.429616,2.272113
            -17.079135,9.079469 -19.243404,16.83798 -5.466095,23.068231 5.476372,28.946961 13.229841,32.874151 15.368982,6.57468 26.910108,
            2.79988 31.938708,-3.34087 1.150611,-0.76576 1.520464,-2.29661 1.868112,-3.62633 1.108025,-4.23809 -1.069169,-10.104605 -4.27354,
            -13.078014 -6.366597,5.426829 -10.832772,5.672268 -14.96709,1.469982 -2.721362,-6.667878 -2.160585,-10.454521 -0.66376,-12.904212 2.625526,
            -4.296917 9.518647,-3.925336 16.566293,-3.800134 7.300296,2.633221 13.802119,6.064916 17.105249,12.695303 z"
                  v-on:mouseover="showDescription(0)" v-on:mouseout="closeDescription()"></path>
            <path transform="translate(0,20)" class="part1" d="m 121.34036,67.281842 c 6.7619,-1.729254 13.00335,-3.343285 18.63251,-3.968339 10.54491,-1.170893 19.41013,-1.055394
             26.26877,2.631992 8.54646,3.920336 16.03813,9.92828 15.37592,26.191408 0.62549,14.406537 -11.51954,23.325117 -23.12673,24.589797
              -6.50938,1.22935 -11.97545,1.60668 -20.44612,-2.93996 -8.62584,-4.58239 -5.15199,-15.844723 -0.93545,-20.847027 0.33342,1.970187
              8.49177,8.997947 14.83346,2.939968 3.56184,-4.726122 2.70073,-9.599104 1.20272,-14.165284 -4.98903,-5.102147 -9.97807,-3.782413
              -14.9671,-3.608139 -11.48283,2.893687 -14.90449,8.062175 -18.8425,13.630744 z"
                  v-on:mouseover="showDescription(2)" v-on:mouseout="closeDescription()"></path>

            <path v-for="(item,index) in outcomes_data" v-bind:class="outcomes_button(item)"
                  v-bind:transform=getPathTranform(index)
                  d="m 25.123334,44.511901 c -4.995669,0 -5.635633,
            -9.73289 -9.888971,-9.732891 2.714366,-2.729521 6.487549,2.886442
            9.888972,5.66964 -2.637805,-3.502953 -2.466706,-5.669639 0,-9.354902 2.83791,3.685263 2.083394,6.32272 0,9.354902 3.363393,-3.576619
            6.766983,-8.164152 9.888972,-5.66964 -4.444739,10e-7 -5.87099,9.732891 -9.888973,9.732891 z"
                  v-on:mouseover="showOutcomesDescription(item, $event)"
                  v-on:mouseout="closeOutcomesDescription(item, $event)"/>
            <path v-for="(item,index) in outcomes_data" v-bind:class="instrument_button(item)"
                  v-bind:transform=getPathTranform(index)
                  v-bind:d=getPathInstrument(index)
                  v-on:mouseover="showInstrumentDescription(item, $event)"
                  v-on:mouseout="closeInstrumentDescription(item, $event)"/>
            </path>
        </svg>
    </div>
    <div class="description">
        <div class="d_header">{{pillar_current.header}}
        </div>
        <div class="d_items">
            {{pillar_current.outcomes}} outcomes
        </div>
    </div>
</div>
<script>
    var app = new Vue({
        el: '#app',
        data: {
            show_desc: false,
            message: 'Вот когда вы загрузили эту страницу: ' + new Date().toLocaleString(),
            pillar_current: {
                header: "",
                outcomes: 0,
            },
            current_outcomes: {
                header: "",
                text: "",
            },
            pillar_data: [
                {id: 1, pillar: "Improving competitiveness and fostering job creation"},
                {id: 2, pillar: "Strengthening governance and improving efficiency in public services delivery"},
                {id: 3, pillar: "Ensuring development is environmentally sustainable"},

            ],
            outcomes_data: [
                {
                    id: 1,
                    pillar: 1,
                    outcome: "Prudent management of oil revenue maintained, with government net financial worth (measured by difference between stock of NFRK assets and sovereign debt) above its 2012 level of 20% of GDP by 2017. ",
                    instruments: [
                        {
                            type: "jerp",
                            text: "Fiscal Policy for Growth; Improvement of Public Debt Management"
                        },
                        {
                            type: "jerp",
                            text: "Macroeconomic and competitiveness DPL Project"
                        }
                    ]
                },
                {
                    id: 2,
                    pillar: 1,
                    outcome: "Improved regulatory environment as measured by Doing Business ranking (up from 46 in 2011 to below 30 in 2017); and BEEPS share of firms citing business licensing and permits as major constraint down from 25.2% in 2009 to below 15% by 2017.",
                    instruments: [
                        {
                            type: "jerp",
                            text: "Enhancement of Business Environment; Enterprise Modernization Support "
                        }
                    ]
                },
                {
                    id: 3,
                    pillar: 1,
                    outcome: "Improved regulatory environment as measured by Doing Business ranking (up from 46 in 2011 to below 30 in 2017); and BEEPS share of firms citing business licensing and permits as major constraint down from 25.2% in 2009 to below 15% by 2017. ",
                    instruments: [
                        {
                            type: "jerp",
                            text: "Enhancement of Business Environment; Enterprise Modernization Support "
                        }
                    ]
                },
                {
                    id: 4,
                    pillar: 1,
                    outcome: "Share of firms with female participation in ownership increased from 34.3% in 2009 to above 40% by 2017 and with female top managers increased from 24.7 % in 2009 to above 30% by 2017.",
                    instruments: [
                        {
                            type: "no",
                            text: "Technology Commercialization Project, Fostering Productive Innovation Project"
                        }
                    ]
                },
                {
                    id: 5,
                    pillar: 1,
                    outcome: "TCO established, awarding at least 10 small technology commercialization grants (pre-commercialization, joint research with industry, international patenting, industrial internship for scientists) and enabling at least 15 groups of scientists to perform high-quality research.",
                    instruments: [
                        {
                            type: "ifc",
                            text: "Real sector investments in manufacturing, and agribusiness"
                        }
                    ]
                },
                {
                    id: 6,
                    pillar: 1,
                    outcome: "IFC invested in manufacturing (paper packaging, cement), agribusiness (food and beverages, agriculture commodities), and real estate."
                },
                {
                    id: 7,
                    pillar: 1,
                    outcome: "IFC provided advisory services on corporate governance to Government and over 100 companies and conducted studies on tax transparency and regulatory reform."
                },
                {
                    id: 8,
                    pillar: 1,
                    outcome: "Ratio of NPLs to total loans (32.6% in 2012) at least halved by 2017 and well provisioned."
                },
                {
                    id: 9,
                    pillar: 1,
                    outcome: "IFC invested in financial institutions, including microfinance and universal banking. It also provided trade guarantees. Sector portfolio is serving 15,200 microfinance and 10,000 SME clients."
                },
                {
                    id: 10,
                    pillar: 1,
                    outcome: "IFC provided advisory services to microfinance institution on corporate governance, branch management, and loan officer development―to improve its lending operations and serve more rural and thus support rural development."
                },
                {
                    id: 11,
                    pillar: 1,
                    outcome: "Share of technical vocational education programs revised in line with new (2013) competency standards by at least 20% by 2017—better equipping graduates with skills demanded in labor market. "
                },
                {
                    id: 12,
                    pillar: 1,
                    outcome: "New applied technologies in farming (for example, conservation agriculture, new methods of veterinary diseases testing) result in increased crop/fodder output, supporting 50% increase in meat production (0.84 million/tons in 2010) by 2017."
                },
                {
                    id: 13,
                    pillar: 1, outcome: "IFC invested in agribusiness (food and beverages, agriculture commodities)."
                },
                {
                    id: 14,
                    pillar: 1,
                    outcome: "IFC Food Safety Program focuses on (a) assisting food company to implement food safety practices; (b) stimulate development of local institutional capacity for promotion and implementation of suppliers’ food safety standards; and (c) promote sectorwide demand by raising awareness of agribusiness standards and developing client pipeline among industry and stakeholders."
                },
                {
                    id: 15,
                    pillar: 1,
                    outcome: "IFC providing advisory services on energy efficiency at two levels as explained in Area of Engagement 3, Outcome 13 (Raising Energy Efficiency)"
                },
                {
                    id: 16,
                    pillar: 1,
                    outcome: "KEGOC’s transmission capacity increased by 5% between 2012 (34,000 MVA) and 2017 to alleviate existing and projected power shortages in southern and eastern part of country."
                },
                {
                    id: 17,
                    pillar: 1,
                    outcome: "Increased transport efficiency through reduction in road-user costs and rate of road crash fatalities along 1,062 km section of WE-WC Road Corridor by at least 10% by 2017 (in 2007: road users’ cost was US$0.26 per vehicle-km and road crash fatalities were 11/100 million vehicle-km)."
                },
                {
                    id: 18,
                    pillar: 1, outcome: "IFC invested in rail leasing company."
                },
                {
                    id: 19,
                    pillar: 1,
                    outcome: "IFC advises Government to structure and implement an international tender for the BAKAD."
                },
                {
                    id: 20,
                    pillar: 2,
                    outcome: "Physical inspections of import declarations by customs reduced from 70% in 2007 to 20% by 2017; and average customs processing time at border posts (24 hours in 2010) reduced by 75% by 2017 as evidenced from client surveys."
                },
                {
                    id: 21,
                    pillar: 2,
                    outcome: "Increase in e-procurement transactions (25,000 in 2012) by 20% by 2017, and efficiency of e-procurement system enhanced by introduction by 2014 of electronic reverse auction system."
                },
                {
                    id: 22,
                    pillar: 2,
                    outcome: "Quality and efficiency of public spending improved through introduction of targeted reviews of selected areas on rolling basis, with at least four reviews completed during 2013–16."
                },
                {
                    id: 23,
                    pillar: 2,
                    outcome: "International standard user satisfaction survey on quality and reliability of statistical data introduced in 2012 with 80% satisfaction rates by 2017."
                },
                {
                    id: 24,
                    pillar: 2,
                    outcome: "Conditional cash transfers piloted in at least two regions; and, depending on need, gender parity targeted in activation support services utilization."
                },
                {
                    id: 25,
                    pillar: 2,
                    outcome: "By 2016, 10% reduction in population's out-of-pocket health expenditures as share of total health expenditures (32.9% in 2010)."
                },
                {
                    id: 26,
                    pillar: 3,
                    outcome: "Reforestation of 44,000 ha completed; and damage from forest fire in Irtysh Pine Forest reduced by 50% by 2017 (9 ha per case of fire on average during 2009–11)."
                },
                {
                    id: 27,
                    pillar: 3,
                    outcome: "Water supply systems rehabilitated in 113,000 ha covering four southern oblasts, bringing water distribution by service providers to levels demanded by farmers."
                },
                {
                    id: 28,
                    pillar: 3,
                    outcome: "IFC providing advisory services on renewable energy and energy efficiency at two levels: (a) policy level, to open up new markets through removing legal and regulatory barriers to private investments; and (b) company level, to provide targeted assistance to first-mover private sector renewable energy and utility efficiency projects."
                },

            ]

        },
        methods: {
            showDescription: function (pillar) {
                this.pillar_current.header = this.pillar_data[pillar].pillar;
                var cnt = 0;
                this.outcomes_data.forEach(function (item, i, arr) {
                    if (item.pillar == pillar + 1) cnt++;
                })
                this.pillar_current.outcomes = cnt;
                this.selectPillarOutcomes(pillar);
                this.show_desc = true;
            },
            closeDescription: function () {
                this.unselectPillarOutcomes();
                this.show_desc = false;
            },
            selectPillarOutcomes: function (pillar) {
                this.outcomes_data.forEach(function (item, i, arr) {
                    if (item.pillar == pillar + 1) item.selected = true;
                })
            },
            unselectPillarOutcomes: function () {
                this.outcomes_data.forEach(function (item, i, arr) {
                    item.selected = false;
                })
            },
            showOutcomesDescription: function (item, event) {
                var header;
                this.pillar_data.forEach(function (it, i, arr) {
                    if (it.id == item.pillar) {
                        header = it.pillar;
                    }
                })
                item.selected = true;
                this.pillar_current.header = header;
                this.pillar_current.outcomes = item.outcome;
                this.show_desc = true;
            },
            closeOutcomesDescription: function (item, event) {
                item.selected = false;
                this.show_desc = false;
            },
            showInstrumentDescription: function (item, event) {
                var header;
                this.pillar_data.forEach(function (it, i, arr) {
                    if (it.id == item.pillar) {
                        header = item.instruments[0].type;
                    }
                })
                item.selected = true;
                this.pillar_current.header = "INSTRUMENTS "+header;
                this.pillar_current.outcomes = item.instruments[0].text;
                this.show_desc = true;
            },
            closeInstrumentDescription: function (item, event) {
                item.selected = false;
                this.show_desc = false;
            },
            getPathTranform: function (ind) {
                var p = -145 + (ind - 1) * 11.6;
                var r = "translate(83, -25), rotate(" + p + " 25,130)";
                return r;
            },
            getPathInstrument: function (index) {
                var res = "";
                var item = this.outcomes_data[index];
                console.log("item", item)
                if (item.instruments!=undefined) {
                    if (item.instruments[0].type =="jerp") {
                        res = "m 25.123335,53.744616 c -2.866994,-2.657201 -3.135774,-2.922921 -3.135774,-2.922921 l 3.046181,-4.074242 3.046181,4.074242 z";
                    } else  if (item.instruments[0].type =="ifc") {
                        res = "m 19.745587,46.690722 c 11.339546,0.105128 11.431736,0.105128 11.431736,0.105128 -1.590301,4.323369 -0.570974,6.03711 0,8.199204 l -11.422525,-0.03188 c 1.559229,-2.822055 1.455272,-5.702373 -0.0092,-8.272452 z";
                    }  else  if (item.instruments[0].type =="no") {
                        res = "m 25.123335,47.346727 6.910147,6.3311 -13.890625,-0.09449 z";
                    }
                }
                return res;
            },
            outcomes_button: function (item) {
                if (item.selected) {
                    return "outcomes_button_select";
                } else {
                    return "outcomes_button"
                }
            },
            instrument_button: function (item) {
                if (item.selected) {
                    return "outcomes_button_select";
                } else {
                    return "outcomes_button"
                }
            }

        },
        computed: {}

    })
</script>
</body>
</html>