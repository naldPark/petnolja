<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.container-check {
    width: 800px;
    margin: 0 auto;
    
}
.top{
    border: 1px solid #D6D6D6;
    width: 530px;
    height: 160px;
    padding: 10px 0px 10px 70px;
}
.middle{
    border: 1px solid #D6D6D6;
    width: 580px;
    height: 170px;
    padding: 20px 0px 0px 20px;
}
.footer{
    border: 1px solid #D6D6D6;
    width: 580px;
    height: 350px;
    padding: 20px 0px 0px 20px;
}
.title-dog{
    font-weight: bold;
    font-size: 17px;
    width: 120px;
}
</style>
</head>
<body>
    <div class="container-check">
        <div class="pet_check">
            <div class="top">
                <table>
                    <tr>
                        <td rowspan="2" style="width: 150px; height: 150px; font-size: 17px; ">사진</td>
                        <td style="font-size: 17px;">홍믿음 보호자님의 쪼꼬</td>
                    </tr>

                    <tr>
                        <td style="font-weight: bold; font-size: 17px;">소형 / 3살 / 여아 (중성화 0) / 믹스</td>
                    </tr>
                </table>
            </div><br>
            <div class="middle">
                <table >
                    <tr>
                        <td class="title-dog">생일</td>
                        <td>18년 4월</td>
                    </tr>
                    <tr>
                        <td class="title-dog">몸무게</td>
                        <td>2.2kg</td>
                    </tr>
                    <tr>
                        <td class="title-dog">중성화</td>
                        <td>했음</td>
                    </tr>
                    <tr>
                        <td class="title-dog">반려견등록</td>
                        <td>내장형</td>
                    </tr>
                    <tr>
                        <td class="title-dog">예방접종</td>
                        <td>DHPPL/코로나장염/광견병/켄넬코프/심장사상충</td>
                    </tr>
                </table>

            </div>
            
            <div class="footer">
                <table>
                    <tr>
                        <td style="font-weight: bold;font-size: 17px;">
                            주의사항
                        </td>
                    </tr>
                    <tr>
                        <td>음식알러지,약물복용</td>
                    </tr>
                </table><br>

                <table>
                    <tr>
                        <td class="title-dog">돌봄시 참고사항</td>
                    </tr>
                    <tr>
                        <td><textarea name = "ta2" rows="5" cols= "70" wrap = "virtual"></textarea></td>
                    </tr>
                </table><br>

                <table >
                    <tr>
                        <td colspan="2" class="title-dog">자주 다니는 동물병원</td>
                    </tr>
                    <tr>
                        <td class="title-dog">병원명</td>
                        <td>KH동물병원(논현동)</td>
                    </tr>
                    <tr>
                        <td class="title-dog">전화번호</td>
                        <td>02-1234-5678</td>
                    </tr>
                </table>
            </div>
        </div>
    </div>

</body>
</html>