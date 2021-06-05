<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.petnolja.research.model.vo.Research"%>
<% Research r = (Research)request.getAttribute("info"); %>

  <!DOCTYPE html>
  <html>

  <head>

    <style>
      .top {
        margin-top: 20px;
        width: 1000px;
        height: 80px;
        display: table;
      }

      .container {
        width: 1000px;
        margin: 0 auto;
      }

      .container div span {
        display: table-cell;
        vertical-align: middle;
      }

      .middle {
        margin-top: 10px;
        width: 1000px;
        height: 500px;
        position: relative;
      }

      .middle-right {

        position: absolute;
        top: 0px;
        width: 380px;
        height: 500px;
        background-color: #E1F0FA;
      }

      .middle-right {
        position: absolute;
        top: 0px;
        left: 620px;
        width: 480px;
        height: 490px;
      }

      .middle-left-1 {

        width: 600px;
        height: 150px;
        background-color: #E1F0FA;
      }

      .middle-left-2 {

        margin-top: 20px;
        width: 600px;
        height: 150px;
        background-color: #E1F0FA;
      }

      .middle-left-3 {

        margin-top: 20px;
        width: 600px;
        height: 150px;
        background-color: #E1F0FA;
      }

      #btn1 {
        border: 0px;
        margin-right: 5px;
        margin-left: 5px;
        background-color: #3498DB;
        color: white;
        border-radius: 5px;
      }
      .my-hr {
        border: 0;
        height: 3px;
        background: #ccc;
  }
    </style>
  </head>

  <body>
    <%@ include file="../petsitter/serv-menu.jsp" %>
      <div class="container">
        
        
        <!-- MIDDLE -->
        <div class="middle">

          <div class="middle-left-3" style="padding: 20px; padding-top:50px; padding-left:140px;">
            <h2 style="float:left;">이용일/시간 관리</h2>
            <div style="padding-left:300px;">
              <input type="button" value="더보기" class="btn btn-primary" onclick="location.href='<%=contextPath%>/Abledate.sit'" align="right">
            </div>
          </div>

          <div class="middle-left-3" style="padding: 20px; padding-top:50px; padding-left:140px;">
            <h2 style="float:left;">시팅 금액 관리</h2>
            <div style="padding-left:300px;">
            <input type="button" value="더보기" class="btn btn-primary"  onclick="location.href='<%=contextPath%>/sitmoney.sit'" align="right">
            </div>
          </div>

          <div class="middle-left-3" style="padding: 20px; padding-top:50px; padding-left:140px;">
            <h2 style="float:left;">추가 서비스 관리</h2>
            <div style="padding-left:300px;">
            <input type="button" value="더보기" class="btn btn-primary"  onclick="location.href='<%=contextPath%>/addservice.sit'" align="right">
            </div>
          </div>
          <div class="middle-right" style="padding: 20px;" >
            <h2>현재 설정된 옵션</h2>
            <div class="dog" style="word-spacing :30px; padding: 20px;">
              <div>
                
                	<div style="float:left; margin-right: 30px;">
                	 <b>ㆍ시팅&ensp;금액</b> <br><br>
                	ㆍ소형견&ensp;7키로미만 <br>
                	ㆍ중형견&ensp;7~14.9키로 <br>
                	ㆍ대형견&ensp;15키로이상
                	</div>
            	    <div style="float:left; margin-right: 30px;">
            	 	<b>1박케어</b><br><br>
                	<%=r.getSmallNightFee()%>원 <br>
                	<%=r.getMidNightFee()%>원 <br>
                	<%=r.getBigNightFee()%>원
                	</div>
                	<div>
                	<b>데이케어</b><br><br>
                	<%=r.getSmallDayFee()%>원 <br>
                	<%=r.getMidDayFee()%>원 <br>
                	<%=r.getBigDayFee()%>원
                	</div>

              </div><br>
               <hr>
              <div style="padding: 20px;">
                <h3>추가&ensp;서비스</h3>
                <span><%=r.getAdditions() %></span><br>
            </div>
          </div>

        </div>
        
        <br><br>

      </div><br>
      <%@ include file="../common/footer.jsp" %>
  </body>

  </html>