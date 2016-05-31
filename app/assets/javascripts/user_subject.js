$(document).on('page:change', function(){
  $.each($('*[id^="user-subject-chart-"]'), function (key, value){
    var user_subject_id = $(value).data('user-subject-id');
    var keys = $(value).data('date');
    var tasks = $(value).data('tasks');
    var tasks_finish = $(value).data('tasks-finish-perday');
    var task_do = $(value).data('tasks-do-perday');

    if ($('#user-subject-chart-' + user_subject_id).length > 0) {
      chart = new Highcharts.Chart({
        chart: {
          renderTo: 'user-subject-chart-' + user_subject_id,
        },
        title: {
          text: I18n.t('user_subjects.chart.title')
        },
        xAxis: {
          categories: keys
        },
        pane: {
          size: '90%'
        },
        labels: {
          items: [{
            html: I18n.t('user_subjects.chart.task_total'),
            style: {
              left: '50px',
              top: '18px',
              color: (Highcharts.theme && Highcharts.theme.textColor) || 'black'
            }
          }]
        },
        series: [{
          type: 'spline',
          name: I18n.t('user_subjects.chart.task_do'),
          data: task_do
        }, {
          type: 'spline',
          name: I18n.t('user_subjects.chart.task_finish'),
          data: tasks_finish,
          marker: {
            lineWidth: 2,
            lineColor: Highcharts.getOptions().colors[3],
            fillColor: 'white'
          }
        }, {
          type: 'pie',
          name: I18n.t('user_subjects.chart.task_total'),
          data: [{
            name: I18n.t('user_tasks.statuses.init'),
            y: tasks[0],
            color: '#f0ad4e'
          }, {
            name: I18n.t('user_tasks.statuses.in_progress'),
            y: tasks[1],
            color: '#00a65a'
          }, {
            name: I18n.t('user_tasks.statuses.finished'),
            y: tasks[2],
            color: '#5bc0de'
          }],
          center: [100, 80],
          size: 100,
          showInLegend: false,
          dataLabels: {
            enabled: false
          }
        }]
      });
    }
  });

  $.each($('*[id^="user-user-subject-chart-"]'), function (key, value){
    var user_subject_id = $(value).data('user-subject-id');
    var tasks = $(value).data('tasks');
    var color = $(value).data('color');
    var time_total = $(value).data('total-time');

    if ($('#user-user-subject-chart-' + user_subject_id).length > 0) {
      chart = new Highcharts.Chart({
        chart: {
          renderTo: 'user-user-subject-chart-' + user_subject_id,
        },
        title: {
          text: I18n.t('user_subjects.chart.title')
        },
        xAxis: {
          categories: [I18n.t('user_subjects.chart.during_time'), I18n.t('user_subjects.chart.done_time')]
        },
        pane: {
          size: '90%'
        },
        labels: {
          items: [{
            html: I18n.t('user_subjects.chart.task_total'),
            style: {
              left: '50px',
              top: '18px',
              color: (Highcharts.theme && Highcharts.theme.textColor) || 'black'
            }
          }]
        },
        series: [{
            type: 'column',
            name: I18n.t('tasks.hours'),
            showInLegend: false,
            data: [{y: time_total[0], color: '#7cb5ec'},
              {y: time_total[1], color: color}],
            pointWidth: 28
        }, {
          type: 'pie',
          name: I18n.t('user_subjects.chart.task_total'),
          data: [{
            name: I18n.t('user_tasks.statuses.init'),
            y: tasks[0],
            color: '#f0ad4e'
          }, {
            name: I18n.t('user_tasks.statuses.in_progress'),
            y: tasks[1],
            color: '#00a65a'
          }, {
            name: I18n.t('user_tasks.statuses.finished'),
            y: tasks[2],
            color: '#5bc0de'
          }],
          center: [100, 80],
          size: 100,
          showInLegend: false,
          dataLabels: {
            enabled: false
          }
        }]
      });
    }
  })
});
