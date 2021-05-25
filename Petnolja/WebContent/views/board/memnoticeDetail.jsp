<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫시터</title>
<style>
        #outer{
          width:1000px;
          margin:auto;
          position:relative;
          font-family:'Noto Sans KR', sans-serif !important;
          border:1px solid lightgray;
          padding: 15px;
        }
        .table th{
            background-color: rgb(230, 230, 230);
            text-align: center; 
        }

</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
<br><br>
 <div id="outer" style="padding: 30px;">
    <br>

        <h2>공지사항</h2><br>

        <table class="table">
            <thead class="thead-light">
              <tr>
                <th colspan="5">긴급점검 실시합니다</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td width="70"><b>관리자</b></td>
                <td width="3">|</td>
                <td width="100">2021-04-28</td>
                <td width="580"></td>
                <td width="100">조회수 302</td>
              </tr>
            </tbody>
          </table>
        
          <div class="form-control" style=" height: 400px; white-space:pre;">
            너구리는 맛있다  
          </div>
          <br>
          <div align="center">
          <button type="submit" class="btn btn-primary" onclick="location.href='<%=contextPath%>/views/board/memnotice.jsp'">목록가기</button>
          </div>
 </div>
 
 <br><br>
 <%@ include file = "../common/footer.jsp"%>
</body>
</html>