<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫놀자</title>
</head>
<body>
	<%@ include file="../common/menubar.jsp" %>
 <br>

<div id="outer">
  <table border="1" align="center">
    <tr>
        <td rowspan="2"><%@ include file="sitterSetDate.jsp" %></td>
        <td>
          선택 날짜* <br><input type="date"><input type="date">
        </td>
    </tr>
    <tr>
      <td>
        <span style="font-size: 16px; font-weight: bold;">시간대 설정</span>
        <span style="font-size: 11px; color: #BCBCBC;">미선택 시 체크인 13시,체크아웃 12시로 설정됩니다.</span><br><br>
        <span>체크인 </span>
        <span><select>
            <option>13시</option>
            <option>14시</option>
            <option>15시</option>
            <option>16시</option>
            <option>17시</option>
        </select> 이후</span>
        <br>
        <span>체크아웃 </span>
        <span><select>
            <option>12시</option>
            <option>13시</option>
            <option>14시</option>
            <option>15시</option>
            <option>16시</option>
        </select> 이전</span><br><br><br><br><br>
        
        <span><button>설정하기</button><button>뒤로가기</button></span>
      </td>
    </tr>
  </table>
  <div>
  
</div>
</div>

<%@ include file = "../common/footer.jsp"%>

</body>
</html>