 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>펫시터</title>
  
    <link rel="stylesheet"  href="<%=request.getContextPath()%>/resources/css/datepicker.min.css">
    <script src="<%=request.getContextPath()%>/resources/js/jquery-3.1.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/datepicker.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/js/datepicker.ko.js"></script>
    <style>
    .double div {float: left;}
    /* .-disabled-{background: lightgrey}; */
    .datepicker--cell:not(.-disabled-) {
        background: rgb(0, 123, 255) !important; 
        border-radius: 0em; 
        color:white;
    }
    .datepicker--day-name{color:black;}
    </style>
</head>

<body>

    <div class="double">
        <input id="datepicker1" type="text" style="width: 100px; border:1px solid lightgray"> -
        <input id="datepicker2" type="text" style="width: 100px; border:1px solid lightgray">
    </div>

    <script>

        datePickerSet($("#datepicker1"), $("#datepicker2"), true); 
        function datePickerSet(sDate, eDate, flag) {
                var sDay = sDate.val(); //시작달력
                var eDay = eDate.val(); //끝달력

                // 날짜차단하기 시작
                var disabled_days = ["2021-5-2", "2021-5-8", "2016-6-20"]; //차단할 날짜를 적으면 됨
                $('#datepicker1, #datepicker2').datepicker({
                    language: 'ko',
                    onRenderCell: function (date, cellType) {
                        pretty_date = date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate();
                        var disabled = false
                        if  (cellType == 'day')    
                            disabled = disabled_days.indexOf(pretty_date) != -1
                        return {disabled: disabled}
                    }
                });
                // 날짜차단하기 끝

                sDate.datepicker({minDate: new Date()}); //시작날짜 오늘로 설정 
                //   minDate: new Date('2021-05-03'.replace(/-/g, "/"))
                eDate.datepicker({maxDate: new Date(new Date().setMonth(new Date().getMonth() + 3))});// 3달뒤로 종료날짜정하기
                // eDate.datepicker({maxDate: new Date('2021-05-20'.replace(/-/g, "/")) });



                if (flag && !isValidStr(sDay) && !isValidStr(eDay)) { 		
                    var sdp = sDate.datepicker().data("datepicker");
                    sdp.selectDate(new Date(sDay.replace(/-/g, "/")));  

                    var edp = eDate.datepicker().data("datepicker");
                    edp.selectDate(new Date(eDay.replace(/-/g, "/")));  
                }
                if (!isValidStr(eDay)) {
                    sDate.datepicker({
                        maxDate: new Date(eDay.replace(/-/g, "/"))
                    });
                }
                sDate.datepicker({
                    language: 'ko',
                    autoClose: true,
                    onSelect: function () {
                        datePickerSet(sDate, eDate);
                    }
                });

                if (!isValidStr(sDay)) {
                    eDate.datepicker({
                        minDate: new Date(sDay.replace(/-/g, "/"))
                    });
                }
                eDate.datepicker({
                    language: 'ko',
                    autoClose: true,
                    onSelect: function () {
                        datePickerSet(sDate, eDate);
                    }
                });


            function isValidStr(str) {
                if (str == null || str == undefined || str == "")
                    return true;
                else
                    return false;
            }
        }
    </script>
</body>

</html>