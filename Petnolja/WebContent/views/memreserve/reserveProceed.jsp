<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, java.util.HashMap, com.petnolja.memreserve.model.vo.*"%>
<%
	ArrayList<ReserveContent> list = (ArrayList<ReserveContent>)request.getAttribute("reserveList");
	int countDay = (Integer)request.getAttribute("countDay");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>
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
        #wrap2{width:45%}
        .updown { border: 1px solid lightgrey; width: 0.1px; height: 70px; }
        .reserveImg{
            position:relative;
            width:70px;
            height:70px;
            overflow: hidden;
            float: left;
            margin:0px 30px 10px 30px;
            
            }
        .reserveImg>img{
            position: absolute;
            top: -9999px;
            left: -9999px;
            right: -9999px;
            bottom: -9999px;
            margin: auto;
            }
       
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
<br><br>
 <div id="outer" ><br>
    
      <div align="center">
        <h3><b>예약진행 페이지</b></h3> <hr> 
      </div>
      <div class="row" style="margin:20px; margin:auto; margin-left: 30px">
              <div width="500">
                    <div class="wrap" style="width:400px;padding:30px; border:1px solid lightgray; margin-left:40px">
                          <b> 내 예약 정보</b><br><br>
                          펫시터 <a href="<%=contextPath%>/views/member/searchPetsitterDetail.jsp"><%=list.get(0).getSitterName() %></a> <br><br>
                          <div class="row">
                          <div style="width:44%; margin-left:15px;">
                          체크인 <br>
                          <%=list.get(0).getCheckinDate() %> <br>
                          <%=list.get(0).getCheckinTime() %>:00</div>
                          <div class="updown" style=" margin-left: 6px;"></div>
                          <div style="width:44%; margin-left: 15px; margin-bottom: 5px;">
                              체크아웃 <br>
                              <%=list.get(0).getCheckoutDate() %> <br>
                              <%=list.get(0).getCheckoutTime() %>:00</div>
                          </div>
                          <br>
                          총 숙박기간 <%=countDay %>박
                    </div><br>
                    <div class="wrap" style="padding:30px; border:1px solid lightgray; margin-left:40px">
                          <b>맡기는 반려동물</b><br><br> 
                          <% for(ReserveContent rc : list){ %>
                          <div class="row" >
                              <div class="reserveImg"><img src="<%=contextPath%>/<%=rc.getPetImg()%>" style="height: 70px;"></div>
                              <div> <b><%=rc.getPetName()%></b><br> <%=rc.getPetSize()%> / <%=rc.getPetGender()%> / <%=rc.getPetBirth()%></div>
                          </div>
                          <% } %>
                          
                   </div>
             </div>
              <div>
                  <div class="wrap" style="width:400px;padding:30px; border:1px solid lightgray; margin-left:40px">
                      <b> 별도 요청사항</b><br><br>
                      <div class="row">
                        <textarea name="text" cols="45" rows="7" placeholder= " 예) 산책 중에 아무거나 잘 삼켜서 주의주셔야 해요." style="resize:none; border:1px solid lightgray"></textarea>
                      </div>
                  </div><br>
                  <div class="wrap" style="padding:20px; border:1px solid lightgray; margin-left:40px">
                      <div class="row">
                        <div style="width:35%; margin-left: 50px;"><b> 결제 예정 금액</b></div>
                        <div id="totalPrice" style="width:20%; margin-left: 90px; text-align: right; color:red; font-weight:bolder"></div>
                      </div><hr><br>
                      <div class="row" style="height: 100px;">
                        <div id="petCount" style="width:35%; margin-left: 130px;"></div>
                        <div id="petPrice" style="width:20%; margin-left: 10px; text-align: right;">
                         
                          <br>
                        </div>
                      </div><hr>
                      <div class="row">
                        <div style="width:35%; margin-left: 50px;"><b> 결제 방식</b></div>
                        <div style="width:50%;">
                            <input type="radio" name="payMethod" id="buyCard" checked> <label for="buyCard"> 신용카드</label>
                            <span>&nbsp;&nbsp;</span>
                            <input type="radio" name="payMethod" id="buyPhone"> <label for="buyPhone"> 휴대폰결제</label>
                        </div> <br><br>
                      </div>                
                  </div>
              </div> 
     </div><br>
     <div style="text-align: center;">
      <div style="background-color: rgb(210, 235, 250); margin-left: 50px; margin-right:50px; font-size:12pt; text-align: left; padding-left:30px;">
        <br>
        <span>- 펫시터님을 무는 등의 심한 공격성을 보이거나 파보/피부염/기관지염 등 전염성 질병의 경우, <br>
          &nbsp;&nbsp;등록하신 반려동물 프로필이 실제와 다른경우 돌봄이 불가할 수 있습니다.</span> <br><br>
        <span>- 사실과 다른 반려동물 프로필 기재로 문제가 발생한 경우, 책임은 보호자에게 있음에 동의합니다.</span>		   
        <br><br>
      </div>
      <br>
        <button type="button" class="btn btn-secondary" onclick="location.href='<%=contextPath%>/views/member/reserveList.jsp'">이전페이지로</button>
        <span style="margin:10px"></span>
        <button type="button" class="btn btn-danger" id="check_module">결제진행하기</button>
     </div>
      
  </div> 
  
  <script>

    var total=0;

    $(function(){
      
    var sm = ["소형",0,0];
    var mid = ["중형",0,0];
    var big = ["대형",0,0];
      <% for(ReserveContent rc : list){ %>
        if(mid[0]=="<%=rc.getPetSize()%>"){
          mid[1]+= 1;
          mid[2]+=<%=rc.getPrice()%>;
        }else if(sm[0]=="<%=rc.getPetSize()%>"){
          sm[1]+= 1;
          sm[2]+=<%=rc.getPrice()%>;
        }else if(big[0]=="<%=rc.getPetSize()%>"){
          big[1]+= 1;
          big[2]+=<%=rc.getPrice()%>;
        }
      <%}%>
      
      total = sm[2]+mid[2]+big[2];

      $("#totalPrice").text(priceToString(total+Math.floor(total*0.1))+"원");
      $("#petCount").html("소형 "+sm[1]+" 마리 <br>중형 "+mid[1]+" 마리 <br>대형 "+big[1]+" 마리 <br> 부가세(10%) <br>");
      $("#petPrice").html(priceToString(sm[2])+"원 <br> "+priceToString(mid[2])+"원 <br> "+priceToString(big[2])+"원 <br>"+ priceToString(Math.floor(total*0.1))+"원<br>");

     })

      function priceToString(price) {
      return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
      }
  

  $("#check_module").click(function () {
      var IMP = window.IMP; // 생략가능
      IMP.init('imp68132881'); 
      IMP.request_pay({
          pg: 'inicis',
          pay_method: 'card',
          merchant_uid: 'merchant_' + new Date().getTime(),
          name: '펫놀자 결제페이지',
          //amount: total+Math.floor(total*0.1), 
          amount: 100, 
          buyer_email: '<%=loginUser.getMemEmail()%>',  
          buyer_name: '<%=loginUser.getMemName()%>',  
          buyer_tel: '<%=loginUser.getMemTel()%>',   
          buyer_addr: '<%=loginUser.getMemAddress()%>',
          buyer_postcode: '12345',
          m_redirect_url: 'http://petnolja.xyz'
      }, function (rsp) {
          console.log(rsp);
          if (rsp.success) {
              var msg = '결제가 완료되었습니다.<br>';
              // msg += '고유ID : ' + rsp.imp_uid;
              // msg += '상점 거래ID : ' + rsp.merchant_uid;
              // msg += '결제 금액 : ' + rsp.paid_amount;
              msg += '카드 승인번호 : ' + rsp.apply_num;
              location.href='http://petnolja.xyz';
          } else {
              var msg = '결제에 실패하였습니다.';
              msg += '에러내용 : ' + rsp.error_msg;
          }
          alert(msg);
          //hidden form만들어서 여기서 서브밋
      });
  });
</script>
        




 <br><br>
 <%@ include file = "../common/footer.jsp"%>
</body>
</html>