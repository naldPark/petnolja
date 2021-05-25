<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
#cancelPopup {
  display: flex;
  justify-content: center;
  position: fixed;
  top: 0;
  bottom: 100;
  left: 0;
  width: 100%;
  height: 100%;
  background: rgba(0, 0, 0, .7);
  z-index: 1;
  overflow:auto;
}
#cancelPopup.cancelHide {
  display: none;
}
.findCancelContent {
  height: 650px; width: 500px;
  font-size:14px;
  padding: 20px;
  background: #fff;
  border-radius: 5px;
  margin-top: 20px;
  overflow:auto;
}
</style>
<title>펫시터</title>
</head>
<body>

<div id="cancelPopup" class="cancelHide">
  <div class="findCancelContent">
    <h4>예약 취소</h4><hr>

        <h6>예약취소를 신청하기 전에 안내사항을 꼭 확인해주세요</h6>
    <div style="height: 300px; text-align: left; background:rgb(243, 243, 243); padding: 20px;">
     예약 취소 후 재예약이 불가할 수 있습니다. <br><br>
     구매일 및 환율에 따라 차이가 있을 수 있으며, 일부 해외카드 결제수수료로 인해 실제 청구금액은 최종 결제 금액과 다를 수 있습니다.
      자세한 사항은 해당 카드사를 통해 확인 바랍니다<br><br>
      <table class="table table-bordered table-sm" style="background: white;">
        <tr>
          <td width="50%">이용 14일 전 오후 12시까지</td>
          <td>페널티 없음</td>
        </tr>
        <tr>
          <td>이용 7일 전 오후 12시까지</td>
          <td>결제액의 10% 페널티 부과</td>
        </tr>
        <tr>
          <td>이용 3일 전 오후 12시까지</td>
          <td>결제액의 30% 페널티 부과</td>
        </tr>
        <tr>
          <td>이용 1일 전 ~ 이용당일</td>
          <td style="color:red">취소 불가</td>
        </tr>
      </table>

    </div><hr>
    <form action="" id="cancelForm">
        <div class="form-group">
            <textarea class="form-control" rows="5" id="cancelComment" style="resize:none; height: 110px" placeholder="취소사유 입력"></textarea>
            <div style="margin-left:360px; font-size:10pt"><span id="cancelCount" >0</span> / 1000<br></div>
         <div align="center">
                <button type="submit" class="btn btn-primary btn-sm" onclick="alert('취소가 완료되었습니다'); closeCancelPopup();">등록</button>&nbsp;
                <button type="button" class="btn btn-secondary btn-sm" onclick="closeCancelPopup()">취소</button>
              </div>
        </div>
  </form>    
  </div>
</div>
<script>
    //팝업 열기
      function openCancelPopup(){$("#cancelPopup").removeClass('cancelHide'); 
      $("#cancelForm")[0].reset();  //input값 초기화
    }  
       // 팝업 닫기
      function closeCancelPopup(){$("#cancelPopup").addClass('cancelHide'); 
    }   
      //글자수세기
      $("#cancelComment").keyup(function(){
          $("#cancelCount").text($(this).val().length);
          if($(this).val().length > 999) {
            alert("글자수는 1000을 초과할 수 없습니다");
            $(this).val($(this).val().substring(0, 999));
        }})
      
      
</script>
</body>
</html>