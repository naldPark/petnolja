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
       
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
    <%@ include file="../member/addReview.jsp" %>
    <%@ include file="cancelReservation.jsp" %>
<br><br>
 <div id="outer">
    <br>
        
        <h3>예약리스트</h3>   
        <br><br>
        <!--검색조회기능-->
        <form>
            <div class="input-group mb-3 input-group-sm">
                <button type="button" class="btn btn-outline-primary btn-sm searchBtn" style="margin-right:8px;" id="findAll">전체</button> 
                <button type="button"class="btn btn-outline-primary btn-sm searchBtn" style="margin-right:8px;" id="1">최근1개월</button>
                <button type="button" class="btn btn-outline-primary btn-sm searchBtn" id="3">최근3개월</button>&nbsp;
              <div class="input-group-prepend">
                <span class="input-group-text" style="background-color: white; border: hidden; padding-right: 100px;"></span>
               <span class="input-group-text">상세검색</span>
              </div>
              <input type="date" class="form-control" style="height:36px;" id="startDate" value="">
              <span class="input-group-text" style="background-color: white; border: hidden;">~</span>
              <input type="date"  max="" id="endDate"  class="form-control" style="height:36px; margin-right: 8px;">
              <button type="button" class="btn btn-primary btn-sm">&nbsp;조회&nbsp;</button>
            </div>
       </form>
       <script>
            $(".searchBtn").click(function(){
            var temp=0;
            if($(this).attr('id')==$("#findAll").attr('id')){
            temp=new Date('2001-01-01'); //가입일을 넣어버리자
            } else{
            var months =$(this).attr("id");
            temp= new Date(new Date().setMonth(new Date().getMonth()-months));
            }
            temp=temp.toISOString().substring(0,10);
            $("#startDate").val(temp);          
            $("#endDate").val(new Date().toISOString().substring(0,10));
            });      
            
       </script>
       <!--검색조회기능 끝-->
          <hr>

       <!-- 예약된 리스트 시작-->
      <div style="margin-bottom:30px; padding-left:20px; padding-top:15px; background-color: rgb(230, 240, 247); height:180px;" > 
        <div class="reserveImg"><img src="../../resources/images/temp/petsitter1.jpg" style="height: 150px;"></div>
        <div style="float:left;">
            <br>
            <h6><b>정성을 다해 사랑으로 돌봐드려요</b></h6>
            <span>예약일 : 2020-01-01 ~ 2020-01-02</span><br>
            <span>고객: 고길동</span><br>
            <span>예약완료</span>
        </div>
        <div id="linkList" style="padding-left:800px; text-align: center;">
            <br>
            <a href="reserveListDetail.jsp"><span>자세히보기</span></a><br>
            <a href="writeReview.jsp" onclick="openPopup(); return false;"><span>후기작성</span></a><br>
            <a href="cancelReservation.jsp" onclick="openCancelPopup(); return false;"><span>예약취소</span></a>
        </div>
      </div>

      <div style="margin-bottom:30px; padding-left:20px; padding-top:15px; background-color: rgb(230, 240, 247); height:180px;" > 
        <div class="reserveImg"><img src="../../resources/images/temp/petsitter2.jpg" style="height: 150px;"></div>
        <div style="float:left;">
            <br>
            <h6><b>정성을 다해 사랑으로 돌봐드려요</b></h6>
            <span>예약일 : 2020-01-01 ~ 2020-01-02</span><br>
            <span>고객: 고길동</span><br>
            <span>예약완료</span>
        </div>
        <div id="linkList" style="padding-left:800px; text-align: center;">
            <br>
            <a href="reserveListDetail.jsp"><span>자세히보기</span></a><br>
            <a href="writeReview.jsp" onclick="openPopup(); return false;"><span>후기작성</span></a><br>
            <a href="cancelReservation.jsp" onclick="openCancelPopup(); return false;"><span>예약취소</span></a>
        </div>
      </div>

      <div style="margin-bottom:30px; padding-left:20px; padding-top:15px; background-color: rgb(230, 240, 247); height:180px;" > 
        <div class="reserveImg"><img src="../../resources/images/temp/petsitter3.jpg" style="height: 150px;"></div>
        <div style="float:left;">
            <br>
            <h6><b>정성을 다해 사랑으로 돌봐드려요</b></h6>
            <span>예약일 : 2020-01-01 ~ 2020-01-02</span><br>
            <span>고객: 고길동</span><br>
            <span>예약완료</span>
        </div>
        <div id="linkList" style="padding-left:800px; text-align: center;">
            <br>
            <a href="reserveListDetail.jsp"><span>자세히보기</span></a><br>
            <a href="writeReview.jsp" onclick="openPopup(); return false;"><span>후기작성</span></a><br>
            <a href="cancelReservation.jsp" onclick="openCancelPopup(); return false;"><span>예약취소</span></a>
        </div>
      </div>

      <!-- 예약된 리스트 끝-->
      
             <ul class="pagination justify-content-center">
                <li class="page-item"><a class="page-link" href="#">&lt;</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
              </ul>

  </div> 

 <br><br>
 <%@ include file = "../common/footer.jsp"%>
</body>
</html>