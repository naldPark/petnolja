<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
        .wrap>*{
            box-sizing:border-box;
        }

        /* *{border:1px solid black;} */
        .wrap{width:45%}
        .updown { border: 1px solid lightgrey; width: 0.1px; height: 70px; }
       
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
<br><br>
 <div id="outer" >
    <br>
        <div align="center">
        <h3><b>예약요청이 정상적으로 완료되었습니다</b></h3>   
        <hr><br>
        펫시터가 예약을 확정하면 <a href="">예약내역조회</a>에서 예약단계가 확정으로 변경됩니다.
        <br><br></div>
        <div class="row" style="margin:20px;">
            <div class="wrap" style="padding:35px; border:1px solid lightgray; margin-left:25px">
                <b> 내 예약 정보</b><br><br>
                펫시터 김개순 <br><br>
                <div class="row" >
                <div style="width:40%;  margin-left: 30px;">
                체크인 <br>
                2021년 5월 13일(목) <br>
                16:00</div>
                <div class="updown"></div>
                <div style="width:40%; margin-left: 30px;">
                    체크인 <br>
                    2021년 5월 13일(목) <br>
                    16:00</div>
                </div><br><br>
                <div align="center"><b>총숙박기간 : 1박</b></div>
            </div>
            <div style="padding: 20px"></div>
            <div class="wrap" style="padding:35px; border:1px solid lightgray">
                <div class="row">
                  <div style="width:35%; margin-left: 50px;"><b> 결제 예정 금액</b></div>
                  <div style="width:20%; margin-left: 90px; text-align: right; color:rgb(69, 179, 248); font-weight:bolder">95,500원</div>
                </div><hr>
                <br>
                <div class="row" style="height: 100px;">
                  <div style="width:35%; margin-left: 130px;">
                    1박 / 소형 1마리 <br>
                    1박 / 중형 1마리 <br>
                    부가세(10%) <br>
                  </div>
                  <div style="width:20%; margin-left: 10px; text-align: right;">
                    40,000원 <br>
                    50,000원 <br>
                    9,000원 <br>
                  </div>
                </div>
                <br>
                <div align="right">예약 수락전에는 결제되지 않습니다</div>
            </div>
       </div>
                <div style="text-align: center;">
            <button type="button" class="btn btn-primary" onclick="location.href='<%=contextPath%>/views/member/reserveList.jsp'">예약내역 조회</button><span style="margin:10px"></span>
            <button type="button" class="btn btn-primary" onclick="location.href='<%=contextPath%>'">메인페이지로</button>
        </div>
      
  </div> 
        




 <br><br>
 <%@ include file = "../common/footer.jsp"%>
</body>
</html>