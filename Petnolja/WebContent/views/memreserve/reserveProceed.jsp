<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

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
				<img src="../../resources/images/dog5.jpg" style="height:50px;">
				&nbsp;&nbsp;&nbsp;&nbsp;
				<span style="position: absolute;">쪼꼬</span> <br>
				<span style="position: absolute; top:510px; left:180px;">소형 / 여 / 3살</span>
			</div>

			<br><br>

			<div>
				<img src="../../resources/images/dog5.jpg" style="height:50px;">
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
		<button id="check_module" class="btn-primary btm-sm">결제하기</button>
		</div>


	</div>

	<script>
		$("#check_module").click(function () {
			var IMP = window.IMP; // 생략가능
			IMP.init('imp68132881'); 
			// 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
			// i'mport 관리자 페이지 -> 내정보 -> 가맹점식별코드
			IMP.request_pay({
				pg: 'inicis', // version 1.1.0부터 지원.
				/* 
					'kakao':카카오페이, 
					html5_inicis':이니시스(웹표준결제)
						'nice':나이스페이
						'jtnet':제이티넷
						'uplus':LG유플러스
						'danal':다날
						'payco':페이코
						'syrup':시럽페이
						'paypal':페이팔
					*/
				pay_method: 'card',
				/* 
					'samsung':삼성페이, 
					'card':신용카드, 
					'trans':실시간계좌이체,
					'vbank':가상계좌,
					'phone':휴대폰소액결제 
				*/
				merchant_uid: 'merchant_' + new Date().getTime(),
				/* 
					merchant_uid에 경우 
					https://docs.iamport.kr/implementation/payment
					위에 url에 따라가시면 넣을 수 있는 방법이 있습니다.
					참고하세요. 
					나중에 포스팅 해볼게요.
				 */
				name: '주문명:결제테스트',
				//결제창에서 보여질 이름
				amount: 500, 
				//가격 
				buyer_email: 'iamport@siot.do',
				buyer_name: '구매자이름',
				buyer_tel: '010-9154-3073',
				buyer_addr: '서울특별시 강남구 삼성동',
				buyer_postcode: '123-456',
				m_redirect_url: 'https://www.yourdomain.com/payments/complete'
				/*  
					모바일 결제시,
					결제가 끝나고 랜딩되는 URL을 지정 
					(카카오페이, 페이코, 다날의 경우는 필요없음. PC와 마찬가지로 callback함수로 결과가 떨어짐) 
					*/
			}, function (rsp) {
				console.log(rsp);
				if (rsp.success) {
					var msg = '결제가 완료되었습니다.';
					msg += '고유ID : ' + rsp.imp_uid;
					msg += '상점 거래ID : ' + rsp.merchant_uid;
					msg += '결제 금액 : ' + rsp.paid_amount;
					msg += '카드 승인번호 : ' + rsp.apply_num;
				} else {
					var msg = '결제에 실패하였습니다.';
					msg += '에러내용 : ' + rsp.error_msg;
				}
				alert(msg);
			});
		});
	</script>
	
	
	<%@ include file = "../common/footer.jsp"%>
</body>
</html>