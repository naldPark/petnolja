<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

  <!DOCTYPE html>
  <html>
<head>

    <style>
        .container {
            width: 1000px;
            margin: auto;
            padding: 0px;
        }

        .container div span {
            display: table-cell;
            vertical-align: middle;
        }

        .middle {
            margin-top: 10px;
            box-sizing: border-box;
            width: 1000px;
            height: 900px;
        }

        .middle-middle-1 {

            width: 1000px;
            height: 140px;
            background-color: #E1F0FA;
        }

        .my-hr2 {
            border: 0;
            margin: 0%;
            height: 3px;
            background: #ccc;
        }

        .cash {
            text-align: right;
            font-size: 17px;
        }

        .word1 {
            color: #A4A4A4;
        }

        .content{
            line-height:80%;
            font-size: 15px;
            padding: 10px;
            width: 100%;
            box-sizing: border-box;

        }
    </style>
</head>

<body>
    <%@ include file="../petsitter/reserveMenu.jsp" %>
    <div class="container">
        <br>
        <br>
        <span style="font-size: 30px; font-weight:bold;">정산 금액 조회</span>
        <span style="font-size: 15px; color: #CFCFCF;">&nbsp;&nbsp;매월 정산금액은 익월 15일에 지정하신 계좌로 입금됩니다.</span>


        <!-- MIDDLE -->
        <div class="middle">
            <div class="middle-middle-1">
                <div style="padding:20px 50px 0px">3/15 정산 예정 금액</div>
                <span style="font-size:40px; padding:0px 50px">1,100,000원</span><br>
                <br>
                <hr class="my-hr2">

                <div style="font-size: 14px; height: 30px;">
                    <h6 style="float:left; margin-top: 5px; font-weight: 500; color: #A4A4A4;"> 최근 6개월간 정산 내역</h6>
                    <input style="float: right;margin-right: 10px; margin-top: 5px;" type="month">
                    <label style="float:right; margin-top: 7px;">검색 :&nbsp;</label>
                </div>
                <br>

                <div class="content">
                    <p class="word1">2021.03.15</p>
                    <p>2021년 2월 서비스 정산</p>
                    <p class="cash">+90,000원</p>
                    <hr>
                    
                    <p class="word1">2021.03.15</p>
                    <p>2021년 2월 서비스 정산</p>
                    <p class="cash">+90,000원</p>
                    <hr>

                    <p class="word1">2021.03.15</p>
                    <p>2021년 2월 서비스 정산</p>
                    <p class="cash">+90,000원</p>
                    <hr>

                    <p class="word1">2021.03.15</p>
                    <p>2021년 2월 서비스 정산</p>
                    <p class="cash">+90,000원</p>
                    <hr>
                    <p class="word1">2021.03.15</p>
                    <p>2021년 2월 서비스 정산</p>
                    <p class="cash">+90,000원</p>
                    <hr>
                    <p class="word1">2021.03.15</p>
                    <p>2021년 2월 서비스 정산</p>
                    <p class="cash">+90,000원</p>
                    <hr>
                </div>
            </div>
        </div>
        <br><br><br><br><br><br><br>
    </div><br>
    <%@ include file="../common/footer.jsp" %>

</body>


  </html>