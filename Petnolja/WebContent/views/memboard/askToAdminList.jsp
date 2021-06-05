<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.petnolja.qna.model.vo.Qna, com.petnolja.common.model.vo.PageInfo"%>
<%
	ArrayList<Qna> list = (ArrayList<Qna>)request.getAttribute("list");
	PageInfo pi = (PageInfo)request.getAttribute("pi");	
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫놀자</title>
<style>
        #outer{
          width:1000px;
          height:100%;
          margin:auto;
          font-family:'Noto Sans KR', sans-serif !important;
          border:1px solid lightgray;
          padding: 15px;
        }
        table{text-align: center; }
        td:nth-of-type(1) { display: none; } 
         tr:hover{cursor:pointer; background-color: lightgrey;}

</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
<br><br>
 <div id="outer">
     <br><br>
<div class="container">
    <h2>고객센터 - 1:1문의내역</h2><br>
      <div align="right">
      <button class="btn btn-primary" onclick="location.href='<%=contextPath%>/askToAdminPath.mem'">글쓰기</button>
      </div>
<br>
    <table class="table table-bordered">
      <thead class="thead-light">
        <tr>
     	   <th>글번호</th>
          <th width="600">제목</th>
          <th>작성자</th>
          <th width="150">작성일시</th>
        </tr>
      </thead>
      <tbody>
        <% if(list.isEmpty()){ %>
      	 <!-- 리스트가 비어있을 경우 -->
      	 <tr>
      	 	<td colspan="4">존재하는 공지사항이 없습니다.</td>
      	 <tr>
      	 </tbody>
      	     </table>
      	 </div>
      <% }else { %>	
      	 <!-- 리스트가 비어있지 않을 경우 --> 
      	 <% for(Qna q : list) { %>
        <tr>
       	    <td><%= q.getQnaNo() %></td>
       		<td><%= q.getRowNum() %></td>
            <td><%= q.getqTitle() %></td>
            <td><%= q.getMemName() %></td>
            <td><%= q.getqCreateDate() %></td>
        </tr>
      <% } %> 

      </tbody>
    </table>
  </div>
     
  
<br><br>
      <!-- 페이지 목록 시작 -->
	             <ul class="pagination justify-content-center">
	             <% if(pi.getCurrentPage() != 1){ %>
	                <li class="page-item"><a class="page-link" href="<%=contextPath%>/askToAdminList.mem?currentPage=<%=pi.getCurrentPage()-1%>">&lt;</a></li>
	           	 <% } %>
	           	 <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
	           	 
	           		 <% if(p != pi.getCurrentPage()){ %>
	               		 <li class="page-item"><a class="page-link" href="<%=contextPath%>/askToAdminList.mem?currentPage=<%= p %>"><%= p %></a></li>
		             <% }else { %>
		            	 <li class="page-item" ><a class="page-link" style="background:rgb(194, 227, 238)" href="<%=contextPath%>/askToAdminList.mem?currentPage=<%= p %>"><%= p %></a></li>
	            	 <% } %>
	             <% } %>
	     
	
				<% if(pi.getCurrentPage() != pi.getMaxPage()){ %>
	            	<li class="page-item"><a class="page-link" href="<%=contextPath%>/askToAdminList.mem?currentPage=<%=pi.getCurrentPage()+1%>"> &gt;</a></li>
				<% } %>
	              </ul>
      <!-- 페이지 목록 끝 -->
      
    <% } %> 
 </div><br>
 
   <script>
  	$(function(){
  		$(".table>tbody>tr").click(function(){
  			var qno = $(this).children().eq(0).text();
  			
  			location.href = '<%=contextPath%>/askToAdminDetail.mem?qno=' + qno;
  		})
  	})
  </script>   



 </div><br>
 
 <%@ include file = "../common/footer.jsp"%>
</body>
</html>