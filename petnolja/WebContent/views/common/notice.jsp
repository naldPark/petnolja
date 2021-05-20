<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        #outer{
          width:1000px;
          height:100%;
          margin:auto;
          font-family:'Noto Sans KR', sans-serif !important;
          border:1px solid lightgray;
          padding: 15px;
        }
        table{text-align: center;}

</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
<br><br>
 <div id="outer">
     <br><br>
<div class="container">
    <h2>공지사항</h2><br>

    <table class="table">
      <thead class="thead-light">
        <tr>
          <th width="600">제목</th>
          <th>작성자</th>
          <th width="150">작성일시</th>
          <th width="80">조회수</th>
        </tr>
      </thead>
      <tbody>
        <tr>
            <td> <a href='<%=contextPath%>/views/common/noticeDetail.jsp'> 너구리는 왜 맛있을까 ?</a></td>
            <td>날드</td>
            <td>2010-05-01</td>
            <td>1</td>
        </tr>
        <tr>
            <td>너구리는 왜 맛있을까 ?</td>
            <td>날드</td>
            <td>2010-05-01</td>
            <td>1</td>
        </tr>
        <tr>
            <td>너구리는 왜 맛있을까 ?</td>
            <td>날드</td>
            <td>2010-05-01</td>
            <td>1</td>
        </tr>
        <tr>
            <td>너구리는 왜 맛있을까 ?</td>
            <td>날드</td>
            <td>2010-05-01</td>
            <td>1</td>
        </tr>
        <tr>
            <td>너구리는 왜 맛있을까 ?</td>
            <td>날드</td>
            <td>2010-05-01</td>
            <td>1</td>
        </tr>
        <tr>
            <td>너구리는 왜 맛있을까 ?</td>
            <td>날드</td>
            <td>2010-05-01</td>
            <td>1</td>
        </tr>
        <tr>
            <td>너구리는 왜 맛있을까 ?</td>
            <td>날드</td>
            <td>2010-05-01</td>
            <td>1</td>
        </tr>
        <tr>
            <td>너구리는 왜 맛있을까 ?</td>
            <td>날드</td>
            <td>2010-05-01</td>
            <td>1</td>
        </tr>
        <tr>
            <td>너구리는 왜 맛있을까 ?</td>
            <td>날드</td>
            <td>2010-05-01</td>
            <td>1</td>
        </tr>

      </tbody>
    </table>
  </div>
          


<br><br>
<ul class="pagination justify-content-center">
    <li class="page-item"><a class="page-link" href="#">이전</a></li>
    <li class="page-item"><a class="page-link" href="#">1</a></li>
    <li class="page-item"><a class="page-link" href="#">2</a></li>
    <li class="page-item"><a class="page-link" href="#">3</a></li>
    <li class="page-item"><a class="page-link" href="#">다음</a></li>
  </ul>
        
 </div><br>
 
 <%@ include file = "../common/footer.jsp"%>
</body>
</html>