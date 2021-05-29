<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
        width:1000px;
        height:1100px;
        font-family:'Noto Sans KR', sans-serif !important;
        position:relative;
        margin:auto;
        margin-top:50px;
        border:1px solid lightgray;
        padding:20px;
    }
    .dogImg{
            position: absolute;
            margin: auto;
            }
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>

    <div class="outer">

        <br>

        <h3>반려동물일지</h3>
        조회기간
        <br><br>
        <!--조회기능-->  
        <div class="input-group mb-3 input-group-sm">
            <button type="button" class="btn btn-outline-info btn-sm">전체</button>
            <button type="button" class="btn btn-outline-info btn-sm">최근1개월</button>
            <button type="button" class="btn btn-outline-info btn-sm">최근3개월</button>
        <div class="input-group-prepend">
            <span class="input-group-text" style="background-color: white; border: hidden; padding-right: 100px;"></span>
           <span class="input-group-text">상세검색</span>
        </div>   
        <input type="date" class="form-control" style="height:36px;">
        <span class="input-group-text" style="background-color: white; border: hidden;">~</span>
        <input type="date" class="form-control" style="height:36px; margin-right: 20px;">
        <button type="button" class="btn btn-primary btn-sm">&nbsp;조회&nbsp;</button>
      </div> 

      <hr>
      
      <!--예약된 리스트 글-->
      <div style="margin-bottom:30px; padding-top:15px; background-color:rgb(224, 224, 255); height:230px;">
          <div class="dogImg" style="padding-left:550px;"><img src="<%=contextPath%>/resources/images/temp/dog5.jpg" style="height:180px;"></div>
          <div style="float:left; padding-left:70px;">
            <br>
              <h6><b>펫시터 강개순</b></h6><br>
              <span><b>2020.04.25(수) 16:23</b></span><br><br>
              <span>
                쪼꼬 오늘은 바닥에 낮잠 중 입니다! <br>
                편한지 코까지 골면서 자요!
             </span>
          </div>
      </div>

      <hr>

      <div style="margin-bottom:30px; padding-top:15px; background-color:rgb(224, 224, 255); height:230px;">
        <div class="dogImg" style="padding-left:550px;"><img src="<%=contextPath%>/resources/images/temp/dog5.jpg" style="height:180px;"></div>
        <div style="float:left; padding-left:70px;">
          <br>
            <h6><b>펫시터 강개순</b></h6><br>
            <span><b>2020.04.25(수) 16:23</b></span><br><br>
            <span>
              쪼꼬 오늘은 바닥에 낮잠 중 입니다! <br>
              편한지 코까지 골면서 자요!
           </span>
        </div>
    </div>
      
    <hr>

    <div style="margin-bottom:30px; padding-top:15px; background-color:rgb(224, 224, 255); height:230px;">
        <div class="dogImg" style="padding-left:550px;"><img src="<%=contextPath%>/resources/images/temp/dog5.jpg" style="height:180px;"></div>
        <div style="float:left; padding-left:70px;">
          <br>
            <h6><b>펫시터 강개순</b></h6><br>
            <span><b>2020.04.25(수) 16:23</b></span><br><br>
            <span>
              쪼꼬 오늘은 바닥에 낮잠 중 입니다! <br>
              편한지 코까지 골면서 자요!
           </span>
        </div>
    </div>

    <ul class="pagination justify-content-center">
        <li class="page-item"><a class="page-link" href="#">&lt;</a></li>
        <li class="page-item"><a class="page-link" href="#">1</a></li>
        <li class="page-item"><a class="page-link" href="#">2</a></li>
        <li class="page-item"><a class="page-link" href="#">3</a></li>
        <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
      </ul>

    </div>

    <%@ include file="../common/footer.jsp" %>
</body>
</html>