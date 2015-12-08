$(function () {

    $(document).ready(function () {

        // Build the chart
        $('#container').highcharts({
            chart: {
                //                                               height: 480,
                //                                               width: 320

            },
           xAxis: [{ // Primary xAxis
                   title: {
                   text: '整数',
                   //  align: 'center',
                   // center: [120, 80],
                   x: 160,
                   y: 90,
                   
                   //  verticalAlign: 'middle'
                   },
                   width: 0,
                   height:0,
                   min: 0
                   },
                   {
                   height:390   //写死了
                   }],
            yAxis: [

            { // Primary yAxis
                title: {
                    text: ''
                },
                min: 0
            }, { // Secondary yAxis
                top: 280,
                // min: 0,
                height: 140,   //写死了
//                bottom: 100,
                // max: 100,
                title: {
                    text: '',
                    style: {
                        color: '#4572A7'
                    }
                }
                //   ,
                //   labels: {
                //       style: {
                //           color: '#4572A7'
                //       }
                //   },
                //   opposite: true
            }],

            title: {
                text: ''
            },
            tooltip: {
                pointFormat: '{series.name}: <b>{point.percentage:.1f}%</b>'
            },
            plotOptions: {
                pie: {
                    allowPointSelect: true,
                    cursor: 'pointer',
                    dataLabels: {
                        enabled: true
                    },
                    showInLegend: false,
                    point: {
                        events: {
                            legendItemClick: function (e) {
                                e.preventDefault();
                            }
                        }
                    }
                },

                column: {
                    width: 10,
                    height: 10,
                    depth: 10,
                    showInLegend: false,
                                   marker: {
                                   enabled: false,
                                   symbol: 'circle',
                                   radius: 2,
                                   states: {
                                   hover: {
                                   enabled: true
                                   }
                                   }
                                   }
                }

            },

            legend: {
                floating: true,
                align: 'left',
                x: 10, // = marginLeft - default spacingLeft
//                padding: 20,
                itemWidth: 160,
               symbolHeight: 16,
               symbolWidth: 16,
               symbolRadius: 8,
                verticalAlign: 'bottom',
                                   
                itemMarginBottom: 16,
                                   itemStyle: {
                                   lineHeight: '100px'
                                   },
                                   itemStyle: {
                                   font: '12pt Trebuchet MS, Verdana, sans-serif',
                                   color: '#A0A0A0'
                                   }
                
            },

            series: [{
                type: 'column',
                name: 'Jane',
                top: 400,
                //                                                        lineColor: '#666666',
                // cropThreshold: 100,
                yAxis: 1,
                xAxis:1,
                     data:  %@
            },


            {
                type: 'pie',
                options3d: {
                    enabled: false,
                    alpha: 45
                },
                //   align: 'center',
//                y: -100,
                verticalAlign: 'top',
                name: 'Brands',
                colorByPoint: true,
                center: [140, 80], //写死了
                size: 200,
                innerSize: 90,
                data: [{
                    name: '红外报警  20',
                    y: 56.33
                }, {
                    name: '煤气报警  15',
                    y: 24.03,
                    sliced: true,
                    selected: true
                }]
            }]
        });
    });
});
