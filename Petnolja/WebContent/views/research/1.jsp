<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList, com.petnolja.pet.model.vo.Pet,com.petnolja.research.model.vo.*" %>
 
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫놀자</title>
<style>

        #outer{
          width:1400px;
          margin:auto;
          position:relative;
          box-sizing:border-box;
          color:rgb(97, 97, 97);  
        }
        .wrap>*{box-sizing:border-box;}
        #outer>div{float:left;}
        
        .wrap1{
            width:100%;
            height: 15%;
            /* border:1px solid pink; */
        }
        .wrap2{
            width:75%;
            height:85%;
        }
        .wrap3{
            width:25%;
            height:85%;
            padding-left:40px;
            /* border:1px solid pink; */
        }
        .buttonImg{height: 20px;}
        #weight>li{
            float:left;
            width:15%;
            height:100%;
            text-align:left;
        }
        .largerCheckbox{
          width:20px;
          height:20px;
        }
        .balloon {
            position:relative;
            margin: 15px;
            margin-left: 230px;
            width:750px;
            background:rgb(210, 235, 250);
            border-radius: 10px;
            white-space:pre-line; 
            padding: 0 0 30px 30px;
        }

        .balloonNo {
          position:relative;
            margin: 15px;
            margin-left: 230px;
            width:750px;
            white-space:pre-line; 
            padding: 0 0 30px 30px;
        }
        .carousel-item h3{color:black!important;  text-align: left; font-size:17pt;}
        .carousel-item p{color:gray!important; text-align: left; font-size:14pt;}
        .sitterImg{
          float: left; 
          width: 33%; height: 300px; padding: 20px;
        }
        .carousel-item{text-align: center; margin:auto;}
        .plusPet:hover, .minusPet:hover{cursor: pointer; opacity:0.7; }
        input[type="checkbox"]:checked + label{          
          background-color: rgb(236, 249, 253);
          }
        .starList{font-size: 16pt; color: rgb(254,187,2); letter-spacing:-3px;} 
        .reviewImg{height: 170px; width: 170px; float: left; padding:15px;}
      .reviewDate{text-align: right; white-space:pre-line;  padding-right: 30px;}
      .reviewContent{white-space:pre-line; text-align:left; margin-bottom:30px; padding-left:180px;}

 
</style>

</head>
<body>
	
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫놀자</title>
<style>

*{font-family:'Noto Sans KR', sans-serif;}
.navbar-nav>li{font-size: 18px; font-weight: bold;}
#dropdownMenuButton:hover{border-radius:50%; box-shadow:0 10px 20px rgba(0, 0, 0, 0.2), 0 6px 4px rgba(0, 0, 0, 0.2); cursor: pointer;}
#logoButton:hover{border-radius:20%; box-shadow:0 10px 20px rgba(0, 0, 0, 0.2), 0 6px 4px rgba(0, 0, 0, 0.2);}

</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel = "preconnect"href = "https://fonts.gstatic.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

</head>
<body>

	<script>
		var msg = "null"; 
		
		if(msg != "null"){
			alert(msg);
			
		}
	</script>


    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="/petnolja"><img src="/petnolja/resources/images/logo.png" style="height: 45px"  id="logoButton" ></a> 
        <div class="navbar-collapse" >
                <ul class="navbar-nav mr-auto">
                  <li class="nav-item active">
                    <a class="nav-link" href="/petnolja">홈</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="/petnolja/searchSitter.mem">펫시터조회</a>
                  </li>
                  <!--펫시터만 보여지는 메뉴-->
                 
                    <!--펫시터만 보여지는 메뉴 끝-->
                </ul>
                
                <img src="/petnolja/resources/images/member/user.png" style="height: 45px; margin-right:20px;" id="dropdownMenuButton" data-toggle="dropdown">

                
                    <script>
                      $("#dropdownMenuButton").click(function(){
                        window.alert("로그인 후 이용 가능합니다");
                      });
                    </script>
                  
               </div> 
        </div>       
        <hr>
      </nav>
</body>
</html>
 <br>

