<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약내역</title>
</head>
<body>
    <%@ include file="../common/menubar.jsp" %>
    <div class="containerReserv">
        <div class="headReserv">
            <div style="font-size: 35px; font-weight: bold;">예약 내역</div><br><br>
        </div>
        <div class="middleReserv">
            <table border="1" style="width: 100%;">
                <tr> 
                    <tr>
                        <td style="text-align: center;">상태</td>
                        <td style="text-align: center;">예약자</td>
                        <td style="text-align: center;">전화번호</td>
                        <td style="text-align: center;">예약번호</td>
                        <td style="text-align: center;">이용기간</td>
                        <td style="text-align: center;">요청사항</td>
                        <td style="text-align: center;">상세조회</td>
                    </tr>

                    <tr>
                        <td></td> <!--상태-->
                        <td></td> <!--예약자-->
                        <td></td> <!--전화번호-->
                        <td></td> <!--예약번호-->
                        <td></td> <!--이용기간-->
                        <td></td> <!--요청사항-->
                        <td><input type="button" value="상세조회" onclick="location.href='<%=contextPath%>/reserveDetail.sit'"></td>
                    </tr>

                </tr>
            </table>
            <div align="center" class="paging-area">

                <button> &lt; </button>

                <button>1</button>
                <button>2</button>
                <button>3</button>
                <button>4</button>
                <button>5</button>

                <button> &gt; </button>
            </div>
        </div><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <div align="center">
            <button>확인</button>
            </div>
    </div>
</body>
</html>
</body>
</html>