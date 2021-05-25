<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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

      .middle-middle-1 {

        width: 1120px;
        height: 140px;
        background-color: #E1F0FA;
      }

      .my-hr {
        border: 0;
        height: 3px;
        background: #ccc;
      }
      .my-hr2 {
        border: 0;
        margin: 0%;
        height: 3px;
        background: #ccc;
      }
      .cash {
        text-align: right;
      }
      .word1 {
        color: #A4A4A4;
      }
    </style>
  </head>

  <body>
    <%@ include file="../common/menubar.jsp" %>
      <div class="container">
       <br>
       <%@ include file="../sitter/re-menu.jsp" %><br>
       <span style="font-size: 30px; font-weight:bold;">정산 금액 조회</span>
       <span style="font-size: 15px; color: #CFCFCF;">&nbsp;&nbsp;매월 1일부터 말일까지의 금액이 익월 N일에 지정하신 계좌로 입금됩니다.</span>
       
        
        <!-- MIDDLE -->
        <div class="middle">

          <div class="middle-middle-1">
            <!--padding을 넣으면 위아래옆으로 네모안에 여유를 두고 글이 써짐-->
            <div style="padding:20px 50px 0px">3/15 정산 예정 금액</div>
            <span style="font-size:50px; padding:0px 50px">1,100,000원</span><br><hr class="my-hr2">
            <%@ include file="../sitter/datepicker.jsp" %>
            
            <div style="line-height:80%;font-size: 17px; padding: 10px;">
              <p class="word1">2021.03.16</p>
              <p>시팅료 입금</p>
              <p class="word1">예약번호 20210311</p>
              <p class="cash">+90,000원</p><hr>
             
              <p class="word1">2021.03.15</p>
              <p>2월 정산</p>
              <p class="word1">펫놀자</p>
              <p  class="cash">+90,000원</p><hr>

              <p class="word1">2021.03.12</p>
              <p>시팅료 입금</p>
              <p class="word1">예약번호 20210313</p>
              <p  class="cash">+90,000원</p><hr>
          </div>
          </div>
          

          

        </div>
        <br><br><br><br><br><br><br><br>

      </div><br>
      <%@ include file="../common/footer.jsp" %>
  </body>

  </html>