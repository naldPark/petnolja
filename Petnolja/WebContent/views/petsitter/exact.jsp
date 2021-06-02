<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

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
    <%@ include file="../petsitter/exa-menu.jsp" %>
      <div class="container">
        
        
        <!-- MIDDLE -->
        <div class="middle">

          <div class="middle-left-1" style="padding: 20px">
            <!--padding을 넣으면 위아래옆으로 네모안에 여유를 두고 글이 써짐-->
            <h2>정산 금액 조회</h2><br>
            <div>
              <span style="float:left; width:80%">YY월 MM월 DD일 기준 예정된 정산 총액은 [200,000]원입니다.</span>
              <!--float:left를 안넣으면 버튼이 다음줄에 표시됨-->
              <!-- 일부러 넓이를 80%를 줘서 다음 버튼이 올 공간이 20%밖에 없음: 80%차지하고 뒤에 위치(오른쪽으로 배치됨)-->
              <button id="btn1" align="right">더보기</button>
            </div>
          </div>

          <div class="middle-left-2" style="padding: 20px">
            <h2>정산 계좌 관리</h2><br>
            <div>
              <span style="float:left; width:80%">현재 등록된 정산 계좌는 [NNNN]입니다.</span>
              <button type="button" id="btn1" align="right">더보기</button>
            </div>
          </div>
          
          <div class="middle-right" style="padding: 20px">
            <h2>알림</h2><br>
            <div>
              <span style="float:left">
                21년 01월 15일<br>
                NNNN계좌로<br>
                000,000원 정산되었습니다.</span>
            </div>
          </div>

        </div>
        <br><br>

      </div><br>
      <%@ include file="../common/footer.jsp" %>
  </body>

  </html>