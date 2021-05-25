<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        }
        .balloon:after {
            border-top:15px solid rgb(210, 235, 250);
            border-left: 15px solid transparent;
            border-right: 0px solid transparent;
            border-bottom: 0px solid transparent;
            content:"";
            position:absolute;
            top:10px;
            left:-15px;
        }
        /* .carousel-inner img {width: 30%; height: 300px; padding: 20px;} */
        .carousel-item h3{color:black!important;  text-align: left; font-size:17pt;}
        .carousel-item p{color:gray!important; text-align: left; font-size:14pt;}
        .reviewImg{
          float: left; 
          width: 33%; height: 300px; padding: 20px;
        }
        .carousel-item{text-align: center; margin:auto;}
        .plusPet:hover, .minusPet:hover{cursor: pointer; opacity:0.7; }
        input[type="checkbox"]:checked + label{          
          background-color: rgb(236, 249, 253);
          }
          #starList{font-size: 12pt; font-weight: bold; letter-spacing :2px;} 

 
</style>

</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
 <br>

<div id="outer">

    <!--사진슬라이드-->
  <div class="wrap1">
    <div id="demo" class="carousel slide" data-ride="carousel">
      <ul class="carousel-indicators">
        <li data-target="#demo" data-slide-to="0" class="active"></li>
        <li data-target="#demo" data-slide-to="1"></li>
        <li data-target="#demo" data-slide-to="2"></li>
        <li data-target="#demo" data-slide-to="3"></li>
        <li data-target="#demo" data-slide-to="4"></li>
        <li data-target="#demo" data-slide-to="5"></li>
      </ul>
      <div class="carousel-inner">
        <div class="carousel-item active">
          <img src="../../resources/images/temp/dog1.jpg" class="reviewImg">
          <img src="../../resources/images/temp/dog2.jpg" class="reviewImg">
          <img src="../../resources/images/temp/dog3.jpg" class="reviewImg">

        </div>
        <div class="carousel-item">
            <img src="../../resources/images/temp/dog4.jpg" class="reviewImg">
            <img src="../../resources/images/temp/dog5.jpg" class="reviewImg">
            <img src="../../resources/images/temp/dog1.jpg" class="reviewImg">

        </div>
        <div class="carousel-item">
            <img src="../../resources/images/temp/dog2.jpg" class="reviewImg">
            <img src="../../resources/images/temp/dog3.jpg" class="reviewImg">
            <img src="../../resources/images/temp/dog4.jpg" class="reviewImg">

        </div>

        <a class="carousel-control-prev" href="#demo" data-slide="prev">
          <span><img src="../../resources/images/member/left-arrow.png" width="70"></span>
        </a>
        <a class="carousel-control-next" href="#demo" data-slide="next">
          <span><img src="../../resources/images/member/right-arrow.png" width="70"></span>
        </a>
      </div>
    </div>
  </div>

  <!--왼쪽면-->
  <div class="wrap wrap2">
      <!--펫시터소개 제목-->
      <hr>
      <div style="height:200px; text-align: center;"> 
        <img src="../../resources/images/temp/petsitter5.jpg" style="height: 200px; float: left; padding:15px;" >
        <br><br><br>
        <h3>논현동 펫시팅 8년 경력 책임지고 돌봐드립니다</h3><br>
        <span style="padding-left:500px">펫시터 강보람</span>
      </div>
      <!--펫시터 자기소개-->
      <hr>
      <div style="white-space:pre-line; text-align:left; margin-bottom:30px; padding-left:20px; border:1px solid gray;" > 
            안녕하세요 논현동에 사는 펫시터 입니다.
            저는 남편하고 둘이서 살고 있구요. 집에는 아주 순한 5살짜리 푸들이 있어요 !
            활동을 하다보니 역시나 저에게 너무 잘 맞았고 일이라는 생각이 전혀 안 들 정도로 아이들과 교감하는 것이 행복했습니다. 
            집에 오는 아가들이 잘 따르고 편안해 할 때와 너무 만족해 하시며 
            고마워 하시는 견주님들을 볼 때 너무 보람있고 행복한 일이라고 느끼고 있습니다. 
            앞으로도 처음 그 마음처럼 사랑과 정성으로 아이들을 돌보겠습니다~~^^<br>
      </div> 

      <!--시팅 금액-->
      <div style="height:200px; text-align:left; margin-bottom:30px;  padding-left:20px; border:1px solid gray;" > 
            <br>
            <h4>시팅 금액</h4><br>
                <ul id="weight">
                    <li style="list-style-type:none; color:gray"><br>1박케어<br>데이케어</li>
                    <li>소형견<br>40,000원<br>35,000원</li>
                    <li>중형견<br>50,000원<br>40,000원</li>
                    <li>대형견<br>80,000원<br>예약불가</li>
                </ul>
      </div> 

      <!--자격 현황-->
      <div style="text-align:left; margin-bottom:30px;  padding-left:20px; border:1px solid gray;" > 
        <br>
        <h4>자격 현황</h4><br>
            <ul id="">
                <li>펫시터 전문가 교육</li><br>
                <li>ㅇㅇㅇㅇㅇㅇㅇㅇ 교육</li><br>
                <br>
            </ul>
      </div> 

      <!--지원 사항-->
      <div style="text-align:left; margin-bottom:10px;  padding-left:20px; border:1px solid gray;" > 
        <br>
        <h4>지원 사항</h4><br>
        <div id="searchCheckbox" style="padding-left:20px">
            <input class="largerCheckbox" type="checkbox" name="pickup" id="pickup" checked="checked" disabled="disabled">&nbsp;&nbsp; <label for="pickup">자차 픽업 가능
            <span><img src="../../resources/images/member/checkboxPickup.png" style="height: 30px"></span></label>
            <span style="margin:20px;"></span>
            <input class="largerCheckbox" type="checkbox" name="bath" id="bath" checked="checked" disabled="disabled">&nbsp;&nbsp;<label for="bath">목욕 가능
            <span><img src="../../resources/images/member/checkboxBath.png" style="height: 30px"></span></label>
            <span style="margin:20px;"></span>
            <input class="largerCheckbox" type="checkbox"  name="medicine" id="medicine" disabled="disabled">&nbsp;&nbsp;<label for="medicine">약물 복용
            <span><img src="../../resources/images/member/checkboxMedicine.png" style="height: 30px" ></span></label><br><br>
            <input class="largerCheckbox" type="checkbox"  name="oldPet" id="oldPet" checked="checked" disabled="disabled">&nbsp;&nbsp;<label for="oldPet">노령견 케어 가능
            <span><img src="../../resources/images/member/checkboxOldpet.png" style="height: 30px"></span></label>
            <span style="margin:20px;"></span>
            <input class="largerCheckbox" type="checkbox" name="hospital" id="hospital" checked="checked" disabled="disabled">&nbsp;&nbsp;<label for="hospital">응급상황시 인근 병원 이동 가능
            <span><img src="../../resources/images/member/checkboxHospital.png" style="height: 30px"></span></label>
            <br><br>
        </div>
       </div> 

      <!--펫놀자 후기-->
           <div style="text-align:left; margin-bottom:30px; padding-left:20px;" > 
                <br>
                <h4 style="float:left;">후기 4개</h4>
                <div style="text-align: right; padding-right: 20px;"><img src="../../resources/images/member/array.png" style="height: 13px"> &nbsp;정렬 &nbsp;&nbsp;
                    <a href="" style="text-decoration: none; color:gray">추천순</a> | 
                    <a href="" style="text-decoration: none; color:gray">별점순</a> | 
                    <a href="" style="text-decoration: none; color:gray">최신순</a>
                </div>
                <br>
                <div> 
                    <img src="../../resources/images/temp/dog3.jpg" style="height: 170px; width: 170px; float: left; padding:15px;" >
                    <br>
                    <span style="float:left"><b>논현동 강개순 님</b></span>
                    <div id="starList"> &nbsp;&nbsp;
                      <span>&#9734;</span><span>&#9734;</span><span>&#9734;</span><span>&#9734;</span><span>&#9734;</span>
                      </div>
                    <div style="text-align: right; white-space:pre-line;  padding-right: 30px;">2021-05-02 작성</div>
                    <div style="white-space:pre-line; text-align:left; margin-bottom:30px; padding-left:180px;" > 
                        진짜 너무너무 맡기길 잘한거 같아요 !!
                    </div> 

                    <div class="balloon" style="white-space:pre-line; padding: 0 0 30px 30px;">
                        <b>펫시터 강보람님의 댓글</b><br>
                        좋은 후기 남겨주셔서 감사합니당 !!
                        강아지가 너무 순하고 착해서 맡는 동안 행복했어요
                        앞으로도 위탁할 일 있으면 꼭 찾아주세요
                    </div>
        
                </div>
                <div> 
                    <img src="../../resources/images/temp/dog3.jpg" style="height: 170px; width: 170px; float: left; padding:15px;" >
                    <br>
                    <span style="float:left"><b>논현동 강개순 님</b></span>
                    <div id="starList"> &nbsp;&nbsp;
                      <span>&#9734;</span><span>&#9734;</span><span>&#9734;</span><span>&#9734;</span><span>&#9734;</span>
                      </div>
                    <div style="text-align: right; white-space:pre-line;  padding-right: 30px;">2021-05-02 작성</div>
                    <div style="white-space:pre-line; text-align:left; margin-bottom:30px; padding-left:180px;" > 
                        진짜 너무너무 맡기길 잘한거 같아요 !!
                    </div> 

                    <div class="balloon" style="white-space:pre-line; padding: 0 0 30px 30px;">
                        <b>펫시터 강보람님의 댓글</b><br>
                        좋은 후기 남겨주셔서 감사합니당 !!
                        강아지가 너무 순하고 착해서 맡는 동안 행복했어요
                        앞으로도 위탁할 일 있으면 꼭 찾아주세요
                    </div>
        
                </div>
                <div> 
                    <img src="../../resources/images/temp/dog3.jpg" style="height: 170px; width: 170px; float: left; padding:15px;" >
                    <br>
                    <span style="float:left"><b>논현동 강개순 님</b></span>
                    <div id="starList"> &nbsp;&nbsp;
                      <span>&#9734;</span><span>&#9734;</span><span>&#9734;</span><span>&#9734;</span><span>&#9734;</span>
                      </div>
                    <div style="text-align: right; white-space:pre-line;  padding-right: 30px;">2021-05-02 작성</div>
                    <div style="white-space:pre-line; text-align:left; margin-bottom:30px; padding-left:180px;" > 
                        진짜 너무너무 맡기길 잘한거 같아요 !!
                    </div> 

                    <div class="balloon" style="white-space:pre-line; padding: 0 0 30px 30px;">
                        <b>펫시터 강보람님의 댓글</b><br>
                        좋은 후기 남겨주셔서 감사합니당 !!
                        강아지가 너무 순하고 착해서 맡는 동안 행복했어요
                        앞으로도 위탁할 일 있으면 꼭 찾아주세요
                    </div>
                </div>
                <BR>
                <div style="text-align:center">
                <button type="button" class="btn btn-secondary" style="width:30%;">후기 더 보기</button></div>
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
            
          <button type="button" class="btn btn-primary" style="width:200px;margin-bottom:5px" onclick="like();"><div id="likeImgDiv"><img src="../../resources/images/member/justHeart.png" class="buttonImg">&nbsp;&nbsp;&nbsp;즐거찾기에 추가</div></button><br>
          <button type="button" class="btn btn-primary" style="width:200px;margin-bottom:5px" data-toggle="modal" data-target="#copyUrl"><img src="../../resources/images/member/share.png" class="buttonImg">&nbsp;&nbsp;&nbsp;공유하기</button><br>
          <button type="button" class="btn btn-primary" style="width:200px;margin-bottom:5px" onclick="location.href='<%=contextPath%>/views/memboard/askToPetsitterList.jsp'"><img src="../../resources/images/member/messenger.png" class="buttonImg">&nbsp;&nbsp;&nbsp;펫시터에게 문의하기</button><br>
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
          <div style="border:1px solid lightgray;"><%@ include file = "../member/ableDate.jsp" %></div>
        
        <br>
        <!--예약 area-->
          <div style="text-align:center;"><hr>
            <div style="text-align: left;">
            <h6>예약 하기</h6><br></div>
                <h6>체크인날짜&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 체크아웃날짜</h6>
                <div><%@ include file = "../member/ableShownDate.jsp" %></div>
                <br>
                    <div style="float: left; margin-left:45px;">
                      위탁할시간<br>
                      <div style="border:1px solid lightgray; padding:5px 20px 5px 20px; text-align: center; margin-top:10px" >오전8시</div>
                    </div>          
                    <div class="form-group" style="margin-left:160px; text-align: left;">&nbsp;
                      찾아올시간<br>
                      <div style="border:1px solid lightgray; padding:5px 20px 5px 20px; text-align: center; margin-top:10px; width:100px;" >오전8시</div>
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
                
               
                <button type="button" class="btn btn-danger" style="width:200px;margin-bottom:5px" onclick="location.href='<%=contextPath%>/views/research/reserveProceed.jsp'">&nbsp;&nbsp;&nbsp;예약하기</button><br>
              </div>
            </div>
          <hr>
          <!--지도 area-->
          <div style="text-align: left;">
            <h6>펫시터님의 위치</h6><br>
            <%@ include file = "map.jsp" %>   
          </div>
      </div>


    <script>
          //즐겨찾기 하트 바꾸기
          var temp=0;
          function like(){
            if(temp==0){
              $("#likeImgDiv").html('<img src="../../resources/images/member/favoriteHeart.png" class="buttonImg">&nbsp;&nbsp;&nbsp;즐거찾기 추가됨');
              temp++;
            }else{
              $("#likeImgDiv").html('<img src="../../resources/images/member/justHeart.png" class="buttonImg">&nbsp;&nbsp;&nbsp;즐거찾기에 추가');
              temp--;
            }
          }
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
  </div>  <br clear="both">
  <!--오른쪽면 끝-->
</div>


<%@ include file = "../common/footer.jsp" %>


</body>
</html>