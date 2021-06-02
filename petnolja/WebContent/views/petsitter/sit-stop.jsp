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
        padding: 50px 0px 40px 100px;
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
<script>
    $(function(){
  $("input[type='checkBox']").change(function(){
    var len = $("input[type='checkBox']:checked").length;
    if(len > 0)
        $("input[type='submit']").removeAttr("disabled");
    else
      $("input[type='submit']").prop("disabled", true);
  });
  $("input[type='checkBox']").trigger('change');
});
</script>
</head>
<body>
    <div class="container-stop">
        <img src="PET.png" style="width: 200px;"><br><br><br>
        <div class="head-stop">
            <div></div>
        </div>

        <div class="middle-stop">
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
        <div style="height: auto; width: 80%; border:1px solid #D6D6D6; padding: 30px 0px 30px 30px;">
            <div>중지 사유 선택 *</div>
            <div><input  type="checkbox" name="searchValues" />개인 사정</div>
            <div><input  type="checkbox" name="searchValues" />펫놀자 서비스에 대한 불만</div>
            <div><input  type="checkbox" name="searchValues" />기타 사유(상세히 적어 주세요)</div>
        
            <div>상세 이유 *</div>
            <textarea name = "ta2" rows="5" cols= "70" wrap = "virtual"></textarea>
        </div><br><br>
        <div style="margin-left: 35%;">
            <input type="submit" class="submitButton" th:value="Speichern" name="submit" disabled="disabled"/>
            <button class="btn2">취소</button>
        </div>
    </div>
</body>
</html>