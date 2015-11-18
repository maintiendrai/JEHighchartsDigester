$(function () {
  $('#container').highcharts({
                             title: {
                             text: ' '
                             },
                             xAxis: {
                                categories: ['1', '2', '3', '4', '5']
                             },
                             yAxis: {
                                 title: {
                                    text: ' '
                                 }
                             },
                             labels: {
                             items: [{
//                                     html: 'Total fruit consumption',
                                     style: {
                                     left: '50px',
                                     top: '18px',
                                     color: (Highcharts.theme && Highcharts.theme.textColor) || 'black'
                                     }
                                     }]
                             },
                             series: [
                                      {
                                          type: 'spline',
                                          name: 'Average',
                                          data: [3, 2.67, 3, 6.33, 3.33],
                                          marker: {
                                              lineWidth: 1,
                                              lineColor: Highcharts.getOptions().colors[3],
                                              fillColor: 'white'
                                          },
                                        fillOpacity: 0.3
                                      },
                                      
                                      {
                                          type: 'pie',
                                          name: 'Total consumption',
                                          data: [{
                                                 name: 'Jane',
                                                 y: 13,
                                                 color: Highcharts.getOptions().colors[0] // Jane's color
                                                 }, {
                                                 name: 'John',
                                                 y: 23,
                                                 color: Highcharts.getOptions().colors[1] // John's color
                                                 }, {
                                                 name: 'Joe',
                                                 y: 19,
                                                 color: Highcharts.getOptions().colors[2] // Joe's color
                                                 }],
                                          center: [100, 80],
                                          size: 100,
                                          showInLegend: false,
                                          dataLabels: {
                                              enabled: false
                                          },
                                      fillOpacity: 0.3
                                      }
                                      ]
                             });
  });