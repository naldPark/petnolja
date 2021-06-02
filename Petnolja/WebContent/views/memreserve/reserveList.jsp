<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList, com.petnolja.memreserve.vo.MemReserve"%>
<%  
	ArrayList<MemReserve> reserveList = (ArrayList<MemReserve>)request.getAttribute("reserveList");
	String startDate = (String)request.getAttribute("startDate");
	String endDate = (String)request.getAttribute("endDate");

%>
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
        <form action="<%=contextPath %>/reserveList.mem" method="post">
            <div class="input-group mb-3 input-group-sm">
                <button type="button" class="btn btn-outline-primary btn-sm searchBtn" style="margin-right:8px;" id="findAll">전체</button> 
                <button type="button"class="btn btn-outline-primary btn-sm searchBtn" style="margin-right:8px;" id="1">최근1개월</button>
                <button type="button" class="btn btn-outline-primary btn-sm searchBtn" id="3">최근3개월</button>&nbsp;
              <div class="input-group-prepend">
                <span class="input-group-text" style="background-color: white; border: hidden; padding-right: 100px;"></span>
               <span class="input-group-text">상세검색</span>
              </div>
              <input type="date" class="form-control" name="startDate" style="height:36px;" id="startDate">
              <span class="input-group-text" style="background-color: white; border: hidden;">~</span>
              <input type="date"  id="endDate" name="endDate" class="form-control" style="height:36px; margin-right: 8px;">
              <button type="submit" id="searchSubmitBtn" class="btn btn-primary btn-sm">&nbsp;조회&nbsp;</button>
            </div>
       </form>
       <script>
		    $(document).ready(function(){
                
			   <% if(startDate!=null && endDate!=null){ %>
			    	$("#startDate").val("<%=startDate%>");     
			    	$("#endDate").val("<%=endDate%>");  
			   <%}%>
		    })
            $(".searchBtn").click(function(){
 
                var temp=0;
                if($(this).attr('id')==$("#findAll").attr('id')){
                    $("#startDate").val(null);  
                    $("#endDate").val(null); 
                } else{
                    var months =$(this).attr("id");
                    temp= new Date(new Date().setMonth(new Date().getMonth()-months));
                    // temp Date타입!!!! 
                    temp=temp.toISOString().substring(0,10);
                    $("#startDate").val(temp);          
                    $("#endDate").val(new Date().toISOString().substring(0,10));
                }
                $("#searchSubmitBtn").click();
            });      
            
       </script>
       <!--검색조회기능 끝-->
          <hr>

       <!-- 예약된 리스트 시작-->
    	  <% if(reserveList.isEmpty()){ %>
      		<br>조회된 리스트가 없습니다.<br><br><br>
            		
    	   <% }else { %>
       	      <% for(MemReserve mr : reserveList){ %>
			      <div style="margin-bottom:30px; padding-left:20px; padding-top:15px; background-color: rgb(230, 240, 247); height:180px;" > 
			        <div class="reserveImg"><img src="<%=contextPath%>/<%=mr.getPath()%>" style="height: 150px;"></div>
			        <div style="float:left;">
			            <br>
			            <h6><b><%=mr.getSitterTitle()%></b></h6>
			            <span>예약일 : <%=mr.getCheckinDate()%> ~ <%=mr.getCheckoutDate()%></span><br>
			            <span>펫시터: <%=mr.getMemName()%></span><br>
			            <span><%=mr.getReviewStatus()%></span>
			        </div>
			        <div id="linkList" style="padding-left:800px; text-align: center;">
			            <br>
			            <a href='<%=contextPath%>/searchSitterDetail.mem?sno=<%=mr.getSitterNo()%>&rw=star'><span>자세히보기</span></a><br>
			            <a href="writeReview.jsp" onclick="openPopup(); return false;"><span>후기작성</span></a><br>
			            <a href="cancelReservation.jsp" onclick="openCancelPopup(); return false;"><span>예약취소</span></a>
			        </div>
			      </div>
  		 	 <% } %>
 

      <!-- 예약된 리스트 끝-->
      
             <ul class="pagination justify-content-center">
                <li class="page-item"><a class="page-link" href="#">&lt;</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">&gt;</a></li>
              </ul>
       <% } %>

  </div> 

 <br><br>
 <%@ include file = "../common/footer.jsp"%>
</body>
</html>