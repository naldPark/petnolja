<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

    <style>
        .outer {
            border: gray solid 1px;
            border-radius: 7px;
            width: 1200px;
            height: 800px;
            margin: auto;
            background-color: rgb(248, 248, 248);
            padding:10px;
        }

        #qna-list {
            text-align: center;
            border: 1px solid gray;
            width: 100%;
            font-size: 13px;
            background-color: white;

        }

        #qna-list>tbody>tr:hover{
            background-color: rgb(255, 254, 190);
            cursor: pointer;
        }

        #qna-list td{height: 60px; border: none;}

        #filter {
            float: left;
        }

        #buttons {
            float: right;
        }

        #buttons>button { font-size: 14px;}


        #paging-area>button {
            width:30px;
            height:30px;
            font-size: 12px;
            text-align: center;
        }

        #qna-list td {
            padding: 0;
            vertical-align: middle;
            }
    </style>

</head>
<body>

<%@include file="adminMenubar.jsp" %>


    <div class="outer" align="center">
        <div id="filter" align="left">
            <select id="qna-filter" style="width:120px; font-size:14px;">
                <option value="">전체 조회</option>
                <option value="Y">답변 완료</option>
                <option value="N">답변 안함</option>
            </select>
        </div>
        <div id="buttons" align="right">
            <button class="btn btn-warning btn-sm">삭제</button>
        </div>

        <br><br>
        <table class="table" id="qna-list">
            <thead>
                <tr class="table-success">
                    <th width="60px">선택</th>
                    <th width="80px">글번호</th>
                    <th width="100px">글분류</th>
                    <th width="340px">제목</th>
                    <th width="100px">작성자</th>
                    <th width="110px">작성시간</th>
                    <th width="80px">답변여부</th>
                    <th width="80px">담당자</th>

                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <input type="checkbox">
                    </td>
                    <td>001</td>
                    <td>결제/취소/환불</td>
                    <td>취소 확인은 어디서하나요?</td>
                    <td>jieun1004</td>
                    <td>2021-05-25 12:05:30</td>
                    <td>N</td>
                    <td>관리자2</td>                
                </tr>
                <tr>
                    <td>
                        <input type="checkbox">
                    </td>
                    <td>002</td>
                    <td>기타</td>
                    <td>기타 자가자가장장</td>
                    <td>jieun1004</td>
                    <td>2021-05-25 12:05:30</td>
                    <td>N</td>
                    <td>관리자2</td>                
                </tr>
                <tr>
                    <td>
                        <input type="checkbox">
                    </td>
                    <td>003</td>
                    <td>이용관련</td>
                    <td>할인쿠폰 이용하려면 어떻게 해야하나요?</td>
                    <td>jieun1004</td>
                    <td>2021-05-25 12:05:30</td>
                    <td>N</td>
                    <td>관리자2</td>                
                </tr>
                <tr>
                    <td>
                        <input type="checkbox">
                    </td>
                    <td>004</td>
                    <td>결제/취소/환불</td>
                    <td>제목</td>
                    <td>jieun1004</td>
                    <td>2021-05-25 12:05:30</td>
                    <td>N</td>
                    <td>관리자2</td>                
                </tr>
                <tr>
                    <td>
                        <input type="checkbox">
                    </td>
                    <td>005</td>
                    <td>결제/취소/환불</td>
                    <td>제목</td>
                    <td>jieun1004</td>
                    <td>2021-05-25 12:05:30</td>
                    <td>N</td>
                    <td>관리자2</td>                
                </tr>
                <tr>
                    <td>
                        <input type="checkbox">
                    </td>
                    <td>006</td>
                    <td>결제/취소/환불</td>
                    <td>제목</td>
                    <td>jieun1004</td>
                    <td>2021-05-25 12:05:30</td>
                    <td>N</td>
                    <td>관리자2</td>                
                </tr>
                <tr>
                    <td>
                        <input type="checkbox">
                    </td>
                    <td>007</td>
                    <td>결제/취소/환불</td>
                    <td>제목</td>
                    <td>jieun1004</td>
                    <td>2021-05-25 12:05:30</td>
                    <td>N</td>
                    <td>관리자2</td>                
                </tr>
                <tr>
                    <td>
                        <input type="checkbox">
                    </td>
                    <td>008</td>
                    <td>결제/취소/환불</td>
                    <td>제목</td>
                    <td>jieun1004</td>
                    <td>2021-05-25 12:05:30</td>
                    <td>N</td>
                    <td>관리자2</td>                
                </tr>
                <tr>
                    <td>
                        <input type="checkbox">
                    </td>
                    <td>009</td>
                    <td>결제/취소/환불</td>
                    <td>제목</td>
                    <td>jieun1004</td>
                    <td>2021-05-25 12:05:30</td>
                    <td>Y</td>
                    <td>관리자2</td>                
                </tr>
                <tr>
                    <td>
                        <input type="checkbox">
                    </td>
                    <td>010</td>
                    <td>결제/취소/환불</td>
                    <td>제목</td>
                    <td>jieun1004</td>
                    <td>2021-05-25 12:05:30</td>
                    <td>Y</td>
                    <td>관리자2</td>                
                </tr>




            </tbody>
        </table>

        <!-- 페이징바 -->
                        
        <div id="paging-area">
            <button class="btn btn-outline-primary btn-sm">&lt;</button>
            <button class="btn btn-outline-primary btn-sm">1</button>
            <button class="btn btn-outline-primary btn-sm">2</button>
            <button class="btn btn-outline-primary btn-sm">3</button>
            <button class="btn btn-outline-primary btn-sm">4</button>
            <button class="btn btn-outline-primary btn-sm">5</button>
            <button class="btn btn-outline-primary btn-sm">&gt;</button>
        </div>
    </div>

    <br><br><br><br><br>


<script>

    // 아이디로 검색  // 조회버튼 필요없음

    $(document).ready(function () {
        $("#qna-filter").on("change", function () {
            var value = $(this).val().toLowerCase();
            $("#qna-list>tbody>tr").filter(function () {
                $(this).toggle($(this).children().eq(6).text().toLowerCase().indexOf(value) > -1)
            });
        });
    });
</script>



</body>
</html>