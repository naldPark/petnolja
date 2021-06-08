<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.petnolja.common.model.vo.PageInfo, java.util.ArrayList, com.petnolja.qna.model.vo.Qna "%>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Qna> list = (ArrayList<Qna>)request.getAttribute("list");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
	
	String answerStatus = "";
%>    
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
            padding:10px;
        }

        #qna-list {
            text-align: center;
            border: 1px solid gray;
            width: 100%;
            font-size: 13px;
            background-color: white;

        }
		
		<% if(!list.isEmpty()){%>
        #qna-list>tbody>tr:hover{
            background-color: rgb(255, 254, 190);
            cursor: pointer;
        }
        <% }%>

        #qna-list td{height: 60px; border: none;}

        #filter {
            float: left;
        }

        #buttons {
            float: right;
        }

        #buttons>button { font-size: 14px;}


        #paging-area>button {
            width:30px;
            height:30px;
            font-size: 12px;
            text-align: center;
        }

        #qna-list td {
            padding: 0;
            vertical-align: middle;
            }
    </style>

</head>
<body>

<%@include file="adminMenubar.jsp" %>


    <div class="outer" align="center">
        <div id="filter" align="left">
            <select id="qna-filter" style="width:120px; font-size:14px;">
                <option value="">전체 조회</option>
                <option value="Y">답변 완료</option>
                <option value="N">답변 안함</option>
            </select>
        </div>
        <div id="buttons" align="right">
            <button onclick="deleteqna();" class="btn btn-warning btn-sm">삭제</button>
        </div>

        <br><br>
        <table class="table" id="qna-list">
            <thead>
                <tr class="table-success">
                    <th width="60px">선택</th>
                    <th width="80px">글번호</th>
                    <th width="100px">글분류</th>
                    <th width="340px">제목</th>
                    <th width="100px">작성자</th>
                    <th width="110px">작성시간</th>
                    <th width="80px">답변여부</th>
                    <th width="80px">담당자</th>

                </tr>
            </thead>
            <tbody>
            	<%if(list.isEmpty()) {%>
            		<tr>
            			<td colspan="8">등록된 문의내역이 없습니다.</td>
            		</tr>
            	<% } else {%>
            
	            	<%for(Qna q : list) { %>
		                <tr>
		                    <td><input type="checkbox" onclick="event.stopPropagation()"></td>
		                    <td><%=q.getQnaNo() %></td>
		                    <td><%=q.getqCategory() %></td>
		                    <td><%=q.getqTitle() %></td>
		                    <td><%=q.getqMemNo() %></td>
		                    <td><%=q.getqCreateDate() %></td>
		                    <% if(q.getaContent() != null ){ answerStatus = "Y"; } else { answerStatus = "N"; } %>
		                    <td><%= answerStatus %></td>
		                    <% if(q.getaWriter() != null) { %>
		                    <td><%= q.getaWriter()%></td>
		                    <% } else { %>
		                    <td>-</td>
		                    <% } %>
		                                    
		                </tr>
		            <% } %>
	            <% } %>
            </tbody>
        </table>

        <!-- 페이징바 -->
                        
        <div id="paging-area">
        
        <% if(currentPage != 1){ %>
            <button onclick="location.href='<%=contextPath %>/qnalist.ad?currentPage=<%=currentPage -1 %>';" class="btn btn-outline-primary btn-sm">&lt;</button>
        <% } %>
        <% for(int p=startPage; p< endPage; p++) {%>
        
        
        	<%if(p !=currentPage) { %>
            	<button onclick="location.href='<%=contextPath %>/qnalist.ad?currentPage=<%=p %>';" class="btn btn-outline-primary btn-sm">1</button>
        	<% } else { %>
	            <button class="btn btn-outline-primary btn-sm" disabled><%=p %></button>
        	<% } %>
        <% } %>
        
        <% if(currentPage != maxPage && !list.isEmpty()) { %>
            <button onclick="location.href='<%=contextPath %>/qnalist.ad?currentPage=<%=currentPage + 1 %>';" class="btn btn-outline-primary btn-sm">&gt;</button>
        <% } %>    
        </div>
    </div>

    <br><br><br><br><br>


<script>

	// 답변여부로 검색
    $(document).ready(function () {
        $("#qna-filter").on("change", function () {
        	var value = $(this).val();
        	location.href = "qnalist.ad?currentPage=1&key=" + value;
        });
    });
    
    // 삭제버튼
    function deleteqna(){
    	
    	if(confirm("선택한 문의내역을 삭제하시겠습니까?")){
    	var qnoArr = [];
    	
    	$("input[type=checkbox]:checked").each(function(){
			qnoArr.push($(this).parent().siblings().eq(0).text());
    	});
    	
		var qnoList = qnoArr.join(",");
		
		$.ajax({
			url:"qdelete.ad",
			type:"post",
			data:{qnoList:qnoList},
			success:function(){
		    	$("input[type=checkbox]:checked").each(function(){
		    		alert("문의내역이 정상적으로 삭제되었습니다.");
		    		location.reload();
		    	});
			}, error:function(){
				console.log("문의내역 삭제ajax 통신 실패");
			}
		});

    	} else {
    		$(":checkbox").prop("checked", false);
    	}
    }

    
    $("#qna-list>tbody>tr").on("click", function(){
    	var qno = $(this).children().eq(1).text();
		location.href = "<%=contextPath%>/qdetail.ad?pno=<%=currentPage%>&qno=" + qno;
    	
    });
</script>



</body>
</html>