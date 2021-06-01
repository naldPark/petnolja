<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8" />
    <style>table { border-collapse: collapse;}  </style>
    <title></title>
    <script type="text/javascript" >
	
    var today = new Date();//오늘 날짜
    var check=0;
 
 
    function prevClaendar(){//이전 달력
      today = new Date(today.getFullYear(), today.getMonth()-1,today.getDate());
      check--;
      buildCalendar();
    }
    //다음 달력을 오늘을 저장하고 달력에 뿌려줌
    function nextCalendar(){
      today = new Date(today.getFullYear(), today.getMonth()+1,today.getDate());
      check++;
      buildCalendar();
      
 
    }
    function buildCalendar(){
          var nMonth = new Date(today.getFullYear(),today.getMonth(),1);// 이번달의 첫번째날
          console.log("nMonth"+nMonth);
          var lastDate =new Date(today.getFullYear(),today.getMonth()+1,0);//이번달의 마지막날
          console.log("lastDate"+lastDate);
          var tblCalendar =document.getElementById("calendar");    //테이블 달력을 만드는 테이블
          var tblCalendarYM =document.getElementById("calendarYM"); ///XXXX년도XX월 출력
          tblCalendarYM.innerHTML = today.getFullYear()+"년"+(today.getMonth()+1)+"월";
          console.log("tblCalendarYM"+tblCalendarYM.innerHTML);
    
          //기존에 테이블에 잇던 달력 내용 삭제
          while(tblCalendar.rows.length>2){
            tblCalendar.deleteRow(tblCalendar.rows.length -1);
          }
          var row = null;
          row =tblCalendar.insertRow();
          var cnt =0;
          // 1일이 시작되는 칸을 맞추어줌
 
          for ( i=0; i <nMonth.getDay(); i++) {
              cell =row.insertCell();
              cnt = cnt + 1;
          }

          //달력 출력
          var userAbleDate='<%=sitterInfo.getAbleDate()%>'.split(",");   
          var todayForDay = new Date();
          var checkDate = new Date(todayForDay.getFullYear(), todayForDay.getMonth()+1+check,todayForDay.getDate());

          for(i=1; i<=lastDate.getDate(); i++){
                  cell =row.insertCell();
                  cell.innerHTML = i;
                  cell.style.color="lightgrey";

                  //여기서 비활성화 조정하자
                  if(i< 10){ varDate = "0" + i}else{varDate=i};
                  var test=checkDate.toISOString().substring(0,8)+varDate;
                  var ableCheck= checkDate.toISOString().substring(0,8)+varDate;

                 for(var k=0;k<userAbleDate.length;k++){

                      if(userAbleDate[k]==ableCheck){
                        cell.style.background="rgb(210, 235, 250)";
                        cell.style.color="darkgrey";
                        }
                    }
                cnt = cnt + 1;
                if (cnt%7 == 0)    //1주=7일
                row = calendar.insertRow();
         } 
   }
 
    </script>
        <style>
            #calendar>*{text-align: center; color:grey;}
        </style>
  </head>
  <body>
    <table id="calendar"  border="0" align="center" width="270" height="270" style="font-size:13pt;">
      <tr>
        <td align ="center"> <label onclick="prevClaendar()">&lt; </label> </td>
        <td colspan="5" align ="center" id="calendarYM">yyyy년 m월</td>
        <td align ="center"> <label onclick="nextCalendar()">&gt;</label> </td>
      </tr>
 
      <tr>
        <td align="center">일</td>
        <td align="center">월</td>
        <td align="center">화</td>
        <td align="center">수</td>
        <td align="center">목</td>
        <td align="center">금</td>
        <td align="center">토</td>
      </tr>
 
    </table>
        <script type="text/javascript" >
          buildCalendar();
         
        </script>

 
  </body>
</html>
 