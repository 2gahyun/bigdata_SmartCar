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
    <script src="/assets/js/item_view.js"></script>
    <link rel="stylesheet" href="/assets/css/item_view.css">
</head>

<body>
    <h1>Item</h1>
    <div class="container">
        <div class="item_rank_wrap">
            <div class="item_rank">
                <c:forEach items="${rankList}" varStatus="s" var="item">
                    <div class="rank_item" data-name="${item}">
                        <span class="rank">${s.count}</span>
                        <span class="name">${item}</span>
                    </div>
                </c:forEach>
            </div>
        </div>
        <div class="chart_container">
            <div class="gen_chart_area pie_chart_container">
                <h1><span class="item_name"></span> 구매 고객 성별 비율</h1>
                <canvas id="gen_chart"></canvas>
            </div>
            <div class="age_chart_area pie_chart_container">
                <h1><span class="item_name"></span> 구매 고객 연령대 비율</h1>
                <canvas id="age_chart"></canvas>
            </div>
            <div class="item_score_area">
                <div class="item_score_wrap">
                    <div class="item_score_prog">
                        <span class="score"></span>
                    </div>
                </div>
            </div>
            <div class="region_chart_area bar_chart_container">
                <h1><span class="item_name"></span> 지역별 구매 수</h1>
                <canvas id="region_chart"></canvas>
            </div>
        </div>
    </div>
</body>

</html>