<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList, com.petnolja.petsitter.model.vo.PetsitterReview"%>
<%   
	ArrayList<PetsitterReview> list = (ArrayList<PetsitterReview>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        width:1000px;
        /* height:1100px; */
        font-family:'Noto Sans KR', sans-serif !important;
        position:relative;
        margin:auto;
        margin-top:50px;
        border:1px solid lightgray;
        padding:15px;
    }
    table{text-align: center;}
        	 tr:hover{cursor:pointer; background:lightgrey}
</style>
</head>
<body>
   <%@ include file="../common/menubar.jsp" %>

    <div class="outer">
            <br>
            <h3>리뷰 조회</h3>
        <hr>
        <br>
   
        <!--예약된 리스트 글-->
        <form action="<%=contextPath %>/PetSitterLog.me" method="post"> 
	        <div class="container">
	            <table class="table">
	              <thead class="thead-light">
	                <tr>
	                  <th width="200">보호자</th>
	                  <th width="200">예약번호</th>
	                  <th width="170">예약일</th>
	                  <th width="100">평점</th>
	                  <th>리뷰보기</th>
	                </tr>
	              </thead>
	              <tbody>
	              <% if(list.isEmpty()){ %>
			      	<br>조회된 리스트가 없습니다.<br><br><br>
			            		
			       <% }else { %>
				      	 <% for(PetsitterReview s : list){ %>
	                <tr>
	                    <td><%=s.getMemName() %></td>
	                    <td><%=s.getResNo() %></td>
	                    <td><%=s.getCheckIn()%>~<%=s.getCheckOut()%></td>
	                    <td><%=s.getRevRating() %></td>
	                    <td><button type="submit" id="searchSubmitBtn" class="btn btn-primary btn-sm">&nbsp;상세보기&nbsp;</button></td>
	                </tr>
	                <% } %>
				<% } %>
	              </tbody>
	            </table>
	          </div>
          </form>
         </div> 
            <hr><br><br><br><br><br><br><br>
	
    <%@ include file="../common/footer.jsp" %>
</body>
</html>