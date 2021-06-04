<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .container-stop{
        width: 700px;
        padding: 50px 0px 40px 100px;
        margin: auto;
        border: 1px solid #C7C7C7;
    }
    table{
    border : 1px solid #D6D6D6;
    border-collapse : collapse;
    }
    .btn1 {
        border: 0px;
        margin-left: 5px;
        background-color: #3498DB;
        color: white;
        border-radius: 5px;
        width: 70px;
        height: 25px;
    }
</style>
</head>
<body>
    <div class="container-stop">
        <img src="<%=contextPath %>/resources/images/PET.png" style="width: 200px;"><br><br><br>
        <div class="head-stop">
            <div style="height: auto; width: 80%; border:1px solid #D6D6D6; padding: 10px 0px 30px 30px;">
                <div>
                    <div style="font-size: 30px; font-weight: bold;">문의 내역 관리</div><br>
                </div>
                <div>
                    <form action="<%=contextPath%>/selectQna.sit"  method="post">
                    <table border="1" style="height: 140px; width: 95%; text-align: center;">
                        <tr>
                            <td >번호</td>
                            <td>제목</td>
                            <td>작성자</td>
                            <td>작성일</td>
                        </tr>

                        <tr>
                            <td>1</td>
                            <td ><% %></td>
                            <td>김은용</td>
                            <td>2020-01-02</td>
                        </tr>

                        <tr>
                            <td>2</td>
                            <td>으억 살려주세요ㅕ 흑허ㅏㅇㄹ하</td>
                            <td>김은용</td>
                            <td>2020-01-03</td>
                        </tr>

                        <tr>
                            <td>3</td>
                            <td>으억 살려주세요ㅕ 흑허ㅏㅇㄹ하</td>
                            <td>김은용</td>
                            <td>2020-01-04</td>
                        </tr>
                    </table>
                    </form>
                </div>
            </div>
            <br><br>
            <div style="margin-left: 40%;">
            <button>확인</button>
        </div>
        
    </div>
</body>
</html>