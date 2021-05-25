<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .container {
        width: 800px;
        margin: 0 auto;
        
    }
    .reject{
        width: 800px;
        padding: 40px;
        
    }
    #btn1 {
        border: 0px;
        margin-right: 5px;
        margin-left: 5px;
        background-color: #3498DB;
        color: white;
        border-radius: 5px;
        width: 50px;
        height: 30px;
      }
      #btn2 {
        border: 0px;
        margin-right: 5px;
        margin-left: 5px;
        background-color: #E0E0E0;
        color: white;
        border-radius: 5px;
        width: 50px;
        height: 30px;
      }
</style>
</head>
<body>
    <div class="container">
        <img src="PET.png" style="width: 250px;">
        <div class="reject">
        <div style="font-size: 45px; font-weight:bold;">예약거절</div>
        <div style="font-size: 20px;">예약취소를 신청하기 전에 안내 사항을 꼭 확인해주세요</div><br>
        <div style="font-size: 20px; font-weight:bold;">합당한 이유가 아닌 예약 거절은 불가능합니다.</div>
        <span style="font-size: 15px; color: coral;">예약거절에 대한 책임은 모두 펫시터(판매자)</span>
        <span>에게 있음을 알려드립니다.</span><br><br>
    
    <form>
        <h3>거절사유*</h3>
        <textarea name = "ta2" rows="20" cols= "80" wrap = "virtual">예약을 거절하시는 이유를 15자 이상 상세하게 적어주세요.</textarea><br><br>
    </form>
    
    <input type="checkbox" name="reject" value="reason" checked>안내 사항을 확인하였으며 위의 내용이 사실과 틀림없음을 확인합니다.
    <br><br><br>
    <div style="margin-left: 28%;"><button id="btn1">확인</button><button id="btn2">취소</button></div>
</div>
</div>
</body>
</html>