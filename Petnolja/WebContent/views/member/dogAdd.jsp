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
		height:1300px;
		position:relative;
		margin:auto;
		margin-top:20px;
		padding:70px;
		border:1px solid black;
	}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer">	
		<div id="dog">
			<span>	
				<img src="../../resources/images/temp/dog5.jpg" style="height:150px;">
			</span>
			<br><br>

			<!--이름-->
			<tr>
				<td><b>이름</b></td> &nbsp;&nbsp;
				<td><input type="text" name="userId" placeholder="예)댕댕이"></td>
			</tr>
			<br><br>

			<!--성별-->
			<tr>
				<td><b>성별</b></td> &nbsp;&nbsp;
				<td><input type="radio" id="male"> <label for="male"><b>남자아이</b></label></td> &nbsp;
				<td><input type="radio" id="female"> <label for="female"><b>여자아이</b></label></td>
			</tr>
			<br><br>

			<!--견종-->
			<tr>
				<td><b>견종</b></td> &nbsp;&nbsp;
				<td><input type="text" name="dogBreed" placeholder="예)시베리안허스키"></td>
			</tr>
			<br><br>

			<!--생일-->
			<tr>
				<td><b>생일</b></td> &nbsp;&nbsp;
				<td><input type="date"></td>
			</tr>
			<br><br>

			<!--몸무게-->
			<tr>
				<td><b>몸무게</b></td> &nbsp;&nbsp;
				<td><input type="text" name="weight" size="3">&nbsp;<b>kg</b></td>
			</tr>
			<br><br>

			<!--중성화-->
			<tr>
				<td><b>중성화</b></td> &nbsp;&nbsp;
				<td><input type="radio" id="neuDo"> <label for="neuDo"><b>했어요</b></label></td> &nbsp;
				<td><input type="radio" id="neuNot"> <label for="neuNot"><b>안했어요</b></label></td> &nbsp;
			</tr>
			<br><br>

			<!--반려견등록-->
			<tr>
				<td><b>반려견등록</b></td> &nbsp;&nbsp;
				<td><input type="radio" id="builtIn"> <label for="builtIn"><b>내장형</b></label></td> &nbsp;
				<td><input type="radio" id="external"> <label for="external"><b>외장형</b></label></td> &nbsp;
				<td><input type="radio" id="registration"> <label for="registration"><b>등록인식표</b></label></td> &nbsp;
				<td><input type="radio" id="Never"> <label for="Never"><b>하지않음</b></label></td> &nbsp;
			</tr>
			<br><br>

			<!--예방접종-->
			<tr>
				<td><b>예방접종</b></td> &nbsp;
					<input type="checkbox" name="" id="dhppl" value="종합백신">
					<label for="dhppl"><b>종합백신(DHPPL)</b></label>

					<input type="checkbox" name="" id="colona" value="코로나장염">
					<label for="colona"><b>코로나장염(연1회)</b></label>

					<input type="checkbox" name="" id="dogFire" value="광견병">
					<label for="dogFire"><b>광견병</b></label>

					<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

					<input type="checkbox" name="" id="kennel" value="켄넬코프">
					<label for="kennel"><b>켄넬코프(연1회)</b></label> &nbsp;&nbsp;

					<input type="checkbox" name="" id="heart" value="심장사상충">
					<label for="heart"><b>심장사상충(월1회)</b></label>				
			</tr>

			<hr>

			<!--주의사항-->
			<tr>
				<td><b>주의사항</b></td> &nbsp;
					<input type="checkbox" name="" id="allergy" value="음식알러지">
					<label for="allergy"><b>음식알러지</b></label>

					<input type="checkbox" name="" id="colona" value="약물복용">
					<label for="colona"><b>약물복용</b></label>

					<input type="checkbox" name="" id="dogFire" value="분리불안">
					<label for="dogFire"><b>분리불안</b></label>

					<br> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

					<input type="checkbox" name="" id="kennel" value="지병">
					<label for="kennel"><b>지병</b></label> 
					
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

					<input type="checkbox" name="" id="heart" value="기타">
					<label for="heart"><b>기타</b></label>				
			</tr>

			<br><br>

			<!--돌봄시 참고사항-->
			<span>
				<b>돌봄시 참고사항(주의사항에 체크하신 경우 해당 란에 상세하게 적어주세요)</b> <br>
				<textarea name="textarea" cols="100" rows="7" placeholder="예)우리집강아지는 실외배변만 해요."></textarea>
			</span>

			<br>
			<!--병원명,전화번호,사실기재-->
			<span>
				<b>우리아이가 자주 다니는 동물병원을 입력 해 주세요. 위급시에 사용 됩니다.</b> <br><br>
				<b>병원명</b> &nbsp;&nbsp;&nbsp;&nbsp; 
				<input type="text" placeholder="예)kh동물병원(논현동)"> <br><br>
				<b>전화번호</b> &nbsp; 
				<input type="text"> <br><br>
				<input type="checkbox" id="checks"> <label for="checks"><b>사실과 다른 기재로 문제가 발생한 경우 책임은 의뢰인에게 있습니다.</b></label>				
			</span>

			<br><br>

			<div align="center">
			<button class="btn btn-primary">등록하기</button>
			</div>

		</div>

	</div>
	
	
	
	
	<%@ include file = "../common/footer.jsp"%>
</body>
</html>