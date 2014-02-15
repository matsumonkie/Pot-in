#----------------------------------------------------------------------------
display_balance_accounts = (container, accounts) ->
  container.highcharts({
    chart: {
      type: 'column'
    },
    title: {
      text: 'Balance'
    },
    xAxis: {
      categories: ['a', 'b']
    },
    yAxis: {
      min: 0,
      title: {
        text: 'foo'
      }
    },
    plotOptions: {
      column: {
        stacking: 'normal'
        dataLabels: {
          enabled: true,
          color: (Highcharts.theme && Highcharts.theme.dataLabelsColor) || 'white'
        }
      }
    },
    series: [{
      name: 'foo',
      data: [1,2]
    },{
      name: 'bar',
      data: [3,4]
    }]
  })
  # return the chart
  container.highcharts()


console.log(gon.balances)
balance_container = $('#container')
display_balance_accounts(balance_container, gon.balances) ->