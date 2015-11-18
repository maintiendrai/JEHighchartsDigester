$(function () {
  
//  var colors = Highcharts.getOptions().colors,
  
  $('#container').highcharts({
                             chart: {
                             type: 'pie',
                             options3d: {
                             enabled: false,
                             alpha: 45
                             }
                             },
                             title: {
                             text: 'Contents of Highsoft\'s weekly fruit delivery'
                             },
                             subtitle: {
//                             text: '3D donut in Highcharts'
                             },
                             plotOptions: {
                             pie: {
                             innerSize: 120,
                             depth: 45
                             },
                             dataLabels: {
                             enabled: false
                             }
                             },
                             series: [{
//                                      name: 'Chrome versions',
//                                      categories: ['Chrome v30.0', 'Chrome v31.0', 'Chrome v32.0', 'Chrome v33.0', 'Chrome v34.0',
//                                                   'Chrome v35.0', 'Chrome v36.0', 'Chrome v37.0', 'Chrome v38.0', 'Chrome v39.0', 'Chrome v40.0', 'Chrome v41.0', 'Chrome v42.0', 'Chrome v43.0'
//                                                   ],
//                                      data: [0.14, 1.24, 0.55, 0.19, 0.14, 0.85, 2.53, 0.38, 0.6, 2.96, 5, 4.32, 3.68, 1.45],
//                                      color: colors[2]
                                      name: 'Delivered amount',
                                      data: [
//                                             ['Bananas', 8],
//                                             ['Kiwi', 3],
//                                             ['Mixed nuts', 1],
//                                             ['Oranges', 6],
//                                             ['Apples', 8],
//                                             ['Pears', 4],
//                                             ['Clementines', 4],
//                                             ['Reddish (bag)', 1],
//                                             ['Grapes (bunch)', 1]
                                             8,
                                             3,
                                             1,
                                             6
                                             ]
                                      ,
//                                      dataLabels: [
//                                            'Bananas',
//                                            'Kiwi',
//                                            'Mixed nuts',
//                                            'Apples'
//                                      ]
                                      dataLabels: {
                                          formatter: function () {
                                          return this.point.name ;
                                          },
                                          color: '#ffffff',
                                          distance: -30
//                                      enabled: false
                                      }
                                      }]
                                     
                             });
  });