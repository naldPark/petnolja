<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="com.petnolja.common.model.vo.PageInfo, java.util.ArrayList, com.petnolja.petsitter.model.vo.Petsitter %>

<% PageInfo pi=(PageInfo)request.getAttribute("pi"); 
    ArrayList<Petsitter> list = (ArrayList<Petsitter>)request.getAttribute("list");
    int currentPage = pi.getCurrentPage();
    int startPage = pi.getStartPage();
    int endPage = pi.getEndPage();
    int maxPage = pi.getMaxPage();
%>

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
            padding: 10px;
        }

        #report-list {
            text-align: center;
            border: 1px solid gray;
            width: 100%;
            font-size: 13px;
            background-color: white;
        }

        #report-list>tbody>tr:hover {
            background-color: rgb(255, 234, 211);
            cursor: pointer;
        }

        #report-list td {
            height: 60px;
            border: none;
        }

        #search {
            float: left;
        }

        #buttons {
            float: right;
        }

        #buttons>button {
            font-size: 14px;
        }


        #paging-area>button {
            width: 30px;
            height: 30px;
            font-size: 12px;
            text-align: center;
        }

        #report-list td {
            padding: 0;
            vertical-align: middle;
        }
    </style>

</head>

<body>

	<%@include file="adminMenubar.jsp" %>

    <div class="outer" align="center">
        <div id="search" align="left">
            <input type="search" id="report-search-box" class="form-control-sm" placeholder="신고글 제목"
                style="font-size: 14px; width: 300px;">
        </div>
        <div id="buttons" align="right">
            <button class="btn btn-info btn-sm">복구</button>
            <button class="btn btn-warning btn-sm">삭제</button>
        </div>
    
        <br><br>
        <table class="table" id="report-list">
            <thead>
                <tr class="table-danger">
                    <th width="60px">선택</th>
                    <th width="80px">글번호</th>
                    <th width="410px">제목</th>
                    <th width="100px">작성자</th>
                    <th width="100px">작성일</th>
                    <th width="100px">신고자</th>
                    <th width="100px">신고일</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <input type="checkbox">
                    </td>
                    <td>001</td>
                    <td>%%$댓글달고 돈벌자$%%</td>
                    <td>adsea</td>
                    <td>2021-05-20</td>
                    <td>cucumber11</td>
                    <td>2021-05-25</td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox">
                    </td>
                    <td>002</td>
                    <td>오이 펫시터님 덕분에 휴가 잘 보냈어요^^</td>
                    <td>adsea</td>
                    <td>2021-05-20</td>
                    <td>cucumber11</td>
                    <td>2021-05-25</td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox">
                    </td>
                    <td>001</td>
                    <td>광고광고~~~~~제목~~~~~~~~</td>
                    <td>adadman</td>
                    <td>2021-05-20</td>
                    <td>cucumber11</td>
                    <td>2021-05-25</td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox">
                    </td>
                    <td>001</td>
                    <td>%%$댓글달고 돈벌자$%%</td>
                    <td>adsea</td>
                    <td>2021-05-20</td>
                    <td>cucumber11</td>
                    <td>2021-05-25</td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox">
                    </td>
                    <td>001</td>
                    <td>%%$댓글달고 돈벌자$%%</td>
                    <td>adsea</td>
                    <td>2021-05-20</td>
                    <td>cucumber11</td>
                    <td>2021-05-25</td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox">
                    </td>
                    <td>001</td>
                    <td>%%$댓글달고 돈벌자$%%</td>
                    <td>adsea</td>
                    <td>2021-05-20</td>
                    <td>cucumber11</td>
                    <td>2021-05-25</td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox">
                    </td>
                    <td>001</td>
                    <td>%%$댓글달고 돈벌자$%%</td>
                    <td>adsea</td>
                    <td>2021-05-20</td>
                    <td>cucumber11</td>
                    <td>2021-05-25</td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox">
                    </td>
                    <td>001</td>
                    <td>%%$댓글달고 돈벌자$%%</td>
                    <td>adsea</td>
                    <td>2021-05-20</td>
                    <td>cucumber11</td>
                    <td>2021-05-25</td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox">
                    </td>
                    <td>001</td>
                    <td>%%$댓글달고 돈벌자$%%</td>
                    <td>adsea</td>
                    <td>2021-05-20</td>
                    <td>cucumber11</td>
                    <td>2021-05-25</td>
                </tr>
                <tr>
                    <td>
                        <input type="checkbox">
                    </td>
                    <td>001</td>
                    <td>%%$댓글달고 돈벌자$%%</td>
                    <td>adsea</td>
                    <td>2021-05-20</td>
                    <td>cucumber11</td>
                    <td>2021-05-25</td>
                </tr>
            </tbody>
        </table>

        <!-- 페이징바 -->
        <div id="paging-area">
            <% if(currentPage !=1){ %>
                <button onclick="location.href='<%=contextPath%>/oldlist.ad?currentPage=<%=currentPage-1%>';"> &lt; </button>
            <% } %>

            <% for(int p=startPage; p<=endPage; p++){ %>
            	<% if(p !=currentPage){ %>
                    <button onclick="location.href='<%=contextPath%>/oldlist.ad?currentPage=<%= p %>';"><%= p %></button>
                <% }else { %>
                	<button disabled><%= p %></button>
                <% } %>
            <% } %>

            <% if(currentPage !=maxPage){ %>
                <button onclick="location.href='<%=contextPath%>/oldlist.ad?currentPage=<%=currentPage+1%>';"> &gt; </button>
            <% } %>

        </div>
    </div>

    <br><br><br><br><br>

	<script>
        $(document).ready(function () {
            $("#report-search-box").on("keyup", function () {
                var value = $(this).val().toLowerCase();
                $("#report-list>tbody>tr").filter(function () {
                    $(this).toggle($(this).children().eq(2).text().toLowerCase().indexOf(value) > -1)
                });
            });
        });
    </script>
</body>

</html>