<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList"%>
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
	  	<h3>예약번호</h3>
	  	<div class="row">
	  		<div class="col">
	  			<div class="row">
			  		<div class="col">
			  			<h4>예약 정보</h4>
			  		</div>
			  	</div>
			  	<div class="row">
			  		<div class="col">
			  			<h4>함께 할 반력</h4>
			  		</div>
			  	</div>
			  	<div class="row">
			  		<div class="col">
			  			<h4>별도 요청 사항</h4>
			  		</div>
			  	</div>
	  		</div>
	  		<div class="col">
	  			<div class="row">
			  		<div class="col">
			  			<h4>정산 예정 금액</h4>
			  		</div>
			  	</div>
			  	<div class="row">
			  		<div class="col">
			  			<p class="text-danger">반려견 별 주의사항을 꼭 확인해주세요.</p>
						<p class="text-danger">펫시터 계약에 따라 원칙적으로 펫시터는 확정된 예약을 취소할 수 없습니다. 만약 펫시터 귀책사유로 취소를 할 경우에는 패널티가 부과됩니다.</p>
						<p class="text-danger">예약요청 48시간 이내 응답하지 않을 시 예약은 자동거절되며 펫시터에게 패널티가 부과됩니다.</p>
			  		</div>
			  	</div>
			  	<div class="row">
			  		<div class="col">
			  			<a type="button" class="btn btn-light" href="<%=contextPath%>/petsitterRequested.ad">뒤로가기</a>
			  			<button type="button" class="btn btn-primary">예약확정</button>
			  			<a type="button" class="btn btn-danger" href="<%=contextPath%>/petsitterCancelRequested.ad?rno=<%=rno%>">예약거절</a>
			  		</div>
			  	</div>
	  		</div>
	  	</div>       
	  </div>
	</div>
</div>
 <br><br></body></html>