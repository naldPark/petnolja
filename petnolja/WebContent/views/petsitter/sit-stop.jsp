<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
    .container-stop{
        width: 700px;
        padding: 50px 0px 50px 0px;
        margin: auto;
        border: 1px solid #C7C7C7;
        
    }
    table, td, th {
    border : 1px solid #D6D6D6;
    border-collapse : collapse;
    }
    .title-stop{
        font-size: 17px;
        color: #C0392B;
        font-weight: bold;
    }
    .text-stop {
        font-size: 12px;
    }
</style>

</head>
<body>
    <%@ include file="serv-menu.jsp" %>
        <div class="container-stop">
        <img src="<%=contextPath %>/resources/images/PET.png" style="width: 200px;">

        
        <div class="middle-stop" style="padding: 30px;">
            <div>
                <div style="font-size: 30px; font-weight: bold;">시팅 서비스 중지</div>
                <div class="text-stop">펫시팅 서비스를 중지하기 전에 안내 사항을 꼭 확인해주세요.</div>
            </div>
            <br>
            <div>
                <div class="title-stop">예정된 예약이 없어야 서비스 중지가 가능합니다.</div>
                <div class="text-stop">미처리된 예약 요청건이 있거나 예정된 예약이 있을 경우 처리 또는 완수하신 후 신청 가능합니다.</div>
            </div>
            <br>
            <div>
                <div class="title-stop">서비스 중지를 위해 정산 계좌를 확인해주셔야 합니다.</div>
                <div class="text-stop">정산금 및 모든 잔액은 등록하신 대표계좌로 기존의 지정일에 입금되며,<br>
                    대표계좌 변경은 정산 계좌 관리 페이지에서 설정 가능합니다.</div>
            </div>
            <br>
            <div>
                <div class="title-stop">중지 완료 후 180일 이내 펫시터 재등록이 불가합니다.</div>
            </div><br>
        </div>
        <form action="<%=contextPath%>/deleteSitStop.sit"  method="post">
        <div style="height: auto; width: 80%; border:1px solid #D6D6D6; margin: 0px 30px 30px 60px; padding: 20px;">
            <div>중지 사유 선택 *</div><br>
            <div><input  type="radio" name="stopRadio" value="비밀" checked>개인 사정</div>
            <div><input  type="radio" name="stopRadio" value="불만">펫놀자 서비스에 대한 불만</div>
            <div><input  type="radio" name="stopRadio" value="기타사유">기타 사유(상세히 적어 주세요)</div><br>
        
            <div>상세 이유 *</div>
            <textarea name ="deReason" rows="5" cols= "70" style="width: 500px; resize:none" required></textarea>
        </div>
        <div align="center">
            <button type="submit" class="btn btn-primary" >제출</button>
            <button type="button" class="btn btn-secondary" onclick="location.href='<%=contextPath%>/options.sit'">취소</button>
        </div>
    </form>
    </div>
    

</body>
</html>