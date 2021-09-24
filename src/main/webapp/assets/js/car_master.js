$(function () {
    let chart = null;
    let yearChart = null;

    makeCarMasterChart();

    function makeCarMasterChart(region) {
        let url;
        if (region == undefined || region == null) url = "/car/master/cnt"
        else url = "/car/master/cnt?region=" + region;
        if (chart != null) chart.destroy();
        $.ajax({
            type: "get",
            url: url,
            success: function (r) {
                console.log(r.listCnt);
                chart = new Chart($("#car_master_regional"), {
                    type: "pie",
                    data: {
                        labels: ['20대', '30대', '40대', '50대', '60대', '70대 이상'],
                        datasets: [{
                            label: "스마트카 마스터 연령대",
                            data: r.listCnt,
                            backgroundColor: [
                                '#E8AC13',
                                '#F29613',
                                '#DB671C',
                                '#F24213',
                                '#ED1A15',
                                '#ED076D'
                            ]
                        }]
                    }
                })
            }
        })
    }

    makeCarYearChart();

    function makeCarYearChart(region) {
        let url;
        if (region == undefined || region == null) {
            url = "/car/year/cnt";
        } else {
            url = "/car/year/cnt?region=" + region;
        }
        if (yearChart != null) yearChart.destroy();
        $.ajax({
            type: "get",
            url: url,
            success: function (r) {
                console.log(r.list);
                yearChart = new Chart($("#car_master_year"), {
                    type: "pie",
                    data: {
                        labels: ['2016~2013', '2012~2008', '2007이전'],
                        datasets: [{
                            label: "스마트카 연식",
                            data: r.list,
                            backgroundColor: [
                                '#E8AC13',
                                '#F29613',
                                '#DB671C',
                                '#F24213',
                                '#ED1A15',
                                '#ED076D'
                            ]
                        }]
                    }
                })
            }
        })
    }

    $(".btn_area button").click(function () {
        makeCarMasterChart($(this).val());
        makeCarYearChart($(this).val());
    });

    let pedal_info_chart = null;
    let speed_info_chart = null;
    makeDriveInfoChart();

    function makeDriveInfoChart() {
        $.ajax({
            type: "get",
            url: "/drive/info",
            success: function (r) {
                console.log(r.data.count);
                console.log(r.data.car_number_list);
                console.log(r.data.age_list);
                console.log(r.data.spd_pedal_list);
                console.log(r.data.brk_pedal_list);
                console.log(r.data.spd_list);

                pedal_info_chart = new Chart($("#pedal_info"), {
                    type: "bar",
                    data: {
                        labels: r.data.car_number_list,
                        datasets: [{
                                label: "가속 페달 조작 빈도 (평균치)",
                                data: r.data.spd_pedal_list,
                                backgroundColor: [
                                    '#E8AC13',
                                    '#F29613',
                                    '#DB671C',
                                    '#F24213',
                                    '#ED1A15',
                                    '#ED076D'
                                ]
                            },
                            {
                                label: "브레이크 페달 조작 빈도 (평균치)",
                                data: r.data.brk_pedal_list,
                                backgroundColor: [
                                    '#4D0DFA',
                                    '#0B0CDE',
                                    '#0041F5',
                                    '#0B7BDE',
                                    '#0DC9FA',
                                    '#1AE8FA'
                                ]
                            }
                        ]
                    }
                })
                speed_info_chart = new Chart($("#speed_info"), {
                    type: "bar",
                    data: {
                        labels: r.data.car_number_list,
                        datasets: [{
                            label: "스마트카 속도 (평균치)",
                            data: r.data.spd_list,
                            backgroundColor: [
                                '#E8AC13',
                                '#F29613',
                                '#DB671C',
                                '#F24213',
                                '#ED1A15',
                                '#ED076D'
                            ]
                        }]
                    }
                })
            }
        })
    }
})