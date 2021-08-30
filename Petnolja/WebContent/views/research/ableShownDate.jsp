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
        <input id="datepicker1" name="reserveStart" type="text" readonly style="width: 100px; border:1px solid lightgray; color: rgb(114, 113, 113); text-align: center;"> -
        <input id="datepicker2" name="reserveEnd" type="text" readonly style="width: 100px; border:1px solid lightgray; color: rgb(114, 113, 113); text-align: center;">
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

                if (!isValidStr(eDay)) {  //만약 2번쨰 달력에 값이 있다면 
                    var index =  abled_days.indexOf(eDay); 
                    var checkDate= new Date(abled_days[index].replace(/-/g, "/"));  // 유저가 선택한 날짜(eDate값)
                    var count = 0;
                    var result = new Date(abled_days[0].replace(/-/g, "/"));

                    for(var i =index ; i>=0 ; i--){  
                        var a = new Date(abled_days[i].replace(/-/g, "/")).getTime();
                        var b= new Date(checkDate.setDate(checkDate.getDate()- count)).getTime();
  
                        if(a!=b){
                            result=  new Date(abled_days[i+1].replace(/-/g, "/"));
                            break;
                        }
                        count=1;
                    }
                    sDate.datepicker({maxDate: new Date(eDay.replace(/-/g, "/"))}); // 1번쨰달력 최소값: 유저가 선택한 날짜
                    if(new Date().getTime()>result.getTime()){
                        result = new Date();
                    }
                    sDate.datepicker({minDate: result}); 
                }
                
                sDate.datepicker({
                    language: 'ko',
                    autoClose: true,
                    onSelect: function () {
                        datePickerSet(sDate, eDate);
                    }
                });
                if (!isValidStr(sDay)) {
                    var index =  abled_days.indexOf(sDay); 
                    var checkDate= new Date(abled_days[index].replace(/-/g, "/"));  // 유저가 선택한 날짜(sDate값)
                    var count = 0;
                    var result = new Date(abled_days[abled_days.length-1].replace(/-/g, "/"));
                    for(var i =index ; i<abled_days.length ; i++){
                        var a = new Date(abled_days[i].replace(/-/g, "/")).getTime();
                        var b= new Date(checkDate.setDate(checkDate.getDate()+ count)).getTime();
                        
                        if(a!=b){
                            result=  new Date(abled_days[i-1].replace(/-/g, "/"));
                            break;
                        }
                        count=1;
                    }
                    eDate.datepicker({minDate: new Date(sDay.replace(/-/g, "/"))}); // 2번쨰달력 최소값: 유저가 선택한 날짜
                    if(new Date(new Date().setMonth(new Date().getMonth() + 3)).getTime()<result.getTime()){
                        result = new Date(new Date().setMonth(new Date().getMonth() + 3));
                    }
                    eDate.datepicker({maxDate: result}); 
                    // 2번쨰달력 최대값: 오늘날짜로부터 3개월뒤 또는 유저가 선택한 날짜로부터 펫시터가 예약가능한 이어지는 마지막날짜중 가까운 날짜로 설정
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