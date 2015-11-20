$(function () {
  
  $(document).ready(function () {
                    
                    // Build the chart
                    $('#container').highcharts({
//                                               chart: {
//                                               height: 800
//                                               },
                                               yAxis: [
                                                       
                                                    { // Primary yAxis
                                                       title: {
                                                       text: ''
                                                       },
                                                       min: 0
                                                       }, { // Secondary yAxis
                                                       top: 200,
                                                       min: 0,
                                                       height: 300,
                                                       max: 100,
                                                       title: {
                                                       text: '%',
                                                       style: {
                                                       color: '#4572A7'
                                                       }
                                                       },
                                                       labels: {
                                                       style: {
                                                       color: '#4572A7'
                                                       }
                                                       },
                                                       opposite: true
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
                                               enabled: false
                                               },
                                               showInLegend: true
                                               },
                                               spline: {
                                               width: 10,
                                               height: 10,
                                               depth: 10
                                               }
                                               
                                               },
                                               series: [
                                                        {
                                                        type: 'spline',
                                                        name: 'Jane',
                                                        top: 400,
                                                        cropThreshold: 100,
                                                        yAxis: 1,
                                                        data: [3, 2, 1, 3, 4]
                                                        },{
                                                        type:'pie',
                                                        options3d: {
                                                        enabled: false,
                                                        alpha: 45
                                                        },
                                                        name: 'Brands',
                                                        colorByPoint: true,
                                                        center: [220, 80],
                                                        size: 180,
                                                        innerSize: 90,
                                                        data: [{
                                                               name: 'Microsoft Internet Explorer',
                                                               y: 56.33
                                                               }, {
                                                               name: 'Chrome',
                                                               y: 24.03,
                                                               sliced: true,
                                                               selected: true
                                                               }, {
                                                               name: 'Firefox',
                                                               y: 10.38
                                                               }, {
                                                               name: 'Safari',
                                                               y: 4.77
                                                               }, {
                                                               name: 'Opera',
                                                               y: 0.91
                                                               }, {
                                                               name: 'Proprietary or Undetectable',
                                                               y: 0.2
                                                               }]
                                                        }]
                                               });
                    });
  });