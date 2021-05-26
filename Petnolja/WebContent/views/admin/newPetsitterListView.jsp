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

    #new-petsitter-list {
        text-align: center;
        border: 1px solid gray;
        width: 100%;
        font-size: 13px;
        background-color: white;

    }

    #new-petsitter-list td {
        height: 60px;
        border: none;
    }

    #filter {
        float: left;
    }


    #new-petsitter-list button {
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


</style>

</head>
<body>

<%@include file="adminMenubar.jsp" %>

<div class="outer" align="center">
    <div id="filter" align="left">
        <select id="new-petsitter-filter" style="width:120px; font-size: 14px;">
            <option value="">전체조회</option>
            <option value="Y">처리완료</option>
            <option value="N">처리안함</option>
        </select>

    </div>

    <br><br>
    <table class="table" id="new-petsitter-list">
        <thead>
            <tr class="table-info">
                <th width="60px">선택</th>
                <th width="80px">고객번호</th>
                <th width="160px">ID</th>
                <th width="450px">지원서 상세내용</th>
                <th width="100px">처리여부</th>
                <th width="100px">처리결과</th>

            </tr>
        </thead>
        <tbody>
            <tr>
                <td>
                    <input type="checkbox">
                </td>
                <td>001</td>
                <td>jieun1010</td>
                <td align="center"><button class="btn btn-info">조회</button></td>
                <td>Y</td>
                <td>승인</td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox">
                </td>
                <td>001</td>
                <td>jieun1010</td>
                <td align="center"><button class="btn btn-info">조회</button></td>
                <td>Y</td>
                <td>거절</td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox">
                </td>
                <td>001</td>
                <td>jieun1010</td>
                <td align="center"><button class="btn btn-info">조회</button></td>
                <td>Y</td>
                <td>승인</td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox">
                </td>
                <td>001</td>
                <td>jieun1010</td>
                <td align="center"><button class="btn btn-info">조회</button></td>
                <td>Y</td>
                <td>승인</td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox">
                </td>
                <td>001</td>
                <td>jieun1010</td>
                <td align="center"><button class="btn btn-info">조회</button></td>
                <td>Y</td>
                <td>승인</td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox">
                </td>
                <td>001</td>
                <td>jieun1010</td>
                <td align="center"><button class="btn btn-info">조회</button></td>
                <td>N</td>
                <td>-</td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox">
                </td>
                <td>001</td>
                <td>jieun1010</td>
                <td align="center"><button class="btn btn-info">조회</button></td>
                <td>Y</td>
                <td>승인</td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox">
                </td>
                <td>001</td>
                <td>jieun1010</td>
                <td align="center"><button class="btn btn-info">조회</button></td>
                <td>N</td>
                <td>-</td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox">
                </td>
                <td>001</td>
                <td>jieun1010</td>
                <td align="center"><button class="btn btn-info">조회</button></td>
                <td>N</td>
                <td>-</td>
            </tr>
            <tr>
                <td>
                    <input type="checkbox">
                </td>
                <td>001</td>
                <td>jieun1010</td>
                <td align="center"><button class="btn btn-info">조회</button></td>
                <td>Y</td>
                <td>거절</td>
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

        $("#new-petsitter-filter").on("change", function () {
            var value = $(this).val().toLowerCase();
            $("#new-petsitter-list>tbody>tr").filter(function () {
                $(this).toggle($(this).children().eq(4).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });
</script>




</body>
</html>