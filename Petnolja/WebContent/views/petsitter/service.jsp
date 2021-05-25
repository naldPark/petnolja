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
    <%@ include file="../common/menubar.jsp" %>
      <div class="container">
        <%@ include file="../sitter/serv-menu.jsp" %>
        
        
        <!-- MIDDLE -->
        <div class="middle">

          <div class="middle-left-1" style="padding: 20px">
            <!--padding을 넣으면 위아래옆으로 네모안에 여유를 두고 글이 써짐-->
            <h2>시팅 일지 관리</h2><br>
            <div>
              <span style="float:left; width:80%">현재 [뿌꾸], [쪼꼬]를 시팅 중입니다.</span>
              <!--float:left를 안넣으면 버튼이 다음줄에 표시됨-->
              <!-- 일부러 넓이를 80%를 줘서 다음 버튼이 올 공간이 20%밖에 없음: 80%차지하고 뒤에 위치(오른쪽으로 배치됨)-->
              <button id="btn1" align="right">더보기</button>
            </div>
          </div>

          <div class="middle-left-2" style="padding: 20px">
            <h2>문의 내역 관리</h2><br>
            <div>
              <span style="float:left; width:80%">새로운 문의가 [3]건 있습니다. </span>
              <button id="btn1" align="right">더보기</button>
            </div>
          </div>
          
          <div class="middle-left-2" style="padding: 20px">
            <h2>리뷰 조회</h2><br>
            <div>
              <span style="float:left; width:80%">추가된 리뷰가 [1]건 있습니다.</span>
              <button id="btn1" align="right">더보기</button>
            </div>
          </div>

          <div class="middle-right" style="padding: 20px">
            <h2>시팅 일지 확인</h2><br>
            <div>
              <span style="float:left">
                <div>뿌꾸,쪼꼬</div>
                <div>2020-05-05~ 2020-05-07</div><br>
                <div>5월 5일 작성완료</div>
                <div>5월 6일 작성완료</div>
                <div>5월 7일 미작성</div> 
                <br><br>
                <div>
                    <hr style="width: 440px;">
                    <h4>시팅 일지 관리의<br>
                        '더보기'란을 통해<br>
                        하루 한 건이상<br>
                        일지를 꼭 작성해주세요.</h4>
                </div>
            </div>
          </div>

        </div>
        <br><br>

      </div><br>
      <%@ include file="../common/footer.jsp" %>
  </body>

  </html>