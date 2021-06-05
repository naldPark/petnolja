<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫시터</title>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a430452224cfcb3ee2eea019ba05725c&libraries=services"></script>
<link rel="stylesheet"  href="<%=request.getContextPath()%>/resources/css/datepicker.min.css">
<script src="<%=request.getContextPath()%>/resources/js/jquery-3.1.1.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/datepicker.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/datepicker.ko.js"></script>
<style>
      .datepicker--day-name{color:black;}
      .datepicker--cell:not(.-disabled-) {
        background: rgb(232, 244, 252) !important; 
        border-radius: 0em; 
        color:rgb(95, 95, 95);
    }
      .largerCheckbox, #searchCheckbox label{cursor: pointer;}
      #searchBar{width:78%; background-color: rgb(210, 235, 250); margin-right: 15px;height: 280px;}
        .loginBar{width:20%; padding:5px; height: 280px;}
        #searchCheckbox{width: 93%; height: 170px; background-color: white; margin:auto; padding-left:50px; text-align: left;}
        .largerCheckbox{
          width:20px;
          height:20px;
        }
        #search-form div input[readonly] {
           background-color: white!important; 
        }
        .wrap1{height:280px;}
        .wrap1>div{float:left; text-align: center;}
        .float_banner2   {   position:absolute; position:fixed; left:10PX; top:100px;    padding:0   }
</style>
</head>
<body>
 <div class="wrap wrap1" style="height: 390px;">
  <%@ include file = "findIdPwd.jsp" %>
     <!--검색창 시작-->
     <hr>
     <h2><b>&nbsp;&nbsp;원하는 조건을 검색하세요</b></h2><br>
     <div id="searchBar">
       <form action="<%=contextPath %>/searchSitter.mem" method="post" id="search-form"><br>

           <div class="input-group mb-3">
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <input type="text" id="search_addr" class="form-control" placeholder="지역설정" readonly onclick="findAddr()" value="" name="address"style="cursor: pointer;" >
             <span class="input-group-text" style="background-color: white; cursor: pointer;" onclick="findAddr()"><img src="<%=contextPath %>/resources/images/member/search.png" style="height: 20px;"></span>
             <input type="hidden" name="latitude" required value="" id="latitude">
    	     <input type="hidden" name="longtitude" required value="" id="longtitude">
             <input type="hidden" name="searchPage" required value="1" id="searchPage">
             <input type="hidden" name="searchArray" value="recommend" id="searchArray">
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <input type="text" name="chooseDate" data-range="true" data-multiple-dates-separator=" - " data-language="ko" readonly placeholder="날짜선택" class="datepicker-here form-control" style="cursor: pointer;">
             <span class="input-group-text " style="background-color: white;cursor: pointer;" onclick="chooseDate()"><img src="<%=contextPath %>/resources/images/member/calendar.png" style="height: 20px;"></span>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
             <button class="btn btn-primary" id="searchSubmitBtn" type="submit"style="width: 100px; margin-right: 10px;">검색</button>
             &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         </div>
         

         <div id="searchCheckbox"><br><br>
           <input class="largerCheckbox" type="checkbox" name="option" id="pickup" value="픽업">&nbsp;&nbsp; <label for="pickup">자차 픽업 가능
           <span><img src="<%=contextPath %>/resources/images/member/checkboxPickup.png" style="height: 30px"></span></label>
           <span style="margin:20px;"></span>
           <input class="largerCheckbox" type="checkbox" name="option" id="bath" value="목욕">&nbsp;&nbsp;<label for="bath">목욕 가능
           <span><img src="<%=contextPath %>/resources/images/member/checkboxBath.png" style="height: 30px"></span></label>
           <span style="margin:20px;"></span>
           <input class="largerCheckbox" type="checkbox"  name="option" id="medicine" value="약물">&nbsp;&nbsp;<label for="medicine">약물 복용
           <span><img src="<%=contextPath %>/resources/images/member/checkboxMedicine.png" style="height: 30px"></span></label><br><br>
           <input class="largerCheckbox" type="checkbox"  name="option" id="oldPet" value="노령견">&nbsp;&nbsp;<label for="oldPet">노령견 케어 가능
           <span><img src="<%=contextPath %>/resources/images/member/checkboxOldpet.png" style="height: 30px"></span></label>
           <span style="margin:20px;"></span>
           <input class="largerCheckbox" type="checkbox" name="option" id="hospital" value="병원">&nbsp;&nbsp;<label for="hospital">응급상황시 인근 병원 이동 가능
           <span><img src="<%=contextPath %>/resources/images/member/checkboxHospital.png" style="height: 30px"></span></label>
           <br>
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
          <button type="button" class="btn btn-light" style="width:40%" onclick="location.href='<%=contextPath%>/enrollform.me'">회원가입</button>
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
          <button type="button" class="btn btn-secondary" style="width:40%" onclick="location.href='<%=contextPath%>/views/member/memberUpdateForm.jsp'">정보수정</button>
          <button type="button" class="btn btn-secondary" style="width:40%" onclick="location.href='<%=contextPath%>/logout.mem'">로그아웃</button>
    </div>
     <% } %>
    <!--로그인 후에 보여지는 form 끝-->

  </div>
  <br clear="both">
  <div class="float_banner2">
				<div align="left"><span class="top" onclick="goTop(); return false;">
					[ 임시 로그인 아이디 ]<br><br>
					유저  ddjn6334 / pass01<br>
					펫시터 geddong / pass01 <br>
					관리자 admin1 / admin1</span>
			</div>
     </div>	

 <script>
 
 	// 주소 검색하는 부분입니다
    function findAddr(){
        new daum.Postcode({
            oncomplete: function(data) {
                
                var roadAddr = data.roadAddress;
                var jibunAddr = data.jibunAddress; 

                if(roadAddr !== ''){
                    document.getElementById("search_addr").value = roadAddr;
                } 
                else if(jibunAddr !== ''){
                    document.getElementById("search_addr").value = jibunAddr;
                }
                var geocoder = new kakao.maps.services.Geocoder();
                    geocoder.addressSearch($("#search_addr").val(), function(result, status) {
                    var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
                    $("#latitude").val(result[0].y);
                    $("#longtitude").val(result[0].x);
                })
            }
        }).open();

      

        
    }

    // 날짜선택하는 부분입니다
    function chooseDate(){
    var searchDatePicker = $('.datepicker-here').datepicker().data('datepicker');
    searchDatePicker.show();
    }
    $('.datepicker-here').datepicker({minDate: new Date()}); //시작날짜 오늘로 설정 
    $('.datepicker-here').datepicker({maxDate: new Date(new Date().setMonth(new Date().getMonth() + 3))});// 3달뒤로 종료날짜정하기
    $('.datepicker-here').datepicker({autoClose:true, toggleSelected: false })
    
    </script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</body>
</html>