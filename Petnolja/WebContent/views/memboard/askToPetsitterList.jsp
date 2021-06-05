<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.petnolja.memboard.model.vo.MemBoard, com.petnolja.common.model.vo.PageInfo ,com.petnolja.research.model.vo.*"%>
<%
	ArrayList<MemBoard> list = (ArrayList<MemBoard>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	int sno = (Integer)request.getAttribute("sno");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.outer{
		width:1000px;
		position:relative;
		margin:auto;
		margin-top:20px;
		padding:70px;
		border:1px solid lightgray;
	}
	 td:nth-of-type(1) { display: none; } 
	 tr:hover{cursor:pointer}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer">
		<div class="container">
			<h2>펫시터 문의하기 목록</h2>
			
			<% if(loginUser != null) { %>
		    <button class="btn btn-secondary" style="position:absolute; top:110px; left:840px;" onclick="location.href='<%=contextPath%>/askToWriter.me?sno=<%=sno%>'">글작성</button>
			<%} %>
			<br>
			
			<p></p>            
			<table class="table table-hover" style="text-align:center">
			  <thead class="thead-dark" >
				<tr>
		     	   <td width="1">글번호</th>
		           <th width="600">제목</th>
		           <th width="150">작성자</th>
		           <th width="150">작성일시</th>
				</tr>
			  </thead>
			  <tbody>
				<% if(list.isEmpty()){ %>
		      	 <!-- 리스트가 비어있을 경우 -->
		      	 <tr>
		      	 	<td colspan="3">존재하는 게시글이 없습니다.</td>
		      	 <tr>
		      	</tbody>
		      	</table>
		      	</div> 
		      <% }else { %>	
		      	 <!-- 리스트가 비어있지 않을 경우 --> 
		      	 <% for(MemBoard b : list) { %>
		        <tr>
		        	<td><%= b.getQnaNo() %></td>
		            <td><%= b.getqTitle() %></td>
		            <td><%= b.getMemName() %></td>
		            <td><%= b.getqCreateDate() %></td>
		        </tr>
		      <% } %> 
			  </tbody>
			</table>
		  </div>


	<script>
	  	$(function(){
	  		$(".table>tbody>tr").click(function(){
	  			var qno = $(this).children().eq(0).text();
	  			
	  			location.href = '<%=contextPath%>/askToPetdetail.me?qno=' + qno;
	  		})
	  	})
	  </script>

		  
	<br><br>
      <!-- 페이지 목록 시작 -->
	             <ul class="pagination justify-content-center">
	             <% if(pi.getCurrentPage() != 1){ %>
	                <li class="page-item"><a class="page-link" href="<%=contextPath%>/askPet.me?sno=<%=sno%>&currentPage=<%=pi.getCurrentPage()-1%>">&lt;</a></li>
	           	 <% } %>
	           	 <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
	           	 
	           		 <% if(p != pi.getCurrentPage()){ %>
	               		 <li class="page-item"><a class="page-link" href="<%=contextPath%>/askPet.me?sno=<%=sno%>&currentPage=<%= p %>"><%= p %></a></li>
		             <% }else { %>
		            	 <li class="page-item" ><a class="page-link" style="background:rgb(194, 227, 238)" href="<%=contextPath%>/askPet.me?sno=<%=sno%>&currentPage=<%= p %>"><%= p %></a></li>
	            	 <% } %>
	             <% } %>
	     
	
				<% if(pi.getCurrentPage() != pi.getMaxPage()){ %>
	            	<li class="page-item"><a class="page-link" href="<%=contextPath%>/askPet.me?sno=<%=sno%>&currentPage=<%=pi.getCurrentPage()+1%>"> &gt;</a></li>
				<% } %>
	              </ul>
      <!-- 페이지 목록 끝 -->
      
    <% } %> 
	
	</div>
	
	
	
	<%@ include file = "../common/footer.jsp"%>
</body>
</html>