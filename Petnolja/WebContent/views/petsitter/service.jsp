<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <!DOCTYPE html>
  <html>

  <head>

    <style>

      .container {
        width: 1000px;
        margin: 0 auto;   
      }

      .middle-left-1 {

        width: 800px;
        height: 150px;
        background-color: #E1F0FA;
      }

    </style>
  </head>

  <body>
    <%@ include file="serviceMenu.jsp" %>
      <div class="container" align="center">

	        <div class="middle">
		          <div class="middle-left-1" style="padding:20px; padding-top:25px">	
		            	<span style="float:left; width:70%; padding-left: 50px;">
			            	<br><h2>시팅 일지 관리</h2>
		            	</span><br>
		            	<button type="button" class="btn btn-primary"  onclick="window.open('<%=contextPath%>/dailysit.sit?currentPage=1')">더보기</button>
		          </div>
		
		          <div class="middle-left-1" style="padding:20px; padding-top:25px; margin-top:20px;">	
		            	<span style="float:left; width:70%; padding-left: 50px;">
			            	<br><h2>문의 내역 관리</h2>
		            	</span><br>
		            	<button type="button" class="btn btn-primary"  onclick="window.open('<%=contextPath%>/histInquiry.sit')">더보기</button>
		          </div>
		
		          <div class="middle-left-1" style="padding:20px; padding-top:25px; margin-top:20px;">	
		            	<span style="float:left; width:70%; padding-left: 50px;">
			            	<br><h2>리뷰 조회</h2>
		            	</span><br>
		            	<button type="button" class="btn btn-primary"  onclick="window.open('<%=contextPath%>/PetSitterLog.me')">더보기</button>
		          </div>
	        </div><br><br>

      </div><br>
      <%@ include file="../common/footer.jsp" %>
  </body>

  </html>