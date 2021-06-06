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
	  	
	  	<form action="/petsitterCancelRequested.ad" method="POST" >
	  		<input type="hidden" name="rno" value="<%=rno%>"/>
	  		<div class="form-group">
			  	<select class="form-control">
				  <option selected>취소 사유 선택 *</option>
				  <option value="FROMMEM">예약자 요청 또는 예약자 귀책 사유</option>
				  <option value="FROMSIT">펫시터 귀책 사유 (상세히 적어주세요)</option>
				</select>
			</div>
			<div class="form-group">
			    <label for="exampleFormControlTextarea1">상세이유 *</label>
			    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="15자 이상 적어주세요."></textarea>
			</div>
			<div class="form-group form-check">
			    <input type="checkbox" class="form-check-input" id="exampleCheck2">
			    <label class="form-check-label" for="exampleCheck2">예약 취소를 위한 개인정보 수집 및 제 3자 제공, 취소/패널티 규정을 확인하였으며 이에 동의합니다.</label>
			</div>
		<div class="row">
	  		<div class="col">
	  			<button type="submit" class="btn btn-danger float-left" href="<%=contextPath%>/petsitterCancelRequested.ad">예약 취소</button>
	  			<a type="button" class="btn btn-light float-right" href="javascript:history.back()">이전 단계</a>
	  		</div>
	  	</div>
	  	</form>
	  </div>
	</div>
</div>
 <br><br>
 <%@ include file = "../common/footer.jsp"%>
 </body></html>