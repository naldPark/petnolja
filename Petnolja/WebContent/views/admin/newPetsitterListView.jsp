<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %> 
<%@ page import="com.petnolja.common.model.vo.PageInfo, java.util.ArrayList, com.petnolja.petsitter.model.vo.Petsitter" %>

<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Petsitter> list = (ArrayList<Petsitter>)request.getAttribute("list");
	
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신규 지원자 목록</title>

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

    #new-petsitter-list {
        text-align: center;
        border: 1px solid gray;
        width: 100%;
        font-size: 13px;
        background-color: white;

    }

    #new-petsitter-list td {
        height: 60px;
        border: none;
    }

    #filter {
        float: left;
    }


    #new-petsitter-list button {
        width: 90px !important;
        height: 30px !important;
        font-size: 12px !important;
        line-height: 10px !important;
    }

    #paging-area>button {
        width: 30px;
        height: 30px;
        font-size: 12px;
        text-align: center;
    }


</style>

</head>
<body>

<%@ include file="adminMenubar.jsp" %>

<div class="outer" align="center">
    <div id="filter" align="left">
        <select id="new-petsitter-filter" style="width:120px; font-size: 14px;">
            <option value="">전체조회</option>
            <option value="Y">처리완료</option>
            <option value="N">처리안함</option>
        </select>

    </div>

    <br><br>
    <table class="table" id="new-petsitter-list">
        <thead>
            <tr class="table-info">
                <th width="60px">선택</th>
                <th width="80px">고객번호</th>
                <th width="160px">ID</th>
                <th width="450px">지원서 상세내용</th>
                <th width="100px">처리여부</th>
                <th width="100px">처리결과</th>
            </tr>
        </thead>
        <tbody>
            <% if(list.isEmpty()) { %>
				
				<td colspan="6">조회 결과가 없습니다.</td>	
				
			<% }else { %>
				<% for(Petsitter n: list) {%>
					<tr>
		                <td>
		                    <input type="checkbox">
		                </td>
		                <td><%= n.getSitterNo()%></td>
		                <td><%= n.getMemID()%></td>
		                <td align="center"><button onclick="location.href='<%=contextPath%>/petsitterApply.ad?sno=<%= n.getSitterNo()%>';" class="btn btn-info">조회</button></td>
		                <td>
		                	<% if (n.getpDate() != null) { %>
		                		Y
		                	<%} else { %>
		                		N
		                	<% } %>
		                </td>
		                <td>
		                	<% if (n.getpStatus() == 'Y') { %>
		                		승인
		                	<%} else { %>
		                		거절
		                	<% } %>
		                </td>
            		</tr>
				<% } %>
			<% } %>            
            

        </tbody>
    </table>
    
    <!-- 클릭시 지원서 상세로 넘어가는 스크립트 -->
	

    <!-- 페이징바 -->

    <div id="paging-area">
        <% if(currentPage != 1){ %>
            	<button onclick="location.href='<%=contextPath%>/newlist.ad?currentPage=<%=currentPage-1%>';" class="btn btn-outline-primary btn-sm"> &lt; </button>
		<% } %>

        <% for(int p=startPage; p<=endPage; p++){ %>
            	
            <% if(p != currentPage){ %>
	            	<button onclick="location.href='<%=contextPath%>/newlist.ad?currentPage=<%= p %>';" class="btn btn-outline-primary btn-sm"><%= p %></button>
	        <% }else { %>
	            	<button class="btn btn-outline-primary btn-sm" disabled><%= p %></button>
            <% } %>
            	
        <% } %>

		<% if(currentPage != maxPage && !list.isEmpty()){ %>
            <button onclick="location.href='<%=contextPath%>/newlist.ad?currentPage=<%=currentPage+1%>';" class="btn btn-outline-primary btn-sm"> &gt; </button>
		<% } %>
    </div>
</div>

<br><br><br><br><br>


<!-- 필터 스크립트 -->
<script>
    $(document).ready(function () {
        $("#new-petsitter-filter").on("change", function () {
            var value = $(this).val().toLowerCase();
            $("#new-petsitter-list>tbody>tr").filter(function () {
                $(this).toggle($(this).children().eq(4).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });
</script>

</body>
</html>