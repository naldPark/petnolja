<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList, com.petnolja.pet.model.vo.Pet,com.petnolja.research.model.vo.*" %>
  <%
    Research sitterInfo = (Research)request.getAttribute("sitterInfo");
 	  ArrayList<Pet> petList = (ArrayList<Pet>)request.getAttribute("petList");
 	  String[] sitterPic = (String[])request.getAttribute("sitterPic");
 	  int maxPage = (Integer)request.getAttribute("maxPage");
  	ArrayList<Review> rwList = (ArrayList<Review>)request.getAttribute("rwList");
  %>
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
	<%@ include file="../common/menubar.jsp" %>
 <br>

<div id="outer">

    <!--사진슬라이드-->
  <div class="wrap1">

		<% for(int i=1 ; i<sitterPic.length ; i++){  %>
          <img src="<%=contextPath%>/<%=sitterPic[i]%>" class="sitterImg">
		<%} %>

  </div>

  <!--왼쪽면-->
  <div class="wrap wrap2">
      <!--펫시터소개 제목-->
      <hr>
      <div style="height:200px; text-align: center;"> 
        <img src="<%=contextPath%>/<%=sitterPic[0]%>" style="height: 200px; float: left; padding:15px;" >
        <br><br><br>
        <h3><%=sitterInfo.getSitterTitle()%></h3><br>
        <span style="padding-left:500px">펫시터 <%=sitterInfo.getSitterName()%></span>
      </div>
      <!--펫시터 자기소개-->
      <hr>
      <div style="white-space:pre-line; text-align:left; margin-bottom:30px; padding-left:20px; padding-right:20px; border:1px solid gray;" > 
            <%=sitterInfo.getSitterContent()%><br>
      </div> 

      <!--시팅 금액-->
      <div style="height:200px; text-align:left; margin-bottom:30px;  padding-left:20px; border:1px solid gray;" > 
            <br>
            <h4>시팅 금액</h4><br>
                <ul id="weight">
                    <li style="list-style-type:none; color:gray"><br>1박케어<br>데이케어</li>
                    <li>소형견<br><span><%=sitterInfo.getSmallNightFee()%>원</span><br><span><%=sitterInfo.getSmallDayFee()%>원</span></li>
                    <li>중형견<br><span><%=sitterInfo.getMidNightFee()%>원</span><br><span><%=sitterInfo.getMidDayFee()%>원</span></li>
                    <li>대형견<br><span><%=sitterInfo.getBigNightFee()%>원</span><br><span><%=sitterInfo.getBigDayFee()%>원</span></li>
                </ul>
      </div> 

      <!--자격 현황-->
      <div style="text-align:left; margin-bottom:30px;  padding-left:20px; border:1px solid gray;" > 
        <br>
        <h4>펫시터 경력</h4><br>
            <ul id="">
                <li>교육: <%=sitterInfo.getLicense()%></li><br>
                <li>반려견 케어 기간: <%=sitterInfo.getPetPeriod()%></li><br>
                <li>펫시터 활동 기간: <%=sitterInfo.getExperience()%></li><br>
            </ul>
      </div> 

      <!--지원 사항-->
      <div style="text-align:left; margin-bottom:10px;  padding-left:20px; border:1px solid gray;" > 
        <br>
        <h4>지원 사항</h4><br>
        <div id="searchCheckbox" style="padding-left:20px">
            <input class="largerCheckbox" type="checkbox" name="pickup" id="pickup" checked="checked" disabled="disabled">&nbsp;&nbsp; <label for="pickup">자차 픽업 가능
            <span><img src="<%=contextPath%>/resources/images/member/checkboxPickup.png" style="height: 30px"></span></label>
            <span style="margin:20px;"></span>
            <input class="largerCheckbox" type="checkbox" name="bath" id="bath" checked="checked" disabled="disabled">&nbsp;&nbsp;<label for="bath">목욕 가능
            <span><img src="<%=contextPath%>/resources/images/member/checkboxBath.png" style="height: 30px"></span></label>
            <span style="margin:20px;"></span>
            <input class="largerCheckbox" type="checkbox"  name="medicine" id="medicine" disabled="disabled">&nbsp;&nbsp;<label for="medicine">약물 복용
            <span><img src="<%=contextPath%>/resources/images/member/checkboxMedicine.png" style="height: 30px" ></span></label><br><br>
            <input class="largerCheckbox" type="checkbox"  name="oldPet" id="oldPet" checked="checked" disabled="disabled">&nbsp;&nbsp;<label for="oldPet">노령견 케어 가능
            <span><img src="<%=contextPath%>/resources/images/member/checkboxOldpet.png" style="height: 30px"></span></label>
            <span style="margin:20px;"></span>
            <input class="largerCheckbox" type="checkbox" name="hospital" id="hospital" checked="checked" disabled="disabled">&nbsp;&nbsp;<label for="hospital">응급상황시 인근 병원 이동 가능
            <span><img src="<%=contextPath%>/resources/images/member/checkboxHospital.png" style="height: 30px"></span></label>
            <br><br>
        </div>
       </div> 

      <!--펫놀자 후기-->
           <div style="text-align:left; margin-bottom:30px; padding-left:20px;" > 
                <br>
                <h4 style="float:left;">후기 <%=rwList.size()%>개</h4>
                <div style="text-align: right; padding-right: 20px;"><img src="<%=contextPath%>/resources/images/member/array.png" style="height: 13px"> &nbsp;정렬 &nbsp;&nbsp;
                    <a href="" style="text-decoration: none; color:gray">추천순</a> | 
                    <a href="" style="text-decoration: none; color:gray">별점순</a> | 
                    <a href="" style="text-decoration: none; color:gray">최신순</a>
                </div>
                <br>
                <% for(Review rw : rwList){ %>
                <div> 
                    <%if(rw.getPath()==null){%>
                    <img src="<%=contextPath%>/resources/images/member/welcome.png" class="reviewImg" > 
                    <%}else{%>
                    <img src="<%=contextPath%>/<%=rw.getPath()%>" class="reviewImg" >
                    <% }%>
                    <br>
                    <span style="float:left"><b><%=rw.getMemName()%> 님</b></span>
                    <div class="starList"> &nbsp;&nbsp;<% for(int i=0 ; i<rw.getReviewRating(); i++){ %>&#9733;<%}%></div>
                    <div class ="reviewDate"><%=rw.getReviewDate()%> 작성</div>
                    <div class="reviewContent"><%=rw.getReviewContent()%></div>
			       	     	<% if(rw.getReviewReplyContent()!=null){%>
                    <div class="balloon"><br><b>펫시터 <%=sitterInfo.getSitterName()%> 님의 댓글</b><br><%=rw.getReviewReplyContent()%></div>
                    <%} else{%><div class="balloonNo"></div>
                    <%} %>                  
                </div>               
                <%} %>

                <div style="text-align:center" id="resultEnd"><br>
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
            <div id="likeImgDiv" value=<%=sitterInfo.getSitterNo()%>>
              <img src="<%=contextPath%>/resources/images/member/justHeart.png" class="buttonImg">&nbsp;&nbsp;&nbsp;즐거찾기에 추가
            </div>
          </button><br>
          <button type="button" class="btn btn-primary" style="width:200px;margin-bottom:5px" data-toggle="modal" data-target="#copyUrl">
            <img src="<%=contextPath%>/resources/images/member/share.png" class="buttonImg">&nbsp;&nbsp;&nbsp;공유하기
          </button><br>
          <button type="button" class="btn btn-primary" style="width:200px;margin-bottom:5px" onclick="location.href='<%=contextPath%>/views/memboard/askToPetsitterList.jsp'"><img src="<%=contextPath%>/resources/images/member/messenger.png" class="buttonImg">&nbsp;&nbsp;&nbsp;펫시터에게 문의하기</button><br>
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
          <div style="border:1px solid lightgray;"><%@ include file = "ableDate.jsp" %></div>
        
        <br>
        <!--예약 area-->
          <div style="text-align:center;"><hr>
            <div style="text-align: left;">
            <h6>예약 하기</h6><br></div>
                <h6>체크인날짜&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 체크아웃날짜</h6>
                <div><%@ include file = "ableShownDate.jsp" %></div>
                <br>
                    <div style="float: left; margin-left:45px;">
                      위탁할시간<br>
                      <div style="border:1px solid lightgray; padding:5px 20px 5px 20px; text-align: center; margin-top:10px;width:100px;" ><%=sitterInfo.getCheckin()%>시</div>
                    </div>          
                    <div class="form-group" style="margin-left:160px; text-align: left;">&nbsp;
                      찾아올시간<br>
                      <div style="border:1px solid lightgray; padding:5px 20px 5px 20px; text-align: center; margin-top:10px; width:100px;" ><%=sitterInfo.getCheckout()%>시</div>
                    </div>
    	  </div>
           <br>
        <div style="text-align:center;"><hr>
              <div style="text-align: left;">
              <h6>맡기시는 반려동물</h6><br></div>

              <% if(petList.isEmpty()){ %>    
              <% }else { %>
                   <% for(Pet p : petList){ %>
              <div style="height: 60px; border:1px solid red">	
                <div style="float:left; padding-left: 10px;">
                <input type="checkbox" class="largerCheckbox">  
                <img src="<%=contextPath%>/resources/images/temp/dog5.jpg" style="height:60px; padding-left:20px;"></div>
                <div style="padding-left:20px;">
                  &nbsp;&nbsp;&nbsp;&nbsp;
                  <span><%=p.getPetName()%></span><br>
                  <span>소형 / 여 / 3살</span>
                </div>
                <br>
              </div>
              <% } %>
              <br>
              <button type="button" class="btn btn-danger" style="width:200px;margin-bottom:5px" onclick="location.href='<%=contextPath%>/views/research/reserveProceed.jsp'">&nbsp;&nbsp;&nbsp;예약하기</button><br>
     
               
              <% } %>

            </div><hr>
        
        <!--지도 area-->
        <div style="line-height:190%; padding-right:20px; padding-left:20px">
        <h6>펫시터님의 위치</h6><br>
               <%@ include file = "map.jsp" %>
        </div>	

    </div>


	<script>
    var page = 2;
    var no = <%=sitterInfo.getSitterNo()%>;
$("#moreReview").click(function(){ 
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
					for(var i=0; i<list.length; i++){
            var star = "";
            var balloon = "";
            for(var j=0 ; j <list[i].reviewRating; j++){star += "&#9733";}
            if(list[i].path==null){list[i].path="resources/images/member/welcome.png"}
            if(list[i].reviewReplyContent!=null){
              balloon ="<div class='balloon'><br><b>펫시터 <%=sitterInfo.getSitterName()%> 님의 댓글</b><br>"
                      +list[i].reviewReplyContent+"</div>"
            } else {
              balloon ="<div class='balloonNo'><br></div>"
            }

          result += "<div>"
                       +"<img src='<%=contextPath%>/" + list[i].path + "' class='reviewImg'>"
                      + "<br><span style='float:left'><b>"+ list[i].memName+ "님</b></span>"
                      + "<div class='starList'> &nbsp;&nbsp; " + star +"</div>"
                      + "<div class ='reviewDate'>"+list[i].reviewDate+" 작성</div>"
                      + "<div class='reviewContent'>"+list[i].reviewContent+"</div>"
                      +balloon
                      +"</div>"
                }
                $(result).insertBefore("#resultEnd");
                if(<%=maxPage%>==page){
                $("#moreReview").hide();
                }
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


      var favor = <%=sitterInfo.getFavor()%>;
			var likeS = '<img src="<%=contextPath%>/resources/images/member/favoriteHeart.png" class="buttonImg">&nbsp;&nbsp;&nbsp;즐거찾기 추가됨'
			var unlikeS = '<img src="<%=contextPath%>/resources/images/member/justHeart.png" class="buttonImg">&nbsp;&nbsp;&nbsp;즐거찾기에 추가'
      $(document).ready(function(){
       if(favor!=0){
        $("#likeImgDiv").html(likeS);
       } else {
        $("#likeImgDiv").html(unlikeS);
       }
       

     })

		function like(){
      <%if(loginUser!=null){%>
          $.ajax({
            url:"changeFavorite.mem",
            data:{
              sitterNo:$("#likeImgDiv").attr("value")
            },
            type:"post",
            success:function(result){			
              if(result>1){
                $("#likeImgDiv").html(unlikeS);
              }else{
                $("#likeImgDiv").html(likeS);
              }
            },error:function(){
              console.log("ajax통신 실패");
            }
          });
            
      <%}else{%>
        window.alert("로그인 후 이용 가능합니다");
      <%}%>
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


    </script>
   <br clear="both">
  <!--오른쪽면 끝-->
</div>


<%@ include file = "../common/footer.jsp" %>


</body>
</html>