<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.petnolja.common.model.vo.PageInfo, java.util.ArrayList, com.petnolja.admin.model.vo.Calculate" %>
    
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Calculate> list = (ArrayList<Calculate>)request.getAttribute("list");
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
            padding: 10px;
        }

        #calculate-list {
            text-align: center;
            border: 1px solid gray;
            width: 100%;
            background-color: white;
            font-size: 13px;
        }

        #search {
            float: left;
        }

        #month-filter {
            float: right;
        }

        #calculate-list button {
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

        #month-filter input,
        #month-filter span {
            margin-right: 15px;
        }

        #calculate-list td {
            vertical-align: middle;
        }
    </style>


</head>
<body>

<%@include file="adminMenubar.jsp" %>

    <div class="outer" align="center">
        <div id="search" align="left">
            <input type="search" id="calculate-search-box" class="form-control-sm" placeholder="펫시터ID"
                style="font-size: 14px;">
        </div>
        <!-- 
        <div id="month-filter" align="right" style="font-size: 14px;">
            <input id="calender" type="month">
            <span id="month-sum" style="font-weight: 600; font-size: 15px;">단위기간 정산 총액 : 원</span>
        </div>
		 -->
		 
        <br><br>
        <table class="table" id="calculate-list">
            <thead>
                <tr class="table-warning">
                    <th width="60px">번호</th>
                    <th width="260px">펫시터ID</th>
                    <th width="260px">이름</th>
                    <th width="300px">상세내역</th>
                    <th width="150px">정산월</th>
                    <th width="150px">정산금액(원)</th>

                </tr>
            </thead>
            <tbody>
	            <% if(list.isEmpty()) { %>
	                <tr>
	                    <td colspan="6">정산내역이 존재하지 않습니다.</td>
	                </tr>            
	            <% } else { %>
	            	<% for(Calculate c : list) {%>
		                <tr>
		                    <td>001</td>
		                    <td><%=c.getSitterId()%></td>
		                    <td><%=c.getSitterName() %></td>
		                    
		                    <% String year = c.getCalYear(); //서비스 한 년도 %>
		                	<% String month = c.getCalMonth(); // 서비스 한 월%>

		                    <%int realCalMonth = Integer.parseInt(month) == 12? 1 : Integer.parseInt(month) + 1; // 실제 정산되는 월은 다음 달이니까.%>
		                    <% String calMonth = realCalMonth < 10 ? "0" + String.valueOf(realCalMonth) : String.valueOf(realCalMonth); //실제 정산되는 월.한자리 수 0붙이기 %>
       		               	<% int realCalYear = Integer.parseInt(month) == 12? Integer.parseInt(year) + 1 : Integer.parseInt(year); // 실제 정산 년도 %>

		                    <td><button onclick="location.href='<%=contextPath %>/calculateDetail.ad?currentPage=1&&sid=<%=c.getSitterId()%>&&month=<%= calMonth %>&&year=<%= realCalYear %>';" class="btn btn-info">상세조회</button></td>
							<!-- 수정 전 (최서경)
		                    <td><button onclick="location.href='<%=contextPath %>/calculateDetail.ad?currentPage=1&&sid=<%=c.getSitterId()%>&&month=<%= calMonth %>&&year=<%= c.getCalYear() %>';" class="btn btn-info">상세조회</button></td>
		                    -->
		                    
		                    <td><%=realCalYear%>-<%=calMonth %></td>
		                    <td><%=c.getPayTotal() %></td>
		                </tr>
	            	<% } %>
	            <% } %>
            </tbody>
        </table>

        <!-- 페이징바 -->
		<div id="paging-area">
        	<%if(currentPage != 1) { %>
            <button onclick="location.href='<%=contextPath %>/callist.ad?currentPage=<%=currentPage - 1 %>';" class="btn btn-outline-primary btn-sm">&lt;</button>
			<% } %>
			<% for(int p=startPage; p<endPage; p++){ %>
				<% if(p != currentPage) {%>
		            <button onclick="location.href='<%=contextPath %>/callist.ad?currentPage=<%=p %>';" class="btn btn-outline-primary btn-sm"><%=p %></button>
				<% } else {%>
		            <button disabled class="btn btn-outline-primary btn-sm"><%=p %></button>
				<% } %>
			<% } %>
			
			<%if(currentPage != maxPage && !list.isEmpty()) {%>
	            <button onclick="location.href='<%=contextPath %>/callist.ad?currentPage=<%=currentPage + 1 %>';" class="btn btn-outline-primary btn-sm">&gt;</button>
			<% } %>
        </div>
    </div>

    <br><br><br><br><br>

<script>
    //펫시터 아이디로 필터링
    $(document).ready(function () {
        $("#calculate-search-box").on("keyup", function () {
        	
        	if(event.keyCode == "13"){
	            var keyword = $(this).val().toLowerCase();
	            location.href = "<%=contextPath%>/callist.ad?currentPage=1&key="+keyword;
        	}
        	
	        /*	
            $("#month-sum").text("단위기간 정산 총액 : 원");

            */


        });
    });

    /*
    //정산 기간으로 필터링
    $(document).ready(function () {
        $("#calender").on("change", function () {
            var value = $(this).val();
            $("#calculate-list>tbody>tr").filter(function () {
                $(this).toggle($(this).children().eq(4).text().indexOf(value) > -1)
            });

            $(function () {
                var trArr = $("#calculate-list>tbody>tr");
                var sum = 0;

                $.each(trArr, function(){

                    if($(this).children().eq(4).text() == value){
                        sum += parseInt($(this).children().eq(5).text());
                    }
                });

                $("#month-sum").text("단위기간 정산 총액 : " + sum + " 원");
            });
        });
    });*/
</script>

</body>
</html>