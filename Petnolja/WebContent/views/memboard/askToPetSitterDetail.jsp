<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.petnolja.qna.model.vo.Qna"%>
<%
	Qna a = (Qna)request.getAttribute("q");
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫시터</title>
<style>
        #outer{
          width:1000px;
          margin:auto;
          position:relative;
          font-family:'Noto Sans KR', sans-serif !important;
          border:1px solid lightgray;
          padding: 15px;
        }
        .table th{
            background-color: rgb(230, 230, 230);
            text-align: center; 
        }

</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
<br><br>
 <div id="outer">
    <br>

        <h2>고객센터 - 1:1 문의</h2>       
        <table class="table" style="border:1px solid lightgray">
            <tr>
                <th style="width:200px;">작성자</th>
                <td><%=a.getMemName()%></td>
            </tr>
            <tr>
                <th>제목</th>
                <td><%=a.getqTitle()%></td>
            </tr>
        </table>
        <label for="comment"><h4>본문 내용</h4></label>
          <div class="form-group" style="text-align: left;">
          
           <div class="form-control" rows="5" id="comment" style="height:200px; white-space:pre;"><%=a.getqContent()%></div><br>
          <%if(a.getaCreateDate()==null){ %>
                          아직 등록된 답변이 없습니다 <br>
	          <div class="form-control" rows="5" id="comment" style="height:200px; text-align:left;">
	          </div>
	      <% }else{ %>
	       	  <%=a.getaCreateDate()%> 에 답변이 등록되었습니다 <br>
	          <div class="form-control" rows="5" id="comment" style="height:200px; text-align:left;white-space:pre;">
	        	  <%=a.getaContent()%>
	          </div>
	      <% } %>
          </div>
          <div class="form-group" style="text-align: center;">
           	<button type="button" class="btn btn-secondary" onclick="history.back();">뒤로가기</button>
          </div>
 </div>
 

 <br><br>
 <%@ include file = "../common/footer.jsp"%>
</body>
</html>