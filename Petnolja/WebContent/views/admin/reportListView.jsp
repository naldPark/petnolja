<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.petnolja.common.model.vo.PageInfo, java.util.ArrayList, com.petnolja.board.model.vo.Report" %>

<% 
	PageInfo pi=(PageInfo)request.getAttribute("pi"); 
    ArrayList<Report> Qlist = (ArrayList<Report>)request.getAttribute("Qlist");
    ArrayList<Report> Rlist = (ArrayList<Report>)request.getAttribute("Rlist");
    ArrayList<Report> list = new ArrayList<>();
    list.addAll(Qlist); list.addAll(Rlist);
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

        #report-list {
            text-align: center;
            border: 1px solid gray;
            width: 100%;
            font-size: 13px;
            background-color: white;
        }

        #report-list>tbody>tr:hover {
            background-color: rgb(255, 234, 211);
            cursor: pointer;
        }

        #report-list td {
            height: 60px;
            border: none;
        }

        #search {
            float: left;
        }

        #buttons {
            float: right;
        }

        #buttons>button {
            font-size: 14px;
        }


        #paging-area>button {
            width: 30px;
            height: 30px;
            font-size: 12px;
            text-align: center;
        }

        #report-list td {
            padding: 0;
            vertical-align: middle;
        }
    </style>

</head>

<body>

	<%@include file="adminMenubar.jsp" %>

    <div class="outer" align="center">
        <div id="search" align="left">
            <input type="search" id="report-search-box" class="form-control-sm" placeholder="신고글 제목"
                style="font-size: 14px; width: 300px;">
        </div>
        <div id="buttons" align="right">
            <button class="btn btn-info btn-sm" onclick="undoReport()">복구</button>
            <button class="btn btn-warning btn-sm" onclick="deleteReport()">삭제</button>
        </div>
    
        <br><br>
        <table class="table" id="report-list">
            <thead>
                <tr class="table-danger">
                    <th width="60px">선택</th>
                    <th width="80px">글번호</th>
                    <th width="410px">제목</th>
                    <th width="100px">작성자</th>
                    <th width="100px">작성일</th>
                    <th width="100px">신고자</th>
                    <th width="100px">신고일</th>
                </tr>
            </thead>
            <tbody>
            	<% if(list.isEmpty()){ %>
            		<tr>
            			<td colspan="7">조회된 결과가 없습니다.</td>
            		</tr>
            	<% }else { %>
            		<% for(Report r : list){ %>
		                <tr>
		                	<td>
                        		<input type="checkbox" onclick = "event.stopPropagation()">
                    		</td>
		                    <td><%= r.getReportNo() %></td>
		                    <td><%= r.getTitle() %></td>
		                    <td><%= r.getWriterId() %></td>
		                    <td><%= r.getCreatedDate() %></td>
		                    <td><%= r.getReporterId() %></td>
		                    <td><%= r.getReportedDate() %></td>
		                </tr>
                	<% } %>
                <% } %>
            </tbody>
        </table>

        <!-- 페이징바 -->
        <div id="paging-area">
            <div id="paging-area">
			<% if(currentPage != 1){ %>
            	<button onclick="location.href='<%=contextPath%>/reportlist.ad?currentPage=<%=currentPage-1%>';" class="btn btn-outline-primary btn-sm"> &lt; </button>
			<% } %>

            <% for(int p=startPage; p<=endPage; p++){ %>
            	
            	<% if(p != currentPage){ %>
	            	<button onclick="location.href='<%=contextPath%>/reportlist.ad?currentPage=<%= p %>';" class="btn btn-outline-primary btn-sm"><%= p %></button>
	            <% }else { %>
	            	<button class="btn btn-outline-primary btn-sm" disabled><%= p %></button>
            	<% } %>
            	
            <% } %>

			<% if(currentPage != maxPage){ %>
            	<button onclick="location.href='<%=contextPath%>/reportlist.ad?currentPage=<%=currentPage+1%>';" class="btn btn-outline-primary btn-sm"> &gt; </button>
			<% } %>

        </div>
    </div>

    <br><br><br><br><br>

	<!-- 복구/삭제 -->
	<script>
	function undoReport(){
    	
    	var rNoArr = [];
    	
    	$("input[type=checkbox]:checked").each(function(){
    		rNoArr.push($(this).parent().siblings().eq(0).text());
    	});
    	
    	var rNoList = rNoArr.join(",");
    	
		if(confirm("선택한 신고내역을 복구하시겠습니까?")){
			$.ajax({
				url:"undoreport.ad",
				type:"post",
				data:{rNoList:rNoList},
				success:function(result){
					if(result == rNoArr.length){
						alert("성공적으로 처리되었습니다.");
						location.reload();
					} else {
						alert("신고내역 복구에 실패했습니다.");
					}
				}, erorr:function(){
					console.log("신고내역 복구 ajax통신 실패");
				}
			});
			
		} else {
			$(":checkbox").prop("checked", false);
		}
    }
	
	function deleteReport(){
    	
    	var rNoArr = [];
    	
    	$("input[type=checkbox]:checked").each(function(){
    		rNoArr.push($(this).parent().siblings().eq(0).text());
    	});
    	
    	var rNoList = rNoArr.join(",");
    	
		if(confirm("선택한 신고내역을 삭제하시겠습니까?")){
			$.ajax({
				url:"deletereport.ad",
				type:"post",
				data:{rNoList:rNoList},
				success:function(result){
					if(result == rNoArr.length){
						alert("성공적으로 처리되었습니다.");
						location.reload();
					} else {
						alert("신고내역 삭제에 실패했습니다.");
					}
				}, erorr:function(){
					console.log("신고내역 삭제 ajax통신 실패");
				}
			});
			
		} else {
			$(":checkbox").prop("checked", false);
		}
    }
	
	
	//상세 조회
    $("#report-list>tbody>tr").on("click", function(){
    	var rno = $(this).children().eq(1).text();
    	location.href = "<%= contextPath %>/reportdetail.ad?pno=<%=currentPage%>&rno=" + rno;
    });
	
	</script>

	<!-- 검색 -->
	<script>
        $(document).ready(function () {
            $("#report-search-box").on("keyup", function () {
            	if(event.keyCode == "13") {
            		var keyword = $(this).val().toLowerCase();
            		location.href = "<%=contextPath%>/reportlist.ad?currentPage=1&key=" + keyword;
            	}
            });
        });
    </script>
</body>

</html>