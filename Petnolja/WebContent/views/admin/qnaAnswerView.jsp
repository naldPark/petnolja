<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.petnolja.qna.model.vo.Qna, com.petnolja.common.Attachment"%>
<%
	Qna q = (Qna)request.getAttribute("q");
	Attachment at = (Attachment)request.getAttribute("at");
	int pno = (int)request.getAttribute("pno");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="resources/images/adFavicon.ico">
<title>펫놀자?관리자!</title>
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
                    <th width="350"><label style="font-size: 16px;">제목 : <%=q.getqTitle() %></label></th>
					<%if(at != null) { %>
                    <td><a download="<%=at.getOriginName()%>" href="<%=contextPath%>/<%=at.getFilePath() + at.getChangeName()%>"><%=at.getOriginName() %></a></td>
					<% } else { %>
                    <td><a> 첨부파일 없음 </a></td>
					<% } %>
                    <th style="text-align: right;">작성자 : <%=q.getqMemNo() %></th>

                </tr>
                <tr>
                    <td colspan="3">
                        <div id="question-box">
							<%=q.getqContent() %>
                        </div>
                    </td>
                </tr>
                <tr height="40px">
                	<%
                		String aWriter = (q.getaWriter() == null) ? loginAdmin.getAdminId() : q.getaWriter();
                		String aContent = (q.getaContent() == null) ? "" : q.getaContent();
                	%>
                    <th colspan="3" style="text-align: right;"> 담당자 : <%= aWriter%></th>
                </tr>
                <tr height="300px">
                    <td colspan="3">
                        <textarea id="answer-box"><%= aContent %></textarea>
                    </td>
                </tr>
                <tr height="50px">
                    <td colspan="3">
                        <div id="buttons" align="right">
                            <button onclick="answer();" type="button" class="btn btn-primary btn-sm">등록</button>
                            <button onclick="location.href='<%=contextPath %>/qnalist.ad?currentPage=<%=pno %>';" type="button" class="btn btn-info btn-sm">목록으로</button>
                        </div>
                    </td>
                </tr>
            </table>

        </form>

    </div>
    <br><br><br><br><br>
    
    <script>
    
    	
    	function answer(){
    		if(confirm("답변을 등록/수정하시겠습니까?")){
    			var answer = $("#answer-box").val();
    			
    			if(answer == ""){
    				alert("답변을 입력해주세요");
    			} else {
    				
    			
    			$.ajax({
    				url:"answer.ad",
    				type:"post",
    				data:{answer:answer,
    					  qno:<%=q.getQnaNo()%>,
    				}, success:function(result){
    					if(result > 0){
    						alert("답변이 등록되었습니다.");
    						$("#answer-box").html(answer);
    					}
    				}, error:function(){
    					alert("답변 등록에 실패했습니다.");
    				}
    			});
    			
    			}
    			
    		}
    	}
    	
    
    </script>


</body>
</html>