<div id="outer">

    <!--사진슬라이드-->
  <div class="wrap1">

		
          <img src="/petnolja/resources/upfiles/sitter_upfiles/5273857789891942881.jpg" class="sitterImg">
		
          <img src="/petnolja/resources/upfiles/sitter_upfiles/5593876718873867377.jpg" class="sitterImg">
		
          <img src="/petnolja/resources/upfiles/sitter_upfiles/7934776546404438662.jpg" class="sitterImg">
		

  </div>

  <!--왼쪽면-->
  <div class="wrap wrap2">
      <!--펫시터소개 제목-->
      <hr>
      <div style="height:200px; text-align: center;"> 
        <img src="/petnolja/resources/upfiles/sitter_upfiles/2512305656761269546.jpg" style="height: 200px; float: left; padding:15px;" >
        <br><br><br>
        <h3>사랑으로 봐드려요.^^</h3><br>
        <span style="padding-left:500px">펫시터 정원경</span>
      </div>
      <!--펫시터 자기소개-->
      <hr>
      <div style="white-space:pre-line; text-align:left; margin-bottom:30px; padding-left:20px; padding-right:20px; border:1px solid gray;" > 
            안녕하세요 😃 저는 반려견 하쿠 그리고 쿠마와 함께 행복한 하루하루를 보내고 있습니다. 하쿠는 올해 4살되는 시바믹스구요, 남자 아이 입니다. 어릴때부터, 교육을 체계적으로 받아 사회성도 좋고, 친구들과도 잘 지내는 아이예요. 저희 하쿠&쿠마와 함께 보호자님의 반려견이 행복한 시간을 함께 보내도록 최선을 다하여 보호자님께서 돌아오실 때까지 편안하고 자유롭게 지낼 수 있도록 사랑으로 돌봐드릴 것을 약속드릴께요.😍 감사합니다. 😊<br>
      </div> 

      <!--시팅 금액-->
      <div style="height:200px; text-align:left; margin-bottom:30px;  padding-left:20px; border:1px solid gray;" > 
            <br>
            <h4>시팅 금액</h4><br>
                <ul id="weight">
                    <li style="list-style-type:none; color:gray"><br>1박케어<br>데이케어</li>
                    <li>소형견<br><span>21,230원</span><br><span>19,300원</span></li>
                    <li>중형견<br><span>25,090원</span><br><span>23,160원</span></li>
                    <li>대형견<br><span>0원</span><br><span>27,020원</span></li>
                </ul>
      </div> 

      <!--자격 현황-->
      <div style="text-align:left; margin-bottom:30px;  padding-left:20px; border:1px solid gray;" > 
        <br>
        <h4>펫시터 경력</h4><br>
            <ul id="">
                <li>교육: 반려동물관리사</li><br>
                <li>반려견 케어 기간: 1년미만</li><br>
                <li>펫시터 활동 기간: 3년~5년미만</li><br>
            </ul>
      </div> 

      <!--지원 사항-->
      <div style="text-align:left; margin-bottom:10px;  padding-left:20px; border:1px solid gray;" > 
        <br>
        <h4>지원 사항</h4><br>
        <div id="searchCheckbox" style="padding-left:20px">
            <input class="largerCheckbox" type="checkbox" name="pickup" id="pickup" checked="checked" disabled="disabled">&nbsp;&nbsp; <label for="pickup">자차 픽업 가능
            <span><img src="/petnolja/resources/images/member/checkboxPickup.png" style="height: 30px"></span></label>
            <span style="margin:20px;"></span>
            <input class="largerCheckbox" type="checkbox" name="bath" id="bath" checked="checked" disabled="disabled">&nbsp;&nbsp;<label for="bath">목욕 가능
            <span><img src="/petnolja/resources/images/member/checkboxBath.png" style="height: 30px"></span></label>
            <span style="margin:20px;"></span>
            <input class="largerCheckbox" type="checkbox"  name="medicine" id="medicine" disabled="disabled">&nbsp;&nbsp;<label for="medicine">약물 복용
            <span><img src="/petnolja/resources/images/member/checkboxMedicine.png" style="height: 30px" ></span></label><br><br>
            <input class="largerCheckbox" type="checkbox"  name="oldPet" id="oldPet" checked="checked" disabled="disabled">&nbsp;&nbsp;<label for="oldPet">노령견 케어 가능
            <span><img src="/petnolja/resources/images/member/checkboxOldpet.png" style="height: 30px"></span></label>
            <span style="margin:20px;"></span>
            <input class="largerCheckbox" type="checkbox" name="hospital" id="hospital" checked="checked" disabled="disabled">&nbsp;&nbsp;<label for="hospital">응급상황시 인근 병원 이동 가능
            <span><img src="/petnolja/resources/images/member/checkboxHospital.png" style="height: 30px"></span></label>
            <br><br>
        </div>
       </div> 

      <!--펫놀자 후기-->
           <div style="text-align:left; margin-bottom:30px; padding-left:20px;" > 
                <br>
                <h4 style="float:left;">후기 3개</h4>
                <div style="text-align: right; padding-right: 20px;"><img src="/petnolja/resources/images/member/array.png" style="height: 13px"> &nbsp;정렬 &nbsp;&nbsp;
                    <a href="" style="text-decoration: none; color:gray">추천순</a> | 
                    <a href="" style="text-decoration: none; color:gray">별점순</a> | 
                    <a href="" style="text-decoration: none; color:gray">최신순</a>
                </div>
                <br>
                
                <div> 
                    
                    <img src="/petnolja/resources/upfiles/review_upfiles/5454055375242516562.jpg" class="reviewImg" >
                    
                    <br>
                    <span style="float:left"><b>신도빈 님</b></span>
                    <div class="starList"> &nbsp;&nbsp;
                      
               				 &#9733;
				 	     
               				 &#9733;
				 	     
               				 &#9733;
				 	     
               				 &#9733;
				 	     
               				 &#9733;
				 	     
                    </div>
                    <div class ="reviewDate">2021-02-12 작성</div>
                    <div class="reviewContent"> 
                        이제까지 경험한 펫시터 중에 최고예요!!!
                    </div>
                
			       	  	
                    <div class="balloon"><b>펫시터 정원경님의 댓글</b><br>펫시터가 필요하시면 언제라도 다시 찾아주세요 !!</div>
                     
                  
                </div>
                
                
                <div> 
                    
                    <img src="/petnolja/resources/images/member/welcome.png" class="reviewImg" > 
                    
                    <br>
                    <span style="float:left"><b>전성임 님</b></span>
                    <div class="starList"> &nbsp;&nbsp;
                      
               				 &#9733;
				 	     
               				 &#9733;
				 	     
               				 &#9733;
				 	     
                    </div>
                    <div class ="reviewDate">2021-02-12 작성</div>
                    <div class="reviewContent"> 
                        덕분에 너무 편한 휴가 보낼 수 있었습니다 !!
                    </div>
                
			       	  	
                    <div class="balloon">
                        <b>펫시터 정원경님의 댓글</b><br>
                        휴가 잘 다녀오셨나요 ? 저도 즐겨웠어요 !!
                      </div>
                     
                  
                </div>
                
                
                <div> 
                    
                    <img src="/petnolja/resources/images/member/welcome.png" class="reviewImg" > 
                    
                    <br>
                    <span style="float:left"><b>곽비운 님</b></span>
                    <div class="starList"> &nbsp;&nbsp;
                      
               				 &#9733;
				 	     
               				 &#9733;
				 	     
                    </div>
                    <div class ="reviewDate">2021-02-12 작성</div>
                    <div class="reviewContent"> 
                        강아지가 집에오니까 시무룩해졌어요 얼마나 잘해주셨는지 .. 정말 감사합니다 !
                    </div>
                
			       	  	
                      <div class="balloonNo"></div>
                       
                  
                </div>
                
                
                <div>
                  <img src='/petnolja/resources/images/member/welcome.png' class='reviewImg'><br>
                  <span style='float:left'><b>최우경님</b></span>
                  <div class='starList'> &nbsp;&nbsp; &#9733&#9733</div>
                  <div class ='reviewDate'>2월 12, 2021작성</div>
                  <div class='reviewContent'>이제까지 경험한 펫시터 중에 최고예요!!!</div>
                  <div class='balloon'><b>펫시터 정원경님의 댓글</b><br>항상 기다리고 있겠습니다 고갱님</div>
                </div>
                <div>
                  <img src='/petnolja/resources/images/member/welcome.png' class='reviewImg'><br>
                  <span style='float:left'><b>차슬기님</b></span>
                  <div class='starList'> &nbsp;&nbsp; &#9733&#9733&#9733&#9733</div>
                  <div class ='reviewDate'>2월 12, 2021작성</div>
                  <div class='reviewContent'>정말좋아요 펫시터가 너무 친절해서 행복했어요 우리 뚜뚜도 행복했겠죠 ?</div>
                  <div class="balloon"><b>펫시터 정원경님의 댓글</b><br>아이쿠 만족하셨다니 제가 다 기쁘네요 또 찾아주세여</div>
                </div>
                <div>
                  <img src='/petnolja/resources/images/member/welcome.png' class='reviewImg'><br>
                  <span style='float:left'><b>나근우님</b></span>
                  <div class='starList'> &nbsp;&nbsp; &#9733&#9733&#9733&#9733</div>
                  <div class ='reviewDate'>2월 12, 2021작성</div>
                  <div class='reviewContent'>강아지가 집에오니까 시무룩해졌어요 얼마나 잘해주셨는지 .. 정말 감사합니다 !</div>
                  <div class='balloon'><b>펫시터 정원경님의 댓글</b><br>고객님을 만족시켜드릴 수 있어서 너무너무 행복하네요 또 오세용</div>
                </div>
                <div style="text-align:center" id="resultEnd">
                <button type="button" class="btn btn-secondary" style="width:30%;" id="moreReview">후기 더 보기</button></div>
                  <!-- 펫놀자 후기 끝 -->
                  <br clear="both">
          </div> 
   </div>
  <!--왼쪽면 끝-->

    <!--오른쪽 면-->
    <div class="wrap wrap3">
        <!--즐겨찾기, 공유, 하트-->
        <div style="text-align: center;">
            <br><br><br>
            
          <button type="button" class="btn btn-primary" style="width:200px;margin-bottom:5px" onclick="like();">
            <div id="likeImgDiv" value=100>
              <img src="/petnolja/resources/images/member/justHeart.png" class="buttonImg">&nbsp;&nbsp;&nbsp;즐거찾기에 추가
            </div>
          </button><br>
          <button type="button" class="btn btn-primary" style="width:200px;margin-bottom:5px" data-toggle="modal" data-target="#copyUrl">
            <img src="/petnolja/resources/images/member/share.png" class="buttonImg">&nbsp;&nbsp;&nbsp;공유하기
          </button><br>
          <button type="button" class="btn btn-primary" style="width:200px;margin-bottom:5px" onclick="location.href='/petnolja/views/memboard/askToPetsitterList.jsp'"><img src="/petnolja/resources/images/member/messenger.png" class="buttonImg">&nbsp;&nbsp;&nbsp;펫시터에게 문의하기</button><br>
        </div>
        <br><br>
         <!-- 공유하기 버튼 클릭시 모달 실행 -->
      <div class="modal" id="copyUrl">
        <div class="modal-dialog">
          <div class="modal-content">
              <!-- Modal Header -->
              <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
              </div>
            <div class="modal-body input-group mb-3">
              <input type="text" id = "ShareUrl" class="form-control">
              <button OnClick="CopyUrlToClipboard()" class="btn btn-primary">URL 복사</button>
            </div>
          </div>
        </div>
      </div>

        <!--예약달력확인--><br>
          <h6>예약 가능 날짜</h6>
          <div style="border:1px solid lightgray;">
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8" />
    <style>table { border-collapse: collapse;}  </style>
    <title></title>
    <script type="text/javascript" >
	
    var today = new Date();//오늘 날짜
 
 
    function prevClaendar(){//이전 달력
      today = new Date(today.getFullYear(), today.getMonth()-1,today.getDate());
      buildCalendar();
    }
    //다음 달력을 오늘을 저장하고 달력에 뿌려줌
    function nextCalendar(){
      today = new Date(today.getFullYear(), today.getMonth()+1,today.getDate());
      buildCalendar();
 
    }
    function buildCalendar(){
      var nMonth = new Date(today.getFullYear(),today.getMonth(),1);// 이번달의 첫번째날
      var lastDate =new Date(today.getFullYear(),today.getMonth()+1,0);//이번달의 마지막날
      var tblCalendar =document.getElementById("calendar");    //테이블 달력을 만드는 테이블
      var tblCalendarYM =document.getElementById("calendarYM"); ///XXXX년도XX월 출력
      tblCalendarYM.innerHTML = today.getFullYear()+"년"+(today.getMonth()+1)+"월";
 
      //기존에 테이블에 잇던 달력 내용 삭제
      while(tblCalendar.rows.length>2){
        tblCalendar.deleteRow(tblCalendar.rows.length -1);
      }
      var row = null;
      row =tblCalendar.insertRow();
      var cnt =0;
      // 1일이 시작되는 칸을 맞추어줌
 
      for ( i=0; i <nMonth.getDay(); i++) {
        cell =row.insertCell();
        cnt = cnt + 1;
    }
      //달력 출력
      var userAbleDate='2021-06-01,2021-06-03,2021-06-04,2021-06-05,2021-06-07,2021-06-08,2021-06-09,2021-06-10,2021-06-11,2021-06-12,2021-06-13,2021-06-14,2021-06-15,2021-06-16,2021-06-17,2021-06-18,2021-06-19,2021-06-20,2021-06-21,2021-06-22,2021-06-23,2021-06-25,2021-06-27,2021-06-29,2021-06-30,2021-07-01,2021-07-02,2021-07-03,2021-07-04,2021-07-05,2021-07-06,2021-07-07,2021-07-08,2021-07-09,2021-07-10,2021-07-11,2021-07-12'.split(",");   
      
      for(i=1; i<=lastDate.getDate(); i++){
        cell =row.insertCell();
        cell.innerHTML = i;
        cell.style.color="lightgrey";


        //여기서 비활성화 조정하자
        if(i< 10){ varDate = "0" + i}else{varDate=i};

		var ableCheck= today.toISOString().substring(0,8)+varDate;
        
        for(var k=0;k<userAbleDate.length;k++){

    
      

		if(userAbleDate[k]==ableCheck){
			cell.style.background="rgb(210, 235, 250)";
            cell.style.color="darkgrey";
		}
		//여기까지 비활성화 조정하자
    }
        cnt = cnt + 1;
        if (cnt%7 == 0)    //1주=7일
         row = calendar.insertRow();

      }
	 
    }
 
    </script>
        <style>
            #calendar>*{text-align: center; color:grey;}
        </style>
  </head>
  <body>
    <table id="calendar"  border="0" align="center" width="270" height="270" style="font-size:13pt;">
      <tr>
        <td align ="center"> <label onclick="prevClaendar()"><</label> </td>
        <td colspan="5" align ="center" id="calendarYM">yyyy년 m월</td>
        <td align ="center"> <label onclick="nextCalendar()">></label> </td>
      </tr>
 
      <tr>
        <td align="center">일</td>
        <td align="center">월</td>
        <td align="center">화</td>
        <td align="center">수</td>
        <td align="center">목</td>
        <td align="center">금</td>
        <td align="center">토</td>
      </tr>
 
    </table>
        <script type="text/javascript" >
          buildCalendar();
        </script>

 
  </body>
