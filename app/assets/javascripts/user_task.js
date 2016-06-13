$(document).on("page:change", function(){
  $('#user-task-chart').highcharts({
    chart: {
      type: 'column'
    },
    title: {
      text: I18n.t('user_tasks.chart.title')
    },
    xAxis: {
      type: 'category',
      labels: {
        style: {
          fontSize: '13px',
          fontFamily: 'Verdana, sans-serif'
        }
      }
    },
    yAxis: {
      min: 0,
      title: {
        text: I18n.t('user_tasks.chart.y_axis')
      }
    },
    legend: {
      enabled: false
    },
    tooltip: {
      pointFormat: '<b>{point.y:.1f}</b>'
    },
    colors: ['#7cb5ec', $('#user-task-chart').data("color")],
    plotOptions: {
      series: {
        colorByPoint: true
      }
    },
    series: [{
      data: [
        [I18n.t('user_tasks.fields.estimated_time'), parseFloat($('#user-task-chart').data("estimated-time"))],
        [I18n.t('user_tasks.fields.spent_time'), parseFloat($('#user-task-chart').data("spent-time"))]
      ],
      dataLabels: {
        enabled: true,
        color: '#FFFFFF',
        format: '{point.y:.1f}',
        y: 20,
        style: {
          fontSize: '13px',
          fontFamily: 'Verdana, sans-serif'
        }
      }
    }]
  });
});
