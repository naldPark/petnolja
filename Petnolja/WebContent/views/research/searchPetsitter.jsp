<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.petnolja.research.model.vo.*, com.petnolja.common.model.vo.PageInfo"%>
 <%
 	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Research> list = (ArrayList<Research>)request.getAttribute("searchlist");
 	UserSetSearch us = (UserSetSearch)request.getAttribute("userSet");
%>
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
          height: 1800px;
          margin:auto;
          position:relative;
          font-family:'Noto Sans KR', sans-serif !important;
          
        }
          .wrap{
            width:100%;
            margin:auto;
        }

        .recommendList{
          box-shadow:5px 5px 10px 5px gray;
          cursor: pointer;
          padding-bottom: 20px;
          height: 270px;
        }
        .recommendList:hover{background-color: rgb(245, 245, 245);}
        .starList{font-size: 16pt; color: rgb(254,187,2); letter-spacing:-3px;} 
        .checkSearchArray:hover{cursor: pointer; font-weight: bold;}
</style>

</head>
<body>
	<%@ include file="../common/menubar.jsp" %>


<div id="outer"><br><br>
  <%@ include file = "../member/loginBar.jsp" %>

    <!-- 추천리스트 시작 -->
  <div class="wrap wrap2" style="width:1000px;">
    <div style="text-align:left; margin-bottom:30px; padding-left:20px; padding-right:20px;" > 
      <br>

      <div style="text-align: right; padding-right: 20px;"><img src="<%=contextPath%>/resources/images/member/array.png" style="height: 13px"> &nbsp;정렬 &nbsp;&nbsp;
          <span style="text-decoration: none; color:gray" class="checkSearchArray" id="starArray">별점순</span> | 
          <span  style="text-decoration: none; color:gray" class="checkSearchArray" id="priceArray">가격순</span> | 
          <% if(!us.getSetAddress().equals("N")) { %>
          <span style="text-decoration: none; color:gray" class="checkSearchArray" id="distanceArray">거리순</span> | 
          <% } %>
          <span style="text-decoration: none; color:gray" class="checkSearchArray" id="dateArray">이용가능일순</span>
      </div>
      <br>
            <!-- 펫시터 소개 박스 -->
	  <% for(Research s : list){ %>
      <div class="recommendList" onclick="location.href='<%=contextPath%>/searchSitterDetail.mem?sno=<%=s.getSitterNo()%>'"> 

        <br>
          <img src="<%=contextPath%>/<%=s.getPath()%>" style="height: 230px; width: 300px; float: left; padding:15px; margin-bottom: 30px;" >
          <br>
          <h3><%=s.getSitterTitle()%></h3>
          <hr width="900px"> 

          <div style="text-align:left; margin-bottom:30px; float:left; color: rgb(95, 95, 95);" > 
              <span><%=s.getAdditions()%><br></span>
                  <% if(!us.getSetAddress().equals("N")) { %>
                  	<br>&nbsp;&nbsp;- 회원님과의 거리는 <%=s.getDistance()%> km 입니다 
                  <% } %><br>
                  <% if(us.getCountDay() ==-1) { %>
				  <% } else if(us.getCountDay() ==s.getDateCount()) { %>
				      &nbsp;&nbsp;- 선택하신 일자로 예약 가능합니다
				  <% } else if(s.getDateCount()>0){ %>
      				   &nbsp;&nbsp;- 선택하신 <%=us.getCountDay()%>일 중 <%=s.getDateCount()%>일만 예약가능합니다
				  <% } %>
              <br><br>         

        </div> 
        <div style="text-align:right;padding-bottom: 20px; padding-right: 30px;">
	        <h5>
	        <%if(s.getSmallNightFee().equals("0")){ %>
	        	정보없음
	        <%}else{ %>
	        	<%=s.getSmallNightFee()%> 원
	        <%} %>
	        &nbsp;&nbsp;<span class="badge badge-pill badge-secondary"> 1 박 </span></h5>
	        <h5>
	        <%if(s.getSmallDayFee().equals("0")){ %>
	        	정보없음
	        <%}else{ %>
	        	<%=s.getSmallDayFee()%> 원
     	    <%} %>
	        &nbsp;&nbsp;<span class="badge badge-pill badge-secondary"> 하루 </span></h5>
	      	 소형견 기준<br>
	      	<span style="align:right">후기 평균별점 :
		       <span class="starList">
              	  <% for(int i=0 ; i<s.getAvgRating(); i++){ %>
               		 &#9733;
				  <% } %>
		       </span>
	        </span>
        </div>
      </div>
      <br>
      <%}%>
      <br>

        <!-- 페이지 목록 시작 -->
             <ul class="pagination justify-content-center">
             <% if(pi.getCurrentPage() != 1){ %>
                <li class="page-item"><a class="page-link">&lt;</a></li>
           	 <% } %>
           	 <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
           	 
           		 <% if(p != pi.getCurrentPage()){ %>
               		 <li class="page-item"><a class="page-link"><%= p %></a></li>
	             <% }else { %>
	            	 <li class="page-item" ><a class="page-link" style="background:rgb(194, 227, 238)"><%= p %></a></li>
            	 <% } %>
             <% } %>
     

			<% if(pi.getCurrentPage() != pi.getMaxPage()){ %>
            	<li class="page-item"><a class="page-link"> &gt;</a></li>
			<% } %>
              </ul>
     <!-- 페이지 목록 끝 -->
      
      
      
      
    </div>
  </div>
    
  <script>
 
    $(".page-link").click(function(){

      var page = $(this).text();
      if(page =="<"){
          $("#searchPage").val(<%=pi.getCurrentPage()-1%>);
      } else if(page==" >"){
        $("#searchPage").val(<%=pi.getCurrentPage()+1%>);
      } else {
        $("#searchPage").val(page);
      }
      $("#searchSubmitBtn").click();
    })

	$(".checkSearchArray").click(function(){
		var array =$(this).attr("id");
    console.log(array);
    $("#searchArray").val(array);
    $("#searchSubmitBtn").click();

	})


    <%if(us!=null){%> 
	      $(document).ready(function(){
           // 주소를 유저가 지정했을 경우에는 지정한 값을 달력 input 화면에 노출
	    	 	 <%if(us.getSetAddress().equals("Y")){%>
		            $("#search_addr").val("<%=us.getAddress()%>");
		            $("#latitude").val("<%=us.getLatitude()%>");
		            $("#longtitude").val("<%=us.getLongtitude()%>");
	            <%}%>
            // 날짜를 유저가 지정했을 경우에는 지정한 값을 달력 input 화면에 노출
		        <%if(us.getSetDate().equals("Y")){%>
		           	$("input[name=chooseDate]").val("<%=us.getSearchStartDate()%>"+" - "+"<%=us.getSearchEndDate()%>");
		        <%}%>
            <%if(us.getOptions()!=null){%>
         		   <%for(int i=0 ; i<us.getOptions().length; i++){%>
         		  			$("#<%=us.getOptions()[i]%>").prop('checked', true);
         		   <%}%>

		    <%}%>
	      })   
     <%} %>   
    </script>


</div><br><br><br><br><br><br><br><br><br><br><br>  <br clear="both">



<%@ include file = "../common/footer.jsp" %>
</body>
</html>