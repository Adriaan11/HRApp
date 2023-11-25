//this file is what the dashboard buttons call so that the elements can be asyncronously updated using ajax
// functions are what the buttons points to / the ajax successful calls point to 
function chartChangeBtn_Click() {
    const option = parseInt($("[id$='optionsDropdown']").val());
    $.ajax({
        type: "POST",
        url: "Dashboard.aspx/changeGraphic",
        data: JSON.stringify({ selectedOption: option }),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var newResult = JSON.parse(response.d);
            UpdateChart(newResult);
        },
        error: function (err) {
            console.log(err);
        }
    });
}

function UpdateChart(newResult) {
    const SyncfusionChart = $("[id$='SyncfusionChart']").ejChart("instance");
    SyncfusionChart.model.series = [];

    if (newResult.ChartType === 'column') {

        for (var i = 0; i < newResult.SeriesDataList.length; i++) {
            var emp = newResult.SeriesDataList[i];

            var series = {
                dataSource: emp.allSeries,
                name: emp.Name,
                xName: "xName",// datasource
                yName: "yName",
                type: 'column',
                tooltip: {
                    visible: true,
                    template: emp.allSeries.xName
                }
            };

            SyncfusionChart.model.series.push(series);

        }

    } else if (newResult.ChartType === 'pie') {

        SyncfusionChart.model.series = [{
            dataSource: newResult.AxesDataList,
            name: 'EmployeeName',
            xName: "xName",
            yName: "yName",
            type: 'pie',
            tooltip: {
                visible: true,
                template: newResult.AxesDataList.xName
            }
        }];
    }


    SyncfusionChart.redraw();
}



function chartChangeBtn2_Click() {
    const ChartOption = parseInt($("[id$='PayrollDropdown']").val());
    const month = parseInt($("[id$='PayrollDateDropdown']").val());
    $.ajax({
        type: "POST",
        url: "Dashboard.aspx/changePayroll",
        data: JSON.stringify({ selectedOption: ChartOption, selectedMonth: month}),
        contentType: "application/json; charset=utf-8",
        dataType: "json",
        success: function (response) {
            var newResult = JSON.parse(response.d);
            UpdatePayroll(newResult);
        },
        error: function (err) {
            console.log(err);
        }
    });
}

function UpdatePayroll(newResult) {
    const chart = $("[id$='PayrollChart']").ejChart("instance");
    chart.model.series = [];

    chart.model.series = [{
        dataSource: newResult.AxesDataList,
        name: newResult.AxesDataList.xName,
        xName: 'xName',// datasource
        yName: 'yName',
        type: 'pie',
        tooltip: {
            visible: true,
            template: newResult.AxesDataList.xName
        }
    }]
    chart.redraw();
}

