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
        background: rgb(210, 235, 250) !important; 
        border-radius: 0em; 
        color:darkgrey;
    }
    .datepicker--day-name{color:black;}
    </style>
</head>

<body>

    <div class="double">
        <input id="datepicker1" type="text" style="width: 100px; border:1px solid lightgray; color: rgb(114, 113, 113); text-align: center;"> -
        <input id="datepicker2" type="text" style="width: 100px; border:1px solid lightgray; color: rgb(114, 113, 113); text-align: center;">
    </div>

    <script>

        datePickerSet($("#datepicker1"), $("#datepicker2"), true); 
        function datePickerSet(sDate, eDate, flag) {
                var sDay = sDate.val(); //시작달력
                var eDay = eDate.val(); //끝달력
                
                // 날짜차단하기 시작
          
                var abled_days = '<%=sitterInfo.getAbleDate()%>'.split(","); //차단할 날짜
                $('#datepicker1, #datepicker2').datepicker({
                    language: 'ko',
                    onRenderCell: function (date, cellType) {
                        pretty_date = date.getFullYear() + '-' + ("00" + (date.getMonth() + 1)).slice(-2) + "-" + ("00" + date.getDate()).slice(-2); //date날짜 두자리로 출력
                        var abled = false
                        if  (cellType == 'day') {   
                            abled = abled_days.indexOf(pretty_date) == -1}
                        return {disabled: abled}
                    }
                });
                // 날짜차단하기 끝

                

                sDate.datepicker({minDate: new Date()}); //시작날짜 오늘로 설정 
                eDate.datepicker({minDate: new Date()}); //시작날짜 오늘로 설정 
                eDate.datepicker({maxDate: new Date(new Date().setMonth(new Date().getMonth() + 3))});// 3달뒤로 종료날짜정하기
                sDate.datepicker({maxDate: new Date(new Date().setMonth(new Date().getMonth() + 3))});// 3달뒤로 종료날짜정하기



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