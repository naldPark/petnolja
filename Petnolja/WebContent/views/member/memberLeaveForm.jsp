<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.largerCheckbox{
		width:20px;
		height:20px;
	}
	.outer{
		width:1000px;
		height:1100px;
		margin:auto;
		margin-top:50px;
		border:1px solid lightgray;
		padding:80px;
	}
</style>
</head>
<body>
	
	<%@ include file="../common/menubar.jsp" %>
	
	<div class="outer">
	
	<form action="<%=contextPath%>/leave2.me" method="post">
		<br>
		<h2>탈퇴 안내</h2>
		<br>
		<span style="color:gray;" align="center">
			회원탈퇴를 신청하기 전에 안내사항을 꼭 확인해주세요.
		</span>
		<br><br>
		<span><b><h5>사용하고 계신 아이디는 탈퇴한 아이디와 관련된 정보는 복구와 재사용이 불가능합니다.</h5></b></span>
		<br>
		<span style="color:orange"><b>탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가</b></span><span><b>하오니 신중하게 선택하시기 바랍니다.</b></span>
		<br><br>
		<span><b><h5>탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</h5></b></span>
		<span><b>
			회원정보 및 개인형 서비스 이용기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다. <br>
			삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.
		</b></span>
		<br><br>
		<hr>
		<br>
		<div id="necessary">
		&nbsp;&nbsp;<input class="largerCheckbox" type="checkbox" name="check" value="사용x" id="notUse"> <label for="notUse"><b>사용을 잘 안하게 되요.</b></label> <br><br>
		&nbsp;&nbsp;<input class="largerCheckbox" type="checkbox" name="check" value="유저수" id="noUser"> <label for="noUser"><b>유저수가 너무 적습니다.</b></label> <br><br>
		&nbsp;&nbsp;<input class="largerCheckbox" type="checkbox" name="check" value="새계정" id="newId"> <label for="newId"><b>계정을 새로 만들고 싶습니다.</b></label> <br><br>
		&nbsp;&nbsp;<input class="largerCheckbox" type="checkbox" name="check" value="ui" id="notUi"> <label for="notUi"><b>UI가 너무 후집니다.</b></label> <br><br>
		&nbsp;&nbsp;<input class="largerCheckbox" type="checkbox" name="check" value="사이트" id="otherSite"> <label for="otherSite"><b>다른 사이트를 이용하고 싶어요.</b></label> <br><br> 
		&nbsp;&nbsp;<input class="largerCheckbox" type="checkbox" name="check" value="etc" id="etc"> <label for="etc"><b>기타</b></label>
		<br><br>
		<hr>
		<br>
		
		&nbsp;&nbsp;<input class="largerCheckbox" type="checkbox" id="agree"> <label for="agree"><b>안내 사항을 모두 확인하였으며, 이에 동의합니다.</b></label>
		</div>	
		<br><br><br>
		<div align="center">
			<button type="submit" id="submit" class="btn btn-primary" style="width:150px;" onclick="return validate();">확인</button>
		</div>
		</form>
	</div>
	
	<script>
    	function validate(){
        	if($("#agree").prop("checked")){ // 일치하면
        	
        	}else{ 
           		window.alert("안내사항 확인 동의부터해라");
           		return false;
        	}
        }
	</script>
	
	
	<%@ include file = "../common/footer.jsp"%>
</body>
</html>