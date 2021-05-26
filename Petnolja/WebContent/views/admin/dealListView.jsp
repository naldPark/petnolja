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

    #deal-list {
        text-align: center;
        border: 1px solid gray;
        width: 100%;
        font-size: 13px;
        background-color: white;
    }

    #search {
        float: left;
    }

    #filter {
        float: right;
    }

    #search>button {
        font-size: 14px;
    }


    #paging-area>button {
        width: 30px;
        height: 30px;
        font-size: 12px;
        text-align: center;
    }

    #deal-list>tbody tr {
        height: 55px;
    }

    #deal-list td {
            padding: 0;
            vertical-align: middle;
        }
</style>

</head>
<body>

<%@include file="adminMenubar.jsp" %>


<body>

    <div class="outer" align="center">
        <div id="search" align="left">
            <input type="search" id="deal-search-box" class="form-control-sm" placeholder="거래번호"
                style="font-size: 14px; width:200px;">
        </div>
        <div id="filter" align="right" style="font-size: 14px;">
            <span>거래발생일 : </span>
            <input type="date" id="date-filter">
        </div>

        <br><br>
        <table class="table" id="deal-list">
            <thead>
                <tr class="table-warning">
                    <th width="80px">거래번호</th>
                    <th width="160px">거래발생일</th>
                    <th width="160px">이용자ID</th>
                    <th width="130px">펫시터ID</th>
                    <th width="150px">금액(원)</th>
                    <th width="150px">서비스일</th>
                    <th width="120px">취소여부</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>20210525</td>
                    <td>2021-05-18</td>
                    <td>carrot042</td>
                    <td>cucumber11</td>
                    <td>50000</td>
                    <td>2021-06-01</td>
                    <td>N</td>
                </tr>
                <tr>
                    <td>20210525</td>
                    <td>2021-05-05</td>
                    <td>carrot042</td>
                    <td>cucumber11</td>
                    <td>50000</td>
                    <td>2021-06-01</td>
                    <td>N</td>
                </tr>
                <tr>
                    <td>20210525</td>
                    <td>2021-05-10</td>
                    <td>carrot042</td>
                    <td>cucumber11</td>
                    <td>50000</td>
                    <td>2021-06-01</td>
                    <td>N</td>
                </tr>
                <tr>
                    <td>20210525</td>
                    <td>2021-05-21</td>
                    <td>carrot042</td>
                    <td>cucumber11</td>
                    <td>50000</td>
                    <td>2021-06-01</td>
                    <td>N</td>
                </tr>
                <tr>
                    <td>20210525</td>
                    <td>2021-05-25</td>
                    <td>carrot042</td>
                    <td>cucumber11</td>
                    <td>50000</td>
                    <td>2021-06-01</td>
                    <td>N</td>
                </tr>
                <tr>
                    <td>20210525</td>
                    <td>2021-05-25</td>
                    <td>carrot042</td>
                    <td>cucumber11</td>
                    <td>50000</td>
                    <td>2021-06-01</td>
                    <td>N</td>
                </tr>
                <tr>
                    <td>20210525</td>
                    <td>2021-05-25</td>
                    <td>carrot042</td>
                    <td>cucumber11</td>
                    <td>50000</td>
                    <td>2021-06-01</td>
                    <td>N</td>
                </tr>
                <tr>
                    <td>20210525</td>
                    <td>2021-05-25</td>
                    <td>carrot042</td>
                    <td>cucumber11</td>
                    <td>50000</td>
                    <td>2021-06-01</td>
                    <td>N</td>
                </tr>
                <tr>
                    <td>20210525</td>
                    <td>2021-05-25</td>
                    <td>carrot042</td>
                    <td>cucumber11</td>
                    <td>50000</td>
                    <td>2021-06-01</td>
                    <td>N</td>
                </tr>
                <tr>
                    <td>20210525</td>
                    <td>2021-05-25</td>
                    <td>carrot042</td>
                    <td>cucumber11</td>
                    <td>50000</td>
                    <td>2021-06-01</td>
                    <td>N</td>
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


    $(document).ready(function () {
        $("#deal-search-box").on("keyup", function () {
            var value = $(this).val().toLowerCase();
            $("#deal-list>tbody>tr").filter(function () {
                $(this).toggle($(this).children().eq(0).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });

</script>

<script>

    $(function () {

        $("#date-filter").on("change", function(){

            var dateFilter = $(this).val();
            $("#deal-list>tbody>tr").filter(function(){
                $(this).toggle($(this).children().eq(1).text().indexOf(dateFilter)>-1)
            });
        });
    });

</script>


</body>
</html>