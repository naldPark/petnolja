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
	<h2>펫시터 프로필</h2>
	<p>프로필은 자유롭게 수정할 수 있으며, 상세페이지 반영까지 약 5분정도 소요될 수 있습니다.</p>
	<div class="formbox">
		<form action="/petsitterProfile.ad" method="POST" >
			<div class="form-row">
			    <div class="col col-3">
			      <img src="../../resources/images/logo.png" style="width:100%">
			    </div>
			    <div class="col col-9">
			      <h3>■ 강계순 시터님의 프로필 ■</h3>
			      <input type="text" class="form-control" placeholder="프로필 제목">
			    </div>
		  	</div>
		  	<div class="form-row mt-2">
		  		<div class="col form-group">
		  			<label for="exampleFormControlFile1" class="h2">사진 첨부하기 *</label>
   					<input type="file" class="form-control-file" id="exampleFormControlFile1">
   					<label>시터님을 나타낼 수 있는 사진 또는 시팅 환경을 소개하는 사진을 올려주세요.<br>프로필 사진 1장 외 본문에 첨부될 사진은 최대 3장까지 업로드 가능합니다. </label>
		  		</div>
		  	</div>
		  	<div class="form-row">
			    <div class="col col-3">
			      <img src="../../resources/images/logo.png" style="width:100%">
			    </div>
			    <div class="col col-3">
			      <img src="../../resources/images/logo.png" style="width:100%">
			    </div>
			    <div class="col col-3">
			      <img src="../../resources/images/logo.png	" style="width:100%">
			    </div>
			    <div class="col col-3">
			      <img src="../../resources/images/logo.png" style="width:100%">
			    </div>
			</div>
			<div class="form-group">
			    <label for="exampleFormControlTextarea1" class="h2">시터님 소개</label>
			    <textarea class="form-control" id="exampleFormControlTextarea1" rows="10" placeholder="시터님과 시터님의 시팅 환경에 대한 소개를 1000자 이내로 자유롭게 적어주세요."></textarea>
			</div>
			<div class="form-group form-check">
			    <input type="checkbox" class="form-check-input" id="exampleCheck4">
			    <label class="form-check-label" for="exampleCheck3">위의 입력사항이 모두 사실이며, 허위로 기재한 사항에 대한 모든 책임은 작성자에게 있음을 확인합니다.</label>
			</div>
			<button type="submit" class="btn btn-primary w-100">저장하기</button>
		</form>
	</div>
</div>
</body>
</html>