<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.petnolja.memboard.model.vo.MemBoard, com.petnolja.common.model.vo.PageInfo ,com.petnolja.research.model.vo.*"%>
<%
	ArrayList<MemBoard> list = (ArrayList<MemBoard>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int sitterNo = (Integer)request.getAttribute("sitterNo");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
		width:1000px;
		height:600px;
		position:relative;
		margin:auto;
		margin-top:20px;
		padding:70px;
		border:1px solid lightgray;
	}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer">
		<div class="container">
			<h2>펫시터 문의하기 목록</h2>

			<br>
			
			<p></p>            
			<table class="table table-hover">
			  <thead class="thead-dark">
				<tr>
				  <th>번호</th>
				  <th>제목</th>
				  <th>작성자</th>
				  <th>작성일</th>
				</tr>
			  </thead>
			  <tbody>
				<% if(list.isEmpty()){ %>
		      	 <!-- 리스트가 비어있을 경우 -->
		      	 <tr>
		      	 	<td colspan="3">존재하는 공지사항이 없습니다.</td>
		      	 <tr>
		      	</tbody>
		      	</table>
		      	</div> 
		      <% }else { %>	
		      	 <!-- 리스트가 비어있지 않을 경우 --> 
		      	 <% for(MemBoard b : list) { %>
		        <tr>
		        	<td><%= b.getaSitterNo() %></td>
		            <td><%= b.getqTitle() %></td>
		            <td><%= b.getMemName() %></td>
		            <td><%= b.getqCreateDate() %></td>
		        </tr>
		      <% } %> 
			  </tbody>
			</table>
		  </div>

		  <button class="btn btn-secondary" style="position:absolute; top:110px; left:840px;" onclick="location.href='<%=contextPath%>/views/memboard/askToPetsitter.jsp'">글작성</button>

		  
	<br><br>
      <!-- 페이지 목록 시작 -->
	             <ul class="pagination justify-content-center">
	             <% if(pi.getCurrentPage() != 1){ %>
	                <li class="page-item"><a class="page-link" href="<%=contextPath%>/askPet.me?sno=<%=sitterNo%>&currentPage=<%=pi.getCurrentPage()-1%>">&lt;</a></li>
	           	 <% } %>
	           	 <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
	           	 
	           		 <% if(p != pi.getCurrentPage()){ %>
	               		 <li class="page-item"><a class="page-link" href="<%=contextPath%>/askPet.me?sno=<%=sitterNo%>&currentPage=<%= p %>"><%= p %></a></li>
		             <% }else { %>
		            	 <li class="page-item" ><a class="page-link" style="background:rgb(194, 227, 238)" href="<%=contextPath%>/askPet.me?sno=<%=sitterNo%>&currentPage=<%= p %>"><%= p %></a></li>
	            	 <% } %>
	             <% } %>
	     
	
				<% if(pi.getCurrentPage() != pi.getMaxPage()){ %>
	            	<li class="page-item"><a class="page-link" href="<%=contextPath%>/askPet.me?sno=<%=sitterNo%>&currentPage=<%=pi.getCurrentPage()+1%>"> &gt;</a></li>
				<% } %>
	              </ul>
      <!-- 페이지 목록 끝 -->
      
    <% } %> 
	
	</div>
	
	
	
	<%@ include file = "../common/footer.jsp"%>
</body>
</html>