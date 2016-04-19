$(document).on("page:update",function(){
  user_progress_chart();
});

function user_progress_chart() {
  var chart = $(".user-progress-chart");
  if(chart.length > 0) {
    chart.highcharts({
      chart: {
        type: "column"
      },
      title: {
        text: I18n.t("charts.user_progress_chart.title")
      },
      xAxis: {
        categories: chart.data("name"),
      },
      yAxis: {
        allowDecimals: false,
        min: 0,
        title: {
          text: I18n.t("charts.user_progress_chart.yaxis_title"),
        }
      },
      legend: {
        enabled: false
      },
      credits: {
        enabled: false
      },
      series: [
        {
          name: I18n.t("charts.user_progress_chart.yaxis_title"),
          colorByPoint: true,
          data: chart.data("total"),
        }
      ]
    });
  }
}
