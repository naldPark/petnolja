<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "java.util.ArrayList, com.petnolja.memreserve.model.vo.MemReserve, com.petnolja.pet.model.vo.Pet"%>
    <%  
	MemReserve info = (MemReserve)request.getAttribute("info");
	ArrayList<Pet> plist = (ArrayList<Pet>)request.getAttribute("plist");
%>
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
 <div id="outer" >
    <br>
        <div align="center">
        <h3><b>예약상세조회</b></h3>   
        <hr></div>
        <div class="row" style="margin:20px; margin:auto">
              <div width="500">
                <div class="wrap" style="width:400px;padding:30px; border:1px solid lightgray; margin-left:40px">
                    <b> 내 예약 정보</b><br><br>
                    펫시터 <a href="<%=contextPath%>/searchSitterDetail.mem?sno=<%=info.getSitterNo()%>&rw=star"><%=info.getMemName()%></a> <br><br>
                    <div class="row">
                    <div style="width:44%; margin-left:15px;">
                    체크인 <br>
                    <%=info.getCheckinDate()%> <br>
                    <%=info.getCheckinTime()%>:00</div>
                    <div class="updown" style=" margin-left: 6px;"></div>
                    <div style="width:44%; margin-left: 15px; margin-bottom: 5px;">
                        체크아웃 <br>
                        <%=info.getCheckoutDate()%> <br>
                        <%=info.getCheckoutTime()%>:00</div>
                    </div>
                </div><br>
            <div class="wrap" style="padding:30px; border:1px solid lightgray; margin-left:40px">
              <b>맡기는 반려동물</b><br><br> 
                 <% for(Pet p : plist){ %>
              <div class="row" >
              		<%if(p.getPetStatus().equals("N")){ %>
              		 <div class="reserveImg"><img src="<%=contextPath%>/resources/images/member/welcome.png" style="height:70px;"></div>
              		<%}else{%>
              		  <div class="reserveImg"><img src="<%=contextPath%>/<%=p.getPetImg()%>" style="height:70px;"></div>
             		<%} %>
                <div> <b><%=p.getPetName()%></b><br> <%=p.getPetSize()%> / <%=p.getPetGender()%> / <%=p.getPetBirth()%></div>
              </div>
             	<%} %>
            

           </div>
             </div>
              <div style="padding: 20px;  margin:auto; "></div>
              <div id="wrap2" style="padding:30px; border:1px solid lightgray; margin-right:30px">
                  <div class="row">
                    <div style="width:35%; margin-left: 50px;"><b> 결제 금액</b></div>
                    <div style="width:20%; margin-left: 90px; text-align: right; color:rgb(69, 179, 248); font-weight:bolder"><%=info.getPayAmount()%>원</div>
                  </div><br>
                  <div class="row">
                    <div style="width:35%; margin-left: 50px;"><b> 결제 방식</b></div>
                    <div style="width:20%; margin-left: 90px; text-align: right; "><%=info.getPayMethod()%></div>
                  </div>
                  <br>
                
                  <br>
                  <div class="row">
                    <div style="width:35%; margin-left: 50px;"><b> 예약 상태</b></div>
                    <div style="width:20%; margin-left: 90px; text-align: right; "> 
                    	<b style="color:red"> 예약<%=info.getReserveStatus()%></b>
                    </div>
                  </div>
                  <br><br>
                   <div class="row">
                    <div style=" margin-left: 50px; text-align: right;">문의는 펫시터 문의게시판을 이용해 주세요</div>
                  </div>
              </div>
       </div><br>
              <div style="text-align: center;">
              <button type="button" class="btn btn-primary" onclick="location.href='<%=contextPath%>/reserveList.mem'">이전페이지로</button><span style="margin:10px"></span>
              <button type="button" class="btn btn-primary" onclick="location.href='<%=contextPath%>'">메인페이지로</button>
              </div>
      
  </div> 
        




 <br><br>
 <%@ include file = "../common/footer.jsp"%>
</body>
</html>