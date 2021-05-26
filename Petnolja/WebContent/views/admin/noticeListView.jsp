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

        #notice-list {
            text-align: center;
            border: 1px solid gray;
            width: 100%;
            font-size: 13px;
            background-color: white;

        }

        #notice-list>tbody>tr:hover{
            background-color: rgb(255, 254, 190);
            cursor: pointer;
        }

        #notice-list td{height: 60px; border: none;}

        #search {
            float: left;
        }

        #buttons {
            float: right;
        }

        #buttons>button {font-size: 14px;}


        #paging-area>button {
            width:30px;
            height:30px;
            font-size: 12px;
            text-align: center;
        }

        #notice-list td {
        padding: 0;
        vertical-align: middle;
        
        }



    </style>
</head>
<body>

<%@include file="adminMenubar.jsp" %>


<body>

    <div class="outer" align="center">
        <div id="search" align="left">
            <input type="search" id="notice-search-box" class="form-control-sm" placeholder="공지사항 제목" style="font-size: 14px; width: 300px;">
        </div>
        <div id="buttons" align="right">
            <button class="btn btn-primary btn-sm">작성하기</button>
            <button class="btn btn-warning btn-sm">삭제</button>
        </div>

        <br><br>
        <table class="table" id="notice-list">
            <thead>
                <tr class="table-success">
                    <th width="60px">선택</th>
                    <th width="80px">글번호</th>
                    <th width="400px">제목</th>
                    <th width="160px">작성자</th>
                    <th width="150px">작성일</th>
                    <th width="100px">조회수</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <input type="checkbox">
                    </td>
                    <td>
                        001
                    </td>
                    <td>이용약관 개정관련 공지사항</td>
                    <td>관리자3</td>
                    <td>2021-05-25</td>
                    <td>103</td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox">
                    </td>
                    <td>
                        002
                    </td>
                    <td>사이트 정기점검관련 공지입니다</td>
                    <td>관리자3</td>
                    <td>2021-05-25</td>
                    <td>103</td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox">
                    </td>
                    <td>
                        003
                    </td>
                    <td>여름맞이 이벤트!</td>
                    <td>관리자3</td>
                    <td>2021-05-25</td>
                    <td>103</td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox">
                    </td>
                    <td>
                        004
                    </td>
                    <td>[QNA] 예약 취소는 어떻게 하나요?</td>
                    <td>관리자3</td>
                    <td>2021-05-25</td>
                    <td>103</td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox">
                    </td>
                    <td>
                        005
                    </td>
                    <td>이용약관 개정관련 공지사항</td>
                    <td>관리자3</td>
                    <td>2021-05-25</td>
                    <td>103</td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox">
                    </td>
                    <td>
                        006
                    </td>
                    <td>이용약관 개정관련 공지사항</td>
                    <td>관리자3</td>
                    <td>2021-05-25</td>
                    <td>103</td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox">
                    </td>
                    <td>
                        007
                    </td>
                    <td>이용약관 개정관련 공지사항</td>
                    <td>관리자3</td>
                    <td>2021-05-25</td>
                    <td>103</td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox">
                    </td>
                    <td>
                        008
                    </td>
                    <td>이용약관 개정관련 공지사항</td>
                    <td>관리자3</td>
                    <td>2021-05-25</td>
                    <td>103</td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox">
                    </td>
                    <td>
                        009
                    </td>
                    <td>이용약관 개정관련 공지사항</td>
                    <td>관리자3</td>
                    <td>2021-05-25</td>
                    <td>103</td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox">
                    </td>
                    <td>
                        010
                    </td>
                    <td>이용약관 개정관련 공지사항</td>
                    <td>관리자3</td>
                    <td>2021-05-25</td>
                    <td>103</td>
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
	
	    $(document).ready(function () {
	        $("#notice-search-box").on("keyup", function () {
	            var value = $(this).val().toLowerCase();
	            $("#notice-list>tbody>tr").filter(function () {
	                $(this).toggle($(this).children().eq(2).text().toLowerCase().indexOf(value) > -1)
	            });
	        });
	    });
	</script>




</body>
</html>