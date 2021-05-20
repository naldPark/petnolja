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
        #mainPage{
          width:1400px;
          height: 1600px;
          margin:auto;
          position:relative;
          font-family:'Noto Sans KR', sans-serif !important;
          
        }
        .wrap{width:100%; margin:auto;}
        .wrap1{height:17%;}
        .wrap2{height:30%;}
        .wrap3{height:23%;
        background-image: url("resources/images/member/petsittingPromo.PNG") ;
        background-repeat: no-repeat;
        background-position: center;
        }
        .wrap4{height:22%;}
        .wrap>div{float:left; height:100%; text-align: center;}
             
        .recommend{
        position:relative;
            width:250px;
            height:250px;
            overflow: hidden;
            float: left;
            margin-right: 15px;
            margin-left: 15px;
       }
   
       .recommend img:hover{ cursor:pointer;
        opacity:0.7;}
       .recommend img{height: 250px; 
        position: absolute;
            top: -9999px;
            left: -9999px;
            right: -9999px;
            bottom: -9999px;
            margin: auto;
       }
       .wrap3>*{color:rgb(230, 230, 230);}
       .carousel-inner img {width: 30%; height: 100%;}
        .carousel-item h3{color:black!important;  text-align: left; font-size:17pt;}
        .carousel-item p{color:gray!important; text-align: left; font-size:14pt;}
        .reviewImg{
          float: left; 
          margin-left: 200px;
          margin-right: 50px;
        }
        .recommendTitle{width:250px; height:55px; overflow: hidden; word-break:break-all; float: left;  margin-inline: 15px;}
        
      
</style>

</head>
<body>
 <%@ include file = "views/common/menubar.jsp" %>

 <br>
<div id="mainPage"><br>
  <%@ include file = "views/member/loginBar.jsp" %>

    <!-- 추천리스트 시작 -->
  <div class="wrap wrap2">
    <br><hr><br>
    <h2><b>&nbsp;&nbsp;펫놀자가 엄선한 추천리스트</b></h2><br>
    
    <div style="width:100%; height:80%;">
      <div class="recommend"><a href="<%=contextPath%>/views/member/searchPetsitterDetail.jsp"><img src="resources/images/temp/petsitter1.jpg"></a></div>
      <div class="recommend"> <a href="<%=contextPath%>/views/member/searchPetsitterDetail.jsp"><img src="resources/images/temp/petsitter2.jpg"></a></div>
      <div class="recommend"> <a href="<%=contextPath%>/views/member/searchPetsitterDetail.jsp"><img src="resources/images/temp/petsitter3.jpg"></a></div>
      <div class="recommend"> <a href="<%=contextPath%>/views/member/searchPetsitterDetail.jsp"><img src="resources/images/temp/petsitter4.jpg"></a></div>
      <div class="recommend"> <a href="<%=contextPath%>/views/member/searchPetsitterDetail.jsp"><img src="resources/images/temp/petsitter5.jpg"></a></div>
      <div class="recommendTitle" >펫시터 만렙입니다</div>
      <div class="recommendTitle" >저한테 맡겨여</div>
      <div class="recommendTitle" >흠흠흠ㅎ므</div>
      <div class="recommendTitle" >맡기든가</div>
      <div class="recommendTitle" >같이 키울래여 ?</div>
    </div> 

  </div>
  <hr><br><br>
      <!-- 추천리스트 끝 -->
      <!-- 펫시터지원광고 시작 -->
  <div class="wrap wrap3">
    <div style="margin-top:50px; margin-left: 900px;">
      <br><br>
      <h2>내 인생의 새로운 도전 . .</h2>
      <h2>펫시터가 되어 보실래요 ?</h2><br>
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
      <button type="button" class="btn btn-light btn-lg" >펫시터 지원하기</button>
   </div>
  </div><br><br>
  <hr><br><br>
     <!-- 펫시터지원광고 끝 -->
     <!-- 펫놀자 후기 시작 -->
  <div class="wrap wrap4">
     <h2><b>&nbsp;&nbsp;펫놀자 고객님들의 후기</b></h2><br><br>

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
          <img src="resources/images/temp/dog2.jpg" class="reviewImg">
            <h3><br>너무 만족합니다</h3><br>
            <p>뭉뭉이가 아주 푹쉬다가요 !!!</p>
        </div>
        <div class="carousel-item">
          <img src="resources/images/temp/dog2.jpg" class="reviewImg">
            <h3><br>너무 만족합니다</h3><br>
            <p>뭉뭉이가 아주 푹쉬다가요 !!!</p> 
        </div>
        <div class="carousel-item">
          <img src="resources/images/temp/dog2.jpg" class="reviewImg">
            <h3><br>너무 만족합니다</h3><br>
            <p>뭉뭉이가 아주 푹쉬다가요 !!!</p> 
        </div>
        <div class="carousel-item">
          <img src="resources/images/temp/dog2.jpg" class="reviewImg">
            <h3><br>너무 만족합니다</h3><br>
            <p>뭉뭉이가 아주 푹쉬다가요 !!!</p>   
        </div>
        <div class="carousel-item">
          <img src="resources/images/temp/dog2.jpg" class="reviewImg">
            <h3><br>너무 만족합니다</h3><br>
            <p>뭉뭉이가 아주 푹쉬다가요 !!!</p> 
        </div>
        <div class="carousel-item">
          <img src="resources/images/temp/dog2.jpg" class="reviewImg">
            <h3><br>너무 만족합니다</h3><br>
            <p>뭉뭉이가 아주 푹쉬다가요 !!!</p>
        </div>
        <a class="carousel-control-prev" href="#demo" data-slide="prev">
          <span><img src="resources/images/member/left-arrow.png" width="70"></span>
        </a>
        <a class="carousel-control-next" href="#demo" data-slide="next">
          <span><img src="resources/images/member/right-arrow.png" width="70"></span>
        </a>
      </div>
    </div>
    
  </div>

     <!-- 펫놀자 후기 끝 -->


</div><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<%@ include file = "views/common/footer.jsp" %>
</body>
</html>