</html>
 </div>
        
        <br>
        <!--예약 area-->
          <div style="text-align:center;"><hr>
            <div style="text-align: left;">
            <h6>예약 하기</h6><br></div>
                <h6>체크인날짜&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 체크아웃날짜</h6>
                <div> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫시터</title>
  
    <link rel="stylesheet"  href="/petnolja/resources/css/datepicker.min.css">
    <script src="/petnolja/resources/js/jquery-3.1.1.min.js"></script>
    <script src="/petnolja/resources/js/datepicker.min.js"></script>
    <script src="/petnolja/resources/js/datepicker.ko.js"></script>
    <style>
    .double div {float: left;}
    /* .-disabled-{background: lightgrey}; */
    .datepicker--cell:not(.-disabled-) {
        background: rgb(210, 235, 250) !important; 
        border-radius: 0em; 
        color:darkgrey;
    }
    .datepicker--day-name{color:black;}
    </style>
</head>

<body>

    <div class="double">
        <input id="datepicker1" type="text" style="width: 100px; border:1px solid lightgray; color: rgb(114, 113, 113); text-align: center;"> -
        <input id="datepicker2" type="text" style="width: 100px; border:1px solid lightgray; color: rgb(114, 113, 113); text-align: center;">
    </div>

    <script>

        datePickerSet($("#datepicker1"), $("#datepicker2"), true); 
        function datePickerSet(sDate, eDate, flag) {
                var sDay = sDate.val(); //시작달력
                var eDay = eDate.val(); //끝달력
                
                // 날짜차단하기 시작
          
                var abled_days = '2021-06-01,2021-06-03,2021-06-04,2021-06-05,2021-06-07,2021-06-08,2021-06-09,2021-06-10,2021-06-11,2021-06-12,2021-06-13,2021-06-14,2021-06-15,2021-06-16,2021-06-17,2021-06-18,2021-06-19,2021-06-20,2021-06-21,2021-06-22,2021-06-23,2021-06-25,2021-06-27,2021-06-29,2021-06-30,2021-07-01,2021-07-02,2021-07-03,2021-07-04,2021-07-05,2021-07-06,2021-07-07,2021-07-08,2021-07-09,2021-07-10,2021-07-11,2021-07-12'.split(","); //차단할 날짜
                $('#datepicker1, #datepicker2').datepicker({
                    language: 'ko',
                    onRenderCell: function (date, cellType) {
                        pretty_date = date.getFullYear() + '-' + ("00" + (date.getMonth() + 1)).slice(-2) + "-" + ("00" + date.getDate()).slice(-2); //date날짜 두자리로 출력
                        var abled = false
                        if  (cellType == 'day') {   
                            abled = abled_days.indexOf(pretty_date) == -1}
                        return {disabled: abled}
                    }
                });
                // 날짜차단하기 끝

                

                sDate.datepicker({minDate: new Date()}); //시작날짜 오늘로 설정 
                eDate.datepicker({minDate: new Date()}); //시작날짜 오늘로 설정 
                eDate.datepicker({maxDate: new Date(new Date().setMonth(new Date().getMonth() + 3))});// 3달뒤로 종료날짜정하기
                sDate.datepicker({maxDate: new Date(new Date().setMonth(new Date().getMonth() + 3))});// 3달뒤로 종료날짜정하기



                if (flag && !isValidStr(sDay) && !isValidStr(eDay)) { 		
                    var sdp = sDate.datepicker().data("datepicker");
                    sdp.selectDate(new Date(sDay.replace(/-/g, "/")));  

                    var edp = eDate.datepicker().data("datepicker");
                    edp.selectDate(new Date(eDay.replace(/-/g, "/")));  
                }
                if (!isValidStr(eDay)) {
                    sDate.datepicker({
                        maxDate: new Date(eDay.replace(/-/g, "/"))
                    });
                }
                sDate.datepicker({
                    language: 'ko',
                    autoClose: true,
                    onSelect: function () {
                        datePickerSet(sDate, eDate);
                    }
                });

                if (!isValidStr(sDay)) {
                    eDate.datepicker({
                        minDate: new Date(sDay.replace(/-/g, "/"))
                    });
                }
                eDate.datepicker({
                    language: 'ko',
                    autoClose: true,
                    onSelect: function () {
                        datePickerSet(sDate, eDate);
                    }
                });


            function isValidStr(str) {
                if (str == null || str == undefined || str == "")
                    return true;
                else
                    return false;
            }
        }
    </script>
