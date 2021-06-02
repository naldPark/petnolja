<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .container-day {
        width: 800px;
        height: 800px;
        border: 1px solid #C7C7C7;
    }
</style>
</head>
<body>
    <div class="container-day">
        <div class="head-day">
            <div style="font-size: 35px; font-weight: bold;">시팅 일지 관리</div><br><br>
            <div style="font-size: 20px;">이지은 보호자님의 쪼꼬,뿌꾸</div><br>
        </div>
        <div class="middle-day">
            <table border="1" style="width: 100%;">
                <tr> 
                    <tr>
                        <td style="width: 20%; height: 40px;">번호</td>
                        <td style="text-align: center; width: 30%; ">예약일</td>
                        <td style="width: 100px; text-align: center; width: 30%;">작성 시간</td>
                        <td style="text-align: center; width: 20%;">작성 상태</td>
                    </tr>

                    <tr>
                        <td>1</td>
                        <td style="text-align: center; height: 40px;">2020-05-05 15:00 ~ 24:00</td>
                        <td style="text-align: center;">11:59</td>
                        <td style="text-align: center;"><button>작성하기</button><button>추가작성</button></td>
                    </tr>

                    <tr>
                        <td>2</td>
                        <td style="text-align: center; height: 40px;">2020-05-08 15:00 ~ 24:00</td>
                        <td style="text-align: center;">17:28</td>
                        <td style="text-align: center;"><button>작성하기</button><button>추가작성</button></td>
                    </tr>

                    <tr>
                        <td>3</td>
                        <td style="text-align: center; height: 40px;">2020-05-09 15:00 ~ 24:00</td>
                        <td style="text-align: center;">17:45</td>
                        <td style="text-align: center;"><button>작성하기</button><button>추가작성</button></td>
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
                <button>6</button>
                <button>7</button>
                <button>8</button>
                <button>9</button>
                <button>10</button>

                <button> &gt; </button>
            </div>
        </div><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
        <div align="center">
            <button>확인</button>
            </div>
    </div>
</body>
</html>