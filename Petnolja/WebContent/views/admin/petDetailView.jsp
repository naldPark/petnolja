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

        div {
            box-sizing: border-box;
            /*border: solid red 1px;*/
        }

        .outer>div {
            width: 100%;
        }

        #petDetail1 {
            height: 10%;
        }

        #petDetail2 {
            height: 90%;
        }

        #petDetail2>div {
            float: left;
            height: 100%;
        }

        #petList {
            width: 25%;
            padding: 20px;
        }

        #petProfile {
            width: 75%;
            padding:20px;
        }

        #mem-info {
            float: left;
            padding: 10px;
            margin-top:10px;
            font-size: 15px;
        }

        #buttons {
            float: right;
        }

        #mem-info, #buttons>button {display: inline-block;}


        #pet-list {
            text-align: center;
            border: 1px solid gray;
            width: 250px;
            float: left;
            font-size: 13px;
        }

        #petProfile>div {
            height: 100%;
            float:left;
            background:azure;

        }

        #pet-img {
            width: 30%;
            padding-top:150px;
        }

        #petInfo {
            width: 70%;
            padding:15px;
        }

        #pet-img>img,
        #pet-img>label {
            display: block;
            margin:auto;
        }

        #pet-img>label{
            width:200px; 
            height:40px; 
            text-align: center; 
            font-weight: 700;
            font-size: 15px;
            background: white;
            line-height: 40px;
            border: 1px gray solid;
            border-radius: 6px;

            }

        /*pet-info ************************/
        #pet-info{
            font-size: 13px;
            background:rgb(248, 248, 248);
            margin-top: 155px;
            border:grey solid 1px;
        }

        #pet-info th{
            background:rgb(255, 221, 166);
            text-align: center; 
            vertical-align: middle;
        }

    </style>


</head>
<body>

<%@include file="adminMenubar.jsp" %>

    <div class="outer">
        <div id="petDetail1">
            <div class="top" id="mem-info" align="left">
                <label>고객명 : 이지은</label>  
                <label>ID : jieun1004</label>
            </div>
            <div id="buttons">
                <button class="btn btn-warning btn-sm" style="font-size: 14px;">삭제</button>
                <button class="btn btn-primary btn-sm" style="font-size: 14px;">목록으로</button>

            </div>
        </div>
        <div id="petDetail2">
            <div id="petList">
                <table class="table" id="pet-list">
                    <thead>
                        <tr class="table-info">
                            <th width="60px">선택</th>
                            <th width="80px">펫번호</th>
                            <th width="80px">펫이름</th>

                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                <input type="checkbox">
                            </td>
                            <td>001</td>
                            <td>백구</td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox">
                            </td>
                            <td>002</td>
                            <td>백구</td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox">
                            </td>
                            <td>003</td>
                            <td>백구</td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox">
                            </td>
                            <td>004</td>
                            <td>백구</td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox">
                            </td>
                            <td>005</td>
                            <td>백구</td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox">
                            </td>
                            <td>006</td>
                            <td>백구</td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox">
                            </td>
                            <td>007</td>
                            <td>백구</td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox">
                            </td>
                            <td>008</td>
                            <td>백구</td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox">
                            </td>
                            <td>009</td>
                            <td>백구</td>
                        </tr>
                        <tr>
                            <td>
                                <input type="checkbox">
                            </td>
                            <td>010</td>
                            <td>백구</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div id="petProfile">
                <div id="pet-img">
                    <img src="resources/img/symbol.png" width="250px" height="250px">
                    <label>백구</label>
                </div>
                <div id="petInfo">
                    <table border="1px solid" class="table" id="pet-info">
                        <tr>
                            <th width="18%;">성별</th>
                            <td width="23%;">F</td>
                            <th width="18%;">등록</th>
                            <td width="42%;">내장형</td>
                        </tr>
                        <tr>
                            <th>견종</th>
                            <td>시고르자브종</td>
                            <th>예방접종</th>
                            <td>종합백신/코로나장염/광견병</td>
                        </tr>
                        <tr>
                            <th>생일</th>
                            <td>2018/05/15</td>
                            <th>주의사항</th>
                            <td>음식알러지/약물복용/분리불안/지병/기타</td>
                        </tr>
                        <tr>
                            <th>몸무게</th>
                            <td>3kg(소형)</td>
                            <th>참고사항</th>
                            <td>부드러운사료만먹음.<br> 산책좋아함.</td>
                        </tr>
                        <tr>
                            <th>중성화</th>
                            <td>Y/N</td>
                            <th>병원정보</th>
                            <td>병원명: 삐뽀삐뽀병원</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>

    <br><br><br><br><br>


</body>
</html>