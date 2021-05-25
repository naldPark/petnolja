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
        <%@ include file="../sitter/op-menu.jsp" %>
        
        
        
        <!-- MIDDLE -->
        <div class="middle">

          <div class="middle-left-1" style="padding: 20px">
            <!--padding을 넣으면 위아래옆으로 네모안에 여유를 두고 글이 써짐-->
            <h2>이용일/시간관리</h2><br>
            <div>
              <span style="float:left; width:80%">마지막 수정일은 YY년 MM월 DD일 00:00 오후 입니다.</span>
              <!--float:left를 안넣으면 버튼이 다음줄에 표시됨-->
              <!-- 일부러 넓이를 80%를 줘서 다음 버튼이 올 공간이 20%밖에 없음: 80%차지하고 뒤에 위치(오른쪽으로 배치됨)-->
              <button id="btn1" align="right">더보기</button>
            </div>
          </div>

          <div class="middle-left-2" style="padding: 20px">
            <h2>시팅 금액 관리</h2><br>
            <div>
              <span style="float:left; width:80%">마지막 수정일은 YY년 MM월 DD일 00:00 오후 입니다.</span>
              <button id="btn1" align="right">더보기</button>
            </div>
          </div>

          <div class="middle-left-3" style="padding: 20px">
            <h2>추가 서비스 관리</h2><br>
            <div>
              <span style="float:left; width:80%">현재 선택된 추가서비스는 [3]개 입니다.</span>
              <button id="btn1" align="right">더보기</button>
            </div>
          </div>
          <div class="middle-right" style="padding: 20px;" >
            <h2>현재 설정된 옵션</h2>
            <div class="dog" style="word-spacing :30px; padding: 20px;">
              <span style="float:left"></span>
              <span>&ensp;&ensp;시팅&ensp;금액 &ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;&ensp;1박케어&ensp;데이케어</span>
              <br>
              <div>
                <span>ㆍ소형견&ensp;7키로미만 40,000원&ensp;35,000원</span><br>
                <span>ㆍ중형견&ensp;7~14.9키로 +10%&ensp;&ensp;+10%</span><br>
                <span>ㆍ대형견&ensp;15키로이상 +20%&ensp;&ensp;+10%</span>
                <hr>
              </div>
              <div style="padding: 20px;">
                <h3>추가&ensp;서비스</h3>
                <span>ㆍ자차&ensp;픽업</span><br>
                <span>ㆍ약물&ensp;복용</span><br>
                <span>ㆍ노령견&ensp;케어&ensp;가능</span>
            </div>
          </div>

        </div>
        
        <br><br>

      </div><br>
      <%@ include file="../common/footer.jsp" %>
  </body>

  </html>