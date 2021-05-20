<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String errorMsg = (String)request.getAttribute("errorMsg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫놀자</title>
<style>
        #outer{
          width:1000px;
          height: 300px;
          margin:auto;
          text-align: center;
          font-size: 18pt;
        }
</style>
</head>
<body>
	<%@ include file="menubar.jsp" %>


<br><br><br>
    <div id="outer">
        <h3 style="font-weight: bolder; color:red"><%= errorMsg %></h3>
        <br>
        자세한 내용은 관리자에게 문의 해 주세요 <br><br>
        admin@petnolja.xyz
        
        <br><br><button class="btn btn-danger" onclick="location.href='<%=contextPath %>'">메인으로 가기</button>
       
    </div><br><br>

 <%@ include file = "footer.jsp"%>
</body>


</html>