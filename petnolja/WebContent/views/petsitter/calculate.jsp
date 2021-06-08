<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.petnolja.admin.model.vo.Calculate, com.petnolja.petsitter.model.vo.Account" %>
<% 
Calculate c = (Calculate)request.getAttribute("c");
Account a = (Account)request.getAttribute("a");

String accNum = "";
if (a != null) {
accNum = a.getAccNumber().substring((a.getAccNumber().length()-4), (a.getAccNumber().length()));
}

%>
  <!DOCTYPE html>
  <html>
  <head>
    <style>
        .container {
            width: 1000px;
            margin: auto;
        }

        .container div span {
            display: table-cell;
            vertical-align: middle;
        }

        .middle {
            box-sizing: border-box;
            margin-top: 10px;
            width: 100%;
            height: 500px;
        }

        .middle>div{
            margin: auto;
            margin-top: 20px;
            width: 600px;
            height: 150px;
            background-color: #E1F0FA;
            padding: 20px;
        }

        .msg{
            float:left;
            width: 80%;
            font-size: 15px;
        }

        .buttons{
            font-size: 14px !important; 
        }

    </style>
</head>

<body>
    <%@ include file="../petsitter/reserveMenu.jsp" %>
    <div class="container">
        <div class="middle">
            <div>
                <h4 style="font-weight: 600;">정산 금액 조회</h4><br>
                <div>
                	<% if(c == null) { %>
                	
                    <span class="msg">정산 예정 금액이 없습니다.</span>
                    <input disabled type="button" class="btn btn-primary btn-sm buttons" value="더보기" align="right">
                        
                	<% } else { %>
                    <span class="msg"><%=c.getCalYear() %>년 <%=(Integer.parseInt(c.getCalMonth()) +1)%>월 정산 금액은 [<%=c.getPayTotal() %>]원입니다.</span>
                    <input type="button" class="btn btn-primary btn-sm buttons" value="더보기"
                        onclick="location.href='<%=contextPath%>/callist.sit'" align="right">
                	<% } %>
                </div>
            </div>

            <div>
                <h4 style="font-weight: 600;">정산 계좌 관리</h4><br>
                <div>
                	<%if (a == null){ %>
                    <span class="msg">현재 등록된 대표 계좌가 존재하지 않습니다.</span>
                	<% } else { %>
                    <span class="msg">현재 등록된 대표 계좌는<%=a.getAccBank() %>은행의 끝자리[<%=accNum %>]입니다.</span>
                	<% } %>
                    <input type="button" class="btn btn-primary btn-sm buttons" value="더보기"
                        onclick="location.href='<%=contextPath%>/calacc.sit'" align="right">
                </div>
            </div>
        </div>
        <br><br>

    </div><br>
    <%@ include file="../common/footer.jsp" %>
    
</body>



  </html>