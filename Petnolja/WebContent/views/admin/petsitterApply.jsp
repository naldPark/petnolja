<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.petnolja.petsitter.model.vo.Petsitter"%>
    
<%
	Petsitter p = (Petsitter)request.getAttribute("p");
%>    

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>petsitterApply</title>
    
        <style>
        .outer {
            border: gray solid 1px;
            border-radius: 7px;
            width: 1200px;
            height: 1000px;
            margin: auto;
            padding: 10px;
            background-color: rgb(248, 248, 248);

        }

        .applyContent {
            width: 90%;
            height: 95%;
            margin: auto;
        }

        #basicInfo {
            width: 100%;
            height: 95%;
            margin: auto;

        }

        .box {
            font-size: 14px;
            width: 100%;
            height: 250px;
            background-color: rgb(255, 255, 227);
            border-radius: 7px;
        }

        #buttons {
            margin-top: 14px;
            width: 100%;

        }

        #buttons>button {
            font-size: 14px;
        }

        .applyContent h6{
            height: 30px;
        line-height: 35px;
        }
        
    </style>
</head>

<body>

    <%@ include file="adminMenubar.jsp" %>
    <div class="outer" align="center">
        <div class="applyContent" align="left">
            <table id="basicInfo" >
                <tr>
                    <th colspan="2">
                        <h4><b>펫시터 지원서</b></h4>
                    </th>
                </tr>
                <tr>
                    <td>
                        <h6><b>아이디 : <%= p.getMemID() %></b></h6>
                    </td>
                    <td>
                        <h6><b>제공 서비스 : <%= p.getAdditions() %></b></h6>
                    </td>
                </tr>

                <tr>
                    <td>
                        <h6><b>반려동물 반려기간 : <%= p.getPetPeriod() %></b></h6>
                    </td>
                    <td>
                        <h6><b>자격증 보유현황 : <%= p.getLicense() %></b></h6>
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6><b>현재 반려견 수 : <%= p.getPetNo() %></b></h6>
                    </td>
                    <td>
                        <h6><b>펫시팅 경험 : 
							<% if(p.getExperience().equals(null)) {%>
								N	
							<%}else { %>
								Y
							<% } %>
						</b></h6>
                    </td>
                </tr>


                <tr>
                    <td colspan="2">
                        <h6><b>지원동기</b></h6>

                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="box"><%= p.getMotive() %></div>

                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <h6><b>하고싶은 말</b></h6>

                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="box"><%= p.getAddContent() %></div>

                    </td>
                </tr>
            </table>
            <div class="bottom" id="buttons" align="right">
                <button type="button" onclick="location.href='<%=contextPath%>/petsitterAccept.ad?sno=<%= p.getSitterNo()%>';" class="btn btn-success btn-sm">승인</button>
                <button type="button" onclick="location.href='<%=contextPath%>/petsitterDeny.ad?sno=<%= p.getSitterNo()%>';" class="btn btn-warning btn-sm">거절</button>
                <button type="button" class="btn btn-info btn-sm" onClick="location.href='<%=contextPath%>/newlist.ad?currentPage=1'">목록으로</button>
            </div>
        </div>
    </div>
    <br><br><br><br><br>
</body>

</html>