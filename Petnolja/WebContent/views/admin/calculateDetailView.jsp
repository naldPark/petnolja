<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.petnolja.common.model.vo.PageInfo, java.util.ArrayList, com.petnolja.admin.model.vo.Calculate" %>

<% 
	PageInfo pi=(PageInfo)request.getAttribute("pi"); 
	ArrayList<Calculate> CNFlist = (ArrayList<Calculate>)request.getAttribute("CNFlist");
    ArrayList<Calculate> CNClist = (ArrayList<Calculate>)request.getAttribute("CNClist");
    ArrayList<Calculate> list = new ArrayList<>();
    list.addAll(CNFlist); list.addAll(CNClist);
    int year = (int)request.getAttribute("year");
    int month = (int)request.getAttribute("month"); 
    String sid = (String)request.getAttribute("sid"); 
    int currentPage = pi.getCurrentPage();
    int startPage = pi.getStartPage();
    int endPage = pi.getEndPage();
    int maxPage = pi.getMaxPage();
%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


    <style>
        .outer {
            border: gray solid 1px;
            border-radius: 7px;
            width: 1200px;
            height: 800px;
            margin: auto;
            background-color: rgb(248, 248, 248);
            padding: 10px;
        }

        #calculate-detail-list {
            text-align: center;
            border: 1px solid gray;
            width: 100%;
            font-size: 13px;
            background-color: white;
        }

        .account-info {
            margin-top: 10px;
        }

        .account-info>span span {
            font-size: 15px;
            font-weight: 600;
        }
		
        .account-info>span {

            border: 3px solid rgb(241, 129, 88);
            padding: 5px;
            background-color: white;
            border-radius: 6px;
            margin-right: 10px;
        }

        #calculate-detail-list>tbody tr {
            height: 55px;
        }


        #paging-area>button {
            width: 30px;
            height: 30px;
            font-size: 12px;
            text-align: center;
        }
    </style>


</head>
<body>

<%@include file="adminMenubar.jsp" %>

    <div class="outer" align="center">
        <div class="account-info" align="left">
            <span>
                <span>ID : <%= sid %> &nbsp; &nbsp;</span>
                
            </span>

            <span>
                <span>정산기간 : <%= year %>년 <%= month %>월 &nbsp; &nbsp;</span>
            </span>

        </div>

        <br>
        <table class="table" id="calculate-detail-list">
            <thead>
                <tr class="table-warning">
                    <th width="100px">번호</th>
                    <th width="200px">서비스일</th>
                    <th width="200px">거래번호</th>
                    <th width="200px">금액(원)</th>
                    <th width="200px">취소 수수료</th>
                    <th width="200px">누적금액(원)</th>
                </tr>
            </thead>
            <% long sumPay = 0; %>
            <% int index = 1; %>
            <tbody>
				<% if(list.isEmpty()){ %>
            		<tr>
            			<td colspan="6">조회된 결과가 없습니다.</td>
            		</tr>
            	<% }else { %>
            		<% for(Calculate c : list){ %>
            			<% long eachPay = c.getPayAmount(); %>
		                <tr>
		                	<td><%= index %></td>
		                	<% index++; %>
		                    <td><%= c.getDealDate() %></td>
		                    <td><%= c.getPayNo() %></td>
		                    <td><%= eachPay %></td>
		                    <td><%= c.getIsPenalty() %></td>
		                    <% sumPay += eachPay; %>
		                    <td><%= sumPay %></td>
		                </tr>
                	<% } %>
                <% } %>
            </tbody>
        </table>
        
        <div align="right"><b>정산총액 : <%= sumPay %></b></div>

        <!-- 페이징바 -->
        <div id="paging-area">
            <div id="paging-area">
			<% if(currentPage != 1){ %>
            	<button onclick="location.href='<%=contextPath%>/calculateDetail.ad?currentPage=<%=currentPage-1%>';" class="btn btn-outline-primary btn-sm"> &lt; </button>
			<% } %>

            <% for(int p=startPage; p<=endPage; p++){ %>
            	
            	<% if(p != currentPage){ %>
	            	<button onclick="location.href='<%=contextPath%>/calculateDetail.adcurrentPage=<%= p %>';" class="btn btn-outline-primary btn-sm"><%= p %></button>
	            <% }else { %>
	            	<button class="btn btn-outline-primary btn-sm" disabled><%= p %></button>
            	<% } %>
            	
            <% } %>

			<% if(currentPage != maxPage){ %>
            	<button onclick="location.href='<%=contextPath%>/calculateDetail.ad?currentPage=<%=currentPage+1%>';" class="btn btn-outline-primary btn-sm"> &gt; </button>
			<% } %>

        </div>
    </div>

    <br><br><br><br><br>


</body>
</html>