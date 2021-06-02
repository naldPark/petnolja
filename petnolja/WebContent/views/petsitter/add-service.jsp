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
    .text-stop {
        font-size: 12px;
    }
</style>
<script>
    $(function(){
  $("input[type='checkBox']").change(function(){
    var len = $("input[type='checkBox']:checked").length;
    if(len == 2)
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
                <div style="font-size: 30px; font-weight: bold;">추가 서비스 관리</div>
                <div class="text-stop">수정 후 실제 가능한 추가 서비스를 선택해주세요.</div>
            </div>
            <br>
            <div>
                <div style="font-size: 15px; font-weight: bold;">실제 제공 가능한 추가 서비스를 선택해주세요.</div>
                <div class="text-stop">일반적으로 사용자가 기대하는 추가 서비스 목록입니다.<br>
                    펫시팅 서비스를 등록한 이후 언제든지 목록을 추가/제거할 수 있습니다.</div>
            </div>
            <br>
        </div>
        <div style="height: auto; width: 80%; border:1px solid #D6D6D6; line-height:60%; padding: 10px 0px 30px 30px;">
           
            <div><input type="checkbox" name="reject" value="reason" >없음</div><br>
            <div><input type="checkbox" name="reject" value="reason" >자차 픽업 가능</div><br>
            <div><input type="checkbox" name="reject" value="reason" >목욕 가능 (목욕시킬 수 있는 경우)</div><br>
            <div><input type="checkbox" name="reject" value="reason" >약물 복용 (약을 바르거나 내복약을 먹여본 적 있음)</div><br>
            <div><input type="checkbox" name="reject" value="reason" >노령견 케어 가능 (관련된 교육이나 노령견을 케어해 본 경험)</div><br>
            <div><input type="checkbox" name="reject" value="reason" >응급상황 시 인근 병원 이동 가능</div>
        </div><br><br>
        <div style="margin-left: 20%;">
            <div><input  type="checkbox" name="searchValues" />위의 선택사항이 틀림없을 확인합니다.</div><br>
            <div><input  type="checkbox" name="searchValues" />허위사실 기재에 관한 책임은<br>
                모두 펫시터(판매자) 에게 있음을 확인합니다.</div>
        </div><br>
        <div style="margin-left: 35%;">
            <input type="submit" class="submitButton" th:value="Speichern" name="submit" disabled="disabled"/>
            <button class="btn2">취소</button>
        </div>
    </div>
</body>
</html>