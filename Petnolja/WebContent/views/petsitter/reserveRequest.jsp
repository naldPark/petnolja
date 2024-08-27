<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.petnolja.petsitter.model.vo.Reserv,com.petnolja.petsitter.model.vo.Detail,java.util.ArrayList"%>
    <%
    
	ArrayList<Reserv> list = (ArrayList<Reserv>)request.getAttribute("list");
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 요청</title>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>
    <div class="containerReserv">
        <div class="headReserv">
            <div style="font-size: 35px; font-weight: bold;">예약 요청</div><br><br>
        </div>
        <div class="middleReserv">
            <table border="1" style="width: 100%;">
                
                    <tr>
                        <td style="text-align: center;">상태</td>
                        <td style="text-align: center;">예약자</td>
                        <td style="text-align: center;">전화번호</td>
                        <td style="text-align: center;">예약번호</td>
                        <td style="text-align: center;" colspan="2">이용기간</td>
                        <td style="text-align: center;">요청사항</td>
                        <td style="text-align: center;">상세조회</td>
                    </tr>

                    <% if(list.isEmpty()){ %>
      						<br>조회된 리스트가 없습니다.<br><br><br>
            		
       					<% }else { %>
	      	 				<% for(Reserv r : list){ %>
                        <tr>
                        	<tr>
                            	<td style="text-align: center;"><%=r.getResStatus() %></td>
                            	<td style="text-align: center;"><%=r.getMemName()%></td>
                            	<td style="text-align: center;"><%=r.getMemTel() %></td>
                            	<td style="text-align: center;"><%=r.getResNo() %></td>
                            	<td style="text-align: center;"><%=r.getResCheckin() %></td>
                            	<td style="text-align: center;"><%=r.getResCheckout() %></td>
                            	<td style="text-align: center;"><%=r.getReQuest() %></td>
                            	<td style="text-align: center;"><a href='<%=contextPath%>/reserveDetail.sit?rno=<%=r.getResNo()%>'><span>자세히보기</span></a></td>
                            </tr>                                                                 
                            
                        </tr>
                        <% } %>
                       <% } %>

            </table>
        </div><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <div align="center">
            <button>확인</button>
            </div>
    </div>
</body>
</html>