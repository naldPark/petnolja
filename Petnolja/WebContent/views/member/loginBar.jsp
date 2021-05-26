<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫시터</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<link rel="stylesheet"  href="<%=request.getContextPath()%>/resources/css/datepicker.min.css">
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.1.1.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/datepicker.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/datepicker.ko.js"></script>
<style>
      .datepicker--day-name{color:black;}
      .largerCheckbox, #searchCheckbox label{cursor: pointer;}
      #searchBar{width:78%; background-color: rgb(210, 235, 250); margin-right: 15px;}
        .loginBar{width:20%; padding:5px;}
        #searchCheckbox{width: 93%; height: 170px; background-color: white; margin:auto; padding-left:50px; text-align: left;}
        .largerCheckbox{
          width:20px;
          height:20px;
        }
      /* *{border:1px solid black;  } */
</style>
</head>
<body>
 <div class="wrap wrap1">
  <%@ include file = "findIdPwd.jsp" %>
     <!--검색창 시작-->
     <hr>
     <h2><b>&nbsp;&nbsp;원하는 조건을 검색하세요</b></h2><br>
     <div id="searchBar">
       <form action="" method="get" id="search-form"><br>

           <div class="input-group mb-3">
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             
             <input type="text" id="member_addr" class="form-control" placeholder="지역설정" onclick="findAddr()" value="" name="address"style="cursor: pointer;" >
             <span class="input-group-text" style="background-color: white; cursor: pointer;" onclick="findAddr()"><img src="<%=contextPath %>/resources/images/member/search.png" style="height: 20px;"></span>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <input type="text" data-range="true" data-multiple-dates-separator=" - " data-language="ko" placeholder="날짜선택" class="datepicker-here form-control" style="cursor: pointer;">
             <span class="input-group-text " style="background-color: white;cursor: pointer;" onclick="chooseDate()"><img src="<%=contextPath %>/resources/images/member/calendar.png" style="height: 20px;"></span>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <button class="btn btn-primary" type="button"style="width: 100px;margin-right: 10px;" onclick="location.href='<%=contextPath%>/views/research/searchPetsitter.jsp'">검색</button>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         </div>
         

         <div id="searchCheckbox"><br><br>
           <input class="largerCheckbox" type="checkbox" name="pickup" id="pickup">&nbsp;&nbsp; <label for="pickup">자차 픽업 가능
           <span><img src="<%=contextPath %>/resources/images/member/checkboxPickup.png" style="height: 30px"></span></label>
           <span style="margin:20px;"></span>
           <input class="largerCheckbox" type="checkbox" name="bath" id="bath">&nbsp;&nbsp;<label for="bath">목욕 가능
           <span><img src="<%=contextPath %>/resources/images/member/checkboxBath.png" style="height: 30px"></span></label>
           <span style="margin:20px;"></span>
           <input class="largerCheckbox" type="checkbox"  name="medicine" id="medicine">&nbsp;&nbsp;<label for="medicine">약물 복용
           <span><img src="<%=contextPath %>/resources/images/member/checkboxMedicine.png" style="height: 30px"></span></label><br><br>
           <input class="largerCheckbox" type="checkbox"  name="oldPet" id="oldPet">&nbsp;&nbsp;<label for="oldPet">노령견 케어 가능
           <span><img src="<%=contextPath %>/resources/images/member/checkboxOldpet.png" style="height: 30px"></span></label>
           <span style="margin:20px;"></span>
           <input class="largerCheckbox" type="checkbox" name="hospital" id="hospital">&nbsp;&nbsp;<label for="hospital">응급상황시 인근 병원 이동 가능
           <span><img src="<%=contextPath %>/resources/images/member/checkboxHospital.png" style="height: 30px"></span></label>
           <br><br>
         </div>
   
      </form>
     </div>
     <!--검색창 끝-->

    <!--로그인전에 보여지는 로그인form-->
    <% if(loginUser == null) { %>
    <div class="loginBar">
      <form action="<%= contextPath %>/login.mem" method="post" id="login-form">
        <h4>회원 로그인</h4><br>
          <div class="input-group mb-3">
              <div class="input-group-prepend">
                <span class="input-group-text"><img src="<%=contextPath %>/resources/images/member/loginImage1.png" style="height: 25px"></span>
              </div>
              <input type="text" class="form-control" placeholder="아이디를 입력하세요"  name="userId" autocomplete="username">
          </div>
        
          <div class="input-group mb-3">
                <div class="input-group-prepend">
                  <span class="input-group-text"><img src="<%=contextPath %>/resources/images/member/loginImage2.png" style="height: 25px"></span>
                </div>
              <input type="password" class="form-control" placeholder="비밀번호를 입력하세요" name="userPwd" autocomplete="current-password">
          </div>
          <button type="submit" class="btn btn-primary" style="width:100%">로그인</button><br><br>
          <button type="button" class="btn btn-light" style="width:40%" onclick="location.href ='<%=contextPath%>/enrollform.me'">회원가입</button>
          <button type="button" class="btn btn-light" style="width:40%" onclick="findMain()">ID/PW찾기</button>
      </form>
    </div>
    <!--로그인전에 보여지는 로그인form 끝-->
    <% }else{ %>
     <!--로그인 후에 보여지는 form-->
    <div class="loginBar" style="border: 1px solid lightgrey;">
        <br>
        <h5><b><span style="color:rgb(0, 123, 255)"><%=loginUser.getMemName()%></span>님 환영합니다</b></h5>
        <img src="<%=contextPath %>/resources/images/member/welcome.png" style="height: 140px">
          <button type="button" class="btn btn-secondary" style="width:40%" onclick="location.href='<%=contextPath%>/update.me'">정보수정</button>
          <button type="button" class="btn btn-secondary" style="width:40%" onclick="location.href='<%=contextPath%>/logout.mem'">로그아웃</button>
    </div>
     <% } %>
    <!--로그인 후에 보여지는 form 끝-->
    
    
    
  </div>
  <br clear="both"><br>

 <script>
    function findAddr(){
        new daum.Postcode({
            oncomplete: function(data) {
                var roadAddr = data.roadAddress;
                var jibunAddr = data.jibunAddress; 
                if(roadAddr !== ''){document.getElementById("member_addr").value = roadAddr;} 
                else if(jibunAddr !== ''){document.getElementById("member_addr").value = jibunAddr;}
            }
        }).open();
    }

    function chooseDate(){
    var myDatepicker = $('.datepicker-here').datepicker().data('datepicker');
    myDatepicker.show();}
    $('.datepicker-here').datepicker({autoClose:true })
    </script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</body>
</html>