</body>

</html></div>
                <br>
                    <div style="float: left; margin-left:45px;">
                      위탁할시간<br>
                      <div style="border:1px solid lightgray; padding:5px 20px 5px 20px; text-align: center; margin-top:10px;width:100px;" >13시</div>
                    </div>          
                    <div class="form-group" style="margin-left:160px; text-align: left;">&nbsp;
                      찾아올시간<br>
                      <div style="border:1px solid lightgray; padding:5px 20px 5px 20px; text-align: center; margin-top:10px; width:100px;" >12시</div>
                    </div>
            </div>


              <br>
            
          
            <div style="line-height:190%">
                <h6>맡기시는 반려동물</h6><br>
                <div style="float:left;  margin: 0px 40px 0px 60px; ">
                소형견<br>
                중형견<br>
                대형견<br>
                </div>
                <div style="text-align: center; margin-bottom: 10px;">
                
                    <h4 style="display: inline;"><span class="badge badge-primary minusPet"><b>−</b></span></h4>&nbsp;&nbsp;
                    <span style="padding-top: 2px;" id="">0</span>&nbsp;&nbsp;
                    <h4 style="display: inline;"><span class="badge badge-primary plusPet"><b>+</b></span></h4><br>
          
                    <h4 style="display: inline;"><span class="badge badge-primary minusPet"><b>−</b></span></h4>&nbsp;&nbsp;
                    <span style="padding-top: 2px;" id="">0</span>&nbsp;&nbsp;
                    <h4 style="display: inline;"><span class="badge badge-primary plusPet"><b>+</b></span></h4><br>
     
  
                    <h4 style="display: inline;"><span class="badge badge-primary minusPet"><b>−</b></span></h4>&nbsp;&nbsp;
                    <span style="padding-top: 2px;" id="">0</span>&nbsp;&nbsp;
                    <h4 style="display: inline;"><span class="badge badge-primary plusPet"><b>+</b></span></h4>
                <br><br>
                
               
                <button type="button" class="btn btn-danger" style="width:200px;margin-bottom:5px" onclick="location.href='/petnolja/views/research/reserveProceed.jsp'">&nbsp;&nbsp;&nbsp;예약하기</button><br>
              </div>
            </div>
          <hr>
          <!--지도 area-->
          <div style="text-align: left;">
            <h6>펫시터님의 위치</h6><br>
            
    <!DOCTYPE html>
    <html>
    <head>
        <meta charset="utf-8">
        <title>위치</title>
        
    </head>
    <body>
    <div id="map" style="width:300px;height:300px;"></div>
    
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=24041778a2f826e90efb57a4417ba69d&libraries=services"></script>
    <script>
 


    var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
        mapOption = {
            center: new kakao.maps.LatLng(37.3926553, 126.9484161), // 지도의 중심좌표
            level: 3 // 지도의 확대 레벨
        };  
    
    // 지도를 생성합니다    
    var map = new kakao.maps.Map(mapContainer, mapOption); 
    
    // 주소-좌표 변환 객체를 생성합니다
    var geocoder = new kakao.maps.services.Geocoder();
    
    // 주소로 좌표를 검색합니다
    geocoder.addressSearch('	경기도 고양시 일산동구 중앙로 1129(장항동, 호수마을1단지아파트)', function(result, status) {
    
        // 정상적으로 검색이 완료됐으면 
         if (status === kakao.maps.services.Status.OK) {
    
            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
    
            // 결과값으로 받은 위치를 마커로 표시합니다
            var marker = new kakao.maps.Marker({
                map: map,
                position: coords
            });
    
            // 인포윈도우로 장소에 대한 설명을 표시합니다
            var infowindow = new kakao.maps.InfoWindow({
                content: '<div style="width:220px;text-align:center;padding:6px 0;font-size:10pt;">	경기도 고양시 일산동구 중앙로 1129(장항동, 호수마을1단지아파트)</div>'
            });
            infowindow.open(map, marker);
    
            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            map.setCenter(coords);
        } 
        
    });    



    function relayout() {    
    
    // 지도를 표시하는 div 크기를 변경한 이후 지도가 정상적으로 표출되지 않을 수도 있습니다
    // 크기를 변경한 이후에는 반드시  map.relayout 함수를 호출해야 합니다 
    // window의 resize 이벤트에 의한 크기변경은 map.relayout 함수가 자동으로 호출됩니다
    map.relayout();
}
    
    </script>
    </body>
    </html>   
          </div>
      </div>


	<script>
    var page = 2;
    var no = 100;
