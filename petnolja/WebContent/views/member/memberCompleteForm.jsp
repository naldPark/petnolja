<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .outer{
		width:1000px;
		height:800px;
		margin:auto;
		margin-top:50px;
		border:1px solid lightgray;
		padding:150px;
    }
    .box{
        width:700px;
        height:350px;
        border:1px solid lightgray;
    }
</style>
</head>
<body>

    <%@ include file="../common/menubar.jsp" %>
    <div class="outer">
        <div align="center">
            <img src="<%=contextPath %>/resources/images/logo.png" style="height:100px">
        </div>
        <br>
        <span style="color:orange;" align="center"><h2><b>회원탈퇴가 안전하게 완료되었습니다.</b></h2></span>
        <br>
        <div class="box" align="center">
            <br><br><br>
            <span><h5>보다 나은 서비스로 다시 찾아뵙겠습니다.</h5></span> <br><br>
            <span><h5>그동안 펫놀자 서비스를 이용해주셔서 감사합니다.</h5></span>
        </div>
        <br>
        <div align="center">
        <button type="button" class="btn btn-primary" onclick="location.href='<%=contextPath%>'">첫화면으로</button>
        </div>
    </div>


    <%@ include file = "../common/footer.jsp"%>
</body>
</html>