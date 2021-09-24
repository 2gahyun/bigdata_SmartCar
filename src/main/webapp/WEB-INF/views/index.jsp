<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
        let cntAll = Number('${cntAll}');
        let spd_abn_cnt = Number('${spd_abn_cnt}');
        let brk_abn_cnt = Number('${brk_abn_cnt}');
        let str_abn_cnt = Number('${str_abn_cnt}');

        let car_numbers = new Array();
        let speed_avgs = new Array();
        let break_avgs = new Array();
        let steer_cnts = new Array();

        <c:forEach items="${list}" var="item">
            car_numbers.push('${item.car_number}');
            speed_avgs.push('${item.speed_p_avg}');
            break_avgs.push('${item.break_p_avg}');
            steer_cnts.push('${item.steer_a_cnt}');
        </c:forEach>
        console.log(car_numbers);
        console.log(speed_avgs);
        console.log(break_avgs);
        console.log(steer_cnts);

        $(function(){
            let ctx = $("#spd_abn_chart");
            let spd_abn_chart = new Chart(ctx, {
                type:'pie',
                // type:'bar',
                data:{
                    labels:['정상', '비정상'],
                    datasets:[
                        {
                            label:"속도",
                            data:[cntAll-spd_abn_cnt, spd_abn_cnt],
                            backgroundColor:[
                                'rgba(54,162,235,0.2)',
                                'rgba(255,99,132,0.2)',
                                'rgba(225,206,86,0.2)',
                                'rgba(75,192,192,0.2)'
                            ],
                            borderColor:[
                                'rgba(54,162,235,1)',
                                'rgba(255,99,132,1)',
                                'rgba(225,206,86,1)',
                                'rgba(75,192,192,1)'
                            ]
                        }
                    ]
                }
            })
            let ctx1 = $("#brk_abn_chart");
            let brk_abn_chart = new Chart(ctx1, {
                type:'pie',
                // type:'bar',
                data:{
                    labels:['정상', '비정상'],
                    datasets:[
                        {
                            label:"브레이크",
                            data:[cntAll-brk_abn_cnt, brk_abn_cnt],
                            backgroundColor:[
                                'rgba(54,162,235,0.2)',
                                'rgba(255,99,132,0.2)',
                                'rgba(225,206,86,0.2)',
                                'rgba(75,192,192,0.2)'
                            ],
                            borderColor:[
                                'rgba(54,162,235,1)',
                                'rgba(255,99,132,1)',
                                'rgba(225,206,86,1)',
                                'rgba(75,192,192,1)'
                            ]
                        }
                    ]
                }
            })
            let ctx2 = $("#str_abn_chart");
            let str_abn_chart = new Chart(ctx2, {
                type:'pie',
                // type:'bar',
                data:{
                    labels:['정상', '비정상'],
                    datasets:[
                        {
                            label:"핸들",
                            data:[cntAll-str_abn_cnt, str_abn_cnt],
                            backgroundColor:[
                                'rgba(54,162,235,0.2)',
                                'rgba(255,99,132,0.2)',
                                'rgba(225,206,86,0.2)',
                                'rgba(75,192,192,0.2)'
                            ],
                            borderColor:[
                                'rgba(54,162,235,1)',
                                'rgba(255,99,132,1)',
                                'rgba(225,206,86,1)',
                                'rgba(75,192,192,1)'
                            ]
                        }
                    ]
                }
            })

            let ctx3 = $("#line_chart1");
            let lineeChart1 = new Chart(ctx3, {
                type:"bar",
                data:{
                    labels:car_numbers,
                    datasets:[{
                        label:"속도",
                        data:speed_avgs,
                        backgroundColor:["#fab"],
                        borderColor:[]
                    }]
                }
            })
            let ctx4 = $("#line_chart2");
            let lineeChart2 = new Chart(ctx4, {
                type:"bar",
                data:{
                    labels:car_numbers,
                    datasets:[{
                        label:"브레이크",
                        data:break_avgs,
                        backgroundColor:["#abf"],
                        borderColor:[]
                    }]
                }
            })
            let ctx5 = $("#line_chart3");
            let lineeChart3 = new Chart(ctx5, {
                type:"bar",
                data:{
                    labels:car_numbers,
                    datasets:[{
                        label:"핸들조작",
                        data:steer_cnts,
                        backgroundColor:["#afb"],
                        borderColor:[]
                    }]
                }
            })
        })
    </script>
</head>
<body>
    <h1>인덱스 페이지</h1>
    <div style="width: 700px;">
        <h1>속도 이상 조작</h1>
        <canvas id="line_chart1"></canvas>
    </div>
    <div style="width: 700px;">
        <h1>브레이크 이상 조작</h1>
        <canvas id="line_chart2"></canvas>
    </div>
    <div style="width: 700px;">
        <h1>핸들 이상 조작 횟수</h1>
        <canvas id="line_chart3"></canvas>
    </div>
    <div style="width: 300px; display:inline-block">
        <h1>속도</h1>
        <canvas id="spd_abn_chart" width="300px" height="300px"></canvas>
    </div>
    <div style="width: 300px; display:inline-block">
        <h1>브레이크</h1>
        <canvas id="brk_abn_chart" width="300px" height="300px"></canvas>
    </div>
    <div style="width: 300px; display:inline-block">
        <h1>핸들조작</h1>
        <canvas id="str_abn_chart" width="300px" height="300px"></canvas>
    </div>
    <%--
        ${spd_abn_rate}
        ${brk_abn_rate}
        ${str_abn_rate}
        ${spd_abn_cnt}
        ${brk_abn_cnt}
        ${str_abn_cnt}
        ${cntAll}
    --%>
</body>
</html>