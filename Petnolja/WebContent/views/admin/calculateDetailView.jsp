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

        #calculate-detail-list {
            text-align: center;
            border: 1px solid gray;
            width: 100%;
            font-size: 13px;
            background-color: white;
        }

        .account-info {
            margin-top: 10px;
        }

        .account-info>span span {
            font-size: 15px;
            font-weight: 600;
        }

        .account-info>span {

            border: 3px solid rgb(241, 129, 88);
            padding: 5px;
            background-color: white;
            border-radius: 6px;
            margin-right: 10px;
        }

        #calculate-detail-list>tbody tr {
            height: 55px;
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
        <div class="account-info" align="left">
            <span>
                <span>ID : cucumber11 &nbsp; &nbsp;</span>
                <span>계좌정보 : 카카오뱅크 352-555-2222-11</span>
            </span>

            <span>
                <span>정산기간 : 2021년 4월 &nbsp; &nbsp;</span>
                <span>정산총액 : 1,000,000원</span>
            </span>

        </div>

        <br>
        <table class="table" id="calculate-detail-list">
            <thead>
                <tr class="table-warning">
                    <th width="100px">번호</th>
                    <th width="200px">서비스일</th>
                    <th width="200px">거래번호</th>
                    <th width="200px">금액(원)</th>
                    <th width="200px">취소여부</th>
                    <th width="200px">누적금액(원)</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>000</td>
                    <td>2021-05-25</td>
                    <td>20210525</td>
                    <td>50000</td>
                    <td>N</td>
                    <td>50000</td>
                </tr>
                <tr>
                    <td>000</td>
                    <td>2021-05-25</td>
                    <td>20210525</td>
                    <td>50000</td>
                    <td>N</td>
                    <td>50000</td>
                </tr>
                <tr>
                    <td>000</td>
                    <td>2021-05-25</td>
                    <td>20210525</td>
                    <td>50000</td>
                    <td>N</td>
                    <td>50000</td>
                </tr>
                <tr>
                    <td>000</td>
                    <td>2021-05-25</td>
                    <td>20210525</td>
                    <td>50000</td>
                    <td>N</td>
                    <td>50000</td>
                </tr>
                <tr>
                    <td>000</td>
                    <td>2021-05-25</td>
                    <td>20210525</td>
                    <td>50000</td>
                    <td>N</td>
                    <td>50000</td>
                </tr>
                <tr>
                    <td>000</td>
                    <td>2021-05-25</td>
                    <td>20210525</td>
                    <td>50000</td>
                    <td>N</td>
                    <td>50000</td>
                </tr>
                <tr>
                    <td>000</td>
                    <td>2021-05-25</td>
                    <td>20210525</td>
                    <td>50000</td>
                    <td>N</td>
                    <td>50000</td>
                </tr>
                <tr>
                    <td>000</td>
                    <td>2021-05-25</td>
                    <td>20210525</td>
                    <td>50000</td>
                    <td>N</td>
                    <td>50000</td>
                </tr>
                <tr>
                    <td>000</td>
                    <td>2021-05-25</td>
                    <td>20210525</td>
                    <td>50000</td>
                    <td>N</td>
                    <td>50000</td>
                </tr>
                <tr>
                    <td>000</td>
                    <td>2021-05-25</td>
                    <td>20210525</td>
                    <td>50000</td>
                    <td>N</td>
                    <td>50000</td>
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


</body>
</html>