<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" href="resources/images/adFavicon.ico">

<title>펫놀자? 관리자!</title>

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

    #box{
        position: relative;

    }

    #logo{
        width: 200px;
        height: 200px;
        position: absolute;
        margin: auto;
        left: 0;
        right: 0;
        top: 0;
        bottom: 0;
    }
    
    #logo>img{width:100%; height:100%;}
</style>
</head>
<body>

<%@include file="adminMenubar.jsp" %>

<div class="outer" id="box">


    <div id="logo">
        <img src="resources/images/logo.png">

    </div>
</div>

<br><br><br><br><br>
</body>
</html>