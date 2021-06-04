<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.petnolja.common.model.vo.PageInfo, java.util.ArrayList, com.petnolja.memreserve.model.vo.MemReserve"%>
<%  
	ArrayList<MemReserve> reserveList = (ArrayList<MemReserve>)request.getAttribute("reserveList");
	String startDate = (String)request.getAttribute("startDate");
	String endDate = (String)request.getAttribute("endDate");
	PageInfo pi = (PageInfo)request.getAttribute("pi");
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
        #linkList>span>a, #linkList>a{
            text-decoration: underline;
            color: gray;
            cursor: pointer;
        }
        #linkList>span>a>span, #linkList>a>span{
            font-size:12pt;
            line-height: 35px;
        }
       
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
  <%@ include file="addReview.jsp" %>
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
              <input type="hidden" name="searchPage" required value="1" id="searchPage">
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
                <% for(int i = 0 ; i<reserveList.size(); i++){ %>
                  <div style="margin-bottom:30px; padding-left:20px; padding-top:15px; background-color: rgb(230, 240, 247); height:180px;" > 
                    <div class="reserveImg"><img src="<%=contextPath%>/<%=reserveList.get(i).getPath()%>" style="height: 150px;"></div>
                    <div style="float:left;">
                        <br>
                        <h6><b><%=reserveList.get(i).getSitterTitle()%></b></h6>
                        <span>예약일 : <%=reserveList.get(i).getCheckinDate()%> ~ <%=reserveList.get(i).getCheckoutDate()%></span><br>
                        <span>펫시터: <%=reserveList.get(i).getMemName()%></span><br>
                        <span><%=reserveList.get(i).getReserveStatus()%></span>
                    </div>
                    <div id="linkList" style="padding-left:800px; text-align: center;">
                        <br>
                        <a href='<%=contextPath%>/reservListDetail.mem?rno=<%=reserveList.get(i).getReserveNo()%>'><span>자세히보기</span></a><br>
                        
                        <span id="<%=reserveList.get(i).getReserveNo()%>reviewspan">
                          
                        <a id="<%=reserveList.get(i).getReserveNo()%>review" onclick="openPopup($(this).attr('id')); return false;">
                          <span>후기작성</span></a><br>
                        </span>
                        
                        <span id="<%=reserveList.get(i).getReserveNo()%>cancelspan">
                          
                        <a id="<%=reserveList.get(i).getReserveNo()%>cancel" onclick="openCancelPopup($(this).attr('id')); return false;"><span>예약취소</span></a>
                        </span>
                    </div>
                  </div>
                  <script>
                          var reserveNo = "<%=reserveList.get(i).getReserveNo()%>";
                          var reviewStatus = "<%=reserveList.get(i).getReviewStatus()%>";
                          var reserveStatus = "<%=reserveList.get(i).getReserveStatus()%>";
                          var today = new Date(); // 오늘날짜
                          var yesterday = new Date(new Date().setDate(new Date().getDate()-1)); // 1일전날짜       
                          var checkinDate =  "<%=reserveList.get(i).getCheckinDate()%>";   //체크인날짜
                          var checkinArr = checkinDate.split('-');   //체크인날짜를 년월일 배열로 변경 
                          var checkinToDateType = new Date(checkinArr[0], checkinArr[1]-1, checkinArr[2]);  //date타입으로 변환
                          var checkoutDate =  "<%=reserveList.get(i).getCheckinDate()%>";   //체크아웃날짜
                          var checkoutArr = checkinDate.split('-');   //체크아웃날짜를 년월일 배열로 변경 
                          var checkoutToDateType = new Date(checkoutArr[0], checkoutArr[1]-1, checkoutArr[2]);  //date타입으로 변환

                         
                           // 예약취소 조건
                          if(checkinToDateType.getTime()<yesterday.getTime() || reserveStatus=="취소"){
                            $("#<%=reserveList.get(i).getReserveNo()%>cancelspan").html("<span> </span>");
                          }
                          // 리뷰버튼 조건
                          if(checkoutToDateType.getTime()>today.getTime() || reviewStatus=='Y' || reserveStatus!='확정'){
                            $("#<%=reserveList.get(i).getReserveNo()%>reviewspan").html("<span> </span>");
                          }
                  </script>
                <% } %>
  
                <!-- 페이지 목록 시작 -->
                <ul class="pagination justify-content-center">
                <% if(pi.getCurrentPage() != 1){ %>
                    <li class="page-item"><a class="page-link">&lt;</a></li>
                <% } %>
                <% for(int p=pi.getStartPage(); p <= pi.getEndPage(); p++){ %>
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
      <% } %>

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
   </script>

 <br><br>
 <%@ include file = "../common/footer.jsp"%>
</body>
</html>