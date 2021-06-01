<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.petnolja.common.model.vo.PageInfo, java.util.ArrayList, com.petnolja.notice.model.vo.Notice" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Notice> list = (ArrayList<Notice>)request.getAttribute("list");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();

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

        #notice-list {
            text-align: center;
            border: 1px solid gray;
            width: 100%;
            font-size: 13px;
            background-color: white;

        }

		<% if(!list.isEmpty()){%>
        #notice-list>tbody>tr:hover{
            background-color: rgb(255, 254, 190);
            cursor: pointer;
        }
        <% }%>

        #notice-list td{height: 60px; border: none;}

        #search {
            float: left;
        }

        #buttons {
            float: right;
        }

        #buttons>button {font-size: 14px;}


        #paging-area>button {
            width:30px;
            height:30px;
            font-size: 12px;
            text-align: center;
        }

        #notice-list td {
        padding: 0;
        vertical-align: middle;
        
        }



    </style>
</head>
<body>

<%@include file="adminMenubar.jsp" %>


<body>

    <div class="outer" align="center">
        <div id="search" align="left">
            <input type="search" id="notice-search-box" class="form-control-sm" placeholder="공지사항 제목" style="font-size: 14px; width: 300px;">
        </div>
        <div id="buttons" align="right">
            <button onclick="location.href='<%=contextPath %>/nenroll.ad';" class="btn btn-primary btn-sm">작성하기</button>
            <button onclick="deleteNotice();" class="btn btn-warning btn-sm">삭제</button>
        </div>

        <br><br>
        <table class="table" id="notice-list">
            <thead>
                <tr class="table-success">
                    <th width="60px">선택</th>
                    <th width="80px">글번호</th>
                    <th width="400px">제목</th>
                    <th width="160px">작성자</th>
                    <th width="150px">작성일</th>
                    <th width="100px">조회수</th>
                </tr>
            </thead>
            <tbody>
            	<%if(list.isEmpty()) { %>
            	<tr>
            		<td colspan="6">공지사항이 존재하지 않습니다.</td>
            	</tr>
            	<% } else { %>
            		<% for(Notice n : list) { %>
		                <tr>
		                    <td>
		                        <input type="checkbox">
		                    </td>
		                    <td><%= n.getNoticeNo() %></td>
		                    <td><%= n.getNoticeTitle() %></td>
		                    <td><%= n.getNoticeWriter() %></td>
		                    <td><%= n.getCreateDate() %></td>
		                    <td><%=n.getNoticeCount() %></td>
		                </tr>            			
            		<% } %>
            	<% } %>


            </tbody>
        </table>

        <!-- 페이징바 -->
                        
        <div id="paging-area">
        
    	<% if(currentPage != 1){ %>
        	<button onclick="location.href='<%=contextPath %>/nlist.ad?currentPage=<%=currentPage - 1 %>';" class="btn btn-outline-primary btn-sm">&lt;</button>
		<% } %>
		<% for(int p=startPage; p<endPage; p++) {%>
			<% if(p != currentPage) { %>
		        <button onclick="location.href='<%=contextPath %>/nlist.ad?currentPage=<%=p %>';" class="btn btn-outline-primary btn-sm"><%=p %></button>
			<% } else { %>
				<buton disabled><%=p %></buton>
			<% } %>
		<% } %>

		<% if(currentPage != maxPage && !list.isEmpty()) { %>
            <button onclick="location.href='<%=contextPath %>/nlist.ad?currentPage=<%=currentPage + 1 %>';" class="btn btn-outline-primary btn-sm">&gt;</button>
        <% } %>
        </div>
    </div>

    <br><br><br><br><br>


	<script>
	
	    $(document).ready(function () {
	        $("#notice-search-box").on("keyup", function () {
	            var value = $(this).val().toLowerCase();
	            $("#notice-list>tbody>tr").filter(function () {
	                $(this).toggle($(this).children().eq(2).text().toLowerCase().indexOf(value) > -1)
	            });
	        });
	    });
	    
	    
	    
	    // 공지사항 삭제
	    function deleteNotice(){
	    	$("input[type=checkbox]:checked").each(function(){
	    		if(confirm("선택한 공지사항을 삭제하시겠습니까?")){
	    			
	    		} else {
	    			$(":checkbox").prop("checked", false);
	    		}
	    		
	    	});
	    }
	</script>




</body>
</html>