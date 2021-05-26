<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>petsitterApply</title>
    <!--부트스트랩-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <style>
        .outer {
            border: gray solid 1px;
            border-radius: 7px;
            width: 1200px;
            height: 800px;
            margin: auto;
            margin-top: 40px;
            padding:10px;
        }

        .applyContent {
            width: 1100px;
            height: 800px;
            margin: auto;
        }

        #basicInfo {
            width: 1100px;
            height: 150px;
        }

        #box {
            background-color: rgb(248, 248, 248);
            font-size: 14px;
            width: 1100px;
            height: 200px;
            margin: auto;
        }

        #buttons {
            float: right;
            margin-top: 14px;
        }

        #buttons>button {
            width: 75px;
            font-size: 14px;
        }
    </style>
</head>

<body>

    <%@ include file="adminMenubar.jsp" %>
    <div class="outer" align="center">
        <div class="applyContent" align="left">
            <br>
            <h4><b>펫시터 지원서</b></h4>
            <br>
            <table id="basicInfo">
                <tr>
                    <td>
                        <h6><b>아이디 : </b></h6>
                    </td>
                    <td></td>
                    <td>
                        <h6><b>제공 서비스 : </b></h6>
                    </td>
                    <td></td>
                </tr>

                <tr>
                    <td>
                        <h6><b>반려동물 반려기간 : </b></h6>
                    </td>
                    <td></td>
                    <td>
                        <h6><b>자격증 보유현황 : </b></h6>
                    </td>
                    <td></td>
                </tr>
                <tr>
                    <td>
                        <h6><b>현재 반려견 수 : </b></h6>
                    </td>
                    <td></td>
                    <td>
                        <h6><b>펫시팅 경험 : </b></h6>
                    </td>
                    <td></td>
                </tr>
            </table>
            <br>
            <h6><b>지원동기</b></h6>
            <div id="box">뽑아주세요</div>
            <br>
            <h6><b>하고싶은 말</b></h6>
            <div id="box">뽑아주세요</div>

            <div class="bottom" id="buttons" align="right">
                <button type="button" class="btn btn-secondary btn-sm">승인</button> &nbsp;
                <button type="button" class="btn btn-dark btn-sm">거절</button> &nbsp;
                <button type="button" class="btn btn-primary btn-sm">목록으로</button>
            </div>
        </div>
    </div>
    <br><br><br><br><br>
</body>

</html>