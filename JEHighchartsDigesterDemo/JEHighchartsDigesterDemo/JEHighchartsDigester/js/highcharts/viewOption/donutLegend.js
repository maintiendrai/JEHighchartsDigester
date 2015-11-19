$(function () {
  
  $(document).ready(function () {
                    
                    // Build the chart
                    $('#container').highcharts({
                                               yAxis: {
                                               title: {
                                               text: ''
                                               },
                                               min: 0
                                               },
                                               chart: {
                                               plotBackgroundColor: null,
                                               plotBorderWidth: null,
                                               plotShadow: false,
                                               type: 'pie',
                                               options3d: {
                                               enabled: false,
                                               alpha: 45
                                               }
                                               },
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
                                               marker: {
                                               enabled: true
                                               }
                                               }
                                               },
                                               series: [
                                                        {
                                                        type: 'spline',
                                                        name: 'Jane',
                                                        data: [3, 2, 1, 3, 4]
                                                        },{
                                                        name: 'Brands',
                                                        colorByPoint: true,
                                                        center: [130, 80],
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