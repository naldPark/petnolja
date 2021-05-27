<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>notice</title>

    <style>
        .outer {
            border: gray solid 1px;
            border-radius: 7px;
            width: 1200px;
            height: 700px;
            margin: auto;
            padding:10px;
        }

        #noticeTitle, #noticeContent textarea {
            width: 80%;
            font-size: 14px;
            margin: auto;

        }


        #noticeTitle td>input{ font-size: 14px;}


        #buttons {
            width: 80%;
            margin: auto;
            margin-top: 5px;
        }

        #buttons>button {
            font-size: 14px;
        }
    </style>
</head>

<body>
	<%@include file="adminMenubar.jsp" %>
    <div class="outer" align="center">
        <form style="margin-top: 20px;">
            <!-- 내용:  db에서 가져온게 null이면 placeholder, null이 아니면 그 값 보여줌 -->
            <div class="top" align="left">
                <table id="noticeTitle">
                    <td style="width: 45%;"><input type="text" class="form-control" name="title" placeholder="제목을 입력해주세요." style="width: 100%"></td>
                    <td style="width: 35%;"><input type="file" style="width: 300px; margin-left: 10px;"></td>
                    <th style="text-align: right;">작성자 : 관리자1</th>
                </table>
            </div>

            <br>

            <div id="noticeContent">
                <textarea name="content" class="form-control" rows="23" placeholder="내용을 입력해주세요."  style="resize:none;"></textarea>
            </div>
            <div class="bottom" id="buttons" align="right">
                <button type="button" class="btn btn-warning btn-sm">삭제</button>
                <button type="sumbit" class="btn btn-primary btn-sm">등록</button>
                <button type="button" class="btn btn-info btn-sm">목록으로</button>
            </div>
        </form>
    </div>
    <br><br><br><br><br>
</body>

</html>