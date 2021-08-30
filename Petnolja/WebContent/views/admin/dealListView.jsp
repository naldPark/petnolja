<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.petnolja.common.model.vo.PageInfo, java.util.ArrayList, com.petnolja.admin.model.vo.Deal" %>
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Deal> list = (ArrayList<Deal>)request.getAttribute("list");
	int currentPage = pi.getCurrentPage();
	int startPage = pi.getStartPage();
	int endPage = pi.getEndPage();
	int maxPage = pi.getMaxPage();
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

    #deal-list {
        text-align: center;
        border: 1px solid gray;
        width: 100%;
        font-size: 13px;
        background-color: white;
    }

    #search {
        float: left;
    }

    #filter {
        float: right;
    }

    #search>button {
        font-size: 14px;
    }


    #paging-area>button {
        width: 30px;
        height: 30px;
        font-size: 12px;
        text-align: center;
    }

    #deal-list>tbody tr {
        height: 55px;
    }

    #deal-list td {
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
            <input type="search" id="deal-search-box" class="form-control-sm" placeholder="거래번호를 정확히 입력해주세요"
                style="font-size: 14px; width:250px;">
        </div>
        <div id="filter" align="right" style="font-size: 14px;">
            <span>거래발생일 : </span>
            <input type="date" id="date-filter">
        </div>

        <br><br>
        <table class="table" id="deal-list">
            <thead>
                <tr class="table-warning">
                    <th width="80px">거래번호</th>
                    <th width="160px">거래발생일</th>
                    <th width="160px">이용자ID</th>
                    <th width="130px">펫시터ID</th>
                    <th width="150px">금액(원)</th>
                    <th width="150px">서비스시작일</th>
                    <th width="120px">취소여부</th>
                </tr>
            </thead>
            <tbody>
            	<% if(list.isEmpty()) {%>
            	<tr>
            		<td colspan="7">거래내역이 존재하지 않습니다.</td>
            	</tr>
            	<% } else { %>
	            	<% for(Deal d:list){ %>
	                <tr>
	                    <td><%=d.getResNo() %></td>
	                    <td><%=d.getResDate() %></td>
	                    <td><%=d.getMemId() %></td>
	                    <td><%=d.getSitterId() %></td>
	                    <td><%=d.getPayAmount() %></td>
	                    <td><%=d.getResCheckinDate() %></td>
	                    <% String cancel = "";%>
	                    <% if(d.getResStatus().equals("취소")){ %>
	                    <% cancel = "Y"; %>
	                    <% } else { cancel="N"; } %>
	                    <td><%=cancel %></td>
	                </tr>
	                <% } %>
            	<% } %>
            </tbody>
        </table>

        <!-- 페이징바 -->

        <div id="paging-area">
        	<%if(currentPage != 1) { %>
            <button onclick="location.href='<%=contextPath %>/deallist.ad?currentPage=<%=currentPage - 1 %>';" class="btn btn-outline-primary btn-sm">&lt;</button>
			<% } %>
			<% for(int p=startPage; p<=endPage; p++){ %>
				<% if(p != currentPage) {%>
		            <button onclick="location.href='<%=contextPath %>/deallist.ad?currentPage=<%=p %>';" class="btn btn-outline-primary btn-sm"><%=p %></button>
				<% } else {%>
		            <button disabled class="btn btn-outline-primary btn-sm"><%=p %></button>
				<% } %>
			<% } %>
			
			<%if(currentPage != maxPage && !list.isEmpty()) {%>
	            <button onclick="location.href='<%=contextPath %>/deallist.ad?currentPage=<%=currentPage + 1 %>';" class="btn btn-outline-primary btn-sm">&gt;</button>
			<% } %>
        </div>
    </div>

    <br><br><br><br><br>

<script>

// 정확한 거래번호 넣어야지만 조회 가능!
	$(document).ready(function () {
	    $("#deal-search-box").on("keyup", function () {
	    	if(event.keyCode == "13"){
	    		//alert("검색!");
	    		var keyword = $(this).val().toLowerCase();
	    		location.href="deallist.ad?currentPage=1&key=" + keyword;
	    	}
	    });
	});

/* 10개 조회 후 -> 필터링 -> 조회 제대로 안됨
    $(document).ready(function () {
        $("#deal-search-box").on("keyup", function () {
            var value = $(this).val().toLowerCase();
            $("#deal-list>tbody>tr").filter(function () {
                $(this).toggle($(this).children().eq(0).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });
*/
	// 거래 날짜로 검색
    $(function () {

        $("#date-filter").on("change", function(){
        		
            var date = $(this).val();
           	console.log(date);
			
            location.href="deallist.ad?currentPage=1&date=" + date;
        });
    });

</script>


</body>
</html>