$("#moreReview").click(function(){ 
   console.log(page);
   console.log(no);
      $.ajax({
        url:"moreReview.mem",
        data:{
          sitterNo:no,
          currentPage:page
        },
        type:"post",
        success:function(list){
          page++;          
          var result = ""; 
          console.log(list);
					for(var i=0; i<list.length; i++){
            var star = "";
            var balloon = "";
            for(var j=0 ; j <list[i].reviewRating; j++){star += "&#9733";}
            if(list[i].path==null){list[i].path="resources/images/member/welcome.png"}
            if(list[i].reviewReplyContent!=null){
              balloon ="<div class='balloon'><b>펫시터 정원경님의 댓글</b><br>"
                      +list[i].reviewReplyContent+"</div>"
            } else {
              balloon ="<div class='balloonNo'><br></div>"
            }

          result += "<div>"
                       +"<img src='/petnolja/" + list[i].path + "' class='reviewImg'>"
                      + "<br><span style='float:left'><b>"+ list[i].memName+ "님</b></span>"
                      + "<div class='starList'> &nbsp;&nbsp; " + star +"</div>"
                      + "<div class ='reviewDate'>"+list[i].reviewDate+"작성</div>"
                      + "<div class='reviewContent'>"+list[i].reviewContent+"</div>"
                      +balloon
                      +"</div>"
                }
                $(result).insertBefore("#resultEnd");
          console.log("result"+result);
          console.log("page"+page);
        },error:function(){
          console.log("ajax통신 실패");
        }
      });
    })

      $("#weight li span").each(function(index){
            if($(this).text()=="0원"){
              $(this).text("시팅불가");
          }
       })


      var favor = 0;
			var likeS = '<img src="/petnolja/resources/images/member/favoriteHeart.png" class="buttonImg">&nbsp;&nbsp;&nbsp;즐거찾기 추가됨'
			var unlikeS = '<img src="/petnolja/resources/images/member/justHeart.png" class="buttonImg">&nbsp;&nbsp;&nbsp;즐거찾기에 추가'
      $(document).ready(function(){
       if(favor!=0){
        $("#likeImgDiv").html(likeS);
       } else {
        $("#likeImgDiv").html(unlikeS);
       }
       

     })

		function like(){
      
        window.alert("로그인 후 이용 가능합니다");
      
      };

	</script>


    <script>

          //공유하기 url복사
          var obShareUrl = document.getElementById("ShareUrl");
          obShareUrl.value = window.document.location.href; 
          function CopyUrlToClipboard(){
          obShareUrl.select();
          document.execCommand("copy");
          obShareUrl.blur();
          alert("URL이 클립보드에 복사되었습니다"); 
           }

        $(function(){
            var count = 0;
          $(".plusPet").click(function(){
            count = Number($(this).parent().prev('span').text())+1;
            $(this).parent().prev('span').text(count);
          });
          $(".minusPet").click(function(){
            count = Number($(this).parent().next('span').text())-1;
            if(count>=0){
            $(this).parent().next('span').text(count);
            }
          });
        })

    </script>
   <br clear="both">
  <!--오른쪽면 끝-->
