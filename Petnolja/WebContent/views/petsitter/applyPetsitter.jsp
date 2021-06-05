<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫놀자</title>
<style>
	 .largerCheckbox{
          width:20px;
          height:20px;
        }
</style>
</head>
<body>
<%@ include file="../common/menubar.jsp" %>

<div class="container bd-content ps-lg-4">
	<br><br>
	<h2>펫시터 지원</h2>
	<p>회원정보는 개인정보처리방침에 따라 안전하게 보호되며, 회원님의 명백한 동의 없이 공개 또는 제 3자에게 제공되지 않습니다.</p>
	<div class="formbox">
		<form action="<%=contextPath%>/applySitterInsert.mem" method="post" method="POST" >
			<div class="form-group">
				<span>1. 반려견을 반려한 총 기간 *</span>
			  <select class="form-control" name="raisePet"  required>
				  <option value="">선택</option>
				  <option value="1년미만">1년 미만</option>
				  <option value="3년미만">3년 미만</option>
				  <option value="3년이상">3년 이상 ~ 5년 미만</option>
				  <option value="5년이상">5년 이상</option>
				</select>
			</div>
			<div class="form-group">
				<span>2. 현재 함께하고 있는 반려견 수 *</span>
			  	<select class="form-control" name="currentPet" required>
				  <option value="">선택</option>
				  <option value="1">1마리</option>
				  <option value="2">2마리</option>
				  <option value="3">3마리</option>
				  <option value="4">4마리 이상</option>
				</select>
			</div>
			<div class="form-group">
				<span>3. 반려동물 관련 자격증 보유 여부 및 내역 *</span>
			  	<select class="form-control" name="petCertificate"  required>
				  <option value="">선택</option>
				  <option value="없음">없음</option>
				  <option value="반려동물관리사">반려동물관리사</option>
				  <option value="반려동물행동교정사">반려동물행동교정사</option>
				</select>
			</div>
			<div class="form-group">
				<span>4. 펫시팅 또는 봉사활동 경험 유무 *</span>
			  	<select class="form-control" name="caringPet" required>
				  <option value="">선택</option>
				  <option value="1년 미만">1년 미만</option>
				  <option value="3년 미만">3년 미만</option>
				  <option value="3년~5년미만">3년 이상 ~ 5년 미만</option>
				  <option value="5년 이상">5년 이상</option>
				</select>
			</div>
			<div class="form-group">
			    <label for="exampleFormControlTextarea1">5. 지원동기 *</label>
			    <textarea class="form-control" name="motive" rows="3" placeholder="300자 이상 500자 이내로 자유롭게 작성해주세요."  required></textarea>
			</div>
			<div class="form-group">
			    <label for="exampleFormControlTextarea2">6. 하고 싶은 말 *</label>
			    <textarea class="form-control" name="addContent" rows="3" placeholder="이 외에 본인이 펫시터로서 가지고 있는 강점이나 시팅 경험에 대해 500자 이내로 자유롭게 서술해주세요."  required></textarea>
			</div>
			
			<div class="form-group form-check required">
			    <input type="checkbox" class="form-check-input largerCheckbox" id="check1">
			    <label class="form-check-label" for="check1"> &nbsp;&nbsp;(필수) 서비스 이용약관</label>
			</div>
			<div class="form-group form-check  required">
			    <input type="checkbox" class="form-check-input largerCheckbox" id="check2">
			    <label class="form-check-label" for="check2">&nbsp;&nbsp;(필수) 개인정보처리방침</label>
			</div>
			<div class="form-group form-check  required">
			    <input type="checkbox" class="form-check-input largerCheckbox" id="check3">
			    <label class="form-check-label" for="check3"> &nbsp;&nbsp;(필수) 본인은 만 26세 이상입니다.</label>
			</div>
			<div class="form-group form-check">
			    <input type="checkbox" class="form-check-input largerCheckbox" id="allAgree">
			    <label class="form-check-label" for="allAgree">&nbsp;&nbsp; 약관에 모두 동의합니다.</label>
			</div>
			<div align="center">
				<button type="submit" id="submit" class="btn btn-primary" style="margin-right: 20px; width:200px"  onclick="return validate();">가입하기</button>
				<button type="reset" class="btn btn-outline-secondary" style="margin-right: 20px; width:200px">초기화</button>
			</div>
		</form>
	</div>
</div>
<script>
	
	
  // 필수사항 체크 검증

  function validate(){

  $(".required").children(":checkbox").each(function(){
                            if($(this).prop("checked")){
                            }else{ 
                                window.alert("필수사항은 반드시 동의하셔야합니다");
                                return false;
                            }
                        })

                    }
//체크박스 모두동의
	$(function(){
		$("#allAgree").change(function(){
			if($(this).prop("checked")==true){
				$(".largerCheckbox").prop("checked",true); 
			}else{
				$(".largerCheckbox").prop("checked",false); 
			}
		})                    
	})    

</script>




</body>
</html>