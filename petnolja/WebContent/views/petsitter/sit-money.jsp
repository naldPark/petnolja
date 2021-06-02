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
    table{
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
                <div style="font-size: 30px; font-weight: bold;">시팅 금액 관리</div>
                <div class="text-stop">수정 후 실제 반영까지 다소 시간이 걸릴 수 있습니다.</div>
            </div>
            <br>
            <div>
                <div style="font-size: 15px; font-weight: bold;">시터님의 시팅료를 등록해주세요.</div>
                <div class="text-stop">펫시터가 책정한 이용 요금 총액의 10%가 중개 수수료로 책정됩니다. <br></div>
                <div>수수료가 어떻게 사용되는지 알아보기</div>
            </div>
            <br>
        </div>
        <div style="height: auto; width: 80%; border:1px solid #D6D6D6; padding: 10px 0px 30px 30px;">
            <div>
                <div style="font-size: 18px;">· 1박케어 : 12시간 이상</div>
                <div style="font-size: 18px;">· 데이케어 : 12시간 이내 장시간 외출할 때</div><br><br><br>
            </div>
            <table style="width: 95%; text-align: center;">
                <tr>
                    <td></td>
                    <td style="font-size: 18px; font-weight: bold;">1박케어</td>
                    <td style="font-size: 18px; font-weight: bold;">데이케어</td>
                </tr>
                <tr>
                    <td>소형견 7kg 미만</td>
                    <td><input type="text" name="1bak-price" onkeypress="onlynum();" size="8">원</td>
                    <td><input type="text" name="day-price" onkeypress="onlynum();" size="8">원</td>
                </tr>

                <tr>
                    <td>중형견 7-14.9kg</td>
                    <td><input type="text" name="1bak-price" onkeypress="onlynum();" size="8">원</td>
                    <td><input type="text" name="day-price" onkeypress="onlynum();" size="8">원</td>
                </tr>

                <tr>
                    <td>대형견 15kg 이상</td>
                    <td><input type="text" name="1bak-price" onkeypress="onlynum();" size="8">원</td>
                    <td><input type="text" name="day-price" onkeypress="onlynum();" size="8">원</td>
                </tr>
            </table>
        </div><br><br>
        <div style="margin-left: 20%;">
            <div><input  type="checkbox" name="searchValues" />위의 선택사항이 틀림없을 확인합니다.</div><br>
            <div><input  type="checkbox" name="searchValues" />허위사실 기재에 관한 책임은<br>
                모두 펫시터(판매자) 에게 있음을 확인합니다.</div>
        </div><br>
        <div style="margin-left: 35%;">
            <p>
                <input type="submit" class="submitButton" th:value="Speichern" name="submit" disabled="disabled"/>
                <button class="btn2">취소</button>
            </p>
        </div>
    </div>
</body>
</html>