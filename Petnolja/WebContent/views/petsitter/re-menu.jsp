<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
<style>
#ul-menu { list-style:none; cursor:pointer; margin: 0%; }
#li-menu { 
  float: left;
  margin-right:20px;
  transition:all .3s ease 
}
#li-menu:hover { color:lightgray; transition:all .3s ease }
#li-menu > span { position:relative }

/*밑줄넣기 부분*/
#li-menu > span::after {
  content: '';
  width: 0%;
  left: 50%;
  height: 1px;
  display: block;
  position: absolute;
  margin-top: 3px;
  border-bottom: 2px solid lightgray;
  transition:all .3s ease;
}
#li-menu:hover > span::after {
  content: '';
  width: 100%;
  left: 0px;
  height: 1px;
  display: block;
  position: absolute;
  margin-top: 3px;
  border-bottom: 2px solid #3498DB;
  transition:all .3s ease;
}
.my-hr {
    border: 0;
    height: 3px;
    background: #ccc;
  }
  </style>
</head>
<body>
  <br>
    <ul id="ul-menu">
    <li id="li-menu"><span>예약내역조회</span></li>
    <li id="li-menu"><span>정산관리</span></li>
  </ul>
    <br>
    <hr class="my-hr" style="margin-left:30px; margin-right: 30px;">
  </body>
</html>