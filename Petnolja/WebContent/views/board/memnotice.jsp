<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.petnolja.board.model.vo.MemNotice, com.petnolja.common.model.vo.PageInfo"%>
<%
	ArrayList<MemNotice> list = (ArrayList<MemNotice>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");	
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        #outer{
          width:1000px;
          height:100%;
          margin:auto;
          font-family:'Noto Sans KR', sans-serif !important;
          border:1px solid lightgray;
          padding: 15px;
        }
        table{text-align: center;}

</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
<br><br>
 <div id="outer">
     <br><br>
<div class="container">
    <h2>공지사항</h2><br>

    <table class="table">
      <thead class="thead-light">
        <tr>
          <th width="100">글번호</th>
          <th width="600">제목</th>
          <th>작성자</th>
          <th width="150">작성일시</th>
          <th width="80">조회수</th>
        </tr>
      </thead>
      <tbody>
      <% if(list.isEmpty()){ %>
      	 <!-- 리스트가 비어있을 경우 -->
      	 <tr>
      	 	<td colspan="3">존재하는 공지사항이 없습니다.</td>
      	 <tr>
      <% }else { %>	
      	 <!-- 리스트가 비어있지 않을 경우 --> 
      	 <% for(MemNotice n : list) { %>
        <tr>
        	<td><%=n.getNoticeNo() %></td>
            <td><%= n.getNoticeTitle() %></td>
            <td><%= n.getNoticeWriter() %></td>
            <td><%= n.getCreateDate() %></td>
            <td><%= n.getCount() %></td>
        </tr>
      <% } %> 
       
      </tbody>
    </table>
  </div>
  <script>
  	$(function(){
  		$(".table>tbody>tr").click(function(){
  			var nno = $(this).children().eq(0).text();
  			
  			location.href = '<%=contextPath%>/memdetail.me?nno=' + nno;
  		})
  	})
  </script>        


<br><br>
      <!-- 페이지 목록 시작 -->
	             <ul class="pagination justify-content-center">
	             <% if(pi.getCurrentPage() != 1){ %>
	                <li class="page-item"><a class="page-link" href="<%=contextPath%>/memNotice.me?currentPage=<%=pi.getCurrentPage()-1%>">&lt;</a></li>
	           	 <% } %>
	           	 <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
	           	 
	           		 <% if(p != pi.getCurrentPage()){ %>
	               		 <li class="page-item"><a class="page-link" href="<%=contextPath%>/memNotice.me?currentPage=<%= p %>"><%= p %></a></li>
		             <% }else { %>
		            	 <li class="page-item" ><a class="page-link" style="background:rgb(194, 227, 238)" href="<%=contextPath%>/memNotice.me?currentPage=<%= p %>"><%= p %></a></li>
	            	 <% } %>
	             <% } %>
	     
	
				<% if(pi.getCurrentPage() != pi.getMaxPage()){ %>
	            	<li class="page-item"><a class="page-link" href="<%=contextPath%>/memNotice.me?currentPage=<%=pi.getCurrentPage()+1%>"> &gt;</a></li>
				<% } %>
	              </ul>
      <!-- 페이지 목록 끝 -->
      
    <% } %> 
 </div><br>
 
 <%@ include file = "../common/footer.jsp"%>
</body>
</html>