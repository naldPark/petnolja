<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.petnolja.notice.model.vo.Notice, com.petnolja.common.Attachment"%>
<% 
int pno = (int)request.getAttribute("pno");
Notice n = (Notice)request.getAttribute("n");
Attachment at = (Attachment)request.getAttribute("at");
%>


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
    
        <form action="<%=contextPath %>/nupdate.ad" method="post" enctype="multipart/form-data" style="margin-top: 20px;">
        <input type="hidden" name="nno" value="<%=n.getNoticeNo()%>">
            <div class="top" align="left">
                <table id="noticeTitle">
                    <td style="width: 40%;"><input name="title" type="text" class="form-control" placeholder="제목을 입력해주세요." style="width: 100%" required value="<%=n.getNoticeTitle() %>"></td>
                    <td style="width:15%;">
                        <select name="category" style="margin-left: 5px; margin-right: 5px;" required>
                            <option value="공지">공지사항</option>
                            <option value="회원정보">[FAQ]회원정보</option>
                            <option value="결제/환불/취소">[FAQ]결제/환불/취소</option>
                            <option value="이용관련">[FAQ]이용관련</option>
                            <option value="기타">[FAQ]기타</option>
                        </select>
                    </td>
                    <td style="width: 30%;">
                    	<%if(at != null) { %>
                    		<a download="<%=at.getOriginName()%>" href="<%= contextPath %>/<%= at.getFilePath() + at.getChangeName()%>"><%=at.getOriginName() %></a>
                    		<input type="hidden" name="originFileNo" value="<%=at.getFileNo()%>">
                    		<input type="hidden" name="originFileName" value="<%=at.getChangeName() %>">
                    	<% } else { %>
                    	<a>기존 첨부파일 없음</a>
                    	<% } %>
                    	<input name="reUpfile" type="file" style="width: 250px;">
                    	</td>
                    <th style="text-align: right;">작성자 : <%=n.getNoticeWriter() %></th>
                </table>
            </div>

            <div id="noticeContent" style="margin-top: 10px;">
                <textarea name="content" class="form-control" rows="23" placeholder="내용을 입력해주세요."  style="resize:none;" required><%=n.getNoticeContent() %></textarea>
            </div>
            <div class="bottom" id="buttons" align="right">
                <button onclick="location.href='<%=contextPath %>/ndeleteone.ad?nno=<%=n.getNoticeNo() %>';" type="button" class="btn btn-warning btn-sm">삭제</button>
                <input type="hidden" name="pno" value="<%=pno%>">
                <button type="submit" class="btn btn-primary btn-sm">수정</button>
                <button onclick="location.href='<%=contextPath %>/nlist.ad?currentPage=<%=pno%>';" type="button" class="btn btn-info btn-sm">목록으로</button>
            </div>
        </form>
    </div>
    <br><br><br><br><br>

	<script>
		$(function(){
			$("option").each(function(){
				if($(this).val().indexOf("<%=n.getNoticeCategory()%>") > -1){
					$(this).attr("selected", true);
				}
			});
		});
		
		
	</script>

</body>



</html>