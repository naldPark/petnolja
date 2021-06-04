<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫놀자</title>
<style>
       
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
<br><br>
<div class="container bd-content ps-lg-4">
	<ul class="nav nav-tabs" id="myTab" role="tablist">
	  <li class="nav-item" role="presentation">
	    <a class="nav-link" id="reserve_list-tab" data-toggle="tab" href="<%=contextPath%>/petsitterRequested.ad" role="tab" aria-controls="reserve_list" aria-selected="false">예약내역조회</a>
	  </li>
	  <li class="nav-item" role="presentation">
	    <a class="nav-link" id="reserve_done_list-tab" data-toggle="tab" href="<%=contextPath%>/petsitterRequested.ad" role="tab" aria-controls="reserve_done_list" aria-selected="false">이전내역조회</a>
	  </li>
	  <li class="nav-item" role="presentation">
	    <a class="nav-link active" id="manage_of_settle-tab" data-toggle="tab" href="#manage_of_settle" role="tab" aria-controls="manage_of_settle" aria-selected="true">정산관리</a>
	  </li>
	</ul>
	<div class="tab-content py-3" id="myTabContent">
	  <div class="tab-pane fade show active" id="manage_of_settle" role="tabpanel" aria-labelledby="home-tab">
	  	<h3>예약 취소 안내</h3>
	  	<p>예약취소를 신청하기 전에 안내 사항을 꼭 확인해주세요.</p>
	  	<p class="font-weight-bold">예약 거절 시 동일 예약에 대하여 재예약은 불가합니다.</p>
	  	<p><span class="text-danger d-inline">예약거절에 대한 책임은 모두 펫시터(판매자)</span>에게 있음을 알려드립니다.</p>
	  	<p><span class="text-danger">귀책 사유로 취소 시 패널티가 부과되며, 패널티가 3회 누적될 경우 펫시터 자격을 상실합니다.</span></p>
	  	<table class="table">
		  <thead>
		    <tr>
		      <th scope="col">내용</th>
		      <th scope="col">비고</th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		      <td scope="row">패널티 1회 누적시</td>
		      <td scope="row">패널티 누적일로부터 1달간 신규 예약 불가</td>
		    </tr>
		    <tr>
		      <td scope="row">패널티 2회 누적시</td>
		      <td scope="row">패널티 누적일로부터 2달간 신규 예약 불가</td>
		    </tr>
		    <tr>
		      <td scope="row">패널티 3회 누적시</td>
		      <td scope="row">펫시터 자격 영구박탈</td>
		    </tr>
		  </tbody>
		</table>
		<div class="row">
	  		<div class="col">
	  			<a type="button" class="btn btn-danger float-left" href="<%=contextPath%>/petsitterCancelRequested.ad?rno=&input=Y">다음</a>
	  			<a type="button" class="btn btn-light float-right" href="javascript:history.back()">취소</a>
	  		</div>
	  	</div>
	  </div>
	</div>
</div>
 <br><br>
 </body>
 </html>