<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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

<div class="container bd-content ps-lg-4">
	<h2>펫시터 지원</h2>
	<p>회원정보는 개인정보처리방침에 따라 안전하게 보호되며, 회원님의 명백한 동의 없이 공개 또는 제 3자에게 제공되지 않습니다.</p>
	<div class="formbox">
		<form action="/petsitterEnroll.ad" method="POST" >
			<div class="form-group">
			  <select class="form-control">
				  <option selected>1. 반려견을 반려한 총 기간 *</option>
				  <option value="~1">1년 미만</option>
				  <option value="~3">3년 미만</option>
				  <option value="3~5">3년 이상 ~ 5년 미만</option>
				  <option value="5~">5년 이상</option>
				</select>
			</div>
			<div class="form-group">
			  	<select class="form-control">
				  <option selected>2. 현재 함께하고 있는 반려견 수 *</option>
				  <option value="1">1마리</option>
				  <option value="2">2마리</option>
				  <option value="3">3마리</option>
				  <option value="4~">4마리 이상</option>
				</select>
			</div>
			<div class="form-group">
			  	<select class="form-control">
				  <option selected>3. 반려동물 관련 자격증 보유 여부 및 내역 *</option>
				  <option value="N">없음</option>
				  <option value="M">반려동물관리사</option>
				  <option value="B">반려동물행동교정사</option>
				</select>
			</div>
			<div class="form-group">
			  	<select class="form-control">
				  <option selected>4. 펫시팅 또는 봉사활동 경험 유무 *</option>
				  <option value="~1">1년 미만</option>
				  <option value="~3">3년 미만</option>
				  <option value="3~5">3년 이상 ~ 5년 미만</option>
				  <option value="5~">5년 이상</option>
				</select>
			</div>
			<div class="form-group">
			    <label for="exampleFormControlTextarea1">5. 지원동기 *</label>
			    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="300자 이상 500자 이내로 자유롭게 작성해주세요."></textarea>
			</div>
			<div class="form-group">
			    <label for="exampleFormControlTextarea2">6. 하고 싶은 말 *</label>
			    <textarea class="form-control" id="exampleFormControlTextarea2" rows="3" placeholder="이 외에 본인이 펫시터로서 가지고 있는 강점이나 시팅 경험에 대해 500자 이내로 자유롭게 서술해주세요."></textarea>
			</div>
			
			<div class="form-group form-check">
			    <input type="checkbox" class="form-check-input" id="exampleCheck1">
			    <label class="form-check-label" for="exampleCheck1">(필수) 서비스 이용약관</label>
			</div>
			<div class="form-group form-check">
			    <input type="checkbox" class="form-check-input" id="exampleCheck2">
			    <label class="form-check-label" for="exampleCheck2">(필수) 개인정보처리방침</label>
			</div>
			<div class="form-group form-check">
			    <input type="checkbox" class="form-check-input" id="exampleCheck3">
			    <label class="form-check-label" for="exampleCheck3">(필수) 본인은 만 26세 이상입니다.</label>
			</div>
			<div class="form-group form-check">
			    <input type="checkbox" class="form-check-input" id="exampleCheck4">
			    <label class="form-check-label" for="exampleCheck3">약관에 모두 동의합니다.</label>
			</div>
			<button type="submit" class="btn btn-primary w-100">지원하기</button>
		</form>
	</div>
</div>
</body></html>