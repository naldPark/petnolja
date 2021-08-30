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
        #outer{
          width:1000px;
          height: 1100px;
          margin:auto;
          border:1px solid lightgray;
          padding: 15px;
        }
        #enroll-f input{margin-bottom: 10px;}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>

<br><br>
    <div id="outer">
        <br>
        <h3 align="center">회원가입</h3><br>
       
        <div style="width: 60%;margin:auto" id="enroll-f">
            <span style="color:gray" align="center">
                회원정보는 개인정보처리방침에 따라 안전하게 보관되며, <br>
                회원님의 명백한 동의없이 공개 또는 제3자에게 제공되지 않습니다.
            </span><br><br>
        <form action="<%=contextPath %>/insert.me" id="enroll-form" method="post">
        
 			<!-- 이름, 아이디, 비밀번호, 비밀번호 확인, 전화번호, 이메일, 주소 -->       
            <div class="form-group">
                이름*
                <input type="text" class="form-control" placeholder="한글로 작성하되 5자 이상인 경우 5자까지만 입력 해 주세요"   id="userName" name="userName" required>
                아이디*<br> 
                <input type="text" class="form-control"  style="float: left; width: 420px" placeholder="영소문자,숫자로만 5~20자 사이로 정해 주세요"  id="userId" name="userId" required>
                <button type="button" class="btn btn-secondary" onclick="idCheck();" style="width: 148px; margin-left:10px"  >중복확인</button><br><br>
                비밀번호*
                <input type="password" class="form-control"  placeholder="영문, 특수문자, 숫자를 모두 포함하여 8~16자 사이로 정해 주세요"  id="userPwd1" name="userPwd1" required>
                비밀번호확인*
                <input type="password" class="form-control" placeholder="동일한 비밀번호를 입력 해 주세요"  id="userPwd2" required>
                전화번호*
                <input type="text" class="form-control" placeholder="-를 포함하여 입력 해 주세요"  id="userPhone" name="phone" required>
                이메일*
                <input type="email" class="form-control" placeholder="@를 포함하여 입력 해 주세요" name="email" required>
                주소*<br>
                <div><%@ include file = "address.jsp"%></div>   
                <br>
                <input class="largerCheckbox" type="checkbox" id="allAgree"> <label for="allAgree"> 약관에 모두 동의합니다.</label><br>
                <br>
                <div id="required">
                &nbsp;&nbsp;<input class="largerCheckbox" type="checkbox" id="serviceAgree"> <label for="serviceAgree">(필수) 서비스 이용약관</label><br>
                &nbsp;&nbsp;<input class="largerCheckbox" type="checkbox" id="infoAgree"> <label for="infoAgree">(필수) 개인정보 처리방침</label><br>
                &nbsp;&nbsp;<input class="largerCheckbox" type="checkbox" id="overAge"> <label for="overAge">(필수) 본인은 만 14세 이상입니다</label><br>
                </div>
                &nbsp;&nbsp;<input class="largerCheckbox" type="checkbox" id="adsAgree"> <label for="adsAgree">(선택) 마케팅용 이메일 및 SMS 수신 동의</label><br>
                <br>
                <div align="center">
                    <button type="submit" id="submit" class="btn btn-primary" style="margin-right: 20px; width:200px"  onclick="return validate();" disabled>가입하기</button>
                    <button type="reset" class="btn btn-outline-secondary" style="margin-right: 20px; width:200px">초기화</button>
                </div>
            </div>
            </form>
            <script>
            
        	function idCheck(){
        		
        		// 아이디 입력하는 input요소 객체
        		var $userId = $("#enroll-form input[name=userId]");
        		
        		 // //아이디검증
                regExp = /^[a-z\d]{5,20}$/;
                if(!regExp.test(userId.value)){
                    alert("유효한 아이디를 입력해주세요");
                	$userId.focus();
                }else{
	        		$.ajax({
	        			url:"idCheck.mem",
	        			data:{checkId:$userId.val()},
	        			success:function(result){
	        				if(result == "NNNNN"){ // 사용불가능
	        					
	        					alert("이미 존재하거나 탈퇴한 회원의 아이디입니다.");
	        					$userId.focus();
	        					
	        				}else{ // 사용가능
	        					
	        					if(confirm("사용가능한 아이디입니다. 사용하시겠습니까?")){ // 사용함
	        						
	        						$("#enroll-form :submit").removeAttr("disabled"); // 회원가입활성화
	        						$userId.attr("readonly", true); // 더이상변경불가
	        						
	        					}else{ // 사용안함 => 다시입력
	        						$userId.focus();
	        					}
	        					
	        				}
	        			},error:function(){
	        				console.log("아이디중복체크용 ajax 통신실패");
	        			}
	        		});
	        		
	        	}
        	}
            
            function validate(){
                        var userId = document.getElementById("userId");
                        var userPwd1 = document.getElementById("userPwd1");
                        var userPwd2 = document.getElementById("userPwd2");
                        var userName = document.getElementById("userName");
                        // 이름 검증
                        var regExp=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
                        if(!regExp.test(userName.value)){
                            alert("유효한 이름을 입력해주세요");
                            userName.select();
                            return false;
                        }
                        // //아이디검증
                        regExp = /^[a-z\d]{5,20}$/;
                        if(!regExp.test(userId.value)){
                            alert("유효한 아이디를 입력해주세요");
                            userId.select();
                            return false;
                        }
                        regExp =/^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/i;
                        var hangulcheck = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
                        // // 비밀번호 검증
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
                        //비밀번호 일치 검증
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
                        // 필수사항 체크 검증
                        var check= 0;
                        $("#required").children(":checkbox").each(function(){
                             if(!$(this).prop("checked")){
                                 check++;
                             }
                        })
                        if(check >0) {
                            alert("필수사항은 반드시 동의하셔야합니다");
                            return false;
                            }
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
        </div>
    </div><br><br>

 <%@ include file = "../common/footer.jsp"%>
</body>


</html>