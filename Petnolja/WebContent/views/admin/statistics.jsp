<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>

    <!--부트스트랩-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

    <style>
        .outer {
            border: gray solid 1px;
            border-radius: 7px;
            width: 1200px;
            height: 1200px;
            margin: auto;
            padding: 10px;
        }


        .content {
            width: 1150px;
            height: 950;
            margin: auto;
        }

        table {
            text-align: center;
        }


        #sum {
            background-color: lightgrey;
        }

        .container {
            width: 500px;
            height: auto;
        }
    </style>

    
    <style>
        /*최서경 작업*/

        #admin-chart{
            box-sizing: border-box;
            width:100%;
            height: 100%;
        }


    

    </style>

</head>

<body>

    <%@include file="adminMenubar.jsp" %>
    <br><br><br>
    <div class="outer">

        <table id="admin-chart" align="center">

            <tr>
                <td colspan="2" align="left">
                    <input type="month">
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <h5 align="left"><b>상세내역</b></h5>
                </td>
            </tr>

            <tr>
                <td>
                    <table id="money-table" class="table-bordered" align="center">
                        <tr class="table-warning">
                            <th width="120" height="50px">날짜</th>
                            <th width="120">매출</th>
                            <th width="120">비용</th>
                            <th width="120">비고</th>
                        </tr>
                        
                        
                        <tr>
                            <td id="sum">총계</td>
                            <td>1,500,230,000</td>
                            <td>2,003,000</td>
                            <td></td>
                        </tr>

                    </table>
                </td>
                <td>
                    <div class="container" align="right">
                        <canvas id="myChart1"></canvas>
                    </div>
                </td>
            </tr>

            <tr>
                <td colspan="2"><h5 align="left"><b>견종별</b></h5>
                </td>
            </tr>

            <tr>
                <td>
                    <div class="container" align="center"> 
                        <canvas id="myChart2"></canvas> 
                    </div>
                </td>
                <td>
                    <table id="t_table" class="table-bordered" align="center">
                        <tr class="table-warning">
                            <th width="120" height="50">견종</th>
                            <th width="120">거래량</th>
                            <th width="120">순익</th>
                            <th width="120">순익/거래량</th>
                        </tr>
                        <tr>
                            <td height="50">소형견</td>
                            <td id="little_num">1700</td>
                            <td id="little_sum">2000</td>
                            <td id="little_net">1443</td>
                        </tr>
                        <tr>
                            <td height="50">중형견</td>
                            <td id="middle_num">1500</td>
                            <td id="middle_sum">1900</td>
                            <td id="middle_net">1546</td>
                        </tr>
                        <tr>
                            <td height="50">대형견</td>
                            <td id="big_num">1900</td>
                            <td id="big_sum">2200</td>
                            <td id="big_net">1394</td>
                        </tr>
                        
                    </table>
                </td>
            </tr>

            <tr>
                <td colspan="2"><h5 align="left"><b>지역별</b></h5>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="container" align="center"> 
                        <canvas id="myChart3"></canvas> 
                    </div>
                </td>
                <td>
                    <table id="t_table" class="table-bordered" align="center">
                        <tr class="table-warning">
                            <th width="120" height="50">지역</th>
                            <th width="120">거래량(건)</th>
                            <th width="120">순익(원)</th>
                            <th width="120">순익/거래량</th>
                        </tr>
                        <tr>
                            <td id="a1" height="50">경기도 용인시</td>
                            <td>234,234</td>
                            <td>2,003,000</td>
                            <td id="1st">2343</td>
                        </tr>
                        <tr>
                            <td id="a2" height="50">서울시</td>
                            <td>1,500,230,000</td>
                            <td>2,003,000</td>
                            <td id="2nd">1900</td>
                        </tr>
                        <tr>
                            <td id="a3" height="50">제주도</td>
                            <td>1,500,230,000</td>
                            <td>2,003,000</td>
                            <td id="3rd">1800</td>
                        </tr>
                        <tr>
                            <td id="a4" height="50">경기도 성남시</td>
                            <td>1,500,230,000</td>
                            <td>2,003,000</td>
                            <td id="4th">1700</td>
                        </tr>
                        <tr>
                            <td id="a5" height="50">강원도 강릉시</td>
                            <td>1,500,230,000</td>
                            <td>2,003,000</td>
                            <td id="5th">1690</td>
                        </tr>
                        <tr>
                            <td id="a6" height="50">부산광역시</td>
                            <td>1,500,230,000</td>
                            <td>2,003,000</td>
                            <td id="6th">1680</td>
                        </tr>
                        <tr>
                            <td id="a7" height="50">광주광역시</td>
                            <td>1,500,230,000</td>
                            <td>2,003,000</td>
                            <td id="7th">1640</td>
                        </tr>
                        
                    </table>
                </td>
            </tr>
        </table>


    </div>

    <br><br><br>




    <!--차트 그리는 스크립트-->
    <script>
        

        var chBar = document.getElementById("myChart2");
        var chartData = {
            labels: ["거래량", "거래금액", "순익/거래량"],
            datasets: [
                {
                    label: '소형견',
                    data: [$("#little_num").text(), $("#little_sum").text(), $("#little_net").text()],
                    backgroundColor: 'rgba(255, 99, 132, 0.2)'
                },
                {
                    label: '중형견',
                    data: [$("#middle_num").text(), $("#middle_sum").text(), $("#middle_net").text()],
                    backgroundColor: 'rgba(54, 162, 235, 0.2)'
                },
                {
                    label: '대형견',
                    data: [$("#big_num").text(), $("#big_sum").text(), $("#big_net").text()],
                    backgroundColor: 'rgba(255, 206, 86, 0.2)'
                }]
            };
            var myChart2 = new Chart(chBar, {
            // 챠트 종류를 선택 
            type: 'bar',
            // 챠트를 그릴 데이타 
            data: chartData,
            options: {
                legend: {
                    diplay: false
                }
            }
        });

        var ctx3 = document.getElementById('myChart3').getContext('2d');
        var chart = new Chart(ctx3, {
            // 챠트 종류를 선택 
            type: 'bar',
            // 챠트를 그릴 데이타 
            data: {
                labels: [$("#a1").text(), $("#a2").text(), $("#a3").text(), $("#a4").text(), $("#a5").text(), $("#a6").text(),$("#a7").text()],
                datasets: [{
                    label: '순익/거래량 순위',
                    data: [$("#1st").text(), $("#2nd").text(), $("#3rd").text(), $("#4th").text(), $("#5th").text(), $("#6th").text(), $("#7th").text()],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)',
                        'rgba(54, 162, 23, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)',
                        'rgba(54, 162, 23, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });

    </script>
</body>



</html>