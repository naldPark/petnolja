<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.petnolja.common.model.vo.PageInfo, java.util.ArrayList, com.petnolja.petsitter.model.vo.Sitter" %>    
<%
	PageInfo pi = (PageInfo)request.getAttribute("pi");
	ArrayList<Sitter> list = (ArrayList<Sitter>)request.getAttribute("list");
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
        .reserveImg{
            position:relative;
            width:150px;
            height:150px;
            overflow: hidden;
            float: left;
            margin-right: 20px;
            }
        .reserveImg>img{
            position: absolute;
            top: -9999px;
            left: -9999px;
            right: -9999px;
            bottom: -9999px;
            margin: auto;
            }
        #linkList>a{
            text-decoration: underline;
            color: gray;
        }
        #linkList>a>span{
            font-size:12pt;
            line-height: 35px;
        }
        .likeImgDiv img:hover{cursor: pointer; opacity:0.7; }
       
</style>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
<br><br>
 <div id="outer">
    <br>
        
        <h3>즐겨찾기조회</h3>   
        <br><br>


       <!-- 즐겨찾기 리스트 시작-->
       
       <% if(list.isEmpty()){ %>
      	<br>조회된 리스트가 없습니다.<br><br><br>
            		
       <% }else { %>
	      	 <% for(Sitter s : list){ %>
			      <div style="margin-bottom:30px; padding-left:20px; padding-top:15px; background-color: rgb(230, 240, 247); height:180px;" > 
			        <div class="reserveImg"><img src="<%=contextPath%>/<%=s.getPath()%>" style="height: 150px;"></div>
			        <div style="float:left;">
			            <br>
			            <h6><b><%=s.getSitterTitle() %></b></h6><br>
			            <br>
			            <span>펫시터: <%=s.getSitterName()%></span><br>
			        </div>
			        <div id="linkList" style="padding-left:800px; text-align: center;">
			            <br>
			            <a href="../research/searchPetsitterDetail.jsp"><span>자세히보기</span></a><br><br>
			            <div class="likeImgDiv" value=<%=s.getSitterNo()%>><img src="<%=contextPath%>/resources/images/member/favoriteHeart.png"></div><br>
			        </div>
			      </div>
	
	      		<% } %>

      <!-- 즐겨찾기 리스트 끝-->
      
      <!-- 페이지 목록 시작 -->
	             <ul class="pagination justify-content-center">
	             <% if(pi.getCurrentPage() != 1){ %>
	                <li class="page-item"><a class="page-link" href="<%=contextPath%>/favoriteList.mem?currentPage=<%=pi.getCurrentPage()-1%>">&lt;</a></li>
	           	 <% } %>
	           	 <% for(int p=pi.getStartPage(); p<=pi.getEndPage(); p++){ %>
	           	 
	           		 <% if(p != pi.getCurrentPage()){ %>
	               		 <li class="page-item"><a class="page-link" href="<%=contextPath%>/favoriteList.mem?currentPage=<%= p %>"><%= p %></a></li>
		             <% }else { %>
		            	 <li class="page-item" ><a class="page-link" style="background:rgb(194, 227, 238)" href="<%=contextPath%>/favoriteList.mem?currentPage=<%= p %>"><%= p %></a></li>
	            	 <% } %>
	             <% } %>
	     
	
				<% if(pi.getCurrentPage() != pi.getMaxPage()){ %>
	            	<li class="page-item"><a class="page-link" href="<%=contextPath%>/favoriteList.mem?currentPage=<%=pi.getCurrentPage()+1%>"> &gt;</a></li>
				<% } %>
	              </ul>
      <!-- 페이지 목록 끝 -->
     <% } %>

  </div> 
        
  <div class="modal cancelBtn">
    <div class="modal-dialog">
      <div class="modal-content" style="width:400px">
        <div class="modal-body" align="center">
        <br>
            <h4><b>예약취소</b></h4><br>예약을 취소하시겠습니까?<br><br>
            <button type="button" class="btn btn-primary" id="cancelBtn">
                취소하기
              </button>
            <button type="button" class="btn btn-secondary"  data-dismiss="modal">
                보류
              </button>
              <br><br>
        </div>
      </div>
    </div>
  </div>

  <div class="modal" id="finCancelReserv">
    <div class="modal-dialog">
      <div class="modal-content" style="width:400px">
        <div class="modal-body" align="center">
        <br>
            <h4><b>예약취소</b></h4><br><br>예약내용이 취소되었습니다.<br><br>
            <button type="button" class="btn btn-primary" onclick="location.href='<%=contextPath%>/views/member/reserveList.jsp'" data-dismiss="modal">
                확인
              </button>
              <br><br>
        </div>
      </div>
    </div>
  </div>
  
  
  	<script>
		$(".likeImgDiv").click(function(){ 
			var sitterLike = $(this);
			var like = '<img src="<%=contextPath%>/resources/images/member/favoriteHeart.png">'
			var unlike = '<img src="<%=contextPath%>/resources/images/member/justHeart.png">'
			console.log(sitterLike.attr("value"));
			$.ajax({
				url:"changeFavorite.mem",
				data:{
					sitterNo:sitterLike.attr("value")
				},
				type:"post",
				success:function(result){			
					if(result>1){
						sitterLike.html(unlike);
						alert("즐겨찾기가 해제 되었습니다");
					}else{
						sitterLike.html(like);
						alert("즐겨찾기가 추가되었습니다");
					}
				},error:function(){
					console.log("ajax통신 실패");
				}
			});
  		  });

	</script>


 <br><br>
 <%@ include file = "../common/footer.jsp"%>
</body>
</html>