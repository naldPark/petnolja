<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫놀자</title>
<style>
        #outer{
          width:1000px;
          margin:auto;
          position:relative;
          font-family:'Noto Sans KR', sans-serif !important;
          border:1px solid lightgray;
          padding: 15px;
        }
        .reserveImg{
            position:relative;
            width:150px;
            height:150px;
            overflow: hidden;
            float: left;
            margin-right: 20px;
            }
        .reserveImg>img{
            position: absolute;
            top: -9999px;
            left: -9999px;
            right: -9999px;
            bottom: -9999px;
            margin: auto;
            }
        #linkList>a{
            text-decoration: underline;
            color: gray;
        }
        #linkList>a>span{
            font-size:12pt;
            line-height: 35px;
        }
        .likeImgDiv img:hover{cursor: pointer; opacity:0.7; }
       
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
<br><br>
 <div id="outer">
    <br>
        
        <h3>즐겨찾기조회</h3>   
        <br><br>


       <!-- 즐겨찾기 리스트 시작-->
      <div style="margin-bottom:30px; padding-left:20px; padding-top:15px; background-color: rgb(230, 240, 247); height:180px;" > 
        <div class="reserveImg"><img src="../../resources/images/temp/petsitter3.jpg" style="height: 150px;"></div>
        <div style="float:left;">
            <br>
            <h6><b>정성을 다해 사랑으로 돌봐드려요</b></h6><br>
            <span>작성일 : 2020-01-01</span><br>
            <span>펫시터: 고길동</span><br>
        </div>
        <div id="linkList" style="padding-left:800px; text-align: center;">
            <br>
            <a href="../research/searchPetsitterDetail.jsp"><span>자세히보기</span></a><br><br>
            <div class="likeImgDiv"><img src="../../resources/images/member/favoriteHeart.png"></div><br>
        </div>
      </div>

    

      <div style="margin-bottom:30px; padding-left:20px; padding-top:15px; background-color: rgb(230, 240, 247); height:180px;" > 
        <div class="reserveImg"><img src="../../resources/images/temp/petsitter1.jpg" style="height: 150px;"></div>
        <div style="float:left;">
            <br>
            <h6><b>정성을 다해 사랑으로 돌봐드려요</b></h6><br>
            <span>작성일 : 2020-01-01</span><br>
            <span>펫시터: 고길동</span><br>
        </div>
        <div id="linkList" style="padding-left:800px; text-align: center;">
            <br>
            <a href="../research/searchPetsitterDetail.jsp"><span>자세히보기</span></a><br><br>
            <div class="likeImgDiv"><img src="../../resources/images/member/favoriteHeart.png"></div><br>
        </div>
      </div>

      <div style="margin-bottom:30px; padding-left:20px; padding-top:15px; background-color: rgb(230, 240, 247); height:180px;" > 
        <div class="reserveImg"><img src="../../resources/images/temp/petsitter2.jpg" style="height: 150px;"></div>
        <div style="float:left;">
            <br>
            <h6><b>정성을 다해 사랑으로 돌봐드려요</b></h6><br>
            <span>작성일 : 2020-01-01</span><br>
            <span>펫시터: 고길동</span><br>
        </div>
        <div id="linkList" style="padding-left:800px; text-align: center;">
            <br>
            <a href="../research/searchPetsitterDetail.jsp"><span>자세히보기</span></a><br><br>
            <div class="likeImgDiv"><img src="../../resources/images/member/favoriteHeart.png"></div><br>
        </div>
      </div>

      <!-- 즐겨찾기 리스트 끝-->
      
             <ul class="pagination justify-content-center">
                <li class="page-item"><a class="page-link" href="#">&lt;</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
              </ul>

  </div> 
        
  <div class="modal cancelBtn">
    <div class="modal-dialog">
      <div class="modal-content" style="width:400px">
        <div class="modal-body" align="center">
        <br>
            <h4><b>예약취소</b></h4><br>예약을 취소하시겠습니까?<br><br>
            <button type="button" class="btn btn-primary" id="cancelBtn">
                취소하기
              </button>
            <button type="button" class="btn btn-secondary"  data-dismiss="modal">
                보류
              </button>
              <br><br>
        </div>
      </div>
    </div>
  </div>

  <div class="modal" id="finCancelReserv">
    <div class="modal-dialog">
      <div class="modal-content" style="width:400px">
        <div class="modal-body" align="center">
        <br>
            <h4><b>예약취소</b></h4><br><br>예약내용이 취소되었습니다.<br><br>
            <button type="button" class="btn btn-primary" onclick="location.href='<%=contextPath%>/views/member/reserveList.jsp'" data-dismiss="modal">
                확인
              </button>
              <br><br>
        </div>
      </div>
    </div>
  </div>

  <script>
       
       var like = '<img src="../../resources/images/member/favoriteHeart.png">'
       var unlike = '<img src="../../resources/images/member/justHeart.png">'

       $(".likeImgDiv").click(function(){    
         if($(this).html()==like){
          $(this).html(unlike);
         } else{
          $(this).html(like);
         }
      }) 
       
        // function like(){
        //   if(temp==0){
        //     $(".likeImgDiv").html('<img src="../../resources/images/member/justHeart.png">');
        //     temp++;
        //   }else{
        //     $(".likeImgDiv").html('<img src="../../resources/images/member/favoriteHeart.png">');
        //     temp--;
        //   }
        // }
   
    </script>



 <br><br>
 <%@ include file = "../common/footer.jsp"%>
</body>
</html>