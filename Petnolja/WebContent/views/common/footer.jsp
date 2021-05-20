<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  #footer-area{
    font-size:13pt;
    text-decoration: none;
    color:gray;
  }
  #footer-link>div>a{
    color:black !important;
  }
</style>
</head>
<body>
<!-- Footer -->
<footer class="page-footer font-small indigo" id="footer-area">
  <hr>
  <div class="container">
    <div class="row text-center d-flex justify-content-center pt-3 mb-1" id="footer-link">
      <div class="col-md-2 mb-3">
          <a href="<%=contextPath%>/views/common/notice.jsp">공지사항</a>
      </div>
      <div class="col-md-2 mb-3">
          <a href="<%=contextPath%>/views/common/private.jsp">개인정보처리방침</a>
      </div>
      <div class="col-md-2 mb-3">
          <a href="<%=contextPath%>/views/common/agreement.jsp">이용약관</a>
      </div>
      <div class="col-md-2 mb-3">
        <a href="<%=contextPath%>/views/common/service.jsp">고객센터</a>
      </div>
    </div>
    <br>

    <div class="row d-flex text-center justify-content-center">
        <p align="left">전화문의  02-111-2222  평일 오전 09:00 ~ 오후 06:00  점심 오전 12:00 ~ 오후 01:00  주말 및 공휴일은 휴무입니다.<br>
          (주)펫놀자  대표 : 김말똥  Tel : 02-111-2222 Fax : 02-111-3333  이메일 : cs@petnolja.co.kr <br>
          주소 : 서울시 강남구 테헤란로 1111, kh빌딩 3층  사업자등록번호 : 111-22-33333 </p>
    </div>
  <div class="footer-copyright text-center">© 2021 Copyright:
    <a href="<%=contextPath%>"> petnolja</a>
  </div></div><br><br><br><br><br><br>
</footer>

</body>
</html>