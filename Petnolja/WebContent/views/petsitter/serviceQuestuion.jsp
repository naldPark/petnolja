<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.petnolja.qna.model.vo.Qna,java.util.ArrayList" %>
   <%
	
	ArrayList<Qna> list = (ArrayList<Qna>)request.getAttribute("list");
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
    .btn1 {
        border: 0px;
        margin-left: 5px;
        background-color: #3498DB;
        color: white;
        border-radius: 5px;
        width: 70px;
        height: 25px;
    }
</style>
</head>
<body>
 <%@ include file="serviceMenu.jsp" %>
    <div class="container-stop">
        <img src="<%=contextPath %>/resources/images/PET.png" style="width: 200px;"><br><br><br>
        <div class="head-stop">
            <div style="height: auto; width: 80%; border:1px solid #D6D6D6; padding: 10px 0px 30px 30px;">
                <div>
                    <div style="font-size: 30px; font-weight: bold;">문의 내역 관리</div><br>
                </div>
                <div>
                    <table border="1" style="height: 140px; width: 95%; text-align: center;">
						<% if(list.isEmpty()){ %>
      						<br>조회된 리스트가 없습니다.<br><br><br>
            		
       					<% }else { %>
	      	 				<% for(Qna q : list){ %>
                        <tr>
                            <td><%=q.getQnaNo() %></td>
                            <td><%=q.getqTitle() %></td>
                            <td><%=q.getMemName() %></td>
                            <td><%=q.getqCreateDate()%></td>
                        </tr>
                        <% } %>
                       <% } %>

        
                    </table>
                </div>
            </div>
            <br><br>
            <div style="margin-left: 40%;">
            <button>확인</button>
        </div>
        
    </div>
</body>
</html>