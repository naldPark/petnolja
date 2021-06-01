<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
  <head>
    <meta charset="utf-8" />
    <style>table { border-collapse: collapse;}  </style>
    <title></title>
    <script type="text/javascript" >
	
    var today = new Date();
 
 
    function prevClaendar(){
      today = new Date(today.getFullYear(), today.getMonth()-1,today.getDate());
      buildCalendar();
    }

    function nextCalendar(){
      today = new Date(today.getFullYear(), today.getMonth()+1,today.getDate());
      buildCalendar();
 
    }
    function buildCalendar(){
      var nMonth = new Date(today.getFullYear(),today.getMonth(),1);
      var lastDate =new Date(today.getFullYear(),today.getMonth()+1,0);
      var tblCalendar =document.getElementById("calendar");    
      var tblCalendarYM =document.getElementById("calendarYM"); 
      tblCalendarYM.innerHTML = today.getFullYear()+"년"+(today.getMonth()+1)+"월";

      while(tblCalendar.rows.length>2){
        tblCalendar.deleteRow(tblCalendar.rows.length -1);
      }
      var row = null;
      row =tblCalendar.insertRow();
      var cnt =0;
 
      for ( i=0; i <nMonth.getDay(); i++) {
        cell =row.insertCell();
        cnt = cnt + 1;
    }

      var userAbleDate = ['2021-06-02', '2021-06-08', '2016-06-20'];   
      
      for(i=1; i<=lastDate.getDate(); i++){
        cell =row.insertCell();
        cell.innerHTML = i;
        cell.style.color="lightgrey";

        if(i< 10){ varDate = "0" + i}else{varDate=i};

		var ableCheck= today.toISOString().substring(0,8)+varDate;
        
   for(var k=0;k<userAbleDate.length;k++){

		if(userAbleDate[k]==ableCheck){
			cell.style.background="rgb(210, 235, 250)";
            cell.style.color="darkgrey";
		}

    }
        cnt = cnt + 1;
        if (cnt%7 == 0)    
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
        <td align ="center"> <label onclick="prevClaendar()"><</label> </td>
        <td colspan="5" align ="center" id="calendarYM">yyyy년 m월</td>
        <td align ="center"> <label onclick="nextCalendar()">></label> </td>
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
 