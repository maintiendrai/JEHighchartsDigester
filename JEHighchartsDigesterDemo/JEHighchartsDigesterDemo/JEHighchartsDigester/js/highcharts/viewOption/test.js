function plots(data) {
  var chart = $('#container').highcharts();
  inCome = [5, 35, 5, 12, 15, 20, 426, 660, 345, 626, 344, 13, 56];
  chart.series[0].setData(inCome, true);
    return 'Hello, ' + data;
}

function greet(name){ return 'Hello, ' + name; }