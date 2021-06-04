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
        height: 70px;
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
      #btn1 {
        border: 0px;
        margin-right: 5px;
        margin-left: 5px;
        background-color: #3498DB;
        color: white;
        border-radius: 5px;
        width: 120px;
        height: 30px;
      }
      #btn2 {
        border: 0px;
        margin-right: 5px;
        margin-left: 5px;
        background-color: #C0392B;
        color: white;
        border-radius: 5px;
        width: 80px;
        height: 30px;
      }
    </style>
  </head>

  <body>
    <%@ include file="../common/menubar.jsp" %>
      <div class="container">
       <br>
       <%@ include file="exa-menu.jsp" %>
       <span style="font-size: 25px; font-weight:bold;">정산 계좌 관리</span><br><br>
       <span style="font-size: 15px; font-weight:bold;">정산 계좌 관리 (5개까지 등록 가능)
        <span style="float:right;"><button id="btn1">계좌등록</button></span>
    </span>
       
        
        <!-- MIDDLE -->
        <div class="middle">

          <div class="middle-middle-1">
            <!--padding을 넣으면 위아래옆으로 네모안에 여유를 두고 글이 써짐-->
            <span style="padding:25px 50px 0px">은행</span>
            <span style="padding:25px 50px 0px 300px">계좌번호</span>
            <span style="padding:25px 50px 0px 450px">관리</span>
            <br><br>
            
            <div style="line-height:80%;font-size: 17px;">
                <span><img src="kakao.png" style="padding:10px 0px 0px 28px;"></span>
                <span style="padding:0px 0px 0px 300px">0423******23423</span>
                <span style="padding:0px 0px 0px 360px">
                    <button id="btn1">대표계좌설정</button><button id="btn2">삭제</button>  
                </span>
                <hr>

                <span><img src="ibk.png" style="padding:10px 0px 0px 35px;"></span>
                <span style="padding:0px 0px 0px 300px">0432******25543</span>
                <span style="padding:0px 0px 0px 360px">
                    <button id="btn1">대표계좌설정</button><button id="btn2">삭제</button>  
                </span>
                <hr>
              
              
          </div>
          </div>
          

          

        </div>
        <br><br><br><br><br><br><br><br>

      </div><br>
      <%@ include file="../common/footer.jsp" %>
  </body>

  </html>