</div>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  #footer-area{
    font-size:13pt;
    text-decoration: none;
    color:gray;
  }
  #footer-link>div>a{
    color:black !important;
  }
</style>
</head>
<body>
<!-- Footer -->
<footer class="page-footer font-small indigo" id="footer-area">
  <hr>
  <div class="container">
    <div class="row text-center d-flex justify-content-center pt-3 mb-1" id="footer-link">
      <div class="col-md-2 mb-3">
          <a href="/petnolja/memNotice.mem">공지사항</a>
      </div>
      <div class="col-md-2 mb-3">
          <a href="/petnolja/private.mem">개인정보처리방침</a>
      </div>
      <div class="col-md-2 mb-3">
          <a href="/petnolja/agreement.mem">이용약관</a>
      </div>
      <div class="col-md-2 mb-3">
        <a href="/petnolja/memService.mem">고객센터</a>
      </div>
    </div>
    <br>

    <div class="row d-flex text-center justify-content-center">
        <p align="left">전화문의  02-111-2222  평일 오전 09:00 ~ 오후 06:00  점심 오전 12:00 ~ 오후 01:00  주말 및 공휴일은 휴무입니다.<br>
          (주)펫놀자  대표 : 김말똥  Tel : 02-111-2222 Fax : 02-111-3333  이메일 : cs@petnolja.co.kr <br>
          주소 : 서울시 강남구 테헤란로 1111, kh빌딩 3층  사업자등록번호 : 111-22-33333 </p>
    </div>
  <div class="footer-copyright text-center">© 2021 Copyright:
    <a href="/petnolja"> petnolja</a>
  </div></div><br><br><br><br><br><br>
</footer>

</body>
</html>


</body>
</html>