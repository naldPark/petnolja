<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.ArrayList, com.petnolja.board.model.vo.MemNotice"%>
<%
	ArrayList<MemNotice> list = (ArrayList<MemNotice>)request.getAttribute("list");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        #outer{
          width:1000px;
          height:100%;
          margin:auto;
          font-family:'Noto Sans KR', sans-serif !important;
          border:1px solid lightgray;
          padding: 15px;
        }
        .question{cursor:pointer; border-radius:10px; }
        .question>th{text-align: center; font-weight: normal;}
        .answer{
                height:100px;
                margin-top:5px;
                border-radius:10px;  
                display:none;
            }

        .answer>td{background-color: rgb(247, 247, 247);}
        .classification:hover{cursor: pointer;}

</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
<br><br>
 <div id="outer">
    <br>


        <h2>고객센터</h2><br>
        <div style="border:1px solid lightgray; padding: 40px;">
            <div style="float:left; width:400px;">
                <h5><b>자주묻는 질문 검색</b></h5><br>
                <div class="input-group mb-3">
              	  <input type="text" class="form-control" id="myInput" placeholder="검색어를 입력하세요">
                </div>
            </div>
            <div style="margin-left:500px;" align="center">
                <h5><b>찾으시는 질문이 없다면 ?</b></h5><br>
                <button type="button" onclick="location.href='<%=contextPath%>/askToAdminList.mem?currentPage=1'" class="btn btn-secondary" style="width:200px">1:1문의</button>
            </div>
           
        </div><br>
        <div style="text-align: left;" >&nbsp; <span id="showAll">전체</span>           | 
            <span style="text-decoration: none; color:gray" class="classification">회원정보</span> | 
            <span style="text-decoration: none; color:gray" class="classification">결제/환불/취소</span> | 
            <span style="text-decoration: none; color:gray" class="classification">이용관련</span> | 
            <span style="text-decoration: none; color:gray" class="classification">기타</span>
        </div>

          <div class="container mt-3">
            <table class="table table-bordered">
              <thead>
                <tr style="background: lightgray; text-align: center;">
                    <th width="100">번호</th>
                    <th width="200">분류</th>
                    <th width="700">내용</th>
                  </tr>
              </thead>
              <tbody id="myTable">
              
	              
	   <% if(list.isEmpty()){ %>
	    <!-- 리스트가 비어있을 경우 -->
      	 <tr>
      	 	<td colspan="3">존재하는 FAQ가 없습니다.</td>
      	 <tr>

      <% }else { %>	
      	 <!-- 리스트가 비어있지 않을 경우 --> 
	      	 <% for(MemNotice n : list) { %>
	      	 
	      			 <tr class="question">
		                    <th><%=n.getNoticeNo() %></th>
		                    <th><%= n.getNoticeCategory() %></th>
		                    <td><%= n.getNoticeTitle() %></td>
	                  </tr>
	                  <tr class="answer">
		                    <td colspan="2"></td>
		                    <td><%= n.getNoticeContent() %></td>
	                  </tr>
	      	 
	   		 <% } %> 
                         

         
      <% } %>  
              </tbody>
            </table>
         </div>
           
         
          
         <script>
          $(document).ready(function(){
            //검색창에 입력시 필터링
            $("#myInput").on("keyup", function() {
                $(".answer").hide(); 
                $(".question").show();
                var value = $(this).val().toLowerCase();
                $("#myTable tr").filter(function() {
                  $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1)
                  $(".answer").hide();
                });
             });
             //질문입력시 다른 질문은 닫히고 입력한 질문이 열림
            $(".question").click(function(){         
                if($(this).next().slideUp()){
                  $(".answer").slideUp();         
                  $(this).next().slideDown(); 
                }
            })
            //분류선택시 일단 창이 닫히고 분류로 구분해서 해당 내용만 보여줌
             $(".classification").click(function(){
                var temp = $(".question").children("th:odd");
                for(var i=0 ; i<temp.length;i++){
	              if($(this).text()==temp.eq(i).text()){
	                $(".answer").hide();     
	                temp.parent().hide(); 
	                temp.eq(i).parent().show();      
	              }
           	    }
         	  })
          	//전체 선택시 기존으로 돌아감
            $("#showAll").click(function(){
              $(".answer").slideUp(); 
              $(".question").show();
            })
         });
       </script>


<br><br>
   
 </div>
 
 <%@ include file = "../common/footer.jsp"%>
</body>
</html>