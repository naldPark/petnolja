<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
				<tr>
				  <td>1</td>
				  <td>펫시터님 문의드립니다</td>
				  <td>강개순</td>
				  <td>2020-01-01</td>
				</tr>
				<tr>
				  <td>2</td>
				  <td>나의 살던 고향은</td>
				  <td>넌누구냐</td>
				  <td>2020-05-04</td>
				</tr>
				<tr>
				  <td>3</td>
				  <td>사장님</td>
				  <td>고길동</td>
				  <td>2020-06-17</td>
				</tr>	
			  </tbody>
			</table>
		  </div>

		  <button class="btn btn-secondary" style="position:absolute; top:110px; left:840px;" onclick="location.href='<%=contextPath%>/views/memboard/askToPetsitter.jsp'">글작성</button>

		  <br><br>

		  <ul class="pagination justify-content-center">
			<li class="page-item"><a class="page-link" href="#">&lt;</a></li>
			<li class="page-item"><a class="page-link" href="#">1</a></li>
			<li class="page-item"><a class="page-link" href="#">2</a></li>
			<li class="page-item"><a class="page-link" href="#">3</a></li>
			<li class="page-item"><a class="page-link" href="#">&gt;</a></li>
		  </ul>

	</div>
	
	
	
	<%@ include file = "../common/footer.jsp"%>
</body>
</html>