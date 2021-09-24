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
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="/assets/js/car_master.js"></script>
    <style>
        h1 {text-align: center; width: 1050px; margin: 30px auto;}
        .smartcar_info_area, .btn_area, .chart_container {width: 1050px; margin: 30px auto; text-align: center;}
        .smartcar_info_area > div, .chart {width: 400px; display: inline-block; vertical-align: top;}
        .drive_info_area .chart {width: 800px;}
    </style>
</head>
<body>
    <h1>Car Master</h1>
    <div class="btn_area">
        <button value="all">전체</button>
        <c:forEach items="${regions}" var="region">
            <button value="${region}">${region}</button>
        </c:forEach>
    </div>
    <div class="smartcar_info_area">
        <div class="region_chart_area">
            <canvas id="car_master_regional"></canvas>
        </div>
        <div class="year_chart_area">
            <canvas id="car_master_year"></canvas>
        </div>
    </div>

    <div class="chart_container drive_info_area">
        <div class="chart">
            <canvas id="pedal_info"></canvas>
        </div>
        <div class="chart">
            <canvas id="speed_info"></canvas>
        </div>
    </div>
</body>
</html>