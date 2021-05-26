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
            height: 700px;
            margin: auto;
            margin-top: 40px;
            padding: 10px;
        }

        .content {
            width: 1100px;
            margin: auto;
            text-align: left;
        }

        .top {
            width: 1100px;
        }

        #reportContent {
            background-color: rgb(248, 248, 248);
            font-size: 14px;
            height: 500px;
            margin: auto;
        }

        .bottom {
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
        <div class="content">
            <br><br>
            <table class="top">
                <td>
                    <h6>제목 : 신고신고신고제목</h6>
                </td>
                <td align="right">
                    <h6>
                        신고자 : singosingo &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        작성자 : spamspam
                    </h6>
                </td>
            </table>
            <br>
            <div id="reportContent">
                $$$ 바 다 이 야 기 $$$
            </div>
            <div class="bottom" id="buttons" align="right">
                <button type="button" class="btn btn-secondary btn-sm">삭제</button> &nbsp;
                <button type="button" class="btn btn-primary btn-sm">복구</button>
            </div>
        </div>
    </div>

    <br><br><br><br><br>
</body>

</html>