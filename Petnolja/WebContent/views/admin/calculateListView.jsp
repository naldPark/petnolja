<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <style>
        .outer {
            border: gray solid 1px;
            border-radius: 7px;
            width: 1200px;
            height: 800px;
            margin: auto;
            background-color: rgb(248, 248, 248);
            padding: 10px;
        }

        #calculate-list {
            text-align: center;
            border: 1px solid gray;
            width: 100%;
            background-color: white;
            font-size: 13px;
        }

        #search {
            float: left;
        }

        #month-filter {
            float: right;
        }

        #calculate-list button {
            width: 90px !important;
            height: 30px !important;
            font-size: 12px !important;
            line-height: 10px !important;
        }

        #paging-area>button {
            width: 30px;
            height: 30px;
            font-size: 12px;
            text-align: center;

        }

        #month-filter input,
        #month-filter span {
            margin-right: 15px;
        }

        #calculate-list td {
            vertical-align: middle;
        }
    </style>


</head>
<body>

<%@include file="adminMenubar.jsp" %>

    <div class="outer" align="center">
        <div id="search" align="left">
            <input type="search" id="carculate-search-box" class="form-control-sm" placeholder="펫시터ID"
                style="font-size: 14px;">
        </div>
        <div id="month-filter" align="right" style="font-size: 14px;">
            <input id="calender" type="month">
            <span id="month-sum" style="font-weight: 600; font-size: 15px;">단위기간 정산 총액 : 원</span>
        </div>

        <br><br>
        <table class="table" id="calculate-list">
            <thead>
                <tr class="table-warning">
                    <th width="60px">번호</th>
                    <th width="260px">펫시터ID</th>
                    <th width="260px">이름</th>
                    <th width="300px">상세내역</th>
                    <th width="150px">정산기간</th>
                    <th width="150px">정산금액(원)</th>

                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>001</td>
                    <td>carrot</td>
                    <td>김오이</td>
                    <td><button class="btn btn-info">상세조회</button></td>
                    <td>2021-04</td>
                    <td>1000000</td>
                </tr>
                <tr>
                    <td>001</td>
                    <td>carrot</td>
                    <td>김오이</td>
                    <td><button class="btn btn-info">상세조회</button></td>
                    <td>2021-04</td>
                    <td>1000000</td>
                </tr>
                <tr>
                    <td>001</td>
                    <td>carrot</td>
                    <td>김오이</td>
                    <td><button class="btn btn-info">상세조회</button></td>
                    <td>2021-03</td>
                    <td>1000000</td>
                </tr>
                <tr>
                    <td>001</td>
                    <td>cucumber</td>
                    <td>김오이</td>
                    <td><button class="btn btn-info">상세조회</button></td>
                    <td>2021-03</td>
                    <td>1000000</td>
                </tr>
                <tr>
                    <td>001</td>
                    <td>banana</td>
                    <td>김오이</td>
                    <td><button class="btn btn-info">상세조회</button></td>
                    <td>2021-03</td>
                    <td>1000000</td>
                </tr>
                <tr>
                    <td>001</td>
                    <td>zero</td>
                    <td>김오이</td>
                    <td><button class="btn btn-info">상세조회</button></td>
                    <td>2021-03</td>
                    <td>1000000</td>
                </tr>
                <tr>
                    <td>001</td>
                    <td>carrot</td>
                    <td>김오이</td>
                    <td><button class="btn btn-info">상세조회</button></td>
                    <td>2021-03</td>
                    <td>1000000</td>
                </tr>
                <tr>
                    <td>001</td>
                    <td>carrot</td>
                    <td>김오이</td>
                    <td><button class="btn btn-info">상세조회</button></td>
                    <td>2021-02</td>
                    <td>1000000</td>
                </tr>
                <tr>
                    <td>001</td>
                    <td>carrot</td>
                    <td>김오이</td>
                    <td><button class="btn btn-info">상세조회</button></td>
                    <td>2021-01</td>
                    <td>1000000</td>
                </tr>
                <tr>
                    <td>001</td>
                    <td>carrot</td>
                    <td>김오이</td>
                    <td><button class="btn btn-info">상세조회</button></td>
                    <td>2021-01</td>
                    <td>1000000</td>
                </tr>

            </tbody>
        </table>

        <!-- 페이징바 -->

        <div id="paging-area">
            <button class="btn btn-outline-primary btn-sm">&lt;</button>
            <button class="btn btn-outline-primary btn-sm">1</button>
            <button class="btn btn-outline-primary btn-sm">2</button>
            <button class="btn btn-outline-primary btn-sm">3</button>
            <button class="btn btn-outline-primary btn-sm">4</button>
            <button class="btn btn-outline-primary btn-sm">5</button>
            <button class="btn btn-outline-primary btn-sm">&gt;</button>
        </div>
    </div>

    <br><br><br><br><br>

<script>
    //펫시터 아이디로 필터링
    $(document).ready(function () {
        $("#carculate-search-box").on("keyup", function () {
            var value = $(this).val().toLowerCase();
            $("#calculate-list>tbody>tr").filter(function () {
                $(this).toggle($(this).children().eq(1).text().toLowerCase().indexOf(value) > -1)
            });


            $("#month-sum").text("단위기간 정산 총액 : 원");



        });
    });

    //정산 기간으로 필터링
    $(document).ready(function () {
        $("#calender").on("change", function () {
            var value = $(this).val();
            $("#calculate-list>tbody>tr").filter(function () {
                $(this).toggle($(this).children().eq(4).text().indexOf(value) > -1)
            });

            $(function () {
                var trArr = $("#calculate-list>tbody>tr");
                var sum = 0;

                $.each(trArr, function(){

                    if($(this).children().eq(4).text() == value){
                        sum += parseInt($(this).children().eq(5).text());
                    }
                });

                $("#month-sum").text("단위기간 정산 총액 : " + sum + " 원");
            });




        });
    });
</script>

</body>
</html>