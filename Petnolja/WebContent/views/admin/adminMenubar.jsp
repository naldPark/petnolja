<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.petnolja.admin.model.vo.Admin"%>
    
    
<%
	String contextPath = request.getContextPath();
	Admin loginAdmin = (Admin)session.getAttribute("loginAdmin");
	String alertMsgAd = (String)session.getAttribute("alertMsgAd");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <!--부트스트랩-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<style>


    .menubar {
        width: 1200px;
        height: 40px;
        font-family: 'Nanum Gothic', sans-serif;
        margin: auto;
        position: relative;
        z-index: 999;

    }

    #menu{
        list-style-type: none;
        margin: 0px;
        padding:0px;
        height: 100%;
    }

    #menu>li {
        float: left;
        width: 150px;
        height: 100%;
        text-align: center;
    }

    .menubar ul {
        padding: 0px;
        margin: 0px;
        box-sizing: border-box;
        height: 100%;
    }

    /*메뉴 스타일*/
    #menu a {
        /*border: blue solid 1px;*/
        border-radius: 6px;
        box-sizing: border-box;
        display: block;
        width: 100%;
        text-align: center;
        line-height: 35px;
        height: 100%;
        text-decoration: none;
        color: white;
    }

    #menu>li li{ list-style-type: none;}

    #menu>li>a {
        background-color: rgb(27, 119, 182);
        font-size: 14px;
    }

    #menu>li>ul a {
        background-color: orange;
        font-size: 13px;
    }


    /*메뉴 효과*/

    #menu>li>a:hover {
        background-color: orange;
    }

    #menu>li>ul>li>a:hover {
        background-color: rgb(241, 196, 15);
    }

    #menu>li>ul {
        padding: 0;
        display: none;
    }

    #menu>li>a:hover+ul {
        display: block;
    }

    #menu>li>ul:hover {
        display: block;
    }


    .menu-etc a:hover {
        color: green !important;
        font-weight: 600;
    }

    .menu-etc{
       /* border: red solid 1px;*/
        float: left;
        height: 100%;
    }



</style>
</head>

<body>

	<script>
	
		var alertMsgAd = "<%= alertMsgAd %>";
		
		if (alertMsgAd != "null"){
			alert(alertMsgAd);
			<% session.removeAttribute("alertMsgAd"); %>
		}
	</script>
		
<br><br>
<div class="menubar">

    <ul id="menu">
        <li><a href="<%=contextPath %>/memlist.ad?currentPage=1">회원 관리</a></li>
        <li>
            <a href="<%=contextPath%>/oldlist.ad?currentPage=1">펫시터 관리</a>
            <ul>
                <li><a href="<%=contextPath%>/oldlist.ad?currentPage=1">기존 펫시터 관리</a></li>
                <li><a href="<%=contextPath%>/newlist.ad?currentPage=1">신규 펫시터 관리</a></li>
            </ul>
        </li>
        <li><a href="<%=contextPath %>/qnalist.ad?currentPage=1">게시판 관리</a>
            <ul>
                <li><a href="<%=contextPath%>/qnalist.ad?currentPage=1">1:1문의내역</a></li>
                <li><a href="<%=contextPath%>/nlist.ad?currentPage=1">공지사항</a></li>
            </ul>
        </li>
        <li><a href="<%=contextPath%>/reportlist.ad?currentPage=1">신고내역 관리</a></li>
        <li>
            <a href="<%=contextPath%>/deallist.ad?currentPage=1">거래내역 관리</a>
            <ul>
                <li><a href="<%=contextPath%>/deallist.ad?currentPage=1">거래내역</a></li>
                <!--
                <li><a href="">통계자료</a></li>
                -->
                <li><a href="<%=contextPath %>/callist.ad?currentPage=1">펫시터 정산</a></li>
            </ul>
        </li>
        <li style="width:450px;">
                <div class="menu-etc" style="width: 50%; text-align: right; line-height: 35px; font-size: 15px;"><%=loginAdmin.getAdminId() %></div>
                <div class="menu-etc" style="width: 25%;"><a href="<%=contextPath%>/logout.ad" id="logout-btn" style="color: black; font-size: 15px;">로그아웃</a></div>
                <div class="menu-etc" style="width: 25%;"><a href="<%=contextPath%>" id="site-btn" style="color: black; font-size: 15px;">펫놀자사이트</a></div>
        </li>
    </ul>
</div>



</body>
</html>