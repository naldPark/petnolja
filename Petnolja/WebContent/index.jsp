<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page  import ="java.util.ArrayList, 
   com.petnolja.research.model.vo.Review, com.petnolja.petsitter.model.vo.Sitter" %>
<%
   ArrayList<Sitter>sitterList = (ArrayList<Sitter>)session.getAttribute("sitterList");
   ArrayList<Review>reviewList = (ArrayList<Review>)session.getAttribute("reviewList");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="<%=request.getContextPath()%>/resources/images/favicon.ico" type="image/x-icon" />
<link rel="icon" href="<%=request.getContextPath()%>/resources/images/favicon.ico" type="image/x-icon" />
<title>펫놀자</title>
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
        .wrap2{height:30%;}
        .wrap3{height:23%;
        background-image: url("resources/images/member/petsittingPromo.PNG") ;
        background-repeat: no-repeat;
        background-position: center;
        }
        .wrap4{height:22%;}
        .wrap>div{float:left; text-align: center;}
             
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
       .carousel-item h3{color:black!important;  text-align: left; font-size:17pt;}
       .carousel-item p{color:gray!important; height: 110px; text-align: left; font-size:14pt; padding-right:220px; word-break:break-all; overflow:hidden;}
       .reviewImg{
          float: left; 
          width: 300px; height: 250px;
          margin-left: 250px;
          margin-right: 50px;
       }
        .recommendTitle{width:250px; height:55px; overflow: hidden; word-break:break-all; float: left;  margin-inline: 15px;}
</style>

</head>
<body>
<%if(sitterList==null||reviewList==null){ %>
 <jsp:forward page="index.mem"/>
 <%} %>
 <%@ include file = "views/common/menubar.jsp" %>

 <br>
<div id="mainPage"><br>
  <%@ include file = "views/member/loginBar.jsp" %>

    <!-- 추천리스트 시작 -->
  <div class="wrap wrap2">
    <hr><br>
    <h2><b>&nbsp;&nbsp;펫놀자가 엄선한 추천리스트</b></h2><br>
    
    <div style="width:100%; height:80%;">
       <% if(sitterList.isEmpty()){ %>
          <br>조회된 리스트가 없습니다.<br><br><br>
                  
       <% }else { %>
             <% for(Sitter s : sitterList){ %>
               <div class="recommend"><a href="<%=contextPath%>/searchSitterDetail.mem?sno=<%=s.getSitterNo()%>&rw=star"><img src="<%=s.getPath() %>"></a></div>
          <% } %>
          <% for(Sitter s : sitterList){ %>
               <div class="recommendTitle" ><%=s.getSitterTitle() %></div>
           <% } %>
        <% } %>       
    </div> 

  </div>
  <hr><br>
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
   <% if(reviewList.isEmpty()){ %>
      <br>조회된 리스트가 없습니다.<br><br><br>
                  
    <% }else { %>
    <div id="demo" class="carousel slide" data-ride="carousel">
      <ul class="carousel-indicators">
        <li data-target="#demo" data-slide-to="0" class="active"></li>
        <li data-target="#demo" data-slide-to="1"></li>
        <li data-target="#demo" data-slide-to="2"></li>
        <li data-target="#demo" data-slide-to="3"></li>
        <li data-target="#demo" data-slide-to="4"></li>
        <li data-target="#demo" data-slide-to="5"></li>
      </ul>
      <div class="carousel-inner"  style="width: 1400px;">
        <div class="carousel-item active">
          <img src="<%=reviewList.get(0).getPath()%>" class="reviewImg">
 
            <h3><br><b><%=reviewList.get(0).getMemName()%></b> 회원님의 후기입니다</h3><br>
            <p><%=reviewList.get(0).getReviewContent()%></p>

        </div>
        <% for(int i = 1; i<reviewList.size(); i++){ %>
        <div class="carousel-item">
          <img src="<%=reviewList.get(i).getPath()%>" class="reviewImg">
            <h3><br><b><%=reviewList.get(i).getMemName()%></b> 회원님의 후기입니다</h3><br>
            <p><%=reviewList.get(i).getReviewContent()%></p> 
        </div>
        <% } %>
       
        <a class="carousel-control-prev" href="#demo" data-slide="prev">
          <span><img src="resources/images/member/left-arrow.png" width="70"></span>
        </a>
        <a class="carousel-control-next" href="#demo" data-slide="next">
          <span><img src="resources/images/member/right-arrow.png" width="70"></span>
        </a>
      </div>
    </div>
    <% } %>  
  </div>

     <!-- 펫놀자 후기 끝 -->


</div><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
<%@ include file = "views/common/footer.jsp" %>
</body>
</html>