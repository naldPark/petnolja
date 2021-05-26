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
        height:1150px;
        margin:auto;
        margin-top:50px;
        border:1px solid lightgray;
        padding:15px;
    }
    #enroll-form input{margin-bottom: 10px;}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
	
    <br><br>
    <div class="outer">
        <br>
        <h2 align="center">회원 정보 수정</h2>
        <br><br>
        <div style="width:60%;margin:auto">
            <span style="color:gray" align="center">
                ***님의 정보입니다. <br>
                회원정보는 개인정보처리방침에 따라 안전하게 보호되며,<br> 
                회원님의 명백한 동의 없이 공개 또는 제 3자에게 제공되지 않습니다.
            </span> <br><br>
            <span><b>* 표시는 필수 입력사항입니다.</b></span> <br><br>
            <form action="<%=contextPath%>/update2.me" method="post" id="enroll-form" name="enroll-form">
                <div class="update-group">
                    이름
                    <input type="text" class="form-control" value="<%=loginUser.getMemName()%>" readonly> 
                    아이디*
                	<input type="text" class="form-control" value="<%=loginUser.getMemId() %>" readonly>      
                    비밀번호*
                    <input type="password" class="form-control" name="userPwd1" value="<%=loginUser.getMemPwd() %>" placeholder="영문, 특수문자, 숫자를 모두 포함하여 8~16자 사이로 정해 주세요"  id="userPwd1">
                    비밀번호확인*
                    <input type="password" class="form-control" placeholder="동일한 비밀번호를 입력 해 주세요"  id="userPwd2">
                    전화번호*
                    <input type="text" class="form-control" name="phone" value="<%=loginUser.getMemTel()%>" placeholder="-를 포함하여 입력 해 주세요"  id="userPhone">
                    이메일*
                    <input type="text" class="form-control" name="email" value="<%=loginUser.getMemEmail()%>" required>
                    주소*<br>
                    <div><%@ include file = "address.jsp"%></div> 
                    <br>
                    <div align="center">
                        <button type="submit" id=modify class="btn btn-primary" style="width:300px" onclick="return validate();">수정하기</button>
                        <button type="button" onclick="location.href='<%=contextPath%>/views/member/memberLeaveForm.jsp'" class="btn btn-secondary">회원탈퇴</button>
                    </div>          
                </div>
            </form>
        </div>
    </div>
	
	<script>
		function(){
			$("#address").val("<%=loginUser.getMemAddress()%>");
			$("#address2").val("<%=loginUser.getMemDetailAddress()%>");
			$("#latitude").val("<%=loginUser.getMemLatitude()%>");
			$("#longtitude").val("<%=loginUser.getMemLongtitude()%>");
		}
	</script>
    
    <script>
         function validate(){

                var userPwd1 = document.getElementById("userPwd1");
                var userPwd2 = document.getElementById("userPwd2");

                var regExp =/(?=.*\d)(?=.*[A-Za-z])(?=.*[~^()+|=@$!%*#?&]).{8,15}/i;
                var hangulcheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
                // 비밀번호 검증
                if(hangulcheck.test(userPwd1.value)){
                    alert("비밀번호에 한글을 사용 할 수 없습니다.");
                }else{
                    if(!regExp.test(userPwd1.value)){
                    alert("유효한 비밀번호를 입력해주세요");
                    userPwd1.value = "";
                    userPwd1.focus();
                    return false;
                    }
                }
                // 비밀번호 일치 검증
                if(userPwd1.value != userPwd2.value){
                    alert("동일한 비밀번호를 입력해주세요");
                    userPwd2.value = "";
                    userPwd2.focus();
                    return false;
                }

                 // 전화번호 검증
                 regExp =/^\d{2,3}-\d{3,4}-\d{4}$/;
                        if(!regExp.test(userPhone.value)){
                            alert("유효한 전화번호를 입력 해 주세요");
                            userPhone.value = "";
                            userPhone.focus();
                        return false;
                            }

          }

    </script>


    <br><br>
 <%@ include file = "../common/footer.jsp"%>
</body>
</html>