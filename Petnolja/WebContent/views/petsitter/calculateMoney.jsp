<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.petnolja.admin.model.vo.Calculate, java.util.ArrayList" %>

<% 
Calculate c = (Calculate)request.getAttribute("c");
int m = Integer.parseInt(c.getCalMonth()); // 펫시터가 서비스한 월
int realMonth = m + 1;// 실제 정산되는 월
ArrayList<Calculate> list = (ArrayList<Calculate>)request.getAttribute("list"); 
%>
  <!DOCTYPE html>
  <html>
<head>

    <style>
        .container {
            width: 1000px;
            margin: auto;
            padding: 0px;
        }

        .container div span {
            display: table-cell;
            vertical-align: middle;
        }

        .middle {
            margin-top: 10px;
            box-sizing: border-box;
            width: 1000px;
            height: 900px;
        }

        .middle-middle-1 {

            width: 1000px;
            height: 140px;
            background-color: #E1F0FA;
        }

        .my-hr2 {
            border: 0;
            margin: 0%;
            height: 3px;
            background: #ccc;
        }

        .cash {
            text-align: right;
            font-size: 17px;
        }

        .word1 {
            color: #A4A4A4;
        }

        .content{
            line-height:80%;
            font-size: 15px;
            padding: 10px;
            width: 100%;
            box-sizing: border-box;

        }
    </style>
</head>

<body>
    <%@ include file="../petsitter/reserveMenu.jsp" %>
    <div class="container">
        <br>
        <br>
        <span style="font-size: 30px; font-weight:bold;">정산 금액 조회</span>
        <span style="font-size: 15px; color: #CFCFCF;">&nbsp;&nbsp;매월 정산금액은 익월 15일에 지정하신 계좌로 입금됩니다.</span>


        <!-- MIDDLE -->
        <div class="middle">
            <div class="middle-middle-1">
                <div style="padding:20px 50px 0px"><%=realMonth %>/15 정산 예정 금액</div>
                <span style="font-size:40px; padding:0px 50px"><%=c.getPayTotal() %>원</span><br>
                <br>
                <hr class="my-hr2">

                <div style="font-size: 14px; height: 30px;">
                    <h6 style="float:left; margin-top: 5px; font-weight: 500; color: #A4A4A4;"> 최근 정산 내역</h6>
                    <input id="calSearch" style="float:right; margin-right: 10px; margin-top: 5px;" type="month">
                    <label style="float:right; margin-top: 7px;">서비스 단위기간 입력 :&nbsp;</label>
                </div>
                <br>

                <div class="content">
                		<!-- list.isEmpty()이면 이 페이지 연결된 더보기 버튼이 비활성화되는거니까 따로 if문 처리 안함 -->
                		<%if(list.isEmpty()){ %>
                		    <p class="word1" align="center" style="height: 300px; margin-top: 50px; font-size: 18px;">정산 내역이 존재하지 않습니다.</p>
                		
                		
                		<% } else { %>
	                		<%for(Calculate cal : list) { %>
		                		<% String year = cal.getCalYear(); //서비스 한 년도 %>
		                		<% String month = cal.getCalMonth(); // 서비스 한 월%>
		                		<% int rYear = Integer.parseInt(month) == 12? Integer.parseInt(year) + 1 : Integer.parseInt(year); // 실제 정산 년도 %>
		                		<% int rMonth = Integer.parseInt(month) == 12? 1 : Integer.parseInt(month) + 1; // 실제 정산 월%>
	                		
			                	<p class="word1"><%=rYear %>.<%= rMonth %>.15</p>
			                    <p><%= year %>년 <%=month %>월 서비스 정산</p>
			                    <p class="cash">+<%=cal.getPayTotal() %>원</p>
			                    <hr>	
	                		<% } %>
                		<% } %>
                </div>
            </div>
        </div>
        <br><br><br><br><br><br><br>
    </div><br>
    <%@ include file="../common/footer.jsp" %>


	<script>
	
	$(function(){

		$("#calSearch").on("change", function(){
			
			var date = $(this).val();
			
			location.href="callist.sit?date=" + date;
			
		});
		
		
	});
	
	</script>

</body>
</html>








