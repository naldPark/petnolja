<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang>

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="shortcut icon" href="resources/images/adFavicon.ico">
<title>펫놀자?관리자!</title>
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
        <form action="<%=contextPath %>/ninsert.ad" method="post" enctype="multipart/form-data" style="margin-top: 20px;">
            <!-- 내용:  db에서 가져온게 null이면 placeholder, null이 아니면 그 값 보여줌 -->
            <div class="top" align="left">
                <table id="noticeTitle">
					
	
                    <td style="width: 40%;"><input name="title" type="text" class="form-control" placeholder="제목을 입력해주세요." style="width: 100%" required></td>
                    <td style="width:15%;">
                        <select name="category" style="margin-left: 5px; margin-right: 5px;" required>
                            <option value="공지">공지사항</option>
                            <option value="회원정보">[FAQ]회원정보</option>
                            <option value="결제/환불/취소">[FAQ]결제/환불/취소</option>
                            <option value="이용관련">[FAQ]이용관련</option>
                            <option value="기타">[FAQ]기타</option>
                        </select>
                    </td>
                    <td style="width: 30%;"><input name="upfile" type="file" style="width: 250px;"></td>
                    <th style="text-align: right;">작성자 : <%=loginAdmin.getAdminId() %></th>
                    <input type="hidden" name="writer" value="<%=loginAdmin.getAdminNo() %>">
                </table>
            </div>

            <div id="noticeContent" style="margin-top: 10px;">
                <textarea name="content" class="form-control" rows="23" placeholder="내용을 입력해주세요."  style="resize:none;" required></textarea>
            </div>
            <div class="bottom" id="buttons" align="right">
                <button type="sumbit" class="btn btn-primary btn-sm">등록</button>
                <button onclick="history.back();" type="button" class="btn btn-info btn-sm">목록으로</button>
            </div>
        </form>
    </div>
    <br><br><br><br><br>
    
</body>

</html>