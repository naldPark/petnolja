<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫놀자 예약정보</title>
<style>
	.outer{
		width:1000px;
		height:1200px;
		position:relative;
		margin:auto;
		margin-top:20px;
		padding:60px;
		border:1px solid black;
	}
	#wrap1{
		border:1px solid black;
		height:300px;
		width:370px;
		padding:20px;
	}
	.updown{
		border:1px solid black;
		width:0.1px; 
		height:50px;
		position: absolute; 
		top:180px;
		left:240px;
		}
	#wrap2{
		width:500px;
		height:270px;
		padding:15px;
		position:absolute;
		top:50px;
		left:480px;
	}	
	#wrap3{
		border:1px solid black;
		height:250px;
		width:370px;
		padding:25px;
	}
	#wrap4{
		border:1px solid black;
		height:280px;
		width:450px;
		padding:30px;
		position:absolute;
		top:400px;
		left:500px;
	}
	#wrap5{
		border:1px solid black;
		height:230px;
		width:350px;
		padding:30px;
	}
	#wrap6{
		border:1px solid black;
		background:#b5cfe4;
		height:150px;
		width:900px;
		padding:25px;
	}
	
</style>
</head>
<body>
	
	<%@ include file="../common/menubar.jsp" %>

	<br>

	<div class="outer">
		<!--내 예약 정보-->
		<div id="wrap1">
			<div>
				<span><b>내 예약 정보</b></span> 
				<br><br>
				<span><b>펫시터</b>&nbsp;김개순</span>
				<br><br>
			</div>	
			<div>
				<b>체크인</b> <br>
				<span><b>2021년 5월 13일(목)</b></span> <br>
				<span>16:00</span>
			</div>

			<div class="updown" style="box-shadow:5px 10px 20px r;"></div>

			<div style="position:absolute; top:175px; left:270px">
				<b>체크아웃</b> <br>
				<span><b>2021년 5월 14일(금)</b></span> <br>
				<span>10:00</span>
			</div>

			<br><br>

			<div>
				<span>총 숙박 기간 : <b>1박</b></span>
			</div>
		</div>	
		<br>

		<!--별도 요청 사항-->
		<div id="wrap2">
			<div>
				<span><b>별도 요청 사항</b></span> <br><br>
				<textarea name="text" cols="55" rows="10" placeholder="예)산책 중에 아무거나 잘 삼켜서 주의주셔야 해요."></textarea>
			</div>
		</div>

		<br>

		<!--맡기실 반려동물-->
		<div id="wrap3">
			<div>
				<span><b>맡기실 반려동물</b></span> <br><br>
				<img src="../../resources/images/temp/dog5.jpg" style="height:50px;">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<span style="position: absolute;">쪼꼬</span> <br>
				<span style="position: absolute; top:510px; left:180px;">소형 / 여 / 3살</span>
			</div>

			<br><br>

			<div>
				<img src="../../resources/images/temp/dog5.jpg" style="height:50px;">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<span style="position: absolute;">뿌꾸</span> <br>
				<span style="position: absolute; top:610px; left:180px;">중형 / 남 / 4살</span>
			</div>

		</div>

		<br>

		<!--결제 예정 금액-->
		<div id="wrap5">
			<div>
				<span><b>결제 예정 금액</b></span>
				<span style="position: absolute; left:300px;"><b>90000원</b></span>
				<br><br>
				<span><b>1박 / 소형1마리</b></span>
				<span style="position: absolute; left:300px;"><b>40000원</b></span>
				<br><br>
				<span><b>1박 / 중형1마리</b></span>
				<span style="position: absolute; left:300px;"><b>50000원</b></span>
				<br><br>
				<span><b>부가세(10%)</b></span>
				<span style="position: absolute; left:300px;"><b>9000원</b></span>
			</div>
		</div>

		<br>

		<!--결제 수단-->
		<div id="wrap4">
			<span><h5>결제 수단을 선택해주세요</h5></span> <br>
			<span><h6>예약 수락전에는 결제되지 않습니다.</h6></span> <br>
			<hr>
			<input type="radio" id="buyCard"> <label for="buyCard">신용카드</label> &nbsp;&nbsp;
			<input type="radio" id="buyPhone"> <label for="buyPhone">휴대폰</label>
		</div>
			
		<input type="checkbox" id="check">&nbsp;<label for="check">아래 내용에 확인 및 동의합니다.</label>

		<div id="wrap6">
			<span><b>- 펫시터님을 무는 등의 심한 공격성을 보이거나 파보/피부염/기관지염 등 전염성 질병의 경우, <br>
					   등록하신 반려동물 프로필이 실제와 다른경우 돌봄이 불가할 수 있습니다.</b></span> <br><br>
			<span><b>- 사실과 다른 반려동물 프로필 기재로 문제가 발생한 경우, 책임은 보호자에게 있음에 동의합니다. </b></span>		   
		</div>
		<br>
		<div align="center" >
		<button class="btn-primary btm-sm">결제하기</button>
		</div>


	</div>

	
	
	<%@ include file = "../common/footer.jsp"%>
</body>
</html>