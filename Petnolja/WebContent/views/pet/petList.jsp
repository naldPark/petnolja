<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList, com.petnolja.pet.model.vo.Pet" %>    
<%
	ArrayList<Pet> plist = (ArrayList<Pet>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫놀자</title>
<style>
    #outer{
      width:1000px;
      margin:auto;
      position:relative;
      font-family:'Noto Sans KR', sans-serif !important;
      border:1px solid lightgray;
      padding: 15px;
    }
    .petImg{
        position:relative;
        width:130px;
        height:130px;
        overflow: hidden;
        float: left;
        margin-right: 20px;
        }
    .petImg>img{
        position: absolute;
        top: -9999px;
        left: -9999px;
        right: -9999px;
        bottom: -9999px;
        margin: auto;
        }
    .petBox{
        margin-bottom:30px; padding:15px; height:160px; border: 1px solid lightgrey; margin:5px;
    }

   
</style>
</head>
<body>
<%@ include file="../common/menubar.jsp" %>
<br><br>
<div id="outer">
<br>
    
    <h3>반려동물을 추가해보세요</h3>   
    반려동물을 추가하지 않으면 예약이 진행되지 않습니다<br><br>
    <!--검색조회기능-->
    <div align="right">
    <button type=button class="btn btn-primary" onclick="return validate();">반려동물 추가</button></div><br>
   <!-- 뭉뭉이 리스트 시작-->
          <% if(loginUser==null||plist==null){ %>
      	<br>조회된 리스트가 없습니다.<br><br><br>
            		
       <% }else { %>
	      	 <% for(Pet p : plist){ %>
        <div class="petBox"> 
            <div class="petImg"><img src="<%=contextPath %>/<%=p.getPetImg()%>" style="height: 130px;"></div>
            <div style="float:left;">
                <br>
                <h6><b></b></h6><br>
                <span><%=p.getPetName()%> / <%=p.getPetBirth()%> / <%=p.getPetGender()%> / <%=p.getPetWeight()%>kg(<%=p.getPetBreed()%>) </span><br>
            </div>
            <div class="linkList" style="padding-left:750px; text-align: center;">
                <button type="button" class="btn btn-outline-primary btn-block">자세히보기</button>
                <button type="submit" class="btn btn-outline-secondary btn-block" onclick="location.href='<%=contextPath%>/updatePet.me?pno=<%=p.getPetNo()%>';">수정</button>
                <button type="button" class="btn btn-outline-secondary btn-block" data-toggle="modal" data-target="#delete<%=p.getPetNo()%>">삭제</button><br>
            </div>
        </div><br>


        <div class="modal deletePet" id=delete<%=p.getPetNo()%>>
            <div class="modal-dialog">
              <div class="modal-content" style="width:400px">
                <div class="modal-body" align="center"><br>
	                <form action="<%=contextPath%>/deletePet.me" method="post">
                        <input type="hidden" name="petNo" value="<%=p.getPetNo()%>">
                        <input type="hidden" name="petImg" value="<%=p.getPetImg()%>">
	                    <h4><b><%=p.getPetName()%> 삭제</b></h4><br>삭제 이후 복원이 불가합니다.<br>반려동물의 정보를 모두 삭제하시겠습니까?<br><br>
	                    <button type="submit" class="btn btn-primary" class="deleteButton">삭제</button>
	                    <button type="button" class="btn btn-secondary"  data-dismiss="modal">취소</button>
	               </form>
                   <br><br>
                </div>
              </div>
            </div>
        </div>
              <!-- 뭉뭄이 리스트 끝-->
    	<% } %>
	<% } %>

  </div>
  <script>
      function validate(){
        if(<%=plist.size()%>==3){
          alert("3마리를 초과하여 추가할 수 없습니다");
          }else{
            location.href='<%=contextPath%>/addpet1.me'
          }
      }      
  </script>

<br><br>
<%@ include file = "../common/footer.jsp"%>
</html>