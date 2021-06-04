<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.petnolja.board.model.vo.MemNotice"%>
<%
	MemNotice n = (MemNotice)request.getAttribute("n");
%>    
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
                <th colspan="5"><%=n.getNoticeTitle() %></th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td width="70"><b>관리자</b><%=n.getNoticeWriter() %></td>
                <td width="3">|</td>
                <td width="100"><%=n.getCreateDate() %></td>
                <td width="580"></td>
                <td width="100"><%=n.getCount() %></td>
              </tr>
            </tbody>
          </table>
        
          <div class="form-control" style=" height: 400px; white-space:pre;">
            <%=n.getNoticeContent() %>
          </div>
          <br>
          <div align="center">
          <button type="submit" class="btn btn-primary" onclick="location.href='<%=contextPath%>/memNotice.me?currentPage=1'">목록가기</button>
          </div>
 </div>
 
 <br><br>
 <%@ include file = "../common/footer.jsp"%>
</body>
</html>