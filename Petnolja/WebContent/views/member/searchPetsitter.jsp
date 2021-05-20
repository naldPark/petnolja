<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>펫시터</title>
<style>

        .wrap>*{
            box-sizing:border-box;
        }
        #outer{
          width:1400px;
          height: 1600px;
          margin:auto;
          position:relative;
          font-family:'Noto Sans KR', sans-serif !important;
          
        }
          .wrap{
            width:100%;
            margin:auto;
        }
        .wrap1{height:17%;}
        .wrap1>div{float:left; height:100%; text-align: center;}
      
        .recommendList{
          box-shadow:5px 5px 10px 5px gray;
          cursor: pointer;
        }
        .recommendList:hover{background-color: rgb(245, 245, 245);}
        #starList{font-size: 13pt;  letter-spacing :2px;} 
</style>

</head>
<body>
	<%@ include file="../common/menubar.jsp" %>


<div id="outer"><br><br>
  <%@ include file = "loginBar.jsp" %>

    <!-- 추천리스트 시작 -->
  <div class="wrap wrap2" style="width:1000px;">
    <div style="text-align:left; margin-bottom:30px; padding-left:20px; padding-right:20px;" > 
      <br>

      <div style="text-align: right; padding-right: 20px;"><img src="../../resources/images/member/array.png" style="height: 13px"> &nbsp;정렬 &nbsp;&nbsp;
          <a href="" style="text-decoration: none; color:gray">별점순</a> | 
          <a href="" style="text-decoration: none; color:gray">가격순</a> | 
          <a href="" style="text-decoration: none; color:gray">거리순</a> | 
          <a href="" style="text-decoration: none; color:gray">최신순</a>
      </div>
      <br>
            <!-- 펫시터 소개 박스 -->

      <div class="recommendList" onclick="location.href='searchPetsitterDetail.jsp'"> 

        <br>
          <img src="../../resources/images/temp/petsitter1.jpg" style="height: 200px;float: left; padding:15px; margin-bottom: 30px;" >
          <br>
          <h3>한강산책 가능한 펫시터</h3>
          <hr width="900px"> 

          <div style=" text-align:left; margin-bottom:30px; float:left;" > 
              <span>자차 픽업 가능, 목욕 가능, 응급상황시 인근 병원 이동 가능<br>뭐뭐가능          </span><br><br>
              <div id="starList">
                <span>&#9734;</span><span>&#9734;</span><span>&#9734;</span><span>&#9734;</span><span>&#9734;</span>
                </div>
        </div> 
        <div style="text-align:right;padding-bottom: 50px; padding-right: 30px;">
        <h5>45,000원&nbsp;&nbsp;<span class="badge badge-pill badge-secondary"> 1 박 </span></h5>
        <h5>30,000원&nbsp;&nbsp;<span class="badge badge-pill badge-secondary"> 하루 </span></h5>
        </div>
        <br>
      </div>
      <br><br>
      <div class="recommendList"> 
        <br>
          <img src="../../resources/images/temp/petsitter2.jpg" style="height: 200px;float: left; padding:15px; margin-bottom: 30px;" >
          <br>
          <h3>한강산책 가능한 펫시터</h3>
          <hr width="900px"> 

          <div style=" text-align:left; margin-bottom:30px; float:left;" > 
              <span>자차 픽업 가능, 목욕 가능, 응급상황시 인근 병원 이동 가능<br>뭐뭐가능          </span><br><br>
              <div id="starList">
                <span>&#9734;</span><span>&#9734;</span><span>&#9734;</span><span>&#9734;</span><span>&#9734;</span>
                </div>
        </div> 
        <div style="text-align:right;padding-bottom: 50px; padding-right: 30px;">
        <h5>45,000원&nbsp;&nbsp;<span class="badge badge-pill badge-secondary"> 1 박 </span></h5>
        <h5>30,000원&nbsp;&nbsp;<span class="badge badge-pill badge-secondary"> 하루 </span></h5>
        </div>
        <br>
      </div>
      <br><br>
      <div class="recommendList"> 
        <br>
          <img src="../../resources/images/temp/petsitter3.jpg" style="height: 200px;float: left; padding:15px; margin-bottom: 30px;" >
          <br>
          <h3>한강산책 가능한 펫시터</h3>
          <hr width="900px"> 

          <div style=" text-align:left; margin-bottom:30px; float:left;" > 
              <span>자차 픽업 가능, 목욕 가능, 응급상황시 인근 병원 이동 가능<br>뭐뭐가능          </span><br><br>
              <div id="starList">
                <span>&#9734;</span><span>&#9734;</span><span>&#9734;</span><span>&#9734;</span><span>&#9734;</span>
                </div>
        </div> 
        <div style="text-align:right;padding-bottom: 50px; padding-right: 30px;">
        <h5>45,000원&nbsp;&nbsp;<span class="badge badge-pill badge-secondary"> 1 박 </span></h5>
        <h5>30,000원&nbsp;&nbsp;<span class="badge badge-pill badge-secondary"> 하루 </span></h5>
        </div>
        <br>
      </div>
      <br><br>
      <div class="recommendList"> 
        <br>
          <img src="../../resources/images/temp/petsitter4.jpg" style="height: 200px;float: left; padding:15px; margin-bottom: 30px;" >
          <br>
          <h3>한강산책 가능한 펫시터</h3>
          <hr width="900px"> 

          <div style=" text-align:left; margin-bottom:30px; float:left;" > 
              <span>자차 픽업 가능, 목욕 가능, 응급상황시 인근 병원 이동 가능<br>뭐뭐가능          </span><br><br>
              <div id="starList">
                <span>&#9734;</span><span>&#9734;</span><span>&#9734;</span><span>&#9734;</span><span>&#9734;</span>
                </div>
        </div> 
        <div style="text-align:right;padding-bottom: 50px; padding-right: 30px;">
        <h5>45,000원&nbsp;&nbsp;<span class="badge badge-pill badge-secondary"> 1 박 </span></h5>
        <h5>30,000원&nbsp;&nbsp;<span class="badge badge-pill badge-secondary"> 하루 </span></h5>
        </div>
        <br>
      </div>
      <br><br>
      <ul class="pagination pagination justify-content-center">
        <li class="page-item"><a class="page-link" href="#">이전</a></li>
        <li class="page-item"><a class="page-link" href="#">1</a></li>
        <li class="page-item active"><a class="page-link" href="#">2</a></li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item"><a class="page-link" href="#">다음</a></li>
      </ul>
    </div>
  </div>
    


</div><br><br><br><br><br><br><br><br><br><br><br>  <br clear="both">
<%@ include file = "../common/footer.jsp" %>
</body>
</html>