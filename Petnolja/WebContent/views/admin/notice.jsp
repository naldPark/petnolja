<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>notice</title>
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
            padding:10px;
        }

        #NoticeTitle {
            width: 1100px;
        }

        form {
            width: 1100px;
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
        <br><br>
        <form>
            <!-- 내용:  db에서 가져온게 null이면 placeholder, null이 아니면 그 값 보여줌 -->
            <div class="top" align="left">
                <table id="NoticeTitle">
                    <td><input type="text" class="form-control" name="title" placeholder="제목을 입력해주세요." size="40"></td>
                    <td><button type="button" class="btn btn-link">첨부.png</button></td>
                    <td><button type="button" class="btn btn-primary btn-sm">파일 첨부하기</button></td>
                    <td align="right"><h6>작성자 : 누구누구</h6></td>
                </table>
            </div>

            <br>

            <div id="noticeContent">
                <textarea name="content" class="form-control" rows="20" placeholder="내용을 입력해주세요."  style="resize:none;"></textarea>
            </div>
            <div class="bottom" id="buttons" align="right">
                <button type="button" class="btn btn-secondary btn-sm">삭제</button> &nbsp;
                <button type="button" class="btn btn-dark btn-sm">등록</button> &nbsp;
                <button type="button" class="btn btn-primary btn-sm">목록으로</button>
            </div>
        </form>
    </div>
    <br><br><br><br><br>
</body>

</html>