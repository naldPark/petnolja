<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.petnolja.pet.model.vo.Pet,java.util.ArrayList"%>
    <%
    
    Pet inpo = (Pet)request.getAttribute("inpo");	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫 상세조회</title>
<style>
.container-check {
    width: 800px;
    margin: 0 auto;
    
}
.top{
    border: 1px solid #D6D6D6;
    width: 580px;
    height: 140px;
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
    height: 390px;
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
                        <td style="font-size: 17px;">
                            <%=inpo.getMemName() %> 보호자님의 <%=inpo.getPetName() %>
                        </td>
                    </tr>

                    <tr>
                        <td style="font-weight: bold; font-size: 17px;">
                        	<%=inpo.getPetSize() %> /
                        	<%=inpo.getPetGender() %> /
                        	<%=inpo.getPetBreed() %>
                        </td>
                    </tr>
                </table>
            </div><br>
            <div class="middle">
                <table >
                    <tr>
                        <td class="title-dog">생일</td>
                        <td><%=inpo.getPetBirth() %></td>
                    </tr>
                    <tr>
                        <td class="title-dog">몸무게</td>
                        <td><%=inpo.getPetWeight() %></td>
                    </tr>
                    <tr>
                        <td class="title-dog">반려견등록</td>
                        <td><%=inpo.getChip() %></td>
                    </tr>
                    <tr>
                        <td class="title-dog">예방접종</td>
                        <td><%=inpo.getVaccine() %></td>
                    </tr>
                </table>

            </div>
            
            <div class="footer">
                <table>
                    <tr>
                        <td style="font-weight: bold;font-size: 17px;">
                            주의사항
                        </td>
                    </tr>
                    <tr>
                        <td><%=inpo.getCaution() %></td>
                    </tr>
                </table><br>

                <table>
                    <tr>
                        <td class="title-dog">정보</td>
                    </tr>
                    <tr>
                        <td><textarea name = "ta2" rows="4" cols= "50" wrap = "virtual"><%=inpo.getNote() %></textarea></td>
                    </tr>
                </table><br>

                <table >
                    <tr>
                        <td colspan="2" class="title-dog">자주 다니는 동물병원</td>
                    </tr>
                    <tr>
                        <td class="title-dog">병원명</td>
                        <td><%=inpo.getHospi() %></td>
                    </tr>
                    <tr>
                        <td class="title-dog">전화번호</td>
                        <td><%=inpo.getHospiTel() %></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>

</body>
</html>