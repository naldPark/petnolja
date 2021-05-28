<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import ="com.petnolja.member.model.vo.Member"%>
 <%
 	String contextPath = request.getContextPath();
 	Member loginUser = (Member)session.getAttribute("loginUser");
 	String alertMsg = (String)session.getAttribute("alertMsg");

 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫놀자</title>
<style>

*{font-family:'Noto Sans KR', sans-serif;}
.navbar-nav>li{font-size: 18px; font-weight: bold;}
#dropdownMenuButton:hover{border-radius:50%; box-shadow:0 10px 20px rgba(0, 0, 0, 0.2), 0 6px 4px rgba(0, 0, 0, 0.2); cursor: pointer;}
#logoButton:hover{border-radius:20%; box-shadow:0 10px 20px rgba(0, 0, 0, 0.2), 0 6px 4px rgba(0, 0, 0, 0.2);}

</style>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<link rel = "preconnect"href = "https://fonts.gstatic.com">
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

</head>
<body>

	<script>
		var msg = "<%= alertMsg %>"; 
		
		if(msg != "null"){
			alert(msg);
			<% session.removeAttribute("alertMsg"); %>
		}
	</script>


    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="<%=contextPath %>"><img src="<%=contextPath %>/resources/images/logo.png" style="height: 45px"  id="logoButton" ></a> 
        <div class="navbar-collapse" >
                <ul class="navbar-nav mr-auto">
                  <li class="nav-item active">
                    <a class="nav-link" href="<%=contextPath %>">홈</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="<%=contextPath%>/searchSitter.mem">펫시터조회</a>
                  </li>
                  <!--펫시터만 보여지는 메뉴-->
                 <% if(loginUser != null && loginUser.getAuthSitter()!=null && loginUser.getAuthSitter().equals("Y")){%>  
                      <li class="nav-item">
                        <a class="nav-link" href="#">예약관리</a>
                      </li>

                      <li class="nav-item">
                          <a class="nav-link" href="#">펫시팅관리</a>
                        </li>
                   <%} %>
                    <!--펫시터만 보여지는 메뉴 끝-->
                </ul>
                <% if(loginUser != null){%>
                <span><b><%=loginUser.getMemName()%></b> 님  환영합니다&nbsp;&nbsp;</span>
                <%} %>
                <img src="<%=contextPath %>/resources/images/member/user.png" style="height: 45px; margin-right:20px;" id="dropdownMenuButton" data-toggle="dropdown">

                <% if(loginUser != null){%>
                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
                  <a class="dropdown-item" href="<%=contextPath%>/views/member/memberUpdateForm.jsp">회원정보수정</a>
                  <a class="dropdown-item" href="<%=contextPath%>/views/memreserve/reserveList.jsp">예약내역</a>
                  <a class="dropdown-item" href="<%=contextPath%>/views/pet/daliyLog.jsp">일지보기</a>
                  <a class="dropdown-item" href="<%=contextPath%>/views/pet/petList.jsp">반려견등록</a>
                  <a class="dropdown-item" href="<%=contextPath%>/favoriteList.mem?currentPage=1">즐겨찾기조회</a>
                  <a class="dropdown-item" href="<%=contextPath%>/logout.mem">로그아웃</a>
                  <%}else{%>
                    <script>
                      $("#dropdownMenuButton").click(function(){
                        window.alert("로그인 후 이용 가능합니다");
                      });
                    </script>
                  <%}%>
               </div> 
        </div>       
        <hr>
      </nav>
</body>
</html>