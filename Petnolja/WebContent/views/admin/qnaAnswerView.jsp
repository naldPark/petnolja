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


        #qna-box {
            /*border: steelblue 1px solid;*/
            margin: auto;
            margin-top: 20px;
            width: 80%;
            height: 720px;
            font-size: 14px;
            
        }

        #question-box {
            height: 300px;
            background-color: white;
            border: #17A2B8 solid 2px;
            border-radius: 5px;

        }

        #answer-box{
            width: 100%;
            height: 100%;
            border: #007BFF solid 2px;
            border-radius: 5px;
            resize: none;
            background-color: white;
            
        }

        #qna-box button{font-size: 14px;}
    </style>
</head>
<body>

	<%@include file="adminMenubar.jsp" %>


    <div class="outer">

        <form action="" method="post">

            <table id="qna-box">
                <tr height="40px">
                    <th width="350"><label style="font-size: 16px;">제목 : 취소 확인좀 해주세요</label></th>
                    <td>첨부파일</td>
                    <th style="text-align: right;">작성자 : cucumber11</th>

                </tr>
                <tr>
                    <td colspan="3">
                        <div id="question-box">
                            내용~~~~~~~~~~~~~~~~~~~
                        </div>
                    </td>
                </tr>
                <tr height="40px">
                    <th colspan="3" style="text-align: right;"> 담당자 : 관리자1</th>
                </tr>
                <tr height="300px">
                    <td colspan="3">
                        <textarea name="" id="answer-box">답변 내용~~~~</textarea>
                    </td>
                </tr>
                <tr height="50px">
                    <td colspan="3">
                        <div id="buttons" align="right">
                            <button type="submit" class="btn btn-primary btn-sm">등록</button>
                            <button type="button" class="btn btn-info btn-sm">목록으로</button>
                        </div>
                    </td>
                </tr>
            </table>

        </form>

    </div>
    <br><br><br><br><br>


</body>
</html>