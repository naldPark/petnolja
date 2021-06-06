<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.petnolja.pet.model.vo.Log,java.util.ArrayList"%>
    <%
	
	ArrayList<Log> list = (ArrayList<Log>)request.getAttribute("list");
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .container-day {
        width: 800px;
        height: 800px;
        border: 1px solid #C7C7C7;
        margin: 0 auto;
    }
</style>
</head>
<body>
    <%@ include file="serviceMenu.jsp" %>
    <div class="container-day">
    <img src="<%=contextPath %>/resources/images/PET.png" style="width: 200px;"><br><br><br>
        <div class="head-day">
            <div style="font-size: 35px; font-weight: bold;">시팅 일지 관리</div><br><br><br>
        </div>
        <div class="middle-day">
            <table border="1" style="width: 100%; text-align: center;">
                <tr>
                    <td>번호</td>
                    <td>예약일</td>
                    <td>작성일</td>
                    <td>작성</td>
                </tr>
                <% if(list.isEmpty()){ %>
      						<br>조회된 리스트가 없습니다.<br><br><br>
            		
       					<% }else { %>
	      	 				<% for(Log l : list){ %>
                        <tr>
                        	<tr>
                            	<td><%=l.getLogNo() %></td>
                            	<td><%=l.getResDate()%></td>
                            	<td><%=l.getLogTime() %></td>
                            	<td><input type="button" value="작성하기" id="write" onclick="window.open('<%=contextPath%>/histInquiry.sit')"></td>
                            </tr>
                            
                        </tr>
                        <% } %>
                       <% } %>

            </table>
           </div>
        <div align="center">
        <br><br><br><br><br><br><br><br><br><br>
            <input type="button" value="확인" id="back" onclick="location.href='<%=contextPath%>/service.sit'">
            </div>
    </div>
    <%@ include file="../common/footer.jsp" %>
</body>
</html>