<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<% int[] count = (int[])request.getAttribute("count"); %>

  <!DOCTYPE html>
  <html>

  <head>

    <style>
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

      .middle-left-1 {

        width: 1120px;
        height: 150px;
        background-color: #E1F0FA;
      }

      .middle-left-2 {

        margin-top: 20px;
        width: 1120px;
        height: 150px;
        background-color: #E1F0FA;
      }

      .middle-left-3 {

        margin-top: 20px;
        width: 1120px;
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
    <%@ include file="../petsitter/reserveMenu.jsp" %>
      <div class="container">
       <br>
       
        <!-- MIDDLE -->
        <div class="middle">

          <div class="middle-left-1" style="padding: 20px">
            <!--padding을 넣으면 위아래옆으로 네모안에 여유를 두고 글이 써짐-->
            <h2>예약 요청</h2><br>
            <div>
              <span style="float:left; width:93%">확인되지 않은 요청이 [<%=count[0]%>]건 있습니다.</span>
              <!--float:left를 안넣으면 버튼이 다음줄에 표시됨-->
              <!-- 일부러 넓이를 80%를 줘서 다음 버튼이 올 공간이 20%밖에 없음: 80%차지하고 뒤에 위치(오른쪽으로 배치됨)-->
              <input type="button" class="btn btn-primary"  value="더보기"  onclick="location.href='<%=contextPath%>/reserveRequest.sit'" align="right">
            </div>
          </div>

          <div class="middle-left-2" style="padding: 20px">
            <h2>예약 내역</h2><br>
            <div>
              <span style="float:left; width:93%">확정된 예약이 [<%=count[1]%>]건 있습니다.</span>
              <input type="button" class="btn btn-primary"  value="더보기"  onclick="location.href='<%=contextPath%>/reserveVation.sit'" align="right">
            </div>
          </div>

          <div class="middle-left-3" style="padding: 20px">
            <h2>이전 예약</h2><br>
            <div>
               <span style="float:left; width:93%">&nbsp; </span>
               <input type="button" class="btn btn-primary"  value="더보기"  align="right">
            </div>
          </div>
          

        </div>
        <br><br>

      </div><br>
      <%@ include file="../common/footer.jsp" %>
  </body>

  </html>