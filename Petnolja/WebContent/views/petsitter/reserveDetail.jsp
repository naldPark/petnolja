<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.petnolja.petsitter.model.vo.Detail,java.util.ArrayList"%>
    <%
    
    Detail d = (Detail)request.getAttribute("d");
	
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container-check {
    width: 800px;
    margin: 0 auto;
    
}
.top{
    border: 1px solid #D6D6D6;
    width: 530px;
    height: 50px;
    padding: 10px 0px 10px 70px;
}
.middle{
    border: 1px solid #D6D6D6;
    width: 580px;
    height: 170px;
    padding: 20px 0px 0px 20px;
}
.footer{
    border: 1px solid #D6D6D6;
    width: 580px;
    height: 350px;
    padding: 20px 0px 0px 20px;
}
.title-dog{
    font-weight: bold;
    font-size: 17px;
    width: 120px;
}
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
    <div class="container-check">
        <div class="pet_check">
            <div class="top">
                <table>
					<tr>
						<td style="font-size: 17px;">승인상태</td>
						<td><%=d.getResStatus() %></td>
					</tr>
                    <tr>
                        <td style="font-size: 17px;">예약번호</td>
						<td name="nno"><%=d.getResNo() %></td>
                    </tr>
                </table>
            </div><br>
            <div class="middle">
                <table >
                    <tr>
                        <td class="title-dog">보호자</td>
                        <td><%=d.getMemName() %></td>
                    </tr>
                    <tr>
                        <td class="title-dog">연락처</td>
                        <td><%=d.getMemTel() %></td>
                    </tr>
                    <tr>
                        <td class="title-dog">체크인</td>
                        <td><%=d.getResCheckin() %></td>
                    </tr>
					<tr>
                        <td class="title-dog">체크아웃</td>
                        <td><%=d.getResCheckout() %></td>
                    </tr>
                </table>

            </div>
            
            <div class="footer">
                <table>
                    <tr>
                        <td style="font-weight: bold;font-size: 17px;">
                           	 함께 할 반려견
                        </td>
                    </tr>
                    <tr>
                        <td><%=d.getPetName() %></td>
                    </tr>
                </table><br>

                <table>
                    <tr>
                        <td class="title-dog"><%=d.getReQuest() %></td>
                    </tr>
                    <tr>
                        <td><textarea name = "ta2" rows="5" cols= "70" wrap = "virtual"></textarea></td>
                    </tr>
                </table><br>
                <table >
                    <tr>
                        <td colspan="2" class="title-dog">정산 예정 금액</td>
                    </tr>
                    <tr>
                        <td class="title-dog">얼마</td>
						<td>금액</td>
                    </tr>
                    
                </table>
				<br><br><br><br>
				</div>
        </div>
    </div>

</body